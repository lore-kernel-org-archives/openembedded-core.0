Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D76C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4769.1647674178129883898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ME4BS0Xo;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id n35so4297624wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=50vza0ZzZo50/ZBMs8ctDPYlDdhGm9AZmDrnNaWTff4=;
        b=ME4BS0XoUkEm+ggRFen7LajOMXr5CsVL2kLncKvGMM2y6M+aZcLl78xk+sSNRvsAKi
         QLOiFMSvSOkgkjvHlNK0b0+nHZdVsWcQ3SNCvpkDCCYwSqmIT6akqrrx5pp/4Ihhp8Cw
         AN7cjWXDP8ZhBEdH3vdPdK79yQyI31gZjMuNnvhXKwqhqMyTc//LvuFgCQY8Kgw6ShoE
         l/TCIlaOgFY06t78+KyUrCczw+mNqvcX+DZbu6NFXF6syg2YmOPbvpY2KfZP9ujvGrg4
         3AmjpvIsAQF4gpYXiSrzxiW3UUIwhzJtPIXIom6LvauH56NdY52eMwoLNt1IV5jHKKLM
         dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=50vza0ZzZo50/ZBMs8ctDPYlDdhGm9AZmDrnNaWTff4=;
        b=TTEo8kWYnJeMO4PDPMgAz+t2JifI2dxfwz3aszq4iCRT5qTbin7CPQOLJkzSKZ2KrC
         ZK8zanw9EPuTEsrF6qpiCPT19aW4JXAAFg1VU0zM2AwEoGzEKbC25wgx/CN4zjH2NtuQ
         9Oim4lcbcqphyY/f0+dCUyqwoDZSTbflN0fz3HuVi+83i2k6ghiWINSoytZp5Chv0BIc
         dtJxH+baqEykFXbiC6vRASaL4tKR4RIWdkzhqNjBGdZFE/xLRc935Zp/3mXWtvgVCZrh
         NzjbeLB4zX8zi5CO+3Yww56hEQ/ucJ+dzeHsQH9rPEhPvuSneRwlEs6egxUlPFozVODd
         CjLw==
X-Gm-Message-State: AOAM533icth5JD0hJHCMAbGw2psHFoGZOPat+YGEWnwT/73UU+40+onB
	q6GXoCiUDW3Vc7hD6ujtjyQvWH6Dbuo=
X-Google-Smtp-Source: 
 ABdhPJy7IAl4z4xnyVjKwzlL3ucMYPhKLb2toCZqTczlCIN2S1iqM2EAR05hRJP1RJn1k4p3J4Rixw==
X-Received: by 2002:a1c:c904:0:b0:38c:8dc1:87a3 with SMTP id
 f4-20020a1cc904000000b0038c8dc187a3mr4707001wmb.101.1647674176651;
        Sat, 19 Mar 2022 00:16:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/11] squashfs-tools: correct upstream version check
Date: Sat, 19 Mar 2022 08:15:57 +0100
Message-Id: <20220319071605.152904-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163459

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index bffc05e812..c92a5f80a8 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=ma
            file://CVE-2021-41072-requisite-3.patch;striplevel=2 \
            file://CVE-2021-41072.patch;striplevel=2 \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git/squashfs-tools"
 
-- 
2.30.2


