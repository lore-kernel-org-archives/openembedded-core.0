Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17AAC43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.8.1668103983812497982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FfxjaAcB;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id cl5so3438927wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFPJii7JmubiC/OK9BqpgSfsP/qQccBo5OjM13HRUp0=;
        b=FfxjaAcBA0hjNbvIpQmNwq0d2Pi4nBtX25y7uesgKiGcMYzsdjT2jbkhM3/BwcLlUp
         tcO8+jgWVLOBoP+hWEff+hVAUArumEl7TF4CRFs/a5mJRok0goT5zKSA1OmrYg9vRY72
         MAJ1+mkY+0p4WhEMMePoSPdPNJKjy65LfXz2a4kFB8OSmRpxAwlYx08kJ4cJoPn9viqN
         1s6OuN/ci4nDdLTejSQdx5hnPDx+SAXvdOjP6SiYpr+c14IQP6RZ5Ywnon4xHq7QQSDa
         OIiNTJ3YrrMC1q8+GXyqihmzU7iFYy/RTP7GhwpFwZFSZ+uI55uj3bhwbjgIM5MGGtfn
         BZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFPJii7JmubiC/OK9BqpgSfsP/qQccBo5OjM13HRUp0=;
        b=Kc8qD/lCPyDPsVVjI11I5Dp3wB9phYd/P2Kz1CjgpZSOyxbmDp3laIlM9MUcFuK174
         MiZyuEb3QtNCAO88GfyJi/Y9IajtTceoAcgXzVFK3Dmk2UGIFJrT+L6oDhzrIVewaEIr
         spyRvhajYKXZxT+bwONb4qwnwZEKNhmDWMsVUL0jC6YtPX0ZL95lKxbWxxFmf3hr/F7s
         LpfbiBDppfMig2uJNHy+BDAgFzKCV4CcgiFEgPeBSzXIxXCXIRShtasQ4EWdhR+rfGvA
         M+b95h2hqRbbfg5gsCNAriPfQ8pV7h4yciqoURb8ZvUGwk4Yni8u1YD1Ci8CKQc6Jvn5
         4qJQ==
X-Gm-Message-State: ACrzQf0ed3OV6Lf1CwOQ+6fwneNeavKuubkzx7vriaANUXI3hovgAJUW
	RTWBWpO3Ha14Waa0z/Uf4gAFC5JD7TM=
X-Google-Smtp-Source: AMsMyM6RcM/rkk2P4GeazpRJDaoBpgtSU9nciXQRI0knJvJVoCPdsTMn/JO64qI7hW6agwMaWngBQA==
X-Received: by 2002:a05:6000:156e:b0:236:ed91:5354 with SMTP id 14-20020a056000156e00b00236ed915354mr27935079wrz.203.1668103992467;
        Thu, 10 Nov 2022 10:13:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/19] systemd: update 251.4 -> 251.8
Date: Thu, 10 Nov 2022 19:12:49 +0100
Message-Id: <20221110181249.1240200-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173102

This resolves systemd-boot fails with latest meson,
while systemd -> 252 is being prepared.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemd/{systemd-boot_251.4.bb => systemd-boot_251.8.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_251.4.bb => systemd_251.8.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_251.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_251.4.bb => systemd_251.8.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_251.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
rename to meta/recipes-core/systemd/systemd-boot_251.8.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 71eb93f23a..3bb6b0efe6 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
+SRCREV = "ae8b249af4acb055f920134f2ac584c4cbc86e3b"
 SRCBRANCH = "v251-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_251.4.bb
rename to meta/recipes-core/systemd/systemd_251.8.bb
-- 
2.30.2


