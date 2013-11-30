Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 993006B891
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 01:51:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB21ptu2024979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Dec 2013 17:51:56 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 1 Dec 2013 17:51:55 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Nov 2013 11:18:07 +0800
Message-ID: <1385781487-18314-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V2] gzip: fix MakeMaker issues with using wrong SHELL/GREP
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
X-List-Received-Date: Mon, 02 Dec 2013 01:51:57 -0000
Content-Type: text/plain

A set of substitution is being processed to all target scripts with sed by
replacing some key words with the detected values at configure time, this
is exactly not compliant with cross compling, and will cause missing path
errors at run time like:
"/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"

Fixed by removing unneeded substitution and using real runtime paths
instead.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../gzip/gzip-1.6/wrong-path-fix.patch             | 31 ++++++++++++++++++++++
 meta/recipes-extended/gzip/gzip.inc                |  2 ++
 2 files changed, 33 insertions(+)
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
index 6ec1dae..bf3469d 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
+SRC_URI_append_class-target = " file://wrong-path-fix.patch"
+
 inherit autotools
 
 do_install_append () {
-- 
1.8.4.1


