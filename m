Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC978C001B5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 16:10:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.572.1662135001338695932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hx2jDcBQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1698538wmb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=7lTcPhWjmm1ID0M2DX/PUGUBp7b8L7Mu/HQh7t/8Wog=;
        b=Hx2jDcBQHHiGX2hB9vFytV7Ja9sVxUH16rzIdkcSrRUEDg7RFVztcYR3aoJ3gN2fLP
         b961jV5FXjpeFTW+zFAS+Q99GHKSgUd5WuJyTTmYiVlou9WboXwEUDnmTTdJcvTApSVA
         JdV5WkVZkLQmYvkFcXJr9BUGLLokySFAl0fQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=7lTcPhWjmm1ID0M2DX/PUGUBp7b8L7Mu/HQh7t/8Wog=;
        b=sDE+o5odTn5gSJ+L5FVemlJy+6VDIBp0rIJZ7zvZEFe7DKydfuYK3xS14oPmQhuPss
         FE3lzsxl/1b38R7DCSUOs/SNACmitcjh/4fEGkgi8lVu2fkiAlcBolymg86NNRP2PaYF
         XHNLIBJ+827OGa+8OB1fRIaZFIb7d8VJ5C9V9flCrJSl/ArbbjPvlPH9ooxlXnd+9K9c
         kBKJuP6JHjRF2/fknJrVkK3yeDCbusrTXT9iEjTvsbBecixPaaSOjuHFgL5bY64Lm8wV
         nEVe6+MW2leeGL9jDEbJrn9YKc07kQUe2pECl/RuunZMrIffCdLNT68S8QyrgHIMdrlN
         P8OQ==
X-Gm-Message-State: ACgBeo29405DUfmeueDXqkZMK4GeLjE9n+N/GFK85qkGeOScZx7v0sZ+
	ouwJcnEoiSnF29LRkMqC15G0oq+blIWOLw==
X-Google-Smtp-Source: 
 AA6agR70KOGPfA182z2APZHNVyxaiXeYOXX1Ixgb2BtUgXP84jvULUgHyBjdGqo9b4+d88oQaWrpgw==
X-Received: by 2002:a1c:cc0f:0:b0:3a5:333:310d with SMTP id
 h15-20020a1ccc0f000000b003a50333310dmr3419664wmb.122.1662134999137;
        Fri, 02 Sep 2022 09:09:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c1e916c8sm18843074wmp.1.2022.09.02.09.09.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 09:09:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: Always set CC and LD for the kernel build
Date: Fri,  2 Sep 2022 17:09:58 +0100
Message-Id: <20220902160958.321738-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 16:10:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170257

It as been bothering me a bit that we don't set CC and LD consistently
for the kernel make calls and this can lead to interesting bugs as the
kernel increases in complexity. Add them to EXTRA_OEMAKE so they're
always passed in. This makes everything slightly more consistent and
less likely to break in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index b5ddd6dabc8..e752874177e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -237,8 +237,9 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false"
+EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}"'
+EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
@@ -381,7 +382,7 @@ kernel_do_compile() {
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 }
 
@@ -413,7 +414,7 @@ do_compile_kernelmodules() {
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
-		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
 		# Module.symvers gets updated during the 
 		# building of the kernel modules. We need to
@@ -604,7 +605,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
@@ -642,7 +643,7 @@ kernel_do_configure() {
 
 do_savedefconfig() {
 	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} LD='${KERNEL_LD}' savedefconfig
+	oe_runmake -C ${B} savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-- 
2.34.1


