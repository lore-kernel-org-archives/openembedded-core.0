Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id DE7C1725FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:17:17 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so13445309wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fcrmtkqmk/Ab9AzFmNIExizAGUVWaL4MOEEcyF0Txh0=;
	b=u8DD5WQAWZuBCPMAa7Eoryf9KWN7MWR1Kz7xEhPSyTeFAMgbCqb858/eDtIU2c22x8
	KqYVep1uKBYxm9vSlwmn4x2iRDDvnv/yJcVIbHzYuAddJCVHBfhLdM/mfgX+qMBXfsbD
	HD1ycuCLPC1RroWjQQtPQOqrlndq8BZ7rWMj1WVP++jnWoReLkmJSu2dhaPTksbKZKnG
	hoqFCXcAm11i0mx3GEQhxC1fpW7OtNrL07ktR1Dm4PekG8VphoGTCEec+dsHEIoJX7dx
	VtPKy6fBmMGIGx0H9DyTVu7+Yt5bxQk8rC2PuknqOeqqZPkgNSqJ7ig1YLomOzcu0cY1
	HZ5w==
X-Received: by 10.180.90.206 with SMTP id by14mr13726525wib.67.1418221037818; 
	Wed, 10 Dec 2014 06:17:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jr4sm6039137wjc.20.2014.12.10.06.17.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:17:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:17:07 +0100
Message-Id: <1418221027-12371-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/4] libpostproc: import from meta-oe
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
X-List-Received-Date: Wed, 10 Dec 2014 14:17:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libav/libpostproc_git.bb | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libpostproc_git.bb

diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
new file mode 100644
index 0000000..811175c
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -0,0 +1,43 @@
+SUMMARY = "FFmpeg derived postprocessing library"
+HOMEPAGE = "http://git.videolan.org/?p=libpostproc.git;a=summary"
+SECTION = "libs"
+DEPENDS = "libav"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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
2.1.3


