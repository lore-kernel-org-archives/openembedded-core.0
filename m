Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CB1C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 20:33:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.1865.1647462810527119279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PoT2XDGL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a1so3209952wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uSJhvC04pAvUQSV2nC+awxhb97fOWBFaTDViO/v/Uo0=;
        b=PoT2XDGLIIRTOI+BFMUQeMusaETyJwml3bb07fEQD6j72xGaCZBj4WLoArthFW7ktX
         97rmLyjR9UbaFR8b+e+yzQ8Sisu8F8MZRP8hIrPaE65SvdVvSnE+9Rib0BAj7QrKfX3I
         jbFH1QKA3JCXaljcNrYmmGoy56NmhI85reTSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uSJhvC04pAvUQSV2nC+awxhb97fOWBFaTDViO/v/Uo0=;
        b=1ovhxNu4neYz3eZ7IDlTV8JoW655jZDFuAKVpy/xM2yvFwa4Yujp2JahhR1cf5jdR7
         vgtSnrtGgR/fvcScgfAcEPcjfBSHZl36wVojXoaKfjmznPCXuvHLtAj42pD37L6Ez92I
         bCmvOdSJu3P8e0lKR8DDL9+de9yswNZXXJ3KA+8e5xA0xBbrGAA0+a81ErIHXzR3VvnM
         KZwrQAbKD0VahrA1gE0qrBxfIsiggP2th0+WI7qPMQqtWSKapTqPU3APNERrKqPOxtGc
         J5v4bUL8y74p+P1coZaH6BAfS2eqLNpzIBe/7PSiUjwGsgcHpjssPOICdPUcXqjm2yK7
         woJg==
X-Gm-Message-State: AOAM530WuBO/nxGC26/PkfegZndmAEm32ng/6p4Yi6M3A3mEnlfq+atB
	gk2bmDSv7sLuro5a7vYtqFLRY9jxOhCP9zh9
X-Google-Smtp-Source: 
 ABdhPJz3XW8fCdcskUuEUzAhz2bRV5p7kQtlnXfAEz1DJMoV+YRRpLeD4rfMuPBJc28aurrKJF4BQQ==
X-Received: by 2002:a5d:64ad:0:b0:1fe:9950:29a3 with SMTP id
 m13-20020a5d64ad000000b001fe995029a3mr1293821wrp.9.1647462808535;
        Wed, 16 Mar 2022 13:33:28 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b00389efe9c512sm6520630wmq.23.2022.03.16.13.33.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:33:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libstd-rs: Extend to nativesdk
Date: Wed, 16 Mar 2022 20:33:25 +0000
Message-Id: <20220316203327.950175-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 20:33:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163356

This is needed to add the rust standard library to SDKs for use
by SDK tools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/libstd-rs_1.59.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb
index 7c453a593a5..0ff1fbd6783 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb
@@ -8,3 +8,5 @@ SRC_URI += " \
 "
 # libstd moved from src/libstd to library/std in 1.47+
 S = "${RUSTSRC}/library/std"
+
+BBCLASSEXTEND = "nativesdk"
\ No newline at end of file
-- 
2.32.0


