Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 46A966C6F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:24:20 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so82321244wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rq4M/yvLo43/lzKGrTVX50ZL7KbN0dMvOCPDx4dfszI=;
	b=AUsOjhWC9vEpjwmJaZ3IJJ+ToncvhjVfchgOTZK32Lit++7jeS3Yt13dGbTTGGIjiR
	7blS691bOVHT15W24KJUPloWukyyjsc1k+QqfTgS09FM6g+Dl8Ncd1fm8ePqB4zbgZsd
	N7MKs4/Y504kXhR53dnzCrseK/MpTm+AwvYSu7/m4y51qHVKPV3M6deB2bKngbn9c+nB
	dcb8qPTV3dCuV9NSCCMyEh7wE6vh2PauDqMWVEV893+auNA3p6KUzgwxhlEOG0Zkq78k
	todpWHVdjabL8juuNjfMeaQQ/f/Z9LoXQ1uBUF5VKw1K2GEDpLiCqC9A3gr9DzvMlUig
	hNmQ==
X-Received: by 10.180.74.102 with SMTP id s6mr49271956wiv.37.1432207461837;
	Thu, 21 May 2015 04:24:21 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g5sm31634021wjq.6.2015.05.21.04.24.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 04:24:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:24:36 +0200
Message-Id: <1432207476-32627-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [fido][PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 21 May 2015 11:24:21 -0000

* it's useful for debugging corrupt squashfs images from mksquashfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
index d36f0fe..19d555e1 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
@@ -27,11 +27,12 @@ SPDX_S = "${WORKDIR}/squashfs${PV}"
 EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
 
 do_compile() {
-        oe_runmake mksquashfs
+	oe_runmake mksquashfs unsquashfs
 }
 do_install () {
         install -d ${D}${sbindir}
         install -m 0755 mksquashfs ${D}${sbindir}/
+	install -m 0755 unsquashfs ${D}${sbindir}/
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
2.4.1


