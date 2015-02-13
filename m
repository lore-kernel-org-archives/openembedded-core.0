Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE4B60556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:10 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hi2so9548691wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9h9nbmM+Pli5QrOfT+NX7C6DxM1M0qlbXuA4NjXPyIc=;
	b=0MCYzVOZQKHf4s73DbeYYFGSRenFZOdY7JbI6hNX9As13DRJ8TEiykrKBfAHfoexO/
	BROJdXjCmdfdC8WJXsi19T7aWs+p3BVeGrikcJT+ZplNzLjWsGnA9kdQWXXKx/dXO6iR
	tMBFenMxbfIsEdtav9z/Y39qBh8eO5irNZY9QwfnzxqSH1dOSvlbVu5LmWaWGe9PDrLb
	Ml2cKfy5y1DdlEyqkNmZgCKCvgdQFAm64IWQxCE5QOtCLgFq3pEBpoUG5IOs8uE25Amj
	HhHnhRUkSgfiVmWTElLMvbZuFiXSBGDVcCCC8ZSj20UghkMsBWTWqu6LGzE/wDshObiD
	iU8g==
X-Received: by 10.180.108.239 with SMTP id hn15mr3661123wib.38.1423807211237; 
	Thu, 12 Feb 2015 22:00:11 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:50 +0100
Message-Id: <1423807195-7087-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] gpgme: fix configuration by setting proper parameters instead of patching
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gpgme/gpgme-1.4.3/disable_gpgconf_check.patch  | 39 ----------------------
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          |  4 +--
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch
deleted file mode 100644
index df09530..0000000
--- a/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1.2.0, gpgme will check if gpgconf & g13(from 1.3.0) exist, and cause
-configure failure if not founding them in cross-compile environment. We can
-add the gnupg-native to get them, but still have some issues:
-
-1. need add new package: libksba, update libassuan(not in sato), and extend
-   native support in some other packages(libgcrypt, libgpg-error, pth...)
-2. Even we have gnupg, the g13 only exist in development branch, so that we
-   still have the g13 check failure in configure.
-
-I have searched the compile log, and found gpgconf/g13 are not used. So use a
-simple method here, throw a warning mesg rather than an error here just like in
-non-cross-compile environment.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gpgme-1.3.0/configure.ac
-===================================================================
---- gpgme-1.3.0.orig/configure.ac	2010-07-21 09:38:09.000000000 +0800
-+++ gpgme-1.3.0/configure.ac	2010-07-21 09:39:19.000000000 +0800
-@@ -574,7 +574,7 @@
- *** Could not find gpgconf, install gpgconf or use --with-gpgconf=PATH to enable it
- ***])
-     else
--      AC_MSG_ERROR([
-+      AC_MSG_WARN([
- ***
- *** Can not determine path to gpgconf when cross-compiling, use --with-gpgconf=PATH
- ***])
-@@ -670,7 +670,7 @@
- *** Could not find g13, install g13 or use --with-g13=PATH to enable it
- ***])
-     else
--      AC_MSG_ERROR([
-+      AC_MSG_WARN([
- ***
- *** Can not determine path to g13 when cross-compiling, use --with-g13=PATH
- ***])
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index ca1e5f9..98fd68b 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
-           file://disable_gpgconf_check.patch \
            file://gpgme.pc"
 
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
@@ -18,9 +17,8 @@ SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60
 
 DEPENDS = "libgpg-error libassuan"
 
-EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm"
-
 BINCONFIG = "${bindir}/gpgme-config"
+EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm --with-gpgconf=no --with-g13=no"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
 
-- 
1.9.3


