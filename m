Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157C5CD3431
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9416.1777739495803040243
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGKclnKh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1554288f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739493; x=1778344293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSI0Sgw6l3IKnZmlOwp0XrPcquEENlxg7BA3Gy5+h9Y=;
        b=QGKclnKh4QM/Drw8Fxe0oytuDIuXyayOVBBuARo9SqSlMn1yKdqoDdTnB8JKPEbChZ
         b48jioQ39xhNQZ2VEseX7UJAliGjGhaRjstgGJVuIjLp/GhHe72lZeJ8axe7kwN25+KO
         XoAngag6pYFkATq/b3n46qO+AlTl7sYDxrV6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739493; x=1778344293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSI0Sgw6l3IKnZmlOwp0XrPcquEENlxg7BA3Gy5+h9Y=;
        b=HcljEeRA9n7qgjy9A2HmqneVBxPyl3X9zy8FwPOP0FHxmScaqcQGUiJMJucKNMcrPX
         AbYPUd+1xi/mLAiTSC0+zO/XI0qa5Pz8B8O3T2yr8ubBxGsvFU9uG2w5nidRHver23L+
         Az9Jbara+toQq4X5HFsD/fhD7Hf+pQmmnkh2zC+PLki99yjbQ96RFSo3w5t/1/jM09Aq
         FlO2y8iJglcyHl4dtJzH8U2X+BfhyQc8MriYOv71lZxzEnnXxEBDPVzPJNX2Uf88D777
         ENRvTrCaenCHerbl9B/xL0c6MB2wE9TWSCvo8E9lsYynvVQPu1R+dSsbTqACEB2B3aRS
         Bs8Q==
X-Gm-Message-State: AOJu0Yx8CalE4YOwSF91Can4JblQWgtHiSJLHBL7huX+1uSzesDygSaX
	tD3+pIMwrAnauJhSp62xD48WuBKoLRk8BLBsVJ1gdTfO/y1r1sKm7E2n+EV2CsJ7SUmVYSpM4lE
	jSyd1G+yNkjuaN1yh1A+E38B7txAa93URhAySx/uexTo6Y9F8eBQ9rSLugwT1wcE6II5H0IRE5N
	BhLWw01GASS9UbLS8=
X-Gm-Gg: AeBDies4NKz80PIGLLXbwCcjOtVtjQiw1/815Dtu/lciGZkQYS3HVz/hcjsoLsNdPWk
	7hGlHm98R3odDqd89tJwrSng522ubUirivDFAr1PSJrcyCwtUCxkhojjPxF/DHBIvy2HlbLcQif
	4MImAZaJXoKriaq/cknia8Un1CAcrEB67mJG2RQOgZrCZYPZaToT2KjD+Os427XPsFEIFsymsFU
	NsdvldmF26WMTmJKdDMpEJRP0Hcq2jzyIyauAOSU/LaB/wZC6GVa82OK9bhPksFrhOIML/ouQih
	UjfW++YPi397ZwRLxnSOhW8ZCfBwiCnswlFOvRVgYfnia98rvOEfJUd91iuAdmDoMQYO/501D+D
	m8kqrFoDmHWTwzyLo1M2oUqRdvGmnWlO+fNGGqtP49FoeOJ0StvmYs7NpqtY01fWvt8ljgU7cek
	bBKFP09q47wnxflnTqlMRrzqd9v3hnImZxPnnFyofeTQkhpEWajEdMso7w2jxjb5I=
X-Received: by 2002:a05:6000:26d1:b0:43d:6fce:3ef with SMTP id ffacd0b85a97d-44bb52abc3amr5947975f8f.21.1777739493585;
        Sat, 02 May 2026 09:31:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 60/62] vulkan-samples: upgrade to latest revision
Date: Sat,  2 May 2026 17:29:20 +0100
Message-ID: <20260502162929.1377831-60-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236369

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index f3997c4e328..dd7b151aa50 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "fa2cf45adde08778d1e8f885f21f934f56d9eb58"
+SRCREV = "f9b160340bf3066313825c119710c9f51e75edd8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 

