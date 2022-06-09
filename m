Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE6C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 08:58:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8312.1654765118343681912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 01:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EH3Dsy0P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id e5so5262400wma.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qn9ibh0QEn13FggcUTUE2nxv00P46BQh1rFgutvJpbY=;
        b=EH3Dsy0PJxd4ZyaFKGadmxdrnDu97YLNsokFzivgKiGuBYg5ZFBRw/TtiWn2/CvNoE
         lJAZ1/hcmIe5iI/cl7Xz3I/o4hFQYKxeDUL26A1d7Gp86q81skomLYEaGylFcWbaMTCX
         W/oqLp/zWIH3GwvHNNEpx4FsJMbOK/OzuNVk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qn9ibh0QEn13FggcUTUE2nxv00P46BQh1rFgutvJpbY=;
        b=FaeO575oswQfOlY0BK0cLy0a5dSHBsxSzGeDHfMdGifj1hhfe54un5zOvaggi2Sky3
         X13kd1VV7ol+rYAZYdzBK+hnhTfQhYMPw3FcUHpfnBAdl0i68l9F7KByrkujsWX1XJr0
         TX7jnZbaxqXRlJgXxQqj9UGoAmNf6E81CWCRwKwlNa9v9Jx+YNMaoDP2WZu/TCZbobvO
         eu+yr0pWXClWaidPON+LDA0mB7ha9ReDQot3QtJypV1qe5DxEyVGQbab9admrOc/jHhI
         KDuFgbnKxOuGnUWsb5B2wG/NMsI9eXPiM2HpbOIiSZhGAuW4h6wP1xLJwWHXrP78Rz9V
         Q8sQ==
X-Gm-Message-State: AOAM532Yd9QbirHYwQB4lTdE/Foty4IglczslHPrxrWATWidS4GwWsIG
	jT5krhMS7kkn5KFk7RjtEBfvrmMUtn4bwQ==
X-Google-Smtp-Source: 
 ABdhPJyyCwiEV8Xp0+1jngWOtN3Rfd2g8R+m3rEUu3ATZ0tmlZ3aIA9UyN9LEBgyf/KJ/7ldj6A0uQ==
X-Received: by 2002:a7b:c384:0:b0:39c:605e:fd41 with SMTP id
 s4-20020a7bc384000000b0039c605efd41mr2241805wmj.65.1654765116334;
        Thu, 09 Jun 2022 01:58:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4643000000b002103a7c5c91sm22902092wrs.43.2022.06.09.01.58.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:58:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot-sign: Fix potential index error issues
Date: Thu,  9 Jun 2022 09:58:35 +0100
Message-Id: <20220609085835.39738-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 08:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166763

Someone reported that if some other shell function has left i or j set,
the concat_dtb_helper function could fail. Add a small tweak to avoid this.

[YOCTO #14815]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 4ca8118eb27..31ffe1f4720 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -134,6 +134,8 @@ concat_dtb_helper() {
 
 			if [ -n "${UBOOT_CONFIG}" ]
 			then
+				i=0
+				j=0
 				for config in ${UBOOT_MACHINE}; do
 					i=$(expr $i + 1);
 					for type in ${UBOOT_CONFIG}; do
-- 
2.34.1


