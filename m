Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 37EC17FAAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d16so8729572wre.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X3sRMNDvfD8oh3OScSSJbttJtRzutEBl6uRyCs3R3X0=;
	b=czFsBDUla0ZDFnuNGIL2Urj2IiY8TkCSVxDBrpfcMYaxpiYI1XDzP5N5xgxuUaAM5P
	b90Z9rKf538hVsOecDPIw9x25qmX1wI0NJ+yYZiNOf/UfEc6aBtJxUeFgQTTByuEjPJF
	HA15XDVRSBrg3z/bgbTL6TS/XhsOBNRtacX7pNY5j9ZG45wkw8ZHHkBQDkq2Fo/tbJA3
	yLkAUQ5jRclrQg759n8rBKf2TUjkdoau5U+hNUgtbDhn3lJCu2qY2XWQZiJ2GUYSs1M3
	6gS2SU6pRh1saWFfWtASkl/8T8b2ov5m2um9FWx5K6zj9yO8VJq4YhppFDLTUAqNUjdo
	LtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X3sRMNDvfD8oh3OScSSJbttJtRzutEBl6uRyCs3R3X0=;
	b=EpEilpjjgKlIQkWFJtlQcIctIryAP9DbwqXZmq4UqNzAM5QhfdjtNU19QspWJnpbRX
	ejn64z5SYmvDCa7p2POqE2HCQbHKBDWLbTZra4WUzC8uvecS+qX4Ju0YmWWrrdP+M86R
	OwR3suw4S8u2bRn7Y7hfdLtz+oo7ke7H3JjOS9k6tWChguSEnFR6ZujGDAkIWbBtcsPo
	sSQNYoFvDI7MRPxBi4rL+XjDTj2tz8kbFb0Ncjn6dYSC2Loe6KNWD1cqQU0cbW3Ji0xW
	aqxhf/L5wO/yfXGbpMLzMW2PylRjALFuK3lnQbl+ZcQPoYyN1TJvmJcfEHkHxMTAXbCa
	ohbQ==
X-Gm-Message-State: APjAAAW2lWJPStLhidNnxDmsrUubUzhX+qNULndHKGisjXoULLjivCob
	zn5dQ792AHxLRzQAlkPa99z+LXCb
X-Google-Smtp-Source: APXvYqxcCOUBNjfvWZjCM5GsDbqYrYDBGzgb+tWIhcDJkTqhh78Q2N7wyU8tNycDIsVLfw89LEYfvQ==
X-Received: by 2002:adf:f052:: with SMTP id t18mr16702333wro.192.1575655800749;
	Fri, 06 Dec 2019 10:10:00 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.09.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:44 +0100
Message-Id: <20191206180949.59953-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/10] libxcrypt: restructure the recipes to allow auto-upgrading with devtool
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libxcrypt/libxcrypt-compat_4.4.8.bb       |  2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     | 33 ++++++++++++++++++
 .../recipes-core/libxcrypt/libxcrypt_4.4.8.bb | 34 +------------------
 3 files changed, 35 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt.inc

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
index ebc4648a18e..ba74eb1f94d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
@@ -2,7 +2,7 @@
 # This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
 #
 
-require libxcrypt_${PV}.bb
+require libxcrypt.inc
 
 PROVIDES = ""
 AUTO_LIBNAME_PKGS = ""
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
new file mode 100644
index 00000000000..1787f6921e4
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -0,0 +1,33 @@
+SUMMARY = "Extended cryptographic library (from glibc)"
+DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
+HOMEPAGE = "https://github.com/besser82/libxcrypt"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
+                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
+SRCBRANCH ?= "develop"
+
+PROVIDES = "virtual/crypt"
+
+FILES_${PN} = "${libdir}/libcrypt*.so.* \
+               ${libdir}/libcrypt-*.so \
+               ${libdir}/libowcrypt*.so.* \
+               ${libdir}/libowcrypt-*.so \
+"
+
+S = "${WORKDIR}/git"
+
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
+CPPFLAGS_append_class-nativesdk = " -Wno-error"
+
+API = "--disable-obsolete-api"
+EXTRA_OECONF += "${API}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
index 1787f6921e4..aba9b1ef0cb 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
@@ -1,33 +1 @@
-SUMMARY = "Extended cryptographic library (from glibc)"
-DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
-HOMEPAGE = "https://github.com/besser82/libxcrypt"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
-                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
-SRCBRANCH ?= "develop"
-
-PROVIDES = "virtual/crypt"
-
-FILES_${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
-"
-
-S = "${WORKDIR}/git"
-
-BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS_append_class-nativesdk = " -Wno-error"
-
-API = "--disable-obsolete-api"
-EXTRA_OECONF += "${API}"
-
-BBCLASSEXTEND = "nativesdk"
+require libxcrypt.inc
-- 
2.17.1


