Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CAEC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.11489.1634657702997339305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bv/AX6Yc;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id o24so5063773wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oIdANeA3yIM11p/22g0z7Bmm6+diqOz5qJFL5l99a0E=;
        b=bv/AX6Yc8PbxrDzI/qj1kLlwdLftKSC42E7XkpEbLVC5If/gyH2NJ6ZgL4J0JDSXR2
         dWdadxHFgdJFgVhfc4GOgIrWBR9nJiqhCLAhOHNCbyvMtChTEf1F1uB7Ji5DBh+YqQGY
         JAne2kc8jRENy9eBU3NJi8/CmV4G0mY2Ds4j+67q9EDWnZo2oXVT15pvKZMsZ/Wh9QKz
         WYPEDRiYMbiIP9dQZx0o2J+PWIqXNQ+DfKWe5JzobDc793J77Sv2DLTi1zmn5HWwXGzd
         lBgBSbc7Kz7+uxmXPd3WTe2YD+ij6vnAHoTRtCGfPNszuooNluywucktaN+IQURIrKMZ
         NDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIdANeA3yIM11p/22g0z7Bmm6+diqOz5qJFL5l99a0E=;
        b=p+tn9GWuMzIhIKXqy3bStnq5XEkASYbilZtv03lR05dqstUIMRFE87I6UWriswMcBy
         MgaME5JgKwN099w/0fwabzcUkPSUPuBC1zJXgq7AlhUSlJBVuEH1pPooeXLHIVTeSJ00
         3UvIky9t1Op/WBU0bud9Xmjd/XPX/VFwyj+RqDSvvAGgAlVaeLs5SB5ynf/+mwD56twJ
         O/afb0p8ubmh0acEIl7zkdXHDqzaUlMgu6w7ZEtpf4PEz/83ua5I5fmfPlsfQFewMd0W
         l859pAcDJaTi+0RxQN/lGJolDPc28I8zI3V3YKpkF0yU35Bp/sXy7eLZcp2ZLc+8XAve
         RL3Q==
X-Gm-Message-State: AOAM531jC4tJFGWaU+dT1vuVi2JaZuNKBs5SyLQaAVU3NPdduQ9UKZrn
	LJeVQaqLGsYkVcbKlEYuFl08QsIOzWY=
X-Google-Smtp-Source: 
 ABdhPJw+3jmizsWB2KITLbwaOI9h6pSfnW8n6ehPWL1FnRAxdenMbhqa4eCLyC3aLYcp3uqoffhlLQ==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr44905180wro.94.1634657701582;
        Tue, 19 Oct 2021 08:35:01 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 52/65] wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
Date: Tue, 19 Oct 2021 17:34:06 +0200
Message-Id: <20211019153419.3319802-52-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157171

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ireless-regdb_2021.07.14.bb => wireless-regdb_2021.08.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.07.14.bb => wireless-regdb_2021.08.28.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
index a396f15c55..c673f8044c 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2e2dd216a5f1a310b849774af63e6309d94c2207c34771a534c47ae18b162742"
+SRC_URI[sha256sum] = "cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446"
 
 inherit bin_package allarch
 
-- 
2.20.1


