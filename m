Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5F2C2BD09
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.69898.1718966583754385497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZKC4/+e;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d10354955so1995701a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966582; x=1719571382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZhWJexdLj2swoIzaXad+MyTnjfe+v3D8p7LPRql5oQ=;
        b=CZKC4/+eTnI8sZRMH/SGJX5nbmHvtmxS9uh50ybhl4LaForvNEf/mJoiy/dokR25zu
         WiXvyVFrWf2HA3Zx902bFswuE8uqV/S+1G6RzUFwsb5t3jlevl09gxoVL+nIyfKFh46d
         6kiuwRqxgiJ+wJ/7QpeIq7q+J/Bln2BuH83292CApe9ZrIRTpcegL4lfp1CIAAXwNnDp
         LaZ9StgM5J0k77yRchuAp5NBDvoiMOstCTxfIe9P4rWMbTKcvkdSf3cr4Z8KIxDJmvjl
         eBsEjP8OOQ1iDaaHxZNAyPACC/2D81owYloNdfyyc0dshNGDe2QvRncg7ISP3UuW8Gs0
         ZMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966582; x=1719571382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZhWJexdLj2swoIzaXad+MyTnjfe+v3D8p7LPRql5oQ=;
        b=O42pCIi5QvyPWSdqpmgORcXZj0ONz9IhsxkULEIeGbBh7dtde6GFHZmxPa8SFicZhe
         F/eeg3WKFnQs1GaFG/wmfYfDVTWsxS9hh3n1yB7m1aUZjNZFJ9e4Z+GR9TOs1a6nvufj
         gkXZ4T9OZ7QVCRDbmEJ7wzLfTgnqi+yRh+hyiWrP0OHTCL37G8Zm6mVJpj2HKEVKr96s
         EmLAnywYI+/RuRk1tp+Xs7DlPXF7km/y4km6R5+Xq4R1+vwwcHDTpRmAHWMVtIt+bU3m
         aL7/ReK1jWj608y7l9UcvIm/HhCT9UUwJD9cK3Pp094WTGWLWFIWfk7b/XtmDX6Da5yA
         wSZQ==
X-Gm-Message-State: AOJu0YxNq3Kkqik9FSPXJEcBLWzlgxhqFfVdRXCo1Nl/+bbLlAMAs3op
	apteXlc1QJ/4eTwZINga/dCVTasnFX0jbQCeff4asFmfUSO4c+JrWjL7XQ==
X-Google-Smtp-Source: AGHT+IH6LHVBP83weVqhbJLfp7xC3IwQqCVXyqo3WuV+e29W9tw4hWr0Ai5JK6gKprC9s3aKj5gRAg==
X-Received: by 2002:a17:907:a4cb:b0:a6f:77bb:1713 with SMTP id a640c23a62f3a-a6fab602e75mr537356966b.9.1718966582072;
        Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/11] systemd: rename systemd-boot on recipe version upgrades
Date: Fri, 21 Jun 2024 12:34:12 +0200
Message-Id: <20240621103414.2842509-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201014

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/systemd/systemd-boot_255.6.bb | 1 +
 meta/recipes-core/systemd/systemd_255.6.bb      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.6.bb b/meta/recipes-core/systemd/systemd-boot_255.6.bb
index 4ee25ee72f8..b57156a94b8 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.6.bb
@@ -65,3 +65,4 @@ do_deploy () {
 
 addtask deploy before do_build after do_compile
 
+RECIPE_NO_UPDATE_REASON = "Upgrades are handled in base systemd recipe"
diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core/systemd/systemd_255.6.bb
index 15b631fc07c..98973fae610 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -899,3 +899,6 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "systemd-boot_{pv}.bb systemd-boot-native_{pv}.bb"
-- 
2.39.2


