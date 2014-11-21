Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05A0E6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:50:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL9ox88007444
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:50:59 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 01:50:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 04:50:57 -0500
Message-ID: <1416563457-2367-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] gzip: fix MakeMaker issues with using wrong SHELL/GREP
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
X-List-Received-Date: Fri, 21 Nov 2014 09:51:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

A set of substitution is being processed to all target scripts with sed by
replacing some key words with the detected values at configure time, this
is exactly not compliant with cross compling, and will cause missing path
errors at run time like:
"/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"

Fixed by removing unneeded substitution and using real runtime paths
instead.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gzip/gzip-1.6/wrong-path-fix.patch             | 31 ++++++++++++++++++++++
 meta/recipes-extended/gzip/gzip.inc                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch
new file mode 100644
index 0000000..92863d6
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch
@@ -0,0 +1,31 @@
+fix MakeMaker issues with using wrong SHELL/GREP
+
+A set of substitution is being processed to all target scripts with sed by
+replacing some key words with the detected values at configure time, this
+is exactly not compliant with cross compling, and will cause missing path
+errors at run time like:
+"/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"
+
+Fixed by removing unneeded substitution and using real runtime paths
+instead.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+Upstream-Status: Pending
+
+Index: gzip-1.3.12/Makefile.am
+===================================================================
+diff -urpN a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2013-11-30 10:06:09.402234871 +0800
++++ b/Makefile.am	2013-11-30 10:13:42.952236025 +0800
+@@ -81,9 +81,8 @@ gzip.doc.gz: gzip.doc $(bin_PROGRAMS)
+ SUFFIXES = .in
+ .in:
+ 	$(AM_V_GEN)sed \
+-		-e 's|/bin/sh|$(SHELL)|g' \
+ 		-e 's|[@]bindir@|'\''$(bindir)'\''|g' \
+-		-e 's|[@]GREP@|$(GREP)|g' \
++		-e 's|[@]GREP@|$(base_bindir)/grep|g' \
+ 		-e 's|[@]VERSION@|$(VERSION)|g' \
+ 		$(srcdir)/$@.in >$@-t \
+ 	  && chmod a+x $@-t \
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 671b1eb..b90856e 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 inherit autotools texinfo
 
-- 
2.0.0


