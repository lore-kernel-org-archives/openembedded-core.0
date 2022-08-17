Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF50C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:05:03 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.25866.1660719893326218495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WU999hru;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id t22so11718449pjy.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zREFtYvL1+5bTWwY0HY2EOeRQT2/MhJrtJiuyhmDu8Q=;
        b=WU999hrucZSKhjBJUAYivZOEskXhakwb/wBe/wjS8oq4kz17JjeYizVQBEnK83JVuL
         RYubN+BiPDT0Mlwblwosz1ykMe2WYNk3koqPAV1Co0LIUg8sOJa//OO8DusppJRZgfNU
         jgNxgnk+dGenNcieEtQYf7Q0P+vXKJ+/bxYmmPlM8RP8L66qg7ZUZypH9pxewzCT55s3
         +9N3q1AV1c5xaSCp8WFvkreIpw+n0NURdlHqwyooYnQ2dY+b8XpwZEdZmtMRDSIycFTQ
         3EaNZXzonaqGK3VOIY04UahsapnYYYZ1H3x9ahXrAbChvFImUx+2BA09bi/+nbiFZb0S
         8w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zREFtYvL1+5bTWwY0HY2EOeRQT2/MhJrtJiuyhmDu8Q=;
        b=ujx2DLr8ZHkdSiqSqRmP+w2guNdS3NgnvFg84Qt59PWWqI3U49yqjaeyJ9Zz8NzL+m
         PeRcYXZG4yYZY0g8SqDMtDW26xq4tlkLXxQy2LO6zKWmmColNuZTC3DLs/PsaNQLC0aN
         xX/9QZy2vQEdtisVQi+H6svEHQodAd4dw+w6hE4sGVEQvqQwHyqjXLiCI4WBRvqWOfR2
         eoYucSG+aE2HGSOv7jOLK1ugNAzwPQ22qQIBD4bzzdkN6Lr3USEMxJcPeH7E+/XqfpFV
         I4h60tEyeY11b57qNQgOs0w4nCDl5FxPileXD5XZ9hn52CBDl6bmy8fX+sZ6Tj/+iCKz
         MLQw==
X-Gm-Message-State: ACgBeo0wts/S8UDzfugUa3urX8O5uA/+tHyHY9BpCtq6v1Ff/7eEiyUa
	+E7zZcP8JiLn8m/duH4lQKrTxojhkgK7Og==
X-Google-Smtp-Source: 
 AA6agR6aTDThG8qJTDdjYiBKxiYc6D8GreUSibBZ91P2V/mNkuR2VUODPHbioyVqXbundE91vubraw==
X-Received: by 2002:a17:90b:2688:b0:1f3:3da3:22f4 with SMTP id
 pl8-20020a17090b268800b001f33da322f4mr2303054pjb.182.1660719892363;
        Wed, 17 Aug 2022 00:04:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 5/7] binutils-cross-canadian: Package up new gprofng.rc
 file
Date: Wed, 17 Aug 2022 00:04:38 -0700
Message-Id: <20220817070440.537761-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169471

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index b3d591e658..4e8f10c1c4 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -27,4 +27,6 @@ do_install () {
 	cross_canadian_bindirlinks
 }
 
+FILES:${PN} += "${sysconfdir}/gprofng.rc"
+
 BBCLASSEXTEND = ""
-- 
2.37.2


