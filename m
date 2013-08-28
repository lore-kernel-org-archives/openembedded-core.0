Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 311846BC83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 11:12:48 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so6096578pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 04:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KfSFPJQHbqJeN3Zmm8pNKJvZ/EHV674E36iZGTeT050=;
	b=Grza3HHGbEIU62FFtB9JbO2yfUs0hwn4TdWDKmJMAdg+rqYZLrHCMzGvZ66MiFGwVh
	O1vRjxfiugLWZrFFdlHG5Xe6cHoOgsNltJkjzGLl6Dh4u8FU8TtNN6ydpj/v5wugd2M0
	lXdQylA2T7otP9ZMCBJ6GeWkB/9kcWDczGbWhN8gWfp/XZ4XXqtxV1uvZJ7xeiNrG8mq
	xJ0UDWgejH0b+iKkgv9EuJYCrNtOFJMSTRuBv+RQbqdM+ly6VZUxpEkfXor+AkxYPQWY
	T5LbR3OJ3hr4AIcn/rRcHOMnLloV9YM1GQ9YGtVmwiN6jYewNCHW768z2D9yGco/metG
	+yEA==
X-Received: by 10.68.210.103 with SMTP id mt7mr14201187pbc.179.1377688368947; 
	Wed, 28 Aug 2013 04:12:48 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	br3sm30625474pbd.31.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 04:12:48 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 21:08:14 +1000
Message-Id: <1377688094-9542-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] mesa: add missing elfutils dependency for r600 PACKAGECONFIG
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
X-List-Received-Date: Wed, 28 Aug 2013 11:12:48 -0000

Fixes the following configure error:
configure:23490: error: radeonsi and r600g require libelf when using LLVM

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e985d67..71fcabd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,7 +51,8 @@ PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
 
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_LLVM33 = "${@base_contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
-GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', '', ',${GALLIUMDRIVERS_LLVM33}', d)}"
+GALLIUMDRIVERS_LLVM33_ENABLED = "${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
+GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 GALLIUMDRIVERS_append_x86 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
@@ -59,7 +60,8 @@ PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --witho
 PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
 PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
 MESA_LLVM_RELEASE ?= "3.3"
-PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE}"
+PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
+                               ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
-- 
1.8.3.4


