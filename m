Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2931BE784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 13:36:53 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.81915.1696253808927784294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 06:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=R0WV7Yg+;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.53, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50306b2920dso3853449e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1696253807; x=1696858607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGwJPE1WD8kdAsrlo6/7jCOZMr3gpchIR7/PqgcDnVc=;
        b=R0WV7Yg+JFJcmy7MDp0MccWdEh3t2a7YFurp7WVQVlJiGKAElgmns8OVWRIWaAXfwl
         xgw+PZDu3e1mmT2hbuoukJSGbcX8k3QjTUIPEG96Ol3Qq2A6EoqUu3cb//Op7DOYMlD3
         ct/rp5/xSGdE70iUnVOmB2eTIlZfGqDmzlJFvHLgGKppVVzj/cleBNu0zISgVMBPefkM
         g2jON7d5CWs+pBhPFTQBtDa4QRWDJRdJIwqbdl40mnj6jI/TftW+pGueuWH43hVhIcCz
         4w7COC+afMEgwIbj0hSjSUjF0AyVp6ac3jh4Xees0ptGPXeEyjmazTG+SdY9ieexaviA
         JGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696253807; x=1696858607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGwJPE1WD8kdAsrlo6/7jCOZMr3gpchIR7/PqgcDnVc=;
        b=UztWSZkIVUBcFTFZaGQGAleNCMgnflryoUMGVKK7UiOsK3qwAETBdTpgbLk+ak5FGJ
         /NrmV+os2lynjT7r4SzdwUBuj2dxQfPp/PQz5P42feO433aMfMjVAA4Of9JSrG+wTCJv
         Xoi5AmaG8LIc08278cQhgLLgMJ2zNBKkpbdVL/Cu6wDWZ9qUVpEWKoHm553kVYIOfbka
         +PLdwBrhaiHyl1Zr1jtwt+H6b8j5LORoI5CMTeCec1UE3ILPpJueneHWERGQaaXSl8wP
         Ue1Q6LQh/yr4H1itlObYdB/WEsRfH+XWw6p06WUE2HK6VmPA2JTz/ywHlva7uptwCD6z
         0sZw==
X-Gm-Message-State: AOJu0YwWtQE16/7PstwOl4fkCw5fPt3lW7WeluI584ZQFJbGhCqGZmQS
	sS374JCr1tGNZ6dJUFwJr0ICDQEHqXD0TwSAJpI=
X-Google-Smtp-Source: AGHT+IEpQMAAuofEwmB0BJKkcRyUs/M3YitLRDHbor8v4TmE4QQTrsnXHD+C8d2Sn/r3MY1u1b4tEg==
X-Received: by 2002:a05:6512:6cc:b0:4fd:d254:edc6 with SMTP id u12-20020a05651206cc00b004fdd254edc6mr9236666lff.26.1696253806455;
        Mon, 02 Oct 2023 06:36:46 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id d14-20020ac24c8e000000b005009c4ba3f0sm4647465lfl.72.2023.10.02.06.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:36:46 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH v1 3/3] uboot-extlinux-config.bbclass: Add menu title configuration
Date: Mon,  2 Oct 2023 15:36:15 +0200
Message-ID: <20231002133617.205619-4-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002133617.205619-1-dse@thaumatec.com>
References: <20231002133617.205619-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 13:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188610

Add new UBOOT_EXTLINUX_MENU_TITLE variable that allows configuring
the "MENU TITLE" entry.

If set to empty, "MENU TITLE" will not be added to the output file.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index a7f325ff2d..30bbea57de 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -23,6 +23,8 @@
 #                                    Measured in 1/10 of a second.
 # UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
 #                                    the timeout period.
+# UBOOT_EXTLINUX_MENU_TITLE        - Menu title. If empty, MENU TITLE entry
+#                                    will not be added to the output file.
 # UBOOT_EXTLINUX_CONFIG            - Output file.
 #
 # If there's only one label system will boot automatically and menu won't be
@@ -68,6 +70,7 @@ UBOOT_EXTLINUX_FDTDIR ??= "../"
 UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
 UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
 UBOOT_EXTLINUX_MENU_DESCRIPTION:linux ??= "${DISTRO_NAME}"
+UBOOT_EXTLINUX_MENU_TITLE ??= "Select the boot mode"
 
 UBOOT_EXTLINUX_CONFIG = "${B}/extlinux.conf"
 
@@ -95,8 +98,9 @@ python do_create_extlinux_config() {
         with open(cfile, 'w') as cfgfile:
             cfgfile.write('# Generic Distro Configuration file generated by OpenEmbedded\n')
 
-            if len(labels.split()) > 1:
-                cfgfile.write('MENU TITLE Select the boot mode\n')
+            menu_title = localdata.getVar('UBOOT_EXTLINUX_MENU_TITLE')
+            if len(labels.split()) > 1 and menu_title:
+                cfgfile.write('MENU TITLE %s\n' % (menu_title))
 
             timeout = localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
             if timeout:
-- 
2.41.0


