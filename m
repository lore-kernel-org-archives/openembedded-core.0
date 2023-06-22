Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37605EB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1203.1687401375909757799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DEOXvIPr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so4930301b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401375; x=1689993375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zru1H9fzcogW4oH/+HbRpdkI3yn3ufBHV53ZnCNxXB4=;
        b=DEOXvIPrBHuxN1pw/S0xs4PA06znKL8DQ8Aw6DrfKrF5EO1gumkR9eBBvYdF0tjMBs
         QyC+OfzQfwHJ4ReUC3sX5zMe1uwsXpcak7NWS+6O2DGygqyOHP5YGFjK4WhuhNNEihKi
         8IJKl1Ynh0VOQsiL0ulogTBe0J7FhQ+buTc8kURU0/euFvws+SWxulrQIBUpVQ18U5v0
         oQu7mMwxLY0ZkP/z+vHAzCFtL/KkMdjn5vR+ZqAM0SSTWA5kODQ3Vkbewp06LZ4IVqaw
         0/iiRNDRBKwVAsCAordOPbx8E7lfxvoPU4Q8bvSvjo2JmVUKG8T0CYMUbiM31JoLeWNo
         eh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401375; x=1689993375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zru1H9fzcogW4oH/+HbRpdkI3yn3ufBHV53ZnCNxXB4=;
        b=AXzo5EWsd94+C0kGhsgRLZ8Ym5sU1a7kJNnT2D7qsgAEFbaXIwnwtD3iUfPDDO1eKU
         rl7yXGzRIJI3N8fyst+MkLhmbg+y3ohqnj/9Gjc0Aln+YdrwDUsoGSVI1FlbifVwh+B2
         s8bcCBx4FJZebaO7FDuR0Z4+B0KB4VBnd2LD3FQgDZVxabkErN6bM3AcI/EDBU77prIe
         vVZB/S4XvgVCx7xIm1a64nH6idsOdE56B+8K5XDVMDW0L/nNhpJlNYP4HllM1mTjC5lv
         LucKObVNaGlvWvxty5XFjkPDz4ZFAtzasYx0Dt6GT9f0eoC/DLt+0upBpdzcwzKpTrOv
         bvQA==
X-Gm-Message-State: AC+VfDxHp5uW72I3R5bwMbhOrdBU5GUJNH4Q1dRRAwp2zDTrljGBG0/b
	ix0LxKiQV7xLGT6pmFY7eZSVQ8/3b0cy4kNmt2g=
X-Google-Smtp-Source: ACHHUZ40yiK4X1s1bnWg8GqHXReAJLmL7mVH7rzeDgZJP8SCnsKy2spXBK5nsEvSwplczBhOm3qQgw==
X-Received: by 2002:a05:6a21:7891:b0:121:e2e1:1302 with SMTP id bf17-20020a056a21789100b00121e2e11302mr11881665pzc.38.1687401374839;
        Wed, 21 Jun 2023 19:36:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/23] fribidi: upgrade 1.0.12 -> 1.0.13
Date: Wed, 21 Jun 2023 16:35:36 -1000
Message-Id: <bafba9fcea41ff6ba8e64b3c718a335841be955e.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183204

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Adding missing man pages to the tar release file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0f6da8601fd4d992550e8afe7b09ba7c491250fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.12.bb b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.12.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.13.bb
index 9e46d958e9..5d0476a375 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.12.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
+SRC_URI[sha256sum] = "7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


