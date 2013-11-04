Return-Path: <net147@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE356D3C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 06:38:20 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so6729981pbc.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Nov 2013 22:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sX6UbUC3XZnM5gSA0l7C0VSyeobf8SQeVJ1suq8Djuo=;
	b=G56uy4iGOmB5LTmmasL/SIWMs4Zm6VaGEjyLrk/7J3WROCGY4AnZDLSAV3bpGtaig4
	FyQNyAXOwL2EeuSCgcuiPhS0SmVINEIw4EiF8m8UQJ/aoZ5J7Mb2ncyw5j4XoCNPH8Qz
	IFdk/whYfCKtoXEdhHrbznMWL4RU7/MhaXiFSiQhDvee41sWk1eKsDSrepqwHnbC0a9C
	Pw5zrZke60opdGh/Hn5GP91tdxuBCuVhey0w2dhwomroRjeVLG38iiVtQ2DBUR2AJpD0
	vc8SON7mzVw4Gx0+OlbZAKNBjvSfK4TuSL2mX5YQ1ofq/AotxUZ3HirtOfp81UwCfZ+J
	klZw==
X-Received: by 10.66.196.168 with SMTP id in8mr15999949pac.18.1383546770264;
	Sun, 03 Nov 2013 22:32:50 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id j9sm30695330paj.18.2013.11.03.22.32.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Nov 2013 22:32:49 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2013 17:31:39 +1100
Message-Id: <1383546699-23050-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] eglibc_2.17.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Mon, 04 Nov 2013 06:38:21 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch | 31 +++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
new file mode 100644
index 0000000..8349c18
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
@@ -0,0 +1,31 @@
+Accept make versions 4.0 and greater
+
+Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+diff -Nur libc.orig/configure libc/configure
+--- libc.orig/configure	2012-12-03 08:11:45.000000000 +1100
++++ libc/configure	2013-11-04 17:15:31.344984184 +1100
+@@ -4995,7 +4995,7 @@
+   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    3.79* | 3.[89]*)
++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+diff -Nur libc.orig/configure.in libc/configure.in
+--- libc.orig/configure.in	2012-12-03 08:11:45.000000000 +1100
++++ libc/configure.in	2013-11-04 17:15:31.351650849 +1100
+@@ -958,7 +958,7 @@
+   critic_missing="$critic_missing gcc")
+ AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
+   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
+-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
+ 
+ AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
+   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index 22129e6..c62ff36 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22
            file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
+           file://make-4.patch \
            ${BACKPORTS} \
           "
 BACKPORTS = "\
-- 
1.8.4


