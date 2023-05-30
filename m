Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7672C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:15:48 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4531.1685477745220992927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 13:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YFtTDSFq;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so5698836e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685477743; x=1688069743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DirNwdYpm6uFrz/7P31nFWR4BGIoVcxBXYowacQIE64=;
        b=YFtTDSFqMDNXh9rwwfHTKZA8PhFpqy0ajqgGf3LmWQvX2s09zHLB30YLIyYfpB1VMr
         sk1lVPCLC40qiQsJ7/lObs+qM2Nxu3kUNd0ECHickwPQVo45g2CeNE3RMs39TJWqY3MF
         TldbNo0yn0f2S/R/02B75qgheIS3kLIo/R4L4osJ6Y2dLosmFgS/QdxgC5r2bnNknaU5
         3uSIekxoXAlfG4YFRlO7TAb+sShjI+G/2TKAw2RkpqDJfvec5p3ZJpcMk6pXag2HIWRC
         OO6TKAXnwO1su3l4qT08ohZMwkhl0wNWilkaJMglR118rCaTocejKATzGRRKepCToSAi
         THhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477743; x=1688069743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DirNwdYpm6uFrz/7P31nFWR4BGIoVcxBXYowacQIE64=;
        b=HbXemZ+MFnu7d7lxycV4Ns2bhnyv6r8v0Rp2jDXN8P9KzAEbg5KJragWyQKWyyaREb
         sJa5IzZdl3urmPrSIHMrcNKaYBDTI91J4fHAfU3qdkpb60hggxh52CLsDmcwkfCBFsop
         h7Q12eSdRMIpbF+zucWBHzWS+2BGCHielW10X+G15+C1Tw96RXtDsjigJQspmueENn3C
         nRj4Y519FBjEYyJbAhzELwFltqYEHt6wfDFOoIyCdvRIyRYnl/PatHCk51qws1DvZoBr
         VCqkHXCfI4RC99V1BYwwMH7BephiXpGFFEZ1aVntQls4yOuPPzr9rtsc9w7V8ZzbBrXQ
         zAhw==
X-Gm-Message-State: AC+VfDzLKFyFA+tYhXASU9yZRV3rBz0e/HY+56ftSDMQVSNGHKuxcKug
	8zwYPC51r10lYfXJaVeYNCoPlJZqh3E=
X-Google-Smtp-Source: ACHHUZ5LtlR0uMN6LWheT8wp1ol9SlBsWxsIl5PKd/JE0CqpSsbHupsN9vYHieiHjRGopyIAhuEvXw==
X-Received: by 2002:ac2:5dc1:0:b0:4f4:6189:1d0 with SMTP id x1-20020ac25dc1000000b004f4618901d0mr1608706lfq.7.1685477743062;
        Tue, 30 May 2023 13:15:43 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id o4-20020a056512050400b004ef11b30a17sm440130lfb.91.2023.05.30.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 13:15:42 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] kernel.bbclass: introduce KERNEL_LOCALVERSION
Date: Tue, 30 May 2023 22:15:40 +0200
Message-Id: <20230530201540.1179665-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 20:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181949

From: Ming Liu <liu.ming50@gmail.com>

Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
to append a string to the name of the local version of the kernel
image.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 6 +++++-
 meta/conf/documentation.conf       | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e634eabd49..0d357407d9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -616,6 +616,7 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
+KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -637,7 +638,10 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
+		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+	fi
 
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a27d7a53c3..66b8e2f24f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system
 KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
+KERNEL_LOCALVERSION[doc] = "Appends a string to the name of the local version of the kernel image."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
 KMACHINE[doc] = "The machine as known by the kernel."
 KTYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
-- 
2.25.1


