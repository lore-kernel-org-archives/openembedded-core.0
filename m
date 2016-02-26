Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 61AD2602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:48:10 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id d32so3140305qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UwDRkE/FfcuwRf2FlbhPH+w1BNhVZI7b/EzaeDyEx8k=;
	b=oj0PV6rN4q42E4/Qx0IiUNfdZ5eM7Q5mY0gBuOOaVbFqZ4Ff4/gTKnoo1ivzZQleKA
	ZQEUeonpvTItVd67+WUMvLcmLZKfA9gbZJKUepa9hNbKajE2C1iQGFcI9vYO47Ln60Gj
	mWaBQ/tbvbpcrRmqzJuS2fVWAyNl2Z1EBvPdb5rJGWasciHY48VhOA9vfkF91bTn/5nr
	XNZjgux5J++x5T83WnpY1JhDaohH5iLgl2+CHyTeHWQBtlGo0uwH3PTNPVOG/7f2FMAJ
	FucERTOKj0lX6LJk0/D4/QfI9FOqyR4LX/xENZtXfhjaYIc3qGYzH7KUvG2fLSKXwnXn
	2FQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UwDRkE/FfcuwRf2FlbhPH+w1BNhVZI7b/EzaeDyEx8k=;
	b=It0T33aoh+bT/Bj0xHrfjYfeUBSPgh+oCYV+DTOe9VSKu8et5WpcHqW6+vAM6RPoXx
	2n2P06ZYRTHPyH/FglwvCl3s3cjaIrKewsPKq9zwTFToWki6GoByHc41vxY/ewBxXSa6
	a2GHoObZgPCS+RiNwzJO4Yefrg8+vaepfEAkCl4uxoGkABctiXor+T2VpgEey+xpas/B
	YZTxrR0oSc6FqKaXwkuK1/O7utDS1gINcGTJd6qbBrdTpW4eI+D6hJNoAU2PMTSXdnaz
	JpRKuQraQcPDi3GOWFGCT2/oftvI4mwH1bAlENjC6WKlVYP52m+XXT4QK32l8OebWpJ3
	Mjmg==
X-Gm-Message-State: AG10YOSaKjbeFSbBfx2DyKJWGhqzyu4VKjNtPJaMAiaBLpLwnAW1PHfxTpgz5ODcWYB1Xw==
X-Received: by 10.141.28.149 with SMTP id f143mr64783076qhe.66.1456469291032; 
	Thu, 25 Feb 2016 22:48:11 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	d65sm4779761qgf.30.2016.02.25.22.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 22:48:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 06:48:00 +0000
Message-Id: <1456469281-6333-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1456469281-6333-1-git-send-email-raj.khem@gmail.com>
References: <1456469281-6333-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] mesa: Fix build on musl
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
X-List-Received-Date: Fri, 26 Feb 2016 06:48:12 -0000

It assumes __GLIBC__ where it could actually check for linux
and include non-glibc C library implementations like musl which
provide __BYTE_ORDER macros as well when computing system endianness

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/files/replace_glibc_check_with_linux.patch     | 17 +++++++++++++++++
 meta/recipes-graphics/mesa/mesa_11.1.1.bb               |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch

diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
new file mode 100644
index 0000000..e4461ef
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
@@ -0,0 +1,17 @@
+endianness check is OS wide and not specific to libc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: mesa-11.1.1/src/gallium/include/pipe/p_config.h
+===================================================================
+--- mesa-11.1.1.orig/src/gallium/include/pipe/p_config.h
++++ mesa-11.1.1/src/gallium/include/pipe/p_config.h
+@@ -130,7 +130,7 @@
+  * Endian detection.
+  */
+ 
+-#ifdef __GLIBC__
++#if defined(__linux__)
+ #include <endian.h>
+ 
+ #if __BYTE_ORDER == __LITTLE_ENDIAN
diff --git a/meta/recipes-graphics/mesa/mesa_11.1.1.bb b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
index 5d73feb..502afcf 100644
--- a/meta/recipes-graphics/mesa/mesa_11.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
@@ -1,6 +1,8 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
+           file://replace_glibc_check_with_linux.patch \
+"
 
 SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
 SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
-- 
1.8.3.1


