Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C11C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 15:36:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13831.1715269005462457466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 08:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UrjZBNPv;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ec486198b6so8023155ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715269005; x=1715873805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzqSQboKdx93TQnSDkcW43n2XQlbHtSMILvpBPbp3YM=;
        b=UrjZBNPvT9U1TTC8dxmZNheXqvuuvpVavk3HhH0vrD1vHzNmY7GFGTxcjBDCBBrDNc
         Ui4bpUdYex9j/pGJrOPVQAMzBBWfDhcavD228kLNjX70032ndr8KShiIF99aZM5iwpca
         EywtUhJI718I7bbTX67Purq+sXAmid9jX59jsLvLegEwGiDK/bZjYQdo6vrhBiCydWLu
         yWuckmDYYMbbo/XpVnvspvesTuveTXqIdQDuDAH9vCgzammVulFA9JzC6bhx9TCZJo2W
         sPRsj7MCxYgPznZ1NcD3eyhFuf5HdKvEPq6N8Ck7mmHOEscdx1Cjjt479Eeb3OMsmPzl
         PrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269005; x=1715873805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzqSQboKdx93TQnSDkcW43n2XQlbHtSMILvpBPbp3YM=;
        b=FxI/8XGY8aMoklLL3Eld5tm/S/DpnX8Vr7+sKs4CNSmLiKV+4E8aCLK+XtoL0OKgyZ
         4kTvCsrti5HE4FYEtJ1Uili4qnjtgPSFPf4447gyhGHbKCv+a4/TQFrA5taM8NAOYpIG
         M+ChtodxCNSLqvd3rFX3LiQZb2qHIQSE2SXfijWJ5USgTE3DCkE6HjmLaMtt1gMVOi1T
         bzCGXati16UvU/UpHEG7J1/WMMl+BI30A5JhKdQu+meNvq1fevSxaIinspF0MB7/V9zf
         sXytz7Mu/SNJzg2IgqVXF5C+rFCmFcFznbNNBJz7wYPzjoZjmnYCEW1UM4y4W9BxGl6U
         iFiQ==
X-Gm-Message-State: AOJu0YzcTew87bDnbMAyi87SkBoXnpG8EW6vxs8ReBi0NpoE/vyRdSzh
	cm08OEeepUOzT8BS4eq0d7zQmBCAYveg8mjRmtfEmfskz8IXSNcORUed/mq+
X-Google-Smtp-Source: AGHT+IEfqDcOXOY0MvjaA1n+vnb9kc1FRrsxIjt3gDXilTKQKGen2vYNpY7Qo4ErrbIt03DIBOknpw==
X-Received: by 2002:a17:903:2349:b0:1eb:86d:70cb with SMTP id d9443c01a7336-1eeb0998ab3mr70115785ad.45.1715269004594;
        Thu, 09 May 2024 08:36:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13873esm15680535ad.266.2024.05.09.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 08:36:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH V2] linux-yocto: Enable team net driver
Date: Thu,  9 May 2024 08:36:41 -0700
Message-ID: <20240509153641.1571390-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 15:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199177

Its needed to run libteam ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
v2: Add comments in recipe on reason to add it

 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 71bfbf9e032..ec6fd838772 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -66,6 +66,8 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+# libteam ptests from meta-oe needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-- 
2.45.0


