Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A98117DEAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z28so8440987pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DxTd7anJuOjCYPVlKRwJh46GZioAtAkkacAWQB4ofnQ=;
	b=KhCkgu0Rk4oYHLd4L0jRonDq5LTc1Iux3pkvDlviq4NExot/ViXv7LrfrMGUXQ+a30
	/R+5sOjZOq4tVzDNJ6AAuJ49uzGXQ4Bd1kE8DrrShjFiyUrM+si9Jhh/+d7c+3b/hCCx
	z6w56rli1lUR7b2YujjxmyQ3wUYAJDqqvh1a1sQV2NsRN7H/q92YJS9X8XUQrDdif0Wu
	jERXcRDzBCEuPbhw2t6fC6PS5oPmFB9Io3hnLe4TrRPAivkXz0O8qtIC0jmQU0dJQrtD
	4cNsPFv5in+TkJXy9Ki52p9c3BD/yC0Mf895/bkWblYIclkHzlhLZiLlwSa8yIU+ErLc
	pLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DxTd7anJuOjCYPVlKRwJh46GZioAtAkkacAWQB4ofnQ=;
	b=OBvgZvrvAtLl+u4fPeuOl7HNMsTd7s6YyVpjNJeus8zMh97iDHVHxPVRKdE0oP9HJX
	z92gMVM/hWFl/qUW0KMtA/bG/j1Li3Mnkz/FP3pPJZsZjet4rvR9i/cjFoKx9unBLvZ7
	4YVc+A/RzdTHkeN+/BctZRX+7yegS0dNqVmeslyTArAMEMxfdF99oraUpC8fXWRWKXT4
	gWuUJkD+343IAdMCHHrt5kNI4vSE/CGedPKFUx8UbbkJwScDnT2sFHkptakxjLwqWOB3
	m4Xp60Wi9nK1DDxBut9gLrx1FyGFeiwdj9PJIR9nelJea7TZOydjsbGmtCKIH6/HzNDm
	REGw==
X-Gm-Message-State: APjAAAVbDvdXnNiU/iRo+HY+mNt+hrGjS6jhdpb2e9Xhq25ijYrsmFpF
	noQ+lBiw39FH6XQhlvF5Z1cWftKu
X-Google-Smtp-Source: APXvYqxb8R7QuhKJPaPYDzjNXY1SFmohTdJzUWAwdJlb7IzUng5Ynpus/qXhvJZGCa6mzlMIZDMKOw==
X-Received: by 2002:a63:1e5b:: with SMTP id p27mr34906981pgm.213.1557809652719;
	Mon, 13 May 2019 21:54:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:45 -0700
Message-Id: <9f47cea3c58a53db8599f1be4ff4401406c00928.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 03/23] cpio/tar/native.bbclass: move rmt to sbindir and add a prefix to avoid native clashing
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
X-List-Received-Date: Tue, 14 May 2019 04:54:11 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

The rmt in cpio-native and tar-native is clashing, since
tar-native has set var-NATIVE_PACKAGE_PATH_SUFFIX, we move rmt
to sbindir, and add suffix NATIVE_PACKAGE_PATH_SUFFIX to sbindir
could avoid the clashing.

And in Ubuntu, rmt is in sbindir
$ which rmt
/usr/sbin/rmt

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/native.bbclass             | 1 +
 meta/recipes-extended/cpio/cpio_2.12.bb | 6 +++---
 meta/recipes-extended/tar/tar_1.31.bb   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index e9f6c74..d5b6f6a 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -89,6 +89,7 @@ export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64
 
 NATIVE_PACKAGE_PATH_SUFFIX ?= ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
+sbindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 base_libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index cb845c3..3713bf0 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713
 
 inherit autotools gettext texinfo
 
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 do_install () {
     autotools_do_install
@@ -34,7 +34,7 @@ do_install () {
 
 PACKAGES =+ "${PN}-rmt"
 
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+FILES_${PN}-rmt = "${sbindir}/rmt*"
 
 inherit update-alternatives
 
@@ -46,6 +46,6 @@ ALTERNATIVE_${PN}-rmt = "rmt"
 ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 
 ALTERNATIVE_PRIORITY[rmt] = "50"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/tar/tar_1.31.bb b/meta/recipes-extended/tar/tar_1.31.bb
index a785042..353617e 100644
--- a/meta/recipes-extended/tar/tar_1.31.bb
+++ b/meta/recipes-extended/tar/tar_1.31.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG_append_class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl
 
 PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since tar has a lot of m4 files, otherwise there might
@@ -45,7 +45,7 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-rmt"
 
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+FILES_${PN}-rmt = "${sbindir}/rmt*"
 
 inherit update-alternatives
 
@@ -57,7 +57,7 @@ ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
 
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
 
 PROVIDES_append_class-native = " tar-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-- 
2.7.4


