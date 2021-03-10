Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.232.1615417475235753354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=zWAWx8ez;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id l4so18788008qkl.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYbLTrrj699/ftG9NNtoC1GPCDqXX2HgSCCMnGcj/iA=;
        b=zWAWx8ezkucpRW/haL7Dv7GDvuJsmbb+hYYPES36gqFQtQ+u4zjIrVVxktnpw2rFHw
         zpkBmuGnvXzCK7zQoCRbtZP7yY2NGiRxNcYg3TO2WrDRQGhWxFcel0kNVgd20Ky5uVbj
         tHuzg7s6cu4UmJGFSgAIdlt/6rShUCmJD2nUvY7X9wIfAlrqnEqFY16ZvOv2pOVywIgl
         if5fMb9c4NMwlVgup+NWRlDTqEvkBqf38r2l+XWKQrsClw37eQaTElgbooapmDpo/Hf6
         W3uRbzrcO2tNqp2gJFjVNbYixZcgG2T4TD6qfXOR+Utv0i11aooMdteoruaHmI49U6SY
         L5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYbLTrrj699/ftG9NNtoC1GPCDqXX2HgSCCMnGcj/iA=;
        b=VkZwVA1Rp88IT/RiJ5hXCkWi6hcdl5imOHTrStyr97S9jsS/ADUUAsghyDGhAqGnzo
         3lZR9SczPUT+Qraw4vmrEqAwLwsgOKNlMEcSHnbujw+dhuhBp4NQ0WUFzgRnjjLVpN3S
         HNLOHCqsFWhhxgbqq/e2VmnF4jU5VE3UY6yp5yoMsE1asu8buhG1K+21Tsvw+Yke7I60
         7bzGwHj25y7fZkCY0L9hGCd8hhN+RKto+jlkRukRSVKgtB7yctafagsjDHewiAfl7ct6
         Rcg3ds3qgvJ9vUSJRvvuPfyvcN1i/Z6ATT9qQ8NBJ4qDiugX1i2FnoUkGx077umQpc4n
         s8jQ==
X-Gm-Message-State: AOAM533V9VR9fSCBfXkRWFrWMK0vlcATigIk84xOGjt620zBYNAngmU9
	FFm7PZMMLvb4TCTWIqscQXzBOm+5B2fumw==
X-Google-Smtp-Source: ABdhPJx0sXXJJbHjeyCq/tpcNMcx9MceATFVfGQz7VTYkU3LKVSoWk46YwllUihsVMkFpf0+83SXnw==
X-Received: by 2002:a05:620a:c8d:: with SMTP id q13mr5019193qki.238.1615417474148;
        Wed, 10 Mar 2021 15:04:34 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:81d0:be77:cd9:faa8])
        by smtp.gmail.com with ESMTPSA id i93sm550978qtd.48.2021.03.10.15.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:04:33 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 1/2] qemuarmv5: add softfp
Date: Wed, 10 Mar 2021 18:04:32 -0500
Message-Id: <20210310230433.29983-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pulseaudio-14.2 is throwing the following error when compiling for
machine qemuarmv5
"NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"

Using softfp to resolve this issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I513ed523f03ed091507a099e3f80fa95a6fc7ca9
---
 meta/conf/machine/qemuarmv5.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index dfe2a89573b2..29bcc1199ea1 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -18,3 +18,4 @@ PREFERRED_VERSION_linux-yocto ??= "5.10%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
+TUNE_CCARGS_MFLOAT = "softfp"
-- 
2.20.1

