Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A88F71C5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:34:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so51375548wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JzZE1wWgWwmzbErcUNAGWxqL26q+bI2a7j4NhT301kM=;
	b=BO5MXxAFHEIeRTLCO5UMYyBp7jvNOPFu+QOuKomsrBpj+w5H0VCT81asoT+fhReesZ
	GveG5NDBwPP6pwnoOXslu4fO+CNx5G50CtK+57kcwNZidq13/qDZQNQf26qoe56CsjrP
	EUviBLszqCGfO460cz6e8382zR6UQSig491QCIY7pJhJJa/1J5PQq347QLUWbACoU1g3
	psaIUcuR2Rl9CgKzIX1qBGOJvTfxnbiLcB7wDab29XuvzGxw+3MVrQQvXyHUAGfXT98O
	+cuJb8KS+EgPI1su19VvMUPuQj7mwFxegvRvPIC6ChoxQYyLJ8zw8M7uMoeTDmuyiBW/
	G3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JzZE1wWgWwmzbErcUNAGWxqL26q+bI2a7j4NhT301kM=;
	b=W80ICdc4vKZ42rRdqBQF7uMAku9K0FYJgNnqt58W2Z6nSkSpPBQHQmO1N/jqlStd2s
	1NVBioFj/S/gko+cohb55ebY7WgAKW6qtQSANseTvE/MNk+Otq2tm2DkhuaGJPITh1MO
	S3pL2GVLDPR978Sy0ziblVhfUmQl0cGlydSlobFb/5DOW21abPtDBG8oyhfbrJGDBaLZ
	ThDaslk/tYiuDKz3YkwKka2+00fLGz6gCgcFse4i3eIUu07cVprQaxmMkXIjvpq7NWmM
	wNu5H+1muaLAHZzLF5aQ4JgH9bRvIG8k53Bj7d+iGYLCs/vKRktf8G9xZmIZ7dDk2Bvs
	qaeA==
X-Gm-Message-State: AIkVDXJoblUuD998pUAkKQcBubaz4ivkF3oRp1AFBrFETDSwgqX9nlz86WoKC9dk1ThNSw==
X-Received: by 10.223.177.195 with SMTP id r3mr3312592wra.147.1485444848598;
	Thu, 26 Jan 2017 07:34:08 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	m84sm4255085wmf.10.2017.01.26.07.34.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 07:34:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 16:33:56 +0100
Message-Id: <1485444836-8374-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: fix 16bit modes
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
X-List-Received-Date: Thu, 26 Jan 2017 15:34:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Discovered on beaglebone black

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...003-modesetting-Fix-16-bit-depth-bpp-mode.patch | 46 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.1.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch
new file mode 100644
index 0000000..5243761
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch
@@ -0,0 +1,46 @@
+From 5028ef46ff4ab0930224b71024a7349b05610d42 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan@agner.ch>
+Date: Thu, 22 Dec 2016 15:41:06 +0100
+Subject: [PATCH] modesetting: Fix 16 bit depth/bpp mode
+
+When setting DefaultDepth to 16 in the Screen section, the current
+code requests a 32 bpp framebuffer, however the X-Server seems to
+assumes 16 bpp.
+
+Fixes commit 21217d02168d ("modesetting: Implement 32->24 bpp
+conversion in shadow update")
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+
+Upstream-Status: Submitted [1]
+
+[1] https://lists.x.org/archives/xorg-devel/2016-December/052113.html
+---
+ hw/xfree86/drivers/modesetting/driver.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/drivers/modesetting/driver.c b/hw/xfree86/drivers/modesetting/driver.c
+index d7030e5..647ad83 100644
+--- a/hw/xfree86/drivers/modesetting/driver.c
++++ b/hw/xfree86/drivers/modesetting/driver.c
+@@ -930,7 +930,7 @@ PreInit(ScrnInfoPtr pScrn, int flags)
+                    "Using 24bpp hw front buffer with 32bpp shadow\n");
+         defaultbpp = 32;
+     } else {
+-        ms->drmmode.kbpp = defaultbpp;
++        ms->drmmode.kbpp = 0;
+     }
+     bppflags = PreferConvert24to32 | SupportConvert24to32 | Support32bppFb;
+ 
+@@ -950,6 +950,8 @@ PreInit(ScrnInfoPtr pScrn, int flags)
+         return FALSE;
+     }
+     xf86PrintDepthBpp(pScrn);
++    if (!ms->drmmode.kbpp)
++        ms->drmmode.kbpp = pScrn->bitsPerPixel;
+ 
+     /* Process the options */
+     xf86CollectOptions(pScrn, NULL);
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
index 987a2be..98ffc86 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
@@ -3,6 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
+            file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             "
 SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
 SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"
-- 
2.7.4


