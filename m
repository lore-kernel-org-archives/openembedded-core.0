Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD01CD98C3
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 21:00:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1396.1696971639047982275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 14:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=nPvXcqXp;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40566f8a093so56662735e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696971637; x=1697576437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWrg7shchxArby3AGJKbnrEvR38w9aCc3dOqnbArSqo=;
        b=nPvXcqXpU47zNh37t0gqHZc1e5LmSY1DCYgsSMCeG1Zva4apuTgWUf3/owvUfqdJXs
         E4mHPSME1nvdULtp1l6ptYDcd6kd4qiwQHq5ktEGGyNrqwhj0wdIGhjIguObHpNltRGS
         1r+MxC3hD4owQSlUrIbvOIyZT/svT9YJNTTnJHQdlYc49PoCcqkDASBcMBvl4b1z/WjC
         J1nZ9EzEzSAdzjAdIVpLPifAPkPFwUg5A7TvghO3KPpiU0clWU57pMWT41rI9c5feZaz
         DZkItChlLs0gMZHFTgWAARGaM6EZZDk/J1V5wa1yNGEys7GLZV1n2O3WgUOozkl1LTDw
         PUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696971637; x=1697576437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWrg7shchxArby3AGJKbnrEvR38w9aCc3dOqnbArSqo=;
        b=QLg8FTygyENzYIYUzf/ZSBbSyjCzhvZ23WZHqqiXZ7tRcfvbx09ZGe5lHuWs/L7ccn
         AwAqZtDGp+yrS5lqQsURqTVDX8Xz4s6ME9Hbel5oc4NwuKog2FpvaOHxAxWESG9FoypQ
         WR9Oy3hMJQt0hirsD3QkkfaLQbLhU7a0MnY97mH/JNluruX0kaldR1dUrFk1gDkBOV5L
         G/TrIzNKNtKCuGeQZJd/9IWJ0b/+YJYXzyZKHYEG6ctdDYXngCxVJhivenR2GupMOy/L
         i82I1HHTxDk86HQ6ARIY9ga/VWwYCp8dbh7jffsGMCLe2fgkEQSWhskdo5UXrjNYOfE/
         iZhQ==
X-Gm-Message-State: AOJu0Yz/aY0g0I7/2L63T4kgXhH7ZWjXSJy5F3kQGf8RbEMdYgZ+EpS+
	VPOnplyxNTV5xVcuVuo2TNJJAhI34rBsujcTfqE=
X-Google-Smtp-Source: AGHT+IGaVYjWdhs6pdWHDYKHazraHQcwiE22Ltj2KAFb2BdbAlUnQBfC6KEPMA4AOvkvab5HFjWeSQ==
X-Received: by 2002:a05:600c:290:b0:405:3d41:5646 with SMTP id 16-20020a05600c029000b004053d415646mr17881137wmk.2.1696971636950;
        Tue, 10 Oct 2023 14:00:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b00406725f27e1sm14960122wmc.42.2023.10.10.14.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:00:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Mickael RAMILISON <mickael.ramilison@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] scripts/patchreview: Add a custom pattern for finding recipe patches
Date: Tue, 10 Oct 2023 22:58:57 +0200
Message-Id: <20231010205856.1720621-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 21:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188916

From: Mickael RAMILISON <mickael.ramilison@smile.fr>

This introduces support for specifying a search pattern with the -p/--pattern
option in the patchreview.py script. This is designed to accommodate
the directory structure of meta-openembedded.

Signed-off-by: Mickael RAMILISON <mickael.ramilison@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
Note: This patch will be followed by patches in yocto-autobuilder-helper
using this to run patchmetrics on meta-openembedded.

 scripts/contrib/patchreview.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index b22cc07f0a..43de105adc 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -207,10 +207,11 @@ if __name__ == "__main__":
     args.add_argument("-v", "--verbose", action="store_true", help="show per-patch results")
     args.add_argument("-g", "--histogram", action="store_true", help="show patch histogram")
     args.add_argument("-j", "--json", help="update JSON")
+    args.add_argument("-p", "--pattern", nargs=1, action="extend", default=["recipes-*/**/*.patch", "recipes-*/**/*.diff"], help="pattern to search recipes patch")
     args.add_argument("directory", help="directory to scan")
     args = args.parse_args()
 
-    patches = subprocess.check_output(("git", "-C", args.directory, "ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff")).decode("utf-8").split()
+    patches = subprocess.check_output(("git", "-C", args.directory, "ls-files") + tuple(args.pattern)).decode("utf-8").split()
     results = patchreview(args.directory, patches)
     analyse(results, want_blame=args.blame, verbose=args.verbose)
 
-- 
2.30.2


