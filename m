Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 281F86022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x5-v6so1744166pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95U1xhnGBeRt76wOxkQBv/KimhSAZGrwF40DTISMUqM=;
	b=un6pcYM+UFP0PlF4xqceO9r/b5cY6HCE/Hbx3mc7aTI1/vFOef/uh2IBH9y2c7cxS5
	wen+YJRODGVdc8Y5s5fh8pDYW84UIjwzxMsJMK1NIFvsbAgz7gfFbvVohkFeFJt/T9my
	VORIaPlVYUC5NmB5O4Q9fsirHTiK8zMNcYbR3JJ69xONebxF//F8lzrs3MaQ10u9ea1Q
	+WUPQ0JJFjQm8JqWN3srxmRUNHuHOT71kmuWOvUhtE3LEV8TAmONbN7vbUyZ81s18neE
	nbwSSZdkv308n54DUgyAdJFAmzs5xqLEt39JBkgC94CCbUmBLGWHiiomIYC8LYSXMYr8
	OKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=95U1xhnGBeRt76wOxkQBv/KimhSAZGrwF40DTISMUqM=;
	b=APO3AHG5bJsz1hf7M1BMkmjgoMnXe20/L1ORl7yKcOhspRnxMZKQS+d5AIDp2eer7A
	aJpw6Punp8lz1k63fdn9SO3qGrZW+pvTVXuEfWP4yzkl8XO9x+fPKqoBkVwTlHnRTgWM
	hxWkL32AV42VTzAiE05eit3H4396Lp1aHyFOVRA/eZJoqDhIa2xJGLF9LB+kIRQ4kuaT
	Br5T76EHZzh6/yylU5iBq1/c/auTc/F0coKUFVWtNyM4IVCKMA3Zi9/aSVC+JkvpZxaH
	jc9F/wKx4knoJWn59V0JbP2zV+AQkzYpjtlGGA7kbsh4yc3I1SCHo03BDZeoohJl1moK
	7Grg==
X-Gm-Message-State: AOUpUlEOlZ4d6xuJb+xqIXLTRZYP1TYGMwC74yBLFo46VYpLVHHDnamZ
	BIfb81YM9rWIz8RE8BNfJXCbrrUI
X-Google-Smtp-Source: AAOMgpcrYcXulQVPDzrFRtzjqDWX6uvZS10/tS/0OXNerIe/CDnjnEeHBwIzMwmXOAFWXNjAN8ZrKQ==
X-Received: by 2002:a62:9bc5:: with SMTP id
	e66-v6mr15643486pfk.84.1532399947992; 
	Mon, 23 Jul 2018 19:39:07 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:50 -0700
Message-Id: <1532399935-32296-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/9] openssl_1.0: fix cryptodev-linux PACKAGECONFIG support
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:07 -0000

Since openssl isn't an autotools recipe, defining cryptodev-linux
related config options via PACKAGECONFIG hasn't worked correctly
since PACKAGECONFIG_CONFARGS stopped being automatically appended to
EXTRA_OECONF in 2016:

  http://git.openembedded.org/openembedded-core/commit/?id=c98fb5f5129e71829ffab4449b3d28082bc95ab4

The issue appears to have been hidden as the flags are also hardcoded
in CFLAG - and therefore always enabled, regardless of the state of
the PACKAGECONFIG option. Fix by passing both EXTRA_OECONF and
PACKAGECONFIG_CONFARGS when running the openssl Configure script.
Although the openssl 1.1 recipe doesn't contain any PACKAGECONFIG
options yet, pre-emptively make the same fix there too.

Also only enable cryptodev-linux by default for target builds (based
on the historical comments in the recipe, that seems to have been the
original intention).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 9 ++++-----
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 9bc9e64..d9e9c84 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -63,6 +63,9 @@ UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
 PACKAGECONFIG ?= "cryptodev-linux"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
 PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 
@@ -88,10 +91,6 @@ CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB
 # (and it causes issues with SELinux)
 CFLAG += "-Wa,--noexecstack"
 
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-
 CFLAG_append_class-native = " -fPIC"
 
 do_configure_prepend_darwin () {
@@ -208,7 +207,7 @@ do_configure () {
 		useprefix=/
 	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
 }
 
 do_compile_prepend_class-target () {
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 8d445e4..c0aaaf6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -126,7 +126,7 @@ do_configure () {
                 useprefix=/
         fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
 do_install () {
-- 
1.9.1


