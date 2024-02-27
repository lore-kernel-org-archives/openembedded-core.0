Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E75C54E55
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.1953.1709071055953878057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YEQpsMQj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e508725b64so1295959b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071055; x=1709675855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNN12jvAcFfDMzoNGst+Y8uXL0RjDhvEmDBwVoP2XWo=;
        b=YEQpsMQjndcSbjY0Hv5k7TTe79gT7WKf+DuBcuZ7ym5oKHB9vR1nH0HuXpVs0zDKHP
         JgTPCvPzqUYDWPhchjwm9eWaD+qjjSjiA8cabyWlwiPmJe4FxpmU3h/MwY5UTAx3yLqf
         mpWD4kJccihCjq/AyAAuDSjoEj5WECsRzFiHKPrVTswpxHjD+f/Q+SKIdVNrhZc5VvdP
         Wr1CPpx3qn4t1uxRUFtoEZfWlNvhzRfpKctr5laaW4Erc3EYiMalRsMJnnB01p5q4VTQ
         G/RHYT6/tbuCjJ3gZiOVvo9HbJDLX4PDy33bIyvlBsV82iTKG+cxn7wKjCrxZrRgllq+
         RYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071055; x=1709675855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNN12jvAcFfDMzoNGst+Y8uXL0RjDhvEmDBwVoP2XWo=;
        b=cZRcav8XesgBqHmcoL/5zBoIIYSaLLXA2zpKaG3a1KKXiYeuCOsoFdO1jZQm0aKoLI
         nwWMv2mmUCkeZGucYaBbgmq7HbNJ/Yw0pp3V2o26FffGFqvXcTEdjig0jfDOO73coW90
         exRJHoeHvYTLCw6UECNg8TqVl5IvAID/z/ySqjeSZBeNQw5Hzj87Ow+sGBN4zlVlGzHw
         3POIfJcVpBN69fqnYwboRvc03IStJahmtC+BYzutmg/4gDCgnLwZja8K4pbzVaYu8WD7
         w/mmNGKgvPG137bySk69aOQSLc6kre6uZtEzT/ZUu2mR4upcRbpBQt67CgsyHrzY2/7n
         nggA==
X-Gm-Message-State: AOJu0Yw1EQxL5NA6yMOFXxf9W5WKmN6fvVfHdl1x3A7JHLWlntKEnfnQ
	dHTamcfwYmbbbq4gJtKc6B5zun9yjY1E4QeQEfQ2ZhgfRLLX8dl3zkXGWeUJlcxPqDky1kF+fB2
	NdUk=
X-Google-Smtp-Source: AGHT+IGy4r41wnOD226M23U408JFSRyixV8GuiUjh7pyEKJwiXfRt79+MtfxBi64Eb2HQz6knyHRsA==
X-Received: by 2002:a05:6a00:23d2:b0:6e4:f753:1e12 with SMTP id g18-20020a056a0023d200b006e4f7531e12mr11210787pfc.28.1709071055225;
        Tue, 27 Feb 2024 13:57:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] kernel.bbclass: introduce KERNEL_LOCALVERSION
Date: Tue, 27 Feb 2024 11:57:01 -1000
Message-Id: <29a0d2a49df8e24f3948a2ddf03743f0cb5d09dd.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196313

From: Ming Liu <liu.ming50@gmail.com>

Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
to append a string to the name of the local version of the kernel
image.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

cherry-picked from master 229435a52f36ddec5f85fb6d5ccd42044b688397

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass  | 6 +++++-
 meta/conf/documentation.conf | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5951347361..80fb1879b0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -614,6 +614,7 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
+KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -635,7 +636,10 @@ kernel_do_configure() {
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
index ab2addb321..e55bfa288d 100644
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
2.34.1


