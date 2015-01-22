Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 813F765C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:36 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so4650790wid.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=A/1s5gWPXONPlxfTo2kxu+dEotuPYsfZ2Jk6T7MNrg4=;
	b=EdFREmu95o6k9CuBc0vLvW/6w+D8/j7R2lmGmadp8IUYuiFUXuN6iang8gM8wgO+Zu
	h3IaxuN7tre9Ai7HUKwmEBZBMIiLwQyFyxKcpsYkYZ2f8NiMptowIlykrntgY5Ct9l71
	ZvAQdu+316li2NO15r2GNLB2Yom400TOJBkBJJLWUPQIyvnVCTEfAq8+vtWQwfhMyzcL
	da6ZFhzXx+xCmEQrs+hBFxWtP0HGZcNzEGt4m+lOCrbKn/w+OhiwW+MdIdBdTgaDnpyK
	lsIvsn0maJXFmxazbvuirKHPW5o7Xs+SXMMzYb8p0+UyYtfd2nX9uEuaC1A9cEbhjzfp
	EG8A==
X-Received: by 10.180.37.197 with SMTP id a5mr17055454wik.2.1421944776895;
	Thu, 22 Jan 2015 08:39:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	et4sm4648472wjd.15.2015.01.22.08.39.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:34 +0100
Message-Id: <2b7911146b7c15f6df11e3452225b2dc7a8e9cd0.1421943849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 4/4] libpostproc: import from meta-oe
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libav/libpostproc_git.bb | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libpostproc_git.bb

diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
new file mode 100644
index 0000000..88891db
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "FFmpeg derived postprocessing library"
+HOMEPAGE = "http://git.videolan.org/?p=libpostproc.git;a=summary"
+SECTION = "libs"
+DEPENDS = "libav"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# because it depends on libav which has commercial flag
+LICENSE_FLAGS = "commercial"
+
+PV = "52.3.0+git${SRCPV}"
+
+SRCREV = "811db3b957dfde24aef2d0f82e297e5bf552d873"
+SRC_URI = "git://github.com/lu-zero/postproc;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools lib_package pkgconfig
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF ?= ""
+
+EXTRA_OECONF = " \
+    --enable-shared \
+    --enable-pthreads \
+    --enable-gpl \
+    --enable-postproc \
+    \
+    --cross-prefix=${TARGET_PREFIX} \
+    --prefix=${prefix} \
+    \
+    --arch=${TARGET_ARCH} \
+    --target-os="linux" \
+    --enable-cross-compile \
+    --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+    --extra-ldflags="${TARGET_LDFLAGS}" \
+    --sysroot="${STAGING_DIR_TARGET}" \
+    ${EXTRA_FFCONF} \
+"
+
+do_configure() {
+    ${S}/configure ${EXTRA_OECONF}
+}
-- 
2.2.1


