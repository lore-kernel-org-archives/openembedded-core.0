Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFB80718D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:27:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="613318010"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2014 13:27:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:27:13 +0100
Message-Id: <5a802295d1f40af6f21dd3ed7e4549fe033f03a0.1413145539.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 3/4] bash: Fix for CVE-2014-6277
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
X-List-Received-Date: Sun, 12 Oct 2014 20:27:46 -0000

From: Catalin Popeanga <Catalin.Popeanga@enea.com>

Follow up bash42-049 to parse properly function definitions in the
values of environment variables, to not allow remote attackers to
execute arbitrary code or to cause a denial of service.

See: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6277

(From OE-Core daisy rev: 85961bcf81650992259cebb0ef1f1c6cdef3fefa)

Signed-off-by: Catalin Popeanga <Catalin.Popeanga@enea.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash/bash-3.2.48/cve-2014-6277.patch           | 44 ++++++++++++++++++++++
 .../bash/bash-4.2/cve-2014-6277.patch              | 44 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  1 +
 meta/recipes-extended/bash/bash_4.2.bb             |  1 +
 4 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch

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
diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch
new file mode 100644
index 0000000..83b4002
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch
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
index 2b26ae7..4bd97e7 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://cve-2014-7169.patch \
            file://Fix-for-bash-exported-function-namespace-change.patch \
            file://cve-2014-7186_cve-2014-7187.patch \
+           file://cve-2014-6277.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index ae63ad3..35af812 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://cve-2014-7169.patch \
            file://Fix-for-bash-exported-function-namespace-change.patch;striplevel=0 \
            file://cve-2014-7186_cve-2014-7187.patch;striplevel=0 \
+           file://cve-2014-6277.patch \
            file://run-ptest \
            "
 
-- 
1.9.3


