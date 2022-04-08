Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D203C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.1056.1649445926786063052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=H5tGkxm+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id 10so11398329qtz.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FEe4u8ndIsl3IpAVyuFUOFZuOeyle9hTKYAnCCKJxQo=;
        b=H5tGkxm+Wyk3KyP7IJ4+GqWLRiFru2zJPsGOdOU4JxRL0vcNzfo45z7JCzqHF//X0D
         vDIjpYe553SEc4vqOz/ve7EMoMqt3+TPXyECTMJpPCxqv4dszbR1cI//Manh0qetu97U
         QRm7tQmOWbfvDP9QXDTIVwruIVRFzGiueZFV40r00MN/OX2NG0cN9Z74kpozA/HOlAmw
         4uJHp0Ywh9SD+OpHtd67pVk7W0mbAWM3A6Y/HjQ6bzIp7U+BDz/RPcf2qT+BMhs5ZaU/
         PSiD7WfWEwAWmCtgq+QyoG8N8wRtJkg+PuShFCDcliGIbeiIe7eW5Qugo0ivwVJr67hX
         LV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEe4u8ndIsl3IpAVyuFUOFZuOeyle9hTKYAnCCKJxQo=;
        b=SHaJRxkoNMZzc7z7++Y3dzuR/ljrGWcY2O+I0ALShMgE0qQrZLxYJ9v/76Y+rpTE52
         XDoNRH99L3gJUCx8Jo7IjqB8MFXSh8/6elA3NpxPpLwoNLkUvOSJ38tVMxp+oRzL4N/v
         NGTHOaeGgcj7xw2Av8yEFyMLD7hjP0wWB8y0Dah/a1fm97H6/kg/MJOfZPfoTsX8+1SZ
         8XYE0dQhVBuYMvVm8QV3z0muo6NDpiszwbzQ9YIAYEHOBLRCJQiJJQ0bB6qXQk1AZrkH
         Ch3rZFYNTlL9JihHq7rj8CqyWJIovekB4G3Ftk+GD62TWMViAfYsQMOfaAa0AlmCwy4H
         MHuA==
X-Gm-Message-State: AOAM531Kdfn9Qv6VPws5SL0TK6jXp1Ke6NUaYDzOice3Pq2JSy5Sjsen
	Z31UwTaopa8+4akG6fWQTYCSLQas5xCc7Q==
X-Google-Smtp-Source: 
 ABdhPJzMZNyFBcirq/ECc/lid8GIyLhmVKF5fX2JyzRtzKYFTBYVYrc0ra94GThxTSRdcIiSNmc9ZA==
X-Received: by 2002:a05:622a:490:b0:2e1:cd32:f3da with SMTP id
 p16-20020a05622a049000b002e1cd32f3damr17032392qtx.339.1649445925836;
        Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 j65-20020a37a044000000b0069be5f5df0asm1123224qke.15.2022.04.08.12.25.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] poky-tiny: add a distro description
Date: Fri,  8 Apr 2022 15:25:20 -0400
Message-Id: <20220408192521.1608764-6-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164167

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta-poky/conf/distro/poky-tiny.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 499af906a898..91c596faf182 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -32,6 +32,7 @@ require conf/distro/poky.conf
 require conf/distro/include/gcsections.inc
 
 DISTRO = "poky-tiny"
+DISTRO_NAME = "Poky Tiny (The Smallest Yocto Project Reference Distro)"
 DISTROOVERRIDES = "poky:poky-tiny"
 TCLIBC = "musl"
 
-- 
2.30.2


