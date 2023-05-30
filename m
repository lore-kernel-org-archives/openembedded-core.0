Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34D2C7EE33
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 17:10:08 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.3079.1685466604030696307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 10:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Av7ZKoK2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso5078121e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685466602; x=1688058602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFMQFEAWb4qcSEi2mIDLmD1MlV/ZSdldXtZ+wnSRB5Q=;
        b=Av7ZKoK20DHmmgKF8CGw3buL7EHsXhPwLeSqd3ztwT73ey/jyr4+ZsXZ4VYbAI6Z1Y
         yVV2KqIRc8QnWJrI0lWwU1oCtGYumBaDkA+uNVyFByguwod/Qj92Hsuk2Efgg5Ep65bj
         dgF268ZuZhsj0A9PZH1rN8VJSLhIs/FSd3rO0CTU5I1avKehTv4kAL6b62nyuuTJyDfa
         dNfvjAqTxDyw0SsoCjjPz7Fib3v88Ywvq0E8O1p7yQUyRzLWxa3c4ZGWOcy3IXK6R9r2
         y2EfWGCrvvzSy2yogLC257BzCKcOEZOsQwj5DbG+7CtcY0U9tUGjvnhn5qmHtfAZIYV7
         qNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685466602; x=1688058602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFMQFEAWb4qcSEi2mIDLmD1MlV/ZSdldXtZ+wnSRB5Q=;
        b=emy7t5mGaPK2lcwA+UTnY0Osl8u7q8oKK7I5/jGWs+QVGuEr3n1pJEdfKnRIFqMjJ9
         dmD9IY1ohUAgpcX6M7tO7mN6J0AjYYF4wujQ1GxUHZp3ZqLMfcxBBvjjEt87EJuBffcF
         xjaVsJY6lfJJznTiwKkeasTkGjk5HdCpdiptA7Y3s0Qxhxowf+lU9j/2Dr642NtwZ8id
         zfLv6sjBTtRfwRhKlIla7OtKrx8z0yaXHHeu7vyzcZVra9mDKBLfL9oM2uUMaNMRM2NL
         F4D4SFrf0Dp3ZPoYQxN7L86NzTLuNW4K5tk7W/kRczh2ew0V//65g0hprrUTRuPrUL7p
         TFNg==
X-Gm-Message-State: AC+VfDz7SGtBXRUrglb6SnZNLln8rxcF00RRCQ3VK2llJCW0gECMc5X3
	ZtBTURC0zPJF1oIAimPMrrziFULHg9E=
X-Google-Smtp-Source: ACHHUZ6ue4tGejaxen0bJ7ROhk+mLhsNV2jKUEBrCy+OmexrSR8kWgyYQmEzrRStUooTO7DM1ebSmA==
X-Received: by 2002:ac2:4466:0:b0:4f1:40fe:a976 with SMTP id y6-20020ac24466000000b004f140fea976mr1307056lfl.30.1685466601705;
        Tue, 30 May 2023 10:10:01 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id u5-20020ac243c5000000b004f3b9adb04asm395352lfl.286.2023.05.30.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:10:01 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
Date: Tue, 30 May 2023 19:09:49 +0200
Message-Id: <20230530170949.12045-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 17:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181939

From: Ming Liu <liu.ming50@gmail.com>

Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
to append a string to the name of the local version of the kernel
image.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 10 +++++-----
 meta/conf/documentation.conf       |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e634eabd49..3dd139eda9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -616,6 +616,7 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
+KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
 do_configure[prefuncs] += "check_oldest_kernel"
 
 kernel_do_configure() {
-	# fixes extra + in /lib/modules/2.6.37+
-	# $ scripts/setlocalversion . => +
-	# $ make kernelversion => 2.6.37
-	# $ make kernelrelease => 2.6.37+
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


