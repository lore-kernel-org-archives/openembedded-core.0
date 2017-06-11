Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD6C60603
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 19:44:01 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id l6so9983816iti.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2gHNVe2bGZwVN2VYvxxK7iQEJUnduWMcrutT3ePpDC4=;
	b=ceDsljd2rjwckXcnCJ1/ODOyerqROE/D5k8CLFpfUNFgZ6L0OOCiXRtsOTYq2lpFLR
	yDrGwpr2oCM2iP9CEsYSOPYmm5faF/qYlK1v/mEsehQT/Lrq2sYKAOu5Om9MTRVWKFRn
	ejJ3H/T+ZRROoGZkicJRsBjcHseEOAv/un1qE2O896v0IUeiRe/9WrX9lsGxcwO19hBp
	deBrSqJ5/Kox9/ow35oB/8JD8UZEhIm3r/wiqQ/QnnZ9pjUcyGzRXyvATVp00VXJgDPK
	VfBBsTBxK7Xwg1EVlTK+skM+mfff+pI9mYhMlN+YR5Bl9wiFUKxqNOu2l1BFnVOysJx4
	9rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2gHNVe2bGZwVN2VYvxxK7iQEJUnduWMcrutT3ePpDC4=;
	b=LlPtiPrgqxCTsnNPDq51eZ2j1iqfdDlNEUQmGQuACWkm/ufWavDMH/gNyR+3etlVRf
	mI0wCzmd/xHbcqBH69GSikw9nH9IfbO8OzJt4mzsbNiTV7EtLcoBaRfCWiONdy3XcBnM
	O3aqgtfy+JnKKe0Fuzpd3InhfnC/PJ1acYYpRDVzDUAgDeScIh1kUdnU4mC0Wdk0+7SD
	EyHkdngIZgS5VDQ9LAchJ4itHlih2L9t0MWE65eGrNFRR9/ij57aU4Vb306RJCb/uYZc
	GzDwRfGvOLDubPbHqczao9p7oys5SvVlDe4af91JL0LY1g/EqfdP0CuZbEwyUpFG6Yp5
	qMVg==
X-Gm-Message-State: AODbwcDnP8O00TDq17HJr/eI78tw3bTB7eqZEnZW96udOq76VpQI/kqC
	GuKUgOYmitjcDjKBYDQ=
X-Received: by 10.36.131.68 with SMTP id d65mr9599823ite.51.1497210242913;
	Sun, 11 Jun 2017 12:44:02 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	e186sm3022036itc.21.2017.06.11.12.44.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 12:44:01 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 15:43:50 -0400
Message-Id: <20170611194350.18033-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170611194350.18033-1-twoerner@gmail.com>
References: <20170611194350.18033-1-twoerner@gmail.com>
Subject: [PATCH v3] mesa.inc: enable texture float for gallium
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
X-List-Received-Date: Sun, 11 Jun 2017 19:44:02 -0000

Following the lead from Fedora (as suggested by Rob Clark) always enable
--enable-texture-float for all gallium drivers, but then modify the code to
not enable it, at runtime, where the implementation isn't backed by hardware.

The patch comes from unpacking fedora-25's mesa-17.0.5-3.fc25.src.rpm from
https://dl.fedoraproject.org/pub/fedora/linux/updates/25/SRPMS/m/

Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are some
algorithms that are encumbered by patents. These algorithms are enabled
with mesa's --enable-texture-float configure flag. However, if hardware
acceleration is being used and the hardware supports --enable-texture-float,
it means the hardware vendor has paid for the patents.

Note that with this solution, non-hardware gallium drivers (e.g. swrast) can't
--enable-texture-float, which might cause issues with some piglit tests.

This solution was discussed and agreed-to on the mailing list:
http://lists.openembedded.org/pipermail/openembedded-core/2017-May/137233.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../mesa/files/0002-hardware-gloat.patch           | 51 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 meta/recipes-graphics/mesa/mesa_17.1.1.bb          |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch

diff --git a/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch b/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
new file mode 100644
index 0000000000..0e014dcc80
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
@@ -0,0 +1,51 @@
+From 00bcd599310dc7fce4fe336ffd85902429051a0c Mon Sep 17 00:00:00 2001
+From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
+Date: Sun, 20 Mar 2016 13:27:04 +0100
+Subject: [PATCH 2/4] hardware gloat
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
+---
+ src/gallium/drivers/llvmpipe/lp_screen.c | 7 +++++++
+ src/gallium/drivers/softpipe/sp_screen.c | 7 +++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c b/src/gallium/drivers/llvmpipe/lp_screen.c
+index 4f61de8..3b0ec77 100644
+--- a/src/gallium/drivers/llvmpipe/lp_screen.c
++++ b/src/gallium/drivers/llvmpipe/lp_screen.c
+@@ -411,6 +411,13 @@ llvmpipe_is_format_supported( struct pipe_screen *_screen,
+    if (!format_desc)
+       return FALSE;
+ 
++   if ((bind & PIPE_BIND_RENDER_TARGET) &&
++       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
++       format != PIPE_FORMAT_R11G11B10_FLOAT &&
++       util_format_is_float(format)) {
++      return FALSE;
++   }
++
+    assert(target == PIPE_BUFFER ||
+           target == PIPE_TEXTURE_1D ||
+           target == PIPE_TEXTURE_1D_ARRAY ||
+diff --git a/src/gallium/drivers/softpipe/sp_screen.c b/src/gallium/drivers/softpipe/sp_screen.c
+index 031602b..c279120 100644
+--- a/src/gallium/drivers/softpipe/sp_screen.c
++++ b/src/gallium/drivers/softpipe/sp_screen.c
+@@ -358,6 +358,13 @@ softpipe_is_format_supported( struct pipe_screen *screen,
+    if (!format_desc)
+       return FALSE;
+ 
++   if ((bind & PIPE_BIND_RENDER_TARGET) &&
++       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
++       format != PIPE_FORMAT_R11G11B10_FLOAT &&
++       util_format_is_float(format)) {
++      return FALSE;
++   }
++
+    if (sample_count > 1)
+       return FALSE;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 014044f381..04285f209a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -64,7 +64,7 @@ GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALL
 GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "3.3"
 PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.1.bb b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
index 060a279015..ff84015aee 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
@@ -5,6 +5,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0001-util-rand_xor-add-missing-include-statements.patch \
+           file://0002-hardware-gloat.patch \
 "
 
 SRC_URI[md5sum] = "a4844bc6052578574f9629458bcbb749"
-- 
2.13.0


