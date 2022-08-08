Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8031AC25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.22609.1659940976814088192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KM8M+KRJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id y13so14734877ejp.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uyaWW9CKtSKM4mhxDLDdO3E/whnxtxhoS1mun0KU/3M=;
        b=KM8M+KRJgzuzVRqhstQfc2r9u6ZZpUARFQ1XmK9FvokZnQ6NCoOyhuMdCNadOuf+f4
         8of0qQMcLJvM04LagFvm33aR1u3AjLELKqSvT+UJBi6qfnTfgf04e3Z9O1DvBCnu44YS
         VZOmIJ4bS7qr0eQy6yeRp536IzsVDFpCPFhc5wB6IfrhL/loOH2nRGWNC3ZkNaQjJVW0
         7pOp0x0qkWIauofGT8lgv++sDhslSST4jMiyk8+G5UWWxEdnGfV9LAhA+g4dCZlozM2b
         56nY3tQH83sOqmV4ZismMGh6S2sdgNNeOpeUEZ3K7sYP/V30kCWZ7ly7HOQ9VhAnb+pj
         GOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uyaWW9CKtSKM4mhxDLDdO3E/whnxtxhoS1mun0KU/3M=;
        b=RJYqmiv+dwWTKqINGI6lBFHoLTsgS4949SPx0H4OSI8/1BsJcGdTejjEpqvXB8Rtlm
         KmgGEHlmaMC+Mm8YBmRimhBRTseh4qs8/vYKa0PV71CDsuMPW5r6rmG1mAZoVzzztTzJ
         S9wtq9RjNvJseHNJIkMN1x7klhmdn+yezfCexcAUACUeX1FG9p9KBCKcNKKr02Y1fhu8
         qM9Q+xG6sFouOuUgDF47/BivpZFn38+3PGlxXihPoV8IDaKOGDsqMezg3PNpYY5SzHEE
         KaR+WQibhpwN5/AKg2Uts4fUQN+Z9N7UWn50vvFnKPVmz9XOQdcLq4+P32LUklxdapSa
         2i4g==
X-Gm-Message-State: ACgBeo3nNxStNHGg3l7H7FMvOYjD3vCJk2X/7oPk2a70gbCS6zNrEv2r
	WrXCXMneK84k74yDcqOoC95YuBuWnjs=
X-Google-Smtp-Source: 
 AA6agR4ciZprWtl3AOulGOf0YKUa64VA3tnOAfoQy3+6FU/bf+jxpdGVZ70Xodih2UOzUNB1fS7eLQ==
X-Received: by 2002:a17:907:2d92:b0:731:3310:418d with SMTP id
 gt18-20020a1709072d9200b007313310418dmr5517049ejc.379.1659940980196;
        Sun, 07 Aug 2022 23:43:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 22/44] libcap: upgrade 2.64 -> 2.65
Date: Mon,  8 Aug 2022 08:42:15 +0200
Message-Id: <20220808064237.3975347-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169046

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.64.bb => libcap_2.65.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.64.bb => libcap_2.65.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 9884fb5641..3f4c7e57ae 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From fc60e000169618a4adced845b9462d36ced1efdd Mon Sep 17 00:00:00 2001
+From 1c234bc39446eb9b23896e85dd67b02976d46c3d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.64.bb b/meta/recipes-support/libcap/libcap_2.65.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.64.bb
rename to meta/recipes-support/libcap/libcap_2.65.bb
index 7690d3e9a5..8013d40769 100644
--- a/meta/recipes-support/libcap/libcap_2.64.bb
+++ b/meta/recipes-support/libcap/libcap_2.65.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13"
+SRC_URI[sha256sum] = "73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.30.2


