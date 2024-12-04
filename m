Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672A9E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8172.1733294977027078247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjCpQ61f;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a742481aso52670135e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294975; x=1733899775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=konPQbltWa+UTMtyrozh3DeOldyd6Sl8e7V0OFYNStM=;
        b=RjCpQ61fTqs6JbaXPknAIE1ZvJQ0kmqhdasQ6RZKjFiPd1yOa3WWOo/iePzjt5F/P9
         NRT4/vQKWOPnvD7LlthXxDpwZPgcYNMS520+8YT3NwvBW0NHx/3U52J/KHdSNaxdsIoW
         p7JRdRFQGT0C2S5WuPLrI2DSKKlnRyH/HfA57znolHjMcJLlgFs8tosOFtg/hlpq/xiS
         xQG3axWb1c42lMFU1hqDwha5zF4Kg9qKkBienWSEbldS71UW0c0dFhAnaB6iqNkx4P6b
         ESf40qDEQYYwugMhoysD1NSKKTk9nJQ+0ey0glGNqeIDQUGiz8N81Iy0UPgq3nPhsFgN
         8grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294975; x=1733899775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=konPQbltWa+UTMtyrozh3DeOldyd6Sl8e7V0OFYNStM=;
        b=wu1EYWI09dzwnNktmd3xGRCLJwSqwoou/OQADJ7+leiDz3pofWxnMk3h637sMcgQVg
         OQsY7AKRVmU1VRtbp+IqBArTPMsBAp4OOR8PXUSkkMTAcYlExrSNe/weggthO6NhnISQ
         kjiXVRUWgfC9nv661Kg3rtAjtyIMhPjv9myQP7ETovG1oF2PK9B1f3KvSWw70CemRu81
         Bd2dWMwJOXaACXGEUNsReqsqU39yNK6j9uZSUPoUw2GqzykXW2Z2gBHOiHL22u8eZAli
         8KzoB72rOmkuBqiipx+8gkECuiJC9t37vqrFBUkU4hWZIbBBc6dbVj29z6kC2sVAr4JK
         KdrQ==
X-Gm-Message-State: AOJu0YxhYLcjtrsWY9B/3giDUYHliODJXpZRVnQ1p14z0WRTXayQLnkK
	jIRF09JJ1w1D9so4ezoVv+GrKwVGkllC1ELzEiJzVkRqvCWGVdBMioIUXw==
X-Gm-Gg: ASbGncuterR64/718kzy5tYEvjVLwlNzaIQRBjNhLbcP/8Q5vIfTFByzRTezcKFu8R0
	ak0rtNLTz/syWZhIrqp8W92KzbgnQZkfJI2fsTOTso+TvpUT6xUrRQVHxnKcO+0pgGc5pUGDcKT
	96l7IH1V5hoq/8Cm7UBDXtKcfcubWi0Ff5Ys5DjdlYuRVXbJvABSGB9h4nD05Y9g8guob+NryXF
	+p56o9wBFmr/MIQeuoTXkLcoc/I9iM31R65tkSEfzcU0hDVgugVpVJ6fgbHdaGMuDKWBO615TwN
	zF5KYtuBtik=
X-Google-Smtp-Source: AGHT+IENNSuneSmw5XDkMMr+JOGJNxsfDIhTRS04dAae+xXrdtHgZEADc6dGMVrAeNDCLrEoGav0Kw==
X-Received: by 2002:a05:600c:a07:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-434d08ee8c1mr49830585e9.0.1733294975339;
        Tue, 03 Dec 2024 22:49:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/37] systemd-compat-units: execute postinst on target
Date: Wed,  4 Dec 2024 07:48:50 +0100
Message-Id: <20241204064920.817016-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208236

From: Alexander Kanavin <alex@linutronix.de>

There is a race here where postinst relies on existence of
various files from other packages on the target rootfs to
operate properly, but doesn't ensure that it runs after all
of those packages have been installed. Adding dependencies
on those packages is not a solution as the recipe
is not supposed to bring them into rootfs, only make
adjustments if they are present.

This commit moves postinst execution to the first boot; another
solution would be to replace the whole recipe with ROOTFS_POSTPROCESS_COMMAND.

This was exposed with rpm 4.20 which rearranges the order
in which packages are installed, and exposes the issue.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index b9295458237..33257395440 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -26,7 +26,7 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   syslog.busybox \
 "
 
-pkg_postinst:${PN} () {
+pkg_postinst_ontarget:${PN} () {
 
 	test -d $D${sysconfdir}/init.d  ||  exit 0
 	cd $D${sysconfdir}/init.d
-- 
2.39.5


