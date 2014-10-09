Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9B87765D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 12:24:56 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Thu, 9 Oct 2014
	14:24:57 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 4C354288D4E;
	Thu,  9 Oct 2014 14:24:57 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 14:24:53 +0200
Message-ID: <1412857494-8388-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Cc: Catalin Popeanga <Catalin.Popeanga@enea.com>
Subject: [PATCH 3/4] bash: Fix for CVE-2014-6277
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Oct 2014 12:24:57 -0000
Content-Type: text/plain

From: Catalin Popeanga <Catalin.Popeanga@enea.com>

Follow up bash43-026 to parse properly function definitions in the values of environment variables, to not allow remote attackers to execute arbitrary code or to cause a denial of service.

See: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6277

Signed-off-by: Catalin Popeanga <Catalin.Popeanga@enea.com>
---
 .../bash/bash-3.2.48/cve-2014-6277.patch           | 44 ++++++++++++++++++++++
 .../recipes-extended/bash/bash/cve-2014-6277.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  1 +
 meta/recipes-extended/bash/bash_4.3.bb             |  1 +
 4 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash/cve-2014-6277.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
new file mode 100644
index 0000000..ed63916
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
@@ -0,0 +1,44 @@
+bash: Fix CVE-2014-6277 (shellshock)
+ 
+Upstream-status: backport
+ 
+Downloaded from: 
+ftp://ftp.gnu.org/pub/bash/bash-3.2-patches/bash32-056
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Catalin Popeanga <catalin.popeanga@enea.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-056
+
+Bug-Reported-by:	Michal Zalewski <lcamtuf@coredump.cx>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+When bash is parsing a function definition that contains a here-document
+delimited by end-of-file (or end-of-string), it leaves the closing delimiter
+uninitialized.  This can result in an invalid memory access when the parsed
+function is later copied.
+---
+--- a/make_cmd.c	2006-09-12 09:21:22.000000000 -0400
++++ b/make_cmd.c	2014-10-02 11:41:40.000000000 -0400
+@@ -677,4 +677,5 @@
+   temp->redirector = source;
+   temp->redirectee = dest_and_filename;
++  temp->here_doc_eof = 0;
+   temp->instruction = instruction;
+   temp->flags = 0;
+--- a/copy_cmd.c	2003-10-07 11:43:44.000000000 -0400
++++ b/copy_cmd.c	2014-10-02 11:41:40.000000000 -0400
+@@ -117,5 +117,5 @@
+     case r_reading_until:
+     case r_deblank_reading_until:
+-      new_redirect->here_doc_eof = savestring (redirect->here_doc_eof);
++      new_redirect->here_doc_eof = redirect->here_doc_eof ? savestring (redirect->here_doc_eof) : 0;
+       /*FALLTHROUGH*/
+     case r_reading_string:
diff --git a/meta/recipes-extended/bash/bash/cve-2014-6277.patch b/meta/recipes-extended/bash/bash/cve-2014-6277.patch
new file mode 100644
index 0000000..83b4002
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/cve-2014-6277.patch
@@ -0,0 +1,44 @@
+bash: Fix CVE-2014-6277 (shellshock)
+ 
+Upstream-status: backport
+ 
+Downloaded from: 
+ftp://ftp.gnu.org/pub/bash/bash-4.3-patches/bash43-029
+ 
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Catalin Popeanga <catalin.popeanga@enea.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-029
+
+Bug-Reported-by:	Michal Zalewski <lcamtuf@coredump.cx>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+When bash is parsing a function definition that contains a here-document
+delimited by end-of-file (or end-of-string), it leaves the closing delimiter
+uninitialized.  This can result in an invalid memory access when the parsed
+function is later copied.
+---
+--- a/make_cmd.c	2011-12-16 08:08:01.000000000 -0500
++++ b/make_cmd.c	2014-10-02 11:24:23.000000000 -0400
+@@ -693,4 +693,5 @@
+   temp->redirector = source;
+   temp->redirectee = dest_and_filename;
++  temp->here_doc_eof = 0;
+   temp->instruction = instruction;
+   temp->flags = 0;
+--- a/copy_cmd.c	2009-09-11 16:28:02.000000000 -0400
++++ b/copy_cmd.c	2014-10-02 11:24:23.000000000 -0400
+@@ -127,5 +127,5 @@
+     case r_reading_until:
+     case r_deblank_reading_until:
+-      new_redirect->here_doc_eof = savestring (redirect->here_doc_eof);
++      new_redirect->here_doc_eof = redirect->here_doc_eof ? savestring (redirect->here_doc_eof) : 0;
+       /*FALLTHROUGH*/
+     case r_reading_string:
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index b71cc76..5b57732 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://cve-2014-7169.patch \
 	   file://Fix-for-bash-exported-function-namespace-change.patch \
            file://cve-2014-7186_cve-2014-7187.patch \
+           file://cve-2014-6277.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 67d91f2..5c27c77 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://cve-2014-7169.patch \
 	   file://Fix-for-bash-exported-function-namespace-change.patch \
            file://cve-2014-7186_cve-2014-7187.patch \
+           file://cve-2014-6277.patch \
            file://run-ptest \
            "
 
-- 
1.9.1


