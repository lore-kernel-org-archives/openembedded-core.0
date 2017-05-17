Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C39677D88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 20:12:23 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w50so3422615wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=943y3eNemjXL9kVlRGkJ3PEZAIu4/lkxMdG0GOm5XAg=;
	b=F3fFDtdMcxQ9ltmLq/2iGgxrhLiwd7KfV/PXfQzpqab2QXSM3Q79goz0EMPGy4+9vq
	s8okE2n96PDfnoF0+cprRhY5RJNIHGonmdEg++00XVTWAZnNrr4841QTAbWAvWZO0Jru
	ZHOJyPfl2ujmujdb6oaAtsQoQJhCpGppMXPmu0pupubcFTbN2QtO/7hAH8AdVdmRtAAG
	xxm0b35sBPv61gEkq2l/1BIhkrOuTDqcf5THY5QoSbDl7AulS+097m8yk7hifksD+upO
	PAW3K1g5eqggQoImbj3dpMCCng0+jsD9EBLhmgeosdQevWl+W0DE0wbTRlZ86v6iIvcQ
	LCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=943y3eNemjXL9kVlRGkJ3PEZAIu4/lkxMdG0GOm5XAg=;
	b=E9cZZvoavjoaSz4IsR8ETZPzeTYpkct41vBjTA6NNJnrdfR3ZIFlJuF3Z3RawY0xIe
	STm/6ApX/p12WwDD00gkstzUOedKjIIWid5c5jXNXRO+bZFM7RpLDXqUUYHyKXCTx765
	yzAIdnCrB0Jn/3DKqKGpNq57rsQVhGUAMUVPnH8NxK1jCFnykjFAFGDF4ldyQ65F49kM
	Ib+9FS4g/QXop3yGjULXJpz5xpiCu7fH1tH15TShoxk+3nhDasbERsVjeD+RtuyDSGtF
	RlU/LjoAFP+sHtId1mWa/gGLU2sulGN5/sAlcu8ihisr/9wxARPY4cMVPufOIAgdBaIb
	rX+Q==
X-Gm-Message-State: AODbwcBKG6ISrkfn7k3Gen+Hbuj+Lw/LdthzksmzWNvk1NOPq/yze6CO
	BVTXmcFH5a2EnsP8
X-Received: by 10.223.154.100 with SMTP id z91mr305335wrb.76.1495051944615;
	Wed, 17 May 2017 13:12:24 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	185sm3615750wmo.10.2017.05.17.13.12.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 13:12:23 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 22:11:34 +0200
Message-Id: <20170517201134.26758-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Wed, 17 May 2017 20:12:26 -0000

If building for nativesdk the wrong rss sysroot is used leading the
following error message.

| ERROR: oe_runmake failed
| In file included from tools/imximage.c:13:0:
| include/image.h:1024:27: fatal error: openssl/evp.h: No such file or directory
|  # include  <openssl/evp.h>

Tools needed on the build host (script/basic/fixdep) and code compiled
for the SDK machine are both built with the build host's compiler,
leading to additinal errors.

Adding CROSS_COMPILE="${HOST_PREFIX}" and using the cross-compiler for
the SDK_ARCH fixes the build error.
The resulting binary in the SDK is working.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
index 1aa95e7..de999e7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
 	oe_runmake sandbox_defconfig
-- 
2.9.3


