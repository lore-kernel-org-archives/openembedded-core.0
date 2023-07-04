Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17ACC001B0
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:59 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.61392.1688484596327091182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YF913fHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso4193059a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484595; x=1691076595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kt/XbxmG+DaKiq4QLpH7zUl/F8V/rDu/vF363Vfl95I=;
        b=YF913fHN9XQb+GgBqPqPQc7eXphqGNpRuTGZ92bhD348/mLJ57T/JHMtnVukhQ6Cov
         HpoeM1figWwINGg/c461xIr34lWMVJpbPiHgxPTDf4B6qdv84103J6+GVWiG6gFSCs/Q
         JdFmKRV5XBm+ApXFsDaWBZmFwCviRNjDVLI+2jksd9hLdjF9jjZWZVFxgE2SmLxFeZkn
         FAbwIWkSi1FQNZ57+5p5STswTjU//dhnf4duKPVoaO0ixmrweBetDe39YKlhTkGZW5IY
         l0p9U7zis5DF0M6Y1hiWSu0aftYP02GsMlmf7WI05jmG4ELeV5ghSStIWaj8aj+NpMs9
         V9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484595; x=1691076595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt/XbxmG+DaKiq4QLpH7zUl/F8V/rDu/vF363Vfl95I=;
        b=L0AMM/tCGnnyhdV4x73h39TBvnYdeuYED4RMi2e3H8D38Rei5Jmv2DIrn/8UlTo5+A
         tOzvugHl7/AAbZEGw1GJDlQpmuG/rbutnePciEuaixaqhKnKaig0/ALfyinrfMP8AVSk
         p4xrPynIi+CMr5ZAN+Jpu8aL22YZFN42aEUSefGd773R7j2A6i3KtiWXbTqylAulDRH7
         XIBy/MnH8j0x1mMrrbJ+rFi0lSYhkNp0r8lhionkLidJu0UY7n3tdywkx5nenjSg0fmD
         jpkx5KqNbcYo7pJ9FRuKedfmQwLOKGMyJflxj+f0N0IlFIRfRMBCD98QIZeitblqP7hW
         EtCw==
X-Gm-Message-State: ABy/qLZohUngwfRZg8o/c66Ta2FG9Zae9s3b/e8MwYv1v9W40CBOrIga
	9bTTc+eTcAMxAghmrL7KFigbvbtGBHBSkfptZKYTfg==
X-Google-Smtp-Source: APBJJlHNcmix5VtR/3wE/8NymUor/cZ46AF7CVfyjCxHGxeaLCyWIWsxALVjfQ0YI6nP+/pyuVB66g==
X-Received: by 2002:a05:6a20:9687:b0:129:bf86:6ebb with SMTP id hp7-20020a056a20968700b00129bf866ebbmr13098763pzc.59.1688484595378;
        Tue, 04 Jul 2023 08:29:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/30] wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
Date: Tue,  4 Jul 2023 05:29:10 -1000
Message-Id: <77889442edaa7540c5c865ceb69dcdd972dd5fd7.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183843

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47438402fa430499864a4b1f1a13eaac66aa21c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
index ce60154f1e..cd3f52fc76 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
+SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
 
 inherit bin_package allarch
 
-- 
2.34.1


