Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B750AC25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:22:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.3825.1715217729614448921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 18:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+z02XXB;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ed012c1afbso3357875ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 18:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715217729; x=1715822529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5yYHV+83YY+Jr/hjqJe4Y9x6GjkTRfd5So0aRpjyjM=;
        b=j+z02XXBKcbkkhONq1WHr5ebZlwBbCxcvnO2Qz5uD2YpsmAey/wLghVkJnICQjAPJt
         8JFWM0nwUGhvSIB+A1xvMDXHY3q6tXA3jjFbkuFt0qu26M/penqns9dogv5ZvmFzyPDm
         2CYw2gQ7sQTioT+y8qdeOzGShefmCYq4G9n4H4+A70anyC214rA/GFBcW9OofESoNsZj
         Nbqd6sdvpPct9b0mrqSu4iCoTgxZR4OVrYr+cXsQrpvlfKhUIbtqVrTIqbR4a8wUExWY
         J2VpGMkZADaVcEtQPciyyTNk9zz3v60PcV+5rWXuTnO8LQ0t3eTFaw3pSAzWC3xOZJsH
         zM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715217729; x=1715822529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5yYHV+83YY+Jr/hjqJe4Y9x6GjkTRfd5So0aRpjyjM=;
        b=dRdHoWnHLCXPbrB2MPtoQgWDT/cPt5GGkZnGlc75cjulOeKqTV7YqqaM5G6UICElGM
         rp7MuUHLBoeKw8+8O176nnSd1pXsBhxNiqF87OANx4UynlhDH7GdCZsu4E7xNxpdbpvN
         y4ZAzjIO2SGilQZl72/d0aC5A1am/Hu/CfaABaQsm+sW4JexWW397l/SLDaSb/Zsyy2z
         gI30u5k3O8KSljG9EujbkffgszNT98pB3dDfCSLRQlYEpc3056l4LKW4Q+/Ax5oLw79g
         azBOpG5iVlEvdTgDawvKnl3admtmxqpOZQ0eTO0q7f9GQzDrhkkYOD9bXNml+BuQLWp4
         S8Pg==
X-Gm-Message-State: AOJu0YzmBHynD3NGMOFmAm2lf8w+j2BcEc0bHKJSCSsqAIynNv1zzfvT
	Vat0G+sLIkz0ztdSAaJ0DdapMelEO8U2EhlW+oXTH7f2EPqK19mlTqkcupHm
X-Google-Smtp-Source: AGHT+IGCcqFgeE3fBBZu+bBDQdvIigLoKWT5wfni4mp7GYxy3kBfw269MsjQPymGb00mjmsWkUhS0w==
X-Received: by 2002:a17:902:eccf:b0:1e4:39e0:660c with SMTP id d9443c01a7336-1eefa5746c8mr18805915ad.23.1715217728786;
        Wed, 08 May 2024 18:22:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bae9d09sm1839485ad.119.2024.05.08.18.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:22:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Enable team net driver
Date: Wed,  8 May 2024 18:22:06 -0700
Message-ID: <20240509012206.517279-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 01:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199131

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 71bfbf9e032..4503ec94ae9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -66,6 +66,7 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-- 
2.45.0


