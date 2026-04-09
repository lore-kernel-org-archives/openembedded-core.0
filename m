Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37DDF364D2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:27 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145068.1775776278675129660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MRyoDRDd;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b8efed61so11979115e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776277; x=1776381077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=MRyoDRDdyoYs64VDeK91c49mp6dEu+hadHNlmdL8dyE+xfr5y7UIG+YswA+HwQJu6d
         V5QuImDst2iCnEYRZ3HvxGPuXyPUkxEGdKCIhCouzDWTJtAyEC5fDmv7Rr2P/XD8g67U
         og9b/A+pdnPF8Z7qFaBSK50dFbWM+E1+z/raQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776277; x=1776381077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=XNhsN/WjLE71+U6eBYUFaF2YXwOxSvqONywRxEAG48UG7AaDgb98HoAbKMxvBBra3d
         hTgYFBdHDR2hRW7v24jKQ9L5jrB48SnM+gaE0M+Na0U7kwR6hYkw9maav6403h7sWWgd
         kn3Qj9bH2R5gJqxy87Z6ymOr76k8g4x6PzB5Jm6/UOcdQZg4uAoOvpqflPT4qtN3nRGV
         hHDe1hYMIsgaKimLhV1ZYeM6Euo5pGu7jauVizMlbQsjCQeD67PHwpq26lCXzfVISYN9
         OFp3Abkv3zPNT4a33So4FgHPAe/7GALR+4vEGfb0JUzAW7K2oWRimC2mYJVjM42ce6tz
         DYWA==
X-Gm-Message-State: AOJu0Yy+nbyoggE9iYETBEqkEYJvbq9d3PnA5NpgPp4RatFFPQqhfdc2
	Ez5XrJvwvUUh1Fk2GgJ4j0IFKVp5g31T0Y6urSAynMGSNY00StWBlU5+ICS2KCOXPvSq3phBkUW
	48mFejdX52Dum
X-Gm-Gg: AeBDieteJmyQzP0oliWz7BQqLvuwdTuKUJeuSVI3PFmcgUH7bwSTWfIu38MMc/IvG/y
	X1n8KjrXV+JjwIqt7ABUK9EwmOrX2CszHRvC/MUNHUJ1p4b1kXTUHjHj+xlIuGul8UN0g5kAopy
	z0lVNySKBHd/Wss2hGAW4tDHQrWwpmolpQIR7yGX8SAntPlkdYhi3j8debZTwZUOgotBMh81HMt
	FUcaK3Gq7M8XbQcPGmyhDC4fHxFhY7FDu7kPRplrTUCPKW1SJCkWcjzUmfjp///YcZe5icrrelP
	MGIjLJDc8k+Ug/5o9HiTSrRf6y/xGn1xu7++RrCaNEYrcc9t3r2XN3E3AN+2G42j3PEBHwTgAKS
	h9KmOykdekqHQ2tetQo9DewVHLvOCzjfIhrfJ9x9RNM5axz8EoEaDGUHnqWGjP9YdrzK6+B2T1+
	/oLGtH2H9pz/MKMjH5/ip6qS+OadZFLbkcorPP3KiVmgZryE7ER8afAAMx+MKQ0b23p3jtbCeQa
	xKHGGPCArno3itZe1b9Rg3klYpS
X-Received: by 2002:a05:600c:8717:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-488d6816f5amr8473785e9.3.1775776276800;
        Thu, 09 Apr 2026 16:11:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 05/30] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Fri, 10 Apr 2026 01:10:05 +0200
Message-ID: <b9d75be7bc2eaa88a280d52ee0fff322e56d52e2.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234964

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>

Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe
Reworked from CVE_STATUS to CVE_CHECK_IGNORE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index ad0be85559b..4066bb1513b 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -22,3 +22,6 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+# fixed-version:branch 1.1 is not affected, vulnerable code is not present yet
+CVE_CHECK_IGNORE += "CVE-2024-56431"

