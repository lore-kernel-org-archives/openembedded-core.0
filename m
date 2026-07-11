Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B62AC4450A
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4107.1783773390411561389
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eYDvh0es;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1048830f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773388; x=1784378188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=se9yFP631VDVQzmNSRVIsFfe+H7ze3ttQWEoxkKl+wQ=;
        b=eYDvh0esmW6chsfvhJGOLfkfgkfLYqkqd1gOH1UrfHu8LO8icIm+bpRAE4fEqSZ6b9
         VztsuHN3Kl4b0HhcdDA/tztwZiPi6tfIYube0AJKxwzJ7T3fkH8SDBfGtrqJGhNSaQvQ
         W2EV78SpFAiraY8FfNhCL989kp+zOmBb9Oo/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773388; x=1784378188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=se9yFP631VDVQzmNSRVIsFfe+H7ze3ttQWEoxkKl+wQ=;
        b=CHrMx4ClEV7/sjorEdT9H0doJfiRY59vJG10HbK1nzyXVlRw8deoexld1KoBTWpEHg
         ZlRLukIRIJbCH3gfUF21ZZ3ZsSFO/4XrjofrxPz1h4OY1ZU9llWoLque2xNRohhFxOox
         FeyIgnfiE3wb7hdOZEVJC3+oq/5u9nC6Rz2ajnLpMH960lmwBItlDC6G5w37RDmLP2fE
         DJ7QI0UCoxqETj1bwyBEtNGAQK8o9TzhzoMhj/PPEoi3vbUjrJMrTeLkeikkj0CZafn5
         usYbDsAlHyGJA4LTXD13Fxa0uygExr7GnM0xXpEMe/z5g0K3gMR1TUVyWQwM+9PwGCx4
         Hszw==
X-Gm-Message-State: AOJu0Yy6+YkQ9OFIzDhw7F9lTPKcajPNyEyGckBHZK5qCRMZlUy7JY9B
	y7/R3J5VxGUEtRSM1NNYY2a/LDU6TRnIOPZWC6227x+rzZC4Lcr+WoKIbpx3nc9YHsVvYnLzHkZ
	FFb1CqgU=
X-Gm-Gg: AfdE7cn3CJZlV3mc+S34TwUFAvLOHIo6bzuCuVyVAEgVJrgJczAF+k722ciaqPW6cm2
	fgR/IVw0CzQyVY0ia9Eg77dpgMCd+N0zAcFCW+INIxuIsRa3fSJWAjI/UG8WsHSw7P0ByvbrIzJ
	MNj+K/CNGrArtwuLX0+7tAs/XbzDMfO7n4RpSxPeLoDNhZJvHn+dWHnMDpdAOObXdUUd/InIgcL
	76JjtBfRvO6+IXi/46NwLhYdrgkoW+sslI7a4egLLAOe8mgtuYUFgv6ofeSWkCIPf1zjd+tUJR8
	TN7NV4hwvjwziiq6vfJJmASIA6QIaSb615DB8TtxkCPe9lvfPYEGy4PLs0okR7sQvSTEpBKkcTq
	iDwEuxshzsQa447qU2EUWHIEk+t7uv/54yTlRoxwd7h6CCBSw7drzz2YILDAIOgvpZduwFSHkDn
	Qafxbd45W94YZhpXY1VYctQw3HQXGZourJchEThtsZYw==
X-Received: by 2002:a5d:5d03:0:b0:46d:d5da:f0ac with SMTP id ffacd0b85a97d-47f2dcdaab8mr2775810f8f.47.1783773388486;
        Sat, 11 Jul 2026 05:36:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] fontconfig: upgrade 2.18.1 -> 2.18.2
Date: Sat, 11 Jul 2026 13:36:19 +0100
Message-ID: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240710

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fontconfig/fontconfig/revert-static-pkgconfig.patch   | 8 ++++++++
 .../{fontconfig_2.18.1.bb => fontconfig_2.18.2.bb}        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.18.1.bb => fontconfig_2.18.2.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index 30d6423037d..4337da724f6 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,3 +1,8 @@
+From 1de775180219a57c85a0cdcc62fc6482ef8e581e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 20:35:32 -0700
+Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
+
 Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
 We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
 paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
@@ -7,6 +12,9 @@ gently refuses and rightly so.
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/fontconfig.pc.in b/fontconfig.pc.in
 index 61b35fb..5bc9bab 100644
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
index 76b26527387..d2b6050081d 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
@@ -23,7 +23,7 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[sha256sum] = "2300f3dbfa7253b3a44f4feecdbc8dfa45dde5dc2cfb71fceaf31f394cb41031"
+SRC_URI[sha256sum] = "cf8e6576ef0484c15079bdaf77cd9c51c464df5365814ada4d3ee7331ea31eb5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"

