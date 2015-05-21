Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 124A36C6F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:23:55 +0000 (UTC)
Received: by wghq2 with SMTP id q2so82271022wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rq4M/yvLo43/lzKGrTVX50ZL7KbN0dMvOCPDx4dfszI=;
	b=Ti1P+vTNAVwwATkvuevtGb1VVqqe3ugwDWongiz1kvOxRuCtfSMFy8V3Y1RC8IuMaL
	N2ltux8e1b3X33Nm4vn+zfKwApZ15swTyNVc5e3wP1Du/LjJ8SAVELxBke7C/3DasgIV
	wZo4KXAszgSORD/itUKjPPbNika+vUnprBXWW0I/uzaRqlYLecW5eScBuVuVRrPjqu7E
	yVMUj7mFUG1F+0OTnTDxTp2WP+yifs9v/K3qgLdCBWf08/S1zMzBwCUAGm9uFVBqa2U1
	vfOekNU4GOR843fYiDPloMAT5FqFEw+7JKMRmLn4BJnp1VnDHw8L7QtCmBfvQ9goudOX
	GVow==
X-Received: by 10.194.7.97 with SMTP id i1mr4468645wja.107.1432207436249;
	Thu, 21 May 2015 04:23:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id d13sm1010645wjs.20.2015.05.21.04.23.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 04:23:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:24:11 +0200
Message-Id: <1432207451-32310-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [dizzy][PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 21 May 2015 11:23:56 -0000

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


