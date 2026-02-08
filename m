Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EEFEF06F1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24734.1770554265323748447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Npw+w2GD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480706554beso23212565e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770554264; x=1771159064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=Npw+w2GDUJh+1uXaNxi506PdRxROvEtgVOTdzqXyicDL8ZmyyjzLgevLZwb1E4YwqG
         u8N6BDmYCSVMQxR57hRieMyhy5m6yPyDjd4R8NmxvA7CsocIXCChyVzat/V1JticQ5iO
         BLDiSdZE4uUkStdDJhGSoqZnxFqKhT2jpKYchKcESz1vtYGuhv2kkaPDuY1qV2fnLvQr
         uqlyRpjnmlBimSb9Z71BLZ+gQGh/1ToLLeXg0/WcFKnV0q0/NMpMH9ylv36w7hYRLmTC
         lsYINPcz73h1NCjxhlgVu7mce5IwRUe1fAoCiQIQS+ZRIxQ4rRPsqyrsjAEVwSKwholb
         ykpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770554264; x=1771159064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=boRlK6NUPtbNoVwPPCGwrhwU9iCD3jnUR4QVgj2tmqdwXAibP1gWJlgbd4QoBMCgcD
         GQR37Kxgzqt6bTJ4M2uVxYrEDF88g/5/KfZjrBC5yeEGDTuUhETplz9C/jJ6uukuiaac
         Yck7zmEpJ5u4zBA8NToiStHdp8eG9FG51Yut8r4bE76DPcT/QL5KjYlevtlgI0PrnW2f
         MdwbysXi19ymrJSjkntjFIZ46VxGrihZ6a6zYriKRKSkf++gs+ct8aD7yKt9+2eOoe/p
         fsrIsz0DNRPZhqykkSrY7jnzprrUtJbLPPjrMvBt0wCPoUzK3abeZVweW/eTY8hDg+6A
         c7jg==
X-Forwarded-Encrypted: i=1; AJvYcCUMrt7fOWzs9LW0NBorrL9Ju2erVzWvy+NhbuuMJYPXZBtyLt7wdzChUToofYO08DROfgTTpMILbOnVlVR4c0tIYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyd3oVu8th8jEqemG6ADxVnD87JQeA/DBKGtJq179fonXlbNB82
	2kiFt2HyLf72p12hEj/DYR4CerhVK40mHzQpOm78yoOJyjO7Uem+piFA
X-Gm-Gg: AZuq6aKokxJfE9YFUBD/F0sIlWSyHOZ7HGmDlZXL2ybIqjxFR0QD0LrrBnoJAofn9TY
	VUfWxbRNUOltjMmZrLksZ0aNFYbkFXasuIOqHr5D1BrRiEG7vAKsmXkNPvygtc6Za/UxLMbCVJi
	uTobHOkKFnoGEJlXaOdcIlTqCRTQjPBqqNP5USMdLGltoGyzL6KiTwwaeG8GsM8iHfQVCvW92z4
	vbgk9gewXp7Kl/7URgghpqs48CiZNJIUcBjT6lakd9rxXHjovYRlMEqHWeJ+Imxwszsy1h5Dvpm
	xAdfXaoZUaqWWmvYEP0gJuR+ahzs9PMwMYBDLyIijpRaZx/O3qevpvxjmo4OcJW3rrdKCydB3Ix
	7LDfPK6rylfqIFyNOe5ZOxPimNwVV3+c4p2rQ3aTsWoojn3N29xGx4xtQs10d/QNqREPT8kgzZp
	Dlc0fdetK9V1tLnLPFUsK1p8yWjW7TpxDxo1IblRtSEGj+W0GVwrz08mqg+ExrYCwqzerZUODyr
	OgC
X-Received: by 2002:a05:600c:c106:b0:483:3384:a873 with SMTP id 5b1f17b1804b1-4833384a95fmr41678765e9.36.1770554263493;
        Sun, 08 Feb 2026 04:37:43 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320728774sm166826795e9.14.2026.02.08.04.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:37:43 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:37:40 +0100
Message-ID: <20260208123740.4909-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0101019c3ac3ecca-9535696f-0659-43b8-a071-29534de7acda-000000@us-west-2.amazonses.com>
References: <0101019c3ac3ecca-9535696f-0659-43b8-a071-29534de7acda-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230690

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


