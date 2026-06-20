Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A969CDB473
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5967.1781960434361568754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GZGKEkJK;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49241a577d8so10757495e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960433; x=1782565233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeQ11XS8gmarwGQ9qvnXnloLOJwGZ1yGfg+7VhM/MXw=;
        b=GZGKEkJKcWmV2/U6QiDR1oWwhfz3fwrZKjvXV3mcnSRhFBKHlOWvhQdewwjxcjCbij
         jSFuigm9ADyRW0KF+lPPq7OdmmixKAeH6ecphVyS/M/ZNHyotrPaUw6NMknzcmHpDdcA
         n5VJmm+ogruJoTb0xt7vobqmfNV6TFs8v1vfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960433; x=1782565233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeQ11XS8gmarwGQ9qvnXnloLOJwGZ1yGfg+7VhM/MXw=;
        b=be3/BVVe6PERe4aUkgmbMsAiF5bIy+PLz8xZ2XvXdAqiwHKK+6T9zetSlqVI2YHxxH
         ZPDFwCijm337OnhkiHHG8VFmiHGQiSRd33B8rfMs8nidykgnPVT+ucBS3oGFYow69csQ
         8HYnsB9ddlLM1NFyGdTRUDg7yzKksLvEonbGuxMOxLt4Yidee9wVgla953rm5ao6jkQb
         eaQ2dBtujoCB7JrKfHlz7gmy4TnwAS9RMiEurhW1fcuq46MFadUwBADt4eAQ4dnNDcSC
         ITvz3DZU1cno5ceSriOuZviHH2535qMv/hOHI9hwzkeC9o5mYfk2eiMbFKPlhCmZqUNf
         jTlw==
X-Gm-Message-State: AOJu0YwIyvm3nT7P7dUa7EaQ2JN3ApyzrxHoJEH8hgjp7WXkLBgAOB45
	jh7b49BKRkhstMtmogfXcEYDQBCXm4qbT1M3RnslBDtYcWDIDNPOHoEz72vBNE9L56Nv72T4eO4
	Fgkhi
X-Gm-Gg: AfdE7cluqsk9k2p5Rh66sGxXe4g0mK0Ae1XEo9s3LdpR3rKlEmYz2fhuCDeCBQL4WO8
	56WlXjNQqPuUDNmPwIdEX8vYt+iqIQSvCzOP7/NPlrkAZJeEQCFipcHtfhcV+gAL3g+yqANzEuD
	SAscgTvGCUEhdS8Y6PUpdtjzxKh4n0U0NhHe2DND8CJGPm+LP8T/LZqyoCWGDn6XgOgyyd9pIcC
	qc0bJx8S8Sqvwxssl0UkCniEFvpzJDoismtGfkMMJRtbTWiQe9g49DLSPnHrHi31+ePuizUXbtm
	81vyOswpw5vLp//6d5Hy6k7+bWzYU3Abrg5U64xGfIvRS5Bi2A0PFUSlCdYDQlVCKax+vlvSxFx
	W7VOVdrszHf/GaNbBp8W+1FS+10SsTcMTWT1uO1p/wCWm7Lb5STm4L+hI68ercsEMAg3Yq3D+34
	MmoY2yC6qBYTVZ0yVp53ZjZOgZEhpelXEqpQfruclk/N7FzqUKea6zdDHgZz7BQ8tr+0HPhIw5K
	990L11TWz34PNF8
X-Received: by 2002:a05:600c:674f:b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-49240e41fbcmr117104595e9.12.1781960432574;
        Sat, 20 Jun 2026 06:00:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/36] glib-2.0-native: Remove problematic path reference
Date: Sat, 20 Jun 2026 14:59:49 +0200
Message-ID: <4d1ad9324758d2707ad7dc3b808c03d559c5ffeb.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239244

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The gdb helper scripts are installed to a path that matches the installed
binary path. Whilst technically correct, we relocate native tools and this
path isn't relocated correctly.

The paths mean the build directory leaks into sstate objects and native
sstate objects can have differing path contents as a result, which causes
problems.

Whilst we could relocate it, gdb would not be searching in these paths for
helpers anyway so the tools aren't needed and we can simply remove them in
the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 117ed64803dc2c8176125835b2bbcc08225f45da)
[YC: This is part of the fix for [YOCTO #16281]]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ae40b7f41f3..dee94ec0600 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -124,6 +124,8 @@ do_install:append () {
 do_install:append:class-native () {
 	# Link gio-querymodules into ${bindir} as otherwise tools like meson won't find it
         ln -rs ${D}${libexecdir}/gio-querymodules ${D}${bindir}
+	# Remove gdb plugins as we'd never use them for native and they encode system build paths into their location
+	rm ${D}${datadir}/gdb -rf
 }
 
 do_install:append:class-target () {

