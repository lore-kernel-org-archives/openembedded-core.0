Return-Path: <vivien.didelot@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2185AC433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 17:55:14 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.25201.1633283713119849175
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 10:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2+QAEkv;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id e16so3519730qts.4
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9UqClWicBX+5i3funhzns9ebXx/CEI/bi4rc5qPDPM=;
        b=h2+QAEkv4SnoGVqZ6OHvMe6sw0/uqpawMkm5iG8YriclbvrqB+5ZAV4024n1QumXW9
         5GQIaJD/oXBP3L7GYXirUb93v2Eaj4FSFuIKTx0WsYoxFIVz8ZN7QS4q7LkaZ2tLyEGY
         VLLiAxOQqmDIEm4o6+NGI/9qPsNaHxLJRx9IhQ/ejIiTRemJWtt8zeV8reNtqnQKvEvL
         /KAm0vt3L1H6jBePHjESg6FZmn59oG7Fas7zboLywwK5gRkGWloT4DUADVLJ2hTKk7Kp
         LASLBjGaIGH1BZ+hzp+zdUDcPB6cqshNBrY9amBJ32FWjWhQ4XTVoBtzhk/uVyfGJtxx
         LSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9UqClWicBX+5i3funhzns9ebXx/CEI/bi4rc5qPDPM=;
        b=iA3UeomGJ3SIlyb4heLxCZxOSZPi2JgHVSpYiDPUPazB+E52N1oQ5H7YddAsqm4Xux
         a9LvsNpM8O7xg4ux0jwysVgMvjvB3ZIJIHCc9li9l9Zv48wYzl9mhSF7aw45OinhQpdf
         947d9fccODodlDPQRSr8/lLDvrHX+HtUrEhvAq/CdzcWmIpcX4fIjlb5iZ8kpEBv169Q
         3blCzNKK4vILztvJogltZp3//0JSIqqI+GxhoM3h+cnXF/RB7b1CC4Oz+mQPFMD7cpLl
         XwwqyWqYkNl1UssZy8R8sGr/Zx2f3S1yinSAgGUWQMbmmZwhN9ED9oQuatFqNbvPXNaO
         Blbw==
X-Gm-Message-State: AOAM531YQHLTse8Rxoilbu6dz6WJwHCpfpw61QDO6CDAPDCLxBsmv3zW
	1x36cghQJ1Sha7ltQ+iKdgaATpBTj0w=
X-Google-Smtp-Source: 
 ABdhPJyyYxq8noF0LiV00+Ze64r81GzulrBh/MVlX9ktUnCHHNV/tTH054+1X7ZiI9pbxJUcyRldLw==
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr9456988qtr.118.1633283712087;
        Sun, 03 Oct 2021 10:55:12 -0700 (PDT)
Received: from localhost
 (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id
 b79sm6467277qkc.0.2021.10.03.10.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 10:55:11 -0700 (PDT)
From: Vivien Didelot <vivien.didelot@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: [meta-oe][hardknott][PATCH] can-utils: fix override syntax
Date: Sun,  3 Oct 2021 13:54:49 -0400
Message-Id: <20211003175449.1419903-1-vivien.didelot@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 17:55:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156556

From: Vivien Didelot <vdidelot@pbsc.com>

The hardknott branch doesn't use the new override syntax, fix it.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 78caa5be2..1b30695d7 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -48,5 +48,5 @@ ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
 
 # busybox ip fails to configure can interfaces, so we need iproute2 to do so.
 # See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
-RRECOMMENDS:${PN} += "iproute2"
+RRECOMMENDS_${PN} += "iproute2"
 
-- 
2.33.0


