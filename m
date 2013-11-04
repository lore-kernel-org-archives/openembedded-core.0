Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 25EAC6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 06:32:29 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kq14so6479087pab.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Nov 2013 22:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BzNcrdLhY5dsA4g9ztZSy+AKVWlx4F0SABgG5pkoFYg=;
	b=N5RFZJ7V+YyWaWfjwkv1HwwZ/e0QUkEDHyqsfJqE7plxQqfevlvJXE7qYCTnXCd7De
	ooHe5BfEQAnYnn2u4q57MTSdg/wuBazMND8cAa1Ox87DIcx1vazErKyOk6SRSgAwWPZz
	knXLPQIkdBVVAyvDFxmQu+BvyiThnFcMZ+5QVG/AVfqgFMWjnQazrgXpAshKARUxgg0L
	oPnWk2VaHrmRrdEArxMkItwXUWjk1HxVdtBb/mNdgBXSCmz4boxQNZvARuGQMR3P2HWB
	RxVpB0gp9yK92p0GsszYMTwH/GclQOTcHw3ebhE8y63o7jTXtn0WFeMFB9K+Nkwjlwm7
	WiXA==
X-Received: by 10.68.106.98 with SMTP id gt2mr16089149pbb.61.1383546751063;
	Sun, 03 Nov 2013 22:32:31 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	hi5sm26045392pbb.43.2013.11.03.22.32.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Nov 2013 22:32:30 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2013 17:31:15 +1100
Message-Id: <1383546675-23002-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] eglibc_2.18.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Mon, 04 Nov 2013 06:32:29 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch | 31 +++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.18.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
new file mode 100644
index 0000000..ec105b4
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
@@ -0,0 +1,31 @@
+Accept make versions 4.0 and greater
+
+Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+diff -Nur libc.orig/configure libc/configure
+--- libc.orig/configure     2013-08-21 02:23:48.000000000 +1000
++++ libc/configure  2013-11-04 17:04:17.778333748 +1100
+@@ -4772,7 +4772,7 @@
+   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    3.79* | 3.[89]*)
++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+diff -Nur libc.orig/configure.in libc/configure.in
+--- libc.orig/configure.in	2013-08-21 02:23:48.000000000 +1000
++++ libc/configure.in	2013-11-04 16:54:17.955014870 +1100
+@@ -989,7 +989,7 @@
+   critic_missing="$critic_missing gcc")
+ AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
+   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
+-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
+ 
+ AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
+   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 710b498..15e5eed 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
            file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
+           file://make-4.patch \
           "
 SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
 SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
-- 
1.8.4


