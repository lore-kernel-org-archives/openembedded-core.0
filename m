Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046C9C63709
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9357.1672830362235773377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDig4psM;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t15so23700726wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhmtJ0kQx40dNGRs44pzzdlUZLhrZv8pcKh/UPb35Hs=;
        b=DDig4psM9C0YZoGSu8R/psN7Wi5qXTRV1cPuZNijP/H8LellRAxKfyDCpaI9owf+pQ
         xfoFNS+6GOCHoK4TsVCfJSw5aItJKtG/dJ2kXRfgJKia+rArMNgpQEh9k4VPTaUTb1mx
         PIqQ/3clc9/5VYwxmOY5Ih4hoJYwiQxZsfc5N4okgA0TbCyRaaJao6Nk1rZK36xO58/2
         r7Dm7XRElLiGt29VqlLwteTWm4qvEqgwRYIyTi5CSs4VG4kpqPb229dy7U7SYCLAVpah
         sIE8SE1Dk0c/7sOpT5tAAfgx6Tby0n11szOZqJDIc9b+YD6oF9obdUyYORgmczaf80+q
         jJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhmtJ0kQx40dNGRs44pzzdlUZLhrZv8pcKh/UPb35Hs=;
        b=DylbpYBZEe7q8/ANOwgF6L5Q38O/w5MXts46OL0ReEbKrROOMSxQj6vrR8gTehidXL
         EdJF1XMmg8LOFqDjpjDT274uBDwAYn0sD6uM3P75UPWuMesf4T0c8hKowEa2btkMbHQQ
         3jVZysPask2wcuPZUsKiFUKc1kbCWpL/eGyBrUIGMmPhvHcSSTFzJ9WOm8om7xsQfby2
         dPs8XI7e1gA5XjLMSNDL00rATlJrpJGnJpdr3FOgipAW4QPxAvkJDJzy2p0BER6I2B4k
         seaZ8E+0fbsNl46cHMlsEsEuaIOqh2AsRyRtnyyS2BWhi8NK75Rgo4tzRl6LUiui7YeC
         Nh8w==
X-Gm-Message-State: AFqh2kp/V85bBTCMgmfI6sA/M0QRwqLmY3+ve3c2K4LUm6HxYtoLR3aj
	NJMuP3G4OC6OAbZkndt+ljnGx96Bbd8=
X-Google-Smtp-Source: AMrXdXu8LI7ZkdE6qIxZrWAwQaq63E/M+UV7rwkXReHOu0L+YHE0qiO4bit/bWx+CSLZ5iKgxWbrWQ==
X-Received: by 2002:a5d:44ca:0:b0:242:1926:782c with SMTP id z10-20020a5d44ca000000b002421926782cmr30689183wrr.43.1672830380800;
        Wed, 04 Jan 2023 03:06:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/77] puzzles: upgrade to latest revision
Date: Wed,  4 Jan 2023 12:05:08 +0100
Message-Id: <20230104110548.2537259-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175421

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 615eb1bb77..c94fef4931 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "06f6e878a0b588c513024c3498b68a3c87594ab7"
+SRCREV = "14c025d192579961d1ade51f2a322bd765aef0e5"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


