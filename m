Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2363971A5A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 06:48:04 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id i93so8131015iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jun 2017 23:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=bsQwv0MpBl3KVpj5RnQzf6D5DcJzu9hy15JGW8+dA6o=;
	b=XCgzVPkpmetiMA3ScPIF4kWPwebP0uDAMb6Pb4xG6vs0+iFXBrSbcuLnDJKlTcUqf2
	VSqcu3A9j6CoFDUEP5jYBfffwta4DTAMAl1uCq1lBCNSB2DicuFeb93sdzhP7dsbd8Vu
	01I6N3bdK0u2UQ2xhRZ9sDlNU/4iXN/7yEJSb8Qpz5kbiMuYHVKdQCcxIupyxs/jpCp7
	fG6dtcehAlwxqikoHWr8CQfV+119srqQOIi0FaeRG3EPcFfqCrGszJhs8zxSOKzXvewt
	1k2IO4lZ9zHcu6xecEg4dyx/byHsifTV273RNM9PFvXWhD0HlxgtOrSPzEjKXwBotW4e
	0eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bsQwv0MpBl3KVpj5RnQzf6D5DcJzu9hy15JGW8+dA6o=;
	b=AJPZzcKAZhm6Wo0kJX6ZgCjVme9dsTQzdgLPtQWKEyAEAGK23uTwCqRKFg/8gm1qgt
	XXz1BxQZRFNGLtIZWVF+k38171GwOqN10a8ZIExnRUBvOr5anU7PBxlNDyxDUb63Q0K+
	8FpPT5pkL8sljhTHLJA/RpFxrJtHdBG7ilSGSkMEOtt9qc4urxihC0o98ojtiAxzaS04
	CH6ZGu8r2M7g+ySuv3Qt4B1zYVIVhUoOL+zBP8sj3A1EufW30mz6LfptcUmvlQ+ZTEyp
	lg2lcnR2XF3RgTUlWWXTu+xYJ/kUCXw1t6PYhhv4zGnj4PKKGJq+Ux28w93WbF0hEI/i
	OYXg==
X-Gm-Message-State: AODbwcASH2Gucaj/GscE8TeqlkpZ1VCyPvTOsaVdsi8Xo26e5h8U+teG
	srIxGmo2FTLfST+dTdI=
X-Received: by 10.107.29.131 with SMTP id d125mr46080468iod.8.1497163685738;
	Sat, 10 Jun 2017 23:48:05 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id e81sm2382006ite.6.2017.06.10.23.48.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Jun 2017 23:48:05 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 02:47:57 -0400
Message-Id: <20170611064757.5937-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH v2] mesa.inc: potentially enable texture float for gallium
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
X-List-Received-Date: Sun, 11 Jun 2017 06:48:05 -0000

Following the lead from Fedora (as suggested by Rob Clark) always enable
--enable-texture-float for all gallium drivers, but then modify the code to
not enable it where the implementation isn't backed by hardware.

Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are some
algorithms that are encumbered by patents. These algorithms are enabled
with mesa's --enable-texture-float configure flag. However, if hardware
acceleration is being used and the hardware supports --enable-texture-float,
it means the hardware vendor has paid for the patents.

Note that with this solution, non-hardware gallium drivers (e.g. swrast) can't
--enable-texture-float, which might cause issues with some piglit tests.

This solution was disgussed and agreed-to on the mailing list:
http://lists.openembedded.org/pipermail/openembedded-core/2017-May/137233.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../mesa/files/0002-hardware-gloat.patch           | 50 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 meta/recipes-graphics/mesa/mesa_17.1.1.bb          |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch

diff --git a/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch b/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
new file mode 100644
index 0000000000..9af9ae3b4b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch
@@ -0,0 +1,50 @@
+From 00bcd599310dc7fce4fe336ffd85902429051a0c Mon Sep 17 00:00:00 2001
+From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
+Date: Sun, 20 Mar 2016 13:27:04 +0100
+Subject: [PATCH 2/4] hardware gloat
+
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


