Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EA3C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.9125.1635325665582874922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pV65U709;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d3so2857210wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSjv2/MrbDmgZnjRQSFd61pi6AhI9XuHcsYcvcaL4TM=;
        b=pV65U7095Do+oDQ5LiGHOy3X1pt8OVMXqyelGH/FldkWeOZl3j9wL0Q42wveuS2+FM
         +LXD1EPq32oddH+xql3UyDMjtVTKDMIp8PUbfm8qu8kR/n62/8koi91YgKy5xGLX6Qcy
         5FeQtLDRFPiO6oHPVP55YIWjFNL1VFVGJPaCwdQ81uf6mOyjrK0+lslQPHUAhyxxYyiz
         S5un9I/cjnmNjqyU8InrkMDB2u4x0X19SX4DH8pun9UILEUXpLPffv8yW6a5WLwX04Ds
         TCiqKzUMxXjx+oCFYYyc8tzCLa15IDHGPpxc9MoLYoTRWdxGMzcNTvS+i1NxRBozFWda
         Ctxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iSjv2/MrbDmgZnjRQSFd61pi6AhI9XuHcsYcvcaL4TM=;
        b=pNr3ezFvaz5fC/Nezm2cQmrOwPuqMxFRvE8TX5J1lqE5T9qKCan4KdDs5yS/d9hvKb
         Pv2JIJ7RiwLmyUECtSZzSj/gyZMP9kb9D0s7qnRYKalccWUDH0xg3lhvQmpXrhMdJrgA
         56vLFK9Sk6mjXQIQYfT2ZVWW1CIbgx9fRG8mYXJTcP2Fv2fD2He80ncYgrH656GHiSRH
         BdyHQeTB/CHqi3OofpHO841EL63IgFEmFoaxRnu5R5X+HJA8GTtSrUdmPS+/C3GCoHKW
         hMU7zv/+W3KlReHTESlRyJwl1VObgcKpyLjkgA66LN9VSeR00aQdmqD65oHycfD/FD6f
         nkSg==
X-Gm-Message-State: AOAM533Se0KrHH2Lp1OhDl2lwIBeVVvoDdsUZZPN9FKRQYgt0Q4ID1+0
	KwaP8ZChIahoyQyk+i7Fhoi0oiqRLpY=
X-Google-Smtp-Source: 
 ABdhPJyskov0WNlF1icL/L3NR0zqdN07umDo0DH8frWonHNCeyEnMp77KCHmewtmwa94UEdCAdeb6g==
X-Received: by 2002:a5d:5274:: with SMTP id
 l20mr11994964wrc.328.1635325664123;
        Wed, 27 Oct 2021 02:07:44 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/30] gi-docgen: upgrade 2021.7 -> 2021.8
Date: Wed, 27 Oct 2021 11:07:15 +0200
Message-Id: <20211027090736.2546759-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157485

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index f319f96b0e..bacf983810 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2021.7"
-SRCREV = "8401357079fdd2f61bff0e110d7379635b73ead8"
+PV = "2021.8"
+SRCREV = "a284455af9b3cad179900f6e1f12b59a3d40c06b"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


