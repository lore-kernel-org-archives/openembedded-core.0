Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9B3C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.822.1639599413282771508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=DHw6gMqM;
 spf=pass (domain: madison.systems, ip: 209.85.210.177,
 mailfrom: matt@madison.systems)
Received: by mail-pf1-f177.google.com with SMTP id k26so21654235pfp.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL5u+9JYIpZtLMvBFRbm00llxnLMEPuZBXc81Og5wXY=;
        b=DHw6gMqMdH7IwzNEIDk9jxcbDq6vdbMX81HfHIETayRCTOmJb5MSJmhMu4Ak3N/3sq
         sM3EUTivO6gyHCqF3zVvSWEpbCzjJWsqY+h/c0vCRXLG68XJiQV6Qmnjm0S+Kyh05yTj
         uaAVmVM7xhrlbOPRPvF+x1e4WUCihFFyF66UF8XfQEAsLqXb6yoDjI+zJtfdmLrATReg
         Ohsf1Wul3xFsf4LL0w7MTvuVi3/UtKS6KSj9QcAsMXb1ztLR2Z9ATrmSGFiAlRxIPBFB
         vk6+/AobCE8qXcvnxIcB3p6t7NoU676p8UJGFxIvGuG+oDwzRobsK7yvi5GoyFpr56B0
         D7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL5u+9JYIpZtLMvBFRbm00llxnLMEPuZBXc81Og5wXY=;
        b=77uHRzJZWAWiBo5hWynHgZ2d7/QC7jjVxfxrdeo+m74wQgvYWedYq+cp/i5WYRTBXJ
         oUbzbiO8rpIEzA+qQSz2r/D6lgBtBQf2ejMe4tu0rX8uIXB5jMpFkry6C4CRq8LRccsQ
         kJq/cXeMx4HhSjJ6xG8/ULoeKRRGB18hRyqcTIbaz/siulpVw6zu65V4g36P3H9d/do7
         DAYJ/S3AvOpvpGwjlYpd2EbO5OPUcjuT9NrIeZG2OgxZqpSIYujOYXRolq2DoaWmmvat
         ZuMKcwHRdy+YAGFqqmNPh/d4OrMNZkIOhFyGMd4SaJ3+k9XpC2lgYwruDvYpnP8Cu/8p
         1ZwQ==
X-Gm-Message-State: AOAM530H6Ra1LoKiaD8Znv33tD2Y7d+lEn9sEOdvcGOQlygJrsTL0pcu
	iLzxbM67ZC8UJXnsjAnJrNrfjdEjW1twsQ==
X-Google-Smtp-Source: 
 ABdhPJxq9S0JCDkVTRzMfsjJT5ClowycCo7euQuOy63bxAWiUirbim22MNphPLgjRjcNFVN1ov9AzA==
X-Received: by 2002:a05:6a00:2af:b0:4a2:a6f0:8eec with SMTP id
 q15-20020a056a0002af00b004a2a6f08eecmr10483600pfs.23.1639599412285;
        Wed, 15 Dec 2021 12:16:52 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 k5sm2895465pgm.94.2021.12.15.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 12:16:51 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
Date: Wed, 15 Dec 2021 12:16:14 -0800
Message-Id: <20211215201615.536707-1-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159740

which is introducing task hash changes for some
allarch package builds, and should no longer
be needed with recent versions of qemu.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..333202b7c4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
+QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
-- 
2.32.0


