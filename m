Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A2AEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.1230.1687401370786244771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iNG8r86m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b512309c86so1256835ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401370; x=1689993370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IU7KRknnSzSdVpw2nSSSFh89BBsLx4njDOvXzQKw/4Q=;
        b=iNG8r86mt+pnfKPVpgW0l0mdCUbuc9qV+L4mXnZnVvgBYipG6Yf3JJVCHIZTrh97SQ
         G5x1ePr2/H/nGrhd6JXAfPt0eUtCcM6gh2/QcEGz9EQ5HThI2vUEaq7hz/tJszG997FC
         112kihL8jTlWPfRDSCx3EnMjdIgzi0G5VAPQtlZ3cDgTQ2A7+T+PlK7fH2If6W0FyV+/
         5XPlHNIlK02kRo2f0s6D/ZCtbmKFp7U7LcxIw91nefv7Qpxi66tNXYUqHVmu7GKl3d7d
         uYpvpmHaSHKQUMpnf2Y+t8N024BL/vCtNPt6c1pCE5A6WGJwNmjreQb3k3l12aN9mCBM
         euYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401370; x=1689993370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU7KRknnSzSdVpw2nSSSFh89BBsLx4njDOvXzQKw/4Q=;
        b=NN5RQITeICXbV9dPoBoZbB/Bx/JssbiICQ/qJlM8Vb54LSyJW9BFU8/M64s1rdi+k8
         hGaZ7Vx+gVJHWDMSYlhFKtxVAdU8Ly+lVuqPyav46/IzTjlsqImGRt0/w/LOcHAIPfiy
         WQOCEoFGlLEne7bTKDiL9iOtHuhFf071VNWzhb8t/tWXRWHTk6pDqh+10jIPAiKSBeYZ
         pA+O2RINbPF+FJKExS3nOMcWm+7Pz2i1TGFlzCv709G1QnPSouzLJldNmmI0udyMo54E
         pt7M6HaeMJ50zPnEXd4IuIT9VEAmQo2NWyz+dfSjbitDU18bXBx6nKO3UwvF+TqFAnog
         nACQ==
X-Gm-Message-State: AC+VfDwwhCt3V7vTW5kXE2CwLoRAHu1iIQSUPeDr4Za2oEI86NlYm8sv
	PhnrYZHlIKx3H0Ce/PNsjMd0I3doh+HYhQ1xLn8=
X-Google-Smtp-Source: ACHHUZ7KHvTQ5BlL4csGmMmlbfIswqti2FF82uD3xbzpbQHYIn2NQmx+YAcJmLpYwX9Bii/lVdEw5g==
X-Received: by 2002:a17:903:228b:b0:1b6:9fe9:a450 with SMTP id b11-20020a170903228b00b001b69fe9a450mr4191085plh.32.1687401369897;
        Wed, 21 Jun 2023 19:36:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/23] ninja: ignore CVE-2021-4336, wrong ninja
Date: Wed, 21 Jun 2023 16:35:33 -1000
Message-Id: <9201a3d766db1caaf020bd3cb7f4f70429b1a7e1.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183201

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2dd2c13ff26c3f046e35a2f6b8afeb099ef422a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ninja/ninja_1.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
index 255f5efb70..83d2f01263 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_IGNORE += "CVE-2021-4336"
-- 
2.34.1


