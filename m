Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8678FC32773
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.482.1660894068833603902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C71TL4RD;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h5so3368777wru.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=EjgLLsNlTyuTcoLBJZMpf8d7dWLG+IZBq8kNmqat2EE=;
        b=C71TL4RDJi/FDrtFYioTAGjughO930bFChtn12o4sEcavUZjhaaTT9n0O3BHochTDC
         lKR4/R9Y9nFqT/vjjUgMgIT/ve/hYRssD0WSQGfZLq7prgn+H/HRMDeG2ktKLvaZLRA6
         dEhpabeBoRZRzXB/0zGeQEcNEymA3qaBDAGomrmMShmUSmPMzfaNdhsbNrj62Bl055xX
         oyrVETZHw1MwSydlyGjubMr3SLy/KKMbC3OiyiKGbgLV5r6AdQfYJ+WJ9IOo5rG2suaj
         tE6nit5yGYPAL0kpRIIgivD1Nfm7T+drRSzuxDF+mp2fdD4DNNuPaOsEocHTPSYYhcVo
         TRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=EjgLLsNlTyuTcoLBJZMpf8d7dWLG+IZBq8kNmqat2EE=;
        b=f7CBZHaVhsmYb+wdm+7nyYejr2CkgP90qS/9pX1CEc4z6xrRqaBfFTLecaNrHzsPDq
         kCvLSohnvfeiol4v4twWcctpIe/LQP41YIHN6xe3kmKCSN53X/21sVj+hXoYiBgeJiR+
         M7V5oCw9/jKfn1avqAhrg+Vriq5ub7L65qBsdA/UyE7Rr5TMANSP6GzWC5iHESMk+Yve
         InraCIX69GVmzXIsiffElBRgEZ3+kODxkF+WbS3wYtC88bep9ewiMD0Wsn5pmPdgFvwJ
         hSXfr12PI55uJvWPjwTxpsY+fPw9G4CNou/PGMvLbJoMUqHuLBG4ntNBKjY2cdC6AVex
         p9ag==
X-Gm-Message-State: ACgBeo23HKt2JjrE50pXpEykEs8/H0U9IaP2PBK+NlL5SX/AWk+X/CC4
	YA7I5AT2wkPq3mKhRJMH9X7Z72v5FKI=
X-Google-Smtp-Source: 
 AA6agR4eHilLM6KuIhd3yV7gUFYQ2zpaIXR6+2r51YpkxaHB6pC21g0zLvcl96OmGnD+0+w2MTMdsQ==
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr3397309wrr.130.1660894067260;
        Fri, 19 Aug 2022 00:27:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/42] tzdata: upgrade 2022a -> 2022b
Date: Fri, 19 Aug 2022 09:26:47 +0200
Message-Id: <20220819072727.2236928-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169573

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index cdd1a2ac3c..2b956cf7c0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022a"
+PV = "2022b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
-SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
+SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
+SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
 
-- 
2.30.2


