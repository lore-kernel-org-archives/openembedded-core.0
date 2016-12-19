Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECD0771D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 07:01:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBJ71noK007685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 23:01:53 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Dec 2016 23:01:48 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2016 15:01:22 +0800
Message-ID: <1482130882-148241-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnupg: specify explicitly tar path
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
X-List-Received-Date: Mon, 19 Dec 2016 07:01:55 -0000
Content-Type: text/plain

On cross-compile platform, automatic check of ustar is unreliable, so we
specify explicitly tar path after check manually.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../fix-ustar-and-tar-path-check-issue.patch       | 46 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/fix-ustar-and-tar-path-check-issue.patch

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/fix-ustar-and-tar-path-check-issue.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/fix-ustar-and-tar-path-check-issue.patch
new file mode 100644
index 0000000..fca8d64
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/fix-ustar-and-tar-path-check-issue.patch
@@ -0,0 +1,46 @@
+Remove automatic detection of tar path and ustar format
+
+Remove automatic detection of tar path and ustar format, because they 
+are unreliable and inappropriate for cross-compile platform.
+
+Upstream status: Inappropriate [cross-compile platform specific]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+
+diff -uarN gnupg-1.4.7-org/m4/tar-ustar.m4 gnupg-1.4.7/m4/tar-ustar.m4
+--- gnupg-1.4.7-org/m4/tar-ustar.m4	2016-12-19 11:06:58.621838069 +0800
++++ gnupg-1.4.7/m4/tar-ustar.m4	2016-12-19 11:13:31.721840809 +0800
+@@ -15,22 +15,22 @@
+ 
+   if test x$_do_tar != xno ; then
+ 
+-     if test x$_do_tar = x ; then
+-        AC_PATH_PROG(TAR,"tar")
+-        _mytar=$ac_cv_path_TAR
+-     fi
+-
+      # Check if our tar is ustar format.  If so, it's good.  TODO: Add some
+      # code to check various options, etc, to try and create ustar
+      # format.
+ 
+-     if test x$_mytar != x ; then
+-        AC_MSG_CHECKING([whether $_mytar speaks USTAR])
+-        echo hithere > conftest.txt
+-        $_mytar -cf - conftest.txt | (dd skip=257 bs=1 count=5 2>/dev/null || cat) | grep ustar > /dev/null
+-        _tar_bad=$?
+-        rm conftest.txt
++     if test x$_do_tar != x ; then 
++        AC_SUBST(TAR,$_do_tar)
++        AC_MSG_CHECKING([whether $_do_tar speaks USTAR])
++
++        # Here, we ignore the check code, because it isn't indeed applicable for
++        # cross-compile platform.
++        # Now our tar support ustar, so we say directly yes, but once the tar is changed, 
++        # you should check whether it suppport ustar, and please reference the follow command:
++        # echo hithere > conftest.txt
++        # tar -cf - conftest.txt | (dd skip=257 bs=1 count=5 2>/dev/null || cat) | grep ustar > /dev/null
+ 
++        _tar_bad=0
+ 	if test x$_tar_bad = x0 ; then
+ 	   AC_MSG_RESULT([yes])
+ 	else
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 6ccffd5..6ea6fe3 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNUPG_MIRROR}/gnupg/gnupg-${PV}.tar.bz2 \
            file://CVE-2013-4351.patch \
            file://CVE-2013-4576.patch \
            file://CVE-2013-4242.patch \
+           file://fix-ustar-and-tar-path-check-issue.patch \
 	  "
 
 SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
@@ -79,6 +80,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--disable-selinux-support \
                 --with-readline=${STAGING_LIBDIR}/.. \
                 ac_cv_sys_symbol_underscore=no \
+                --with-tar=${base_bindir}/tar \
 		"
 
 # Force gcc's traditional handling of inline to avoid issues with gcc 5
-- 
1.9.1


