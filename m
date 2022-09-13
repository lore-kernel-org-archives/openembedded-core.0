Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C71C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.5277.1663078705730959658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=soF/gx6j;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id fv3so11487541pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=xmRnbGkiOzdpVVAOyHmQKPeNWWf+T5f3/Hx5q9VKKOo=;
        b=soF/gx6jag6gY2TxaYj5vz9mVkDwqNTkmbKI4NpalEisQB10CL4MNXTUYCwd4hMl8V
         0uOKtJRKmNK4+2jWjQiwVqWwNuGqBJz0Td7Jvjlzslp4kERJR8zaDILWsVrF603VTq9w
         /gH77XzDf+P0mgGJolep1fWvQtT7J5tG04BLS6WOB5u5deA8ql3zpThBzkISsDGPytWC
         9yTGyB+w4s6VgQIB1Xn7L4fXR/SYRjNUqXFSyX3Nb0iav/VhENQYVj9IBYCa4bx3HHRU
         p0tLPfBPZuhUt1j5hTuW/oSy7DeuHR/dS9JRRRu8lWScqkxarosCLEL920jr2L6sJbvk
         mezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xmRnbGkiOzdpVVAOyHmQKPeNWWf+T5f3/Hx5q9VKKOo=;
        b=6VKBRxcAeXsU00gkxG3qiyn5QoIspzgWTez9g4iTmyXDyps+l0tPuDlRiExNu6R1N6
         Wr3g8M4LoZ6Ct79zmX+1i4CN84/gRPPaTTl2E3Vd9Y6nZVMwl079RoZCSSxUa8RAtlGF
         JiGR58GMwmM1l6xzRjLsNrJFRcS2ACQbQjaOQXA2i2dRHgcs/jW4mXr+tdKZO94B4C3H
         QJdshC3FCbm/UC1cHd2hYaKtgL0TTnD1byMQARZ2j6EYZRi1cQCOsaTIEW1YzvhfHLby
         a1Dcainr+e7lxkwJHim7RTDMB1IZqjLHFS7omBkcShxMV3HtlYVQjed8zylFzqyDj+Gm
         gJmA==
X-Gm-Message-State: ACgBeo3+3uuDBgvgcZxEdkdgDDs8H30N3u2Q6s1Hm4IVlu+dEb8YJZQ7
	ZObACVRD2E9BE80bunMZ+A71IwJ55HGaIynd
X-Google-Smtp-Source: 
 AA6agR6QMXrv2PBqt7/g1K3WSE/ZpMn7BwtAI7L+h55kqkilOdazA5al6kXy3Vdpe2P5gK7+2se0ww==
X-Received: by 2002:a17:903:2410:b0:171:4bbc:2526 with SMTP id
 e16-20020a170903241000b001714bbc2526mr31998002plo.62.1663078704666;
        Tue, 13 Sep 2022 07:18:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] kernel: Always set CC and LD for the
 kernel build
Date: Tue, 13 Sep 2022 04:17:46 -1000
Message-Id: 
 <0872e11ede2469a7d176c791395b139158bd22a3.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170584

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It as been bothering me a bit that we don't set CC and LD consistently
for the kernel make calls and this can lead to interesting bugs as the
kernel increases in complexity. Add them to EXTRA_OEMAKE so they're
always passed in. This makes everything slightly more consistent and
less likely to break in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afe8c318843e4033dcc07e4f10198df241d8e4f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c29bd3d5f3..aca03fc071 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -231,8 +231,9 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false"
+EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}"'
+EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
@@ -375,7 +376,7 @@ kernel_do_compile() {
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 }
 
@@ -407,7 +408,7 @@ do_compile_kernelmodules() {
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
-		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
 		# Module.symvers gets updated during the 
 		# building of the kernel modules. We need to
@@ -591,7 +592,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
@@ -629,7 +630,7 @@ kernel_do_configure() {
 
 do_savedefconfig() {
 	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} LD='${KERNEL_LD}' savedefconfig
+	oe_runmake -C ${B} savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-- 
2.25.1


