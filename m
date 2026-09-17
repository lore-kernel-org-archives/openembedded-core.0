Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAACC982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1586.1789682892967150483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s6Sj6A3G;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1480605e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682891; x=1790287691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EYQDqsu+jbSIPDGCZoA4pVb/dZiHbd3UiiXezFeghKA=;
        b=s6Sj6A3GgqXaZRgu5KBpVGAqOd5vjmrAsd/EXnWkewbbLSZb8eUKSVMXuFxLnt+XCx
         p0CDKsyua1PYyTTSbSDc5yyYvJY8VGFf1gJAQdV+uqg7tTQrpkTVJYYFwwg/YDOyckcX
         gwNzO71VD7MG9XTdfUtNspCj7yaEeQP2RNd2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682891; x=1790287691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EYQDqsu+jbSIPDGCZoA4pVb/dZiHbd3UiiXezFeghKA=;
        b=IUOVyC7756muHZvkwDygoOxfKIB5Ndelj7eZ+lqSwbWnf+TU8BZVHHklKOhUFOFjfG
         AlNO5ZXx6nNjOCWDznzM+G/68daneMRv0i9dL53bvNHiQqHvVNzTMAh3IyF0eRQx4EDc
         IcOqsLEhm1p7UDnJedyR+I7Ax4cBMc7PnVT4KDysHm/D+VuwhFVrLOylxPOigo/5Id3q
         Cwb4knGkjt8NaeMQwS/21Yt2b4+LPCxQTidD8TfNodk6H8Q2X5t+NpeUuhha8NS91ho0
         OBUWqZfaEpx7gMbL48gV59avQ/yOssbjXP00+8dtYA4RQox83QSLdC2nAAVLwEIIJjzd
         RblQ==
X-Gm-Message-State: AFuF++kE2+Nj+N+vlWbEYrGdPP/aeBogVc6Lfqiu4tPQxpHxLDJCrvhG
	sXySoq7viGzYp/fMyl+yyfQZDpm39apDE/4/9qwRdaN6IC/ZyIbWxyKkM+re7luCVemHaT78KXr
	zFAdR9fU=
X-Gm-Gg: AYBFou31J+dVk9cnPZ6CCQ+ETtCtqD9RElz4YdolmQ8+cA4P0xHWvwZH5vxrHYgJhgM
	xFPd8bPkHdqZIXYeH8I5DxvSMXe2WCfdurMihSdxEjNCuz7bjPMtjidA2JV6HvT+sh/UAW4INkC
	5RV5JNXqj7BvD0QmRhfXz6fGdCEEbbuYBO9VHngjhjxv2zY1UoHt4srL8UZlG9QfKJfQXX3j5SJ
	ld2rQZCoL7TvB0cY0x51Jd2jvYOj9Ryi+cIB5bJU3z5A7yNwf+8LeyxZY8T358yf/9VCQbhitVa
	tTIqDdizC5Hf2jDfOa6hL0U0ryAuApiTGdpwTeYhaAfBMzwlcRfn5HI0wUBhCRTb1sf40y3UMMM
	1+4RgWmdvq/sMzaiSCzfeF+hmXTQDkorkqM5hTDzdGNuyAkIYuqwrjz6/NbYQDHKNB8+Xr7aWmi
	5TdA0nqhCYYOoKFQeXvMN1Eo2tz38cnm8yc+CNw7PgllVhqMx06N3nk34Jv0SH5sLip7Q0GVitL
	aXfMoCpm3kXQwUlbJFwp2OVg9gAEDTN2s98CflNbJ1fzvHhJ4mrp1CD5VRWRYNWBb7bNrhz+qA=
X-Received: by 2002:a05:600c:698c:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49fc5743c19mr2684505e9.28.1789682891203;
        Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 41/79] sqlite3: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:26 +0200
Message-ID: <ba9ed30c1778ed27d7697cefe873b8dc17eea90f.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246136

From: Daniel Turull <daniel.turull@ericsson.com>

SQLite cuts a per-minor maintenance branch for each release series,
branch-3.53 matching the current PV alongside branch-3.52, -3.51 and
-3.50, and tags patch releases off it. Superseded branches keep receiving
them: 3.44.5 and 3.42.1 were released in mid-2025, long after 3.50 was
current. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/sqlite/sqlite/tree/branch-3.53

Checked the whole current series. 3.53.1 (May 05 2026) through 3.53.4 (Jul
24 2026) are almost entirely memory-safety and corruption-handling fixes:
five out-of-bounds reads, two buffer overreads or overwrites, two integer
overflows, hot-journal rollback with a zeroed super-journal record, safer
double-to-int64 conversion, and mutex acquisition added to a batch of
sqlite3_* entry points. 3.53.0 (Apr 09 2026) opens the series and does add
API surface, confirming X.Y.0 bumps must stay outside the regex.

Two additive exceptions in 3.53.4, neither touching the core library ABI:
the SQLITE_SHELL_EDITION compile-time option for the CLI, and
sqlite3_intck_register() in the incremental integrity-check extension.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.38.2 -> 3.38.3 -> 3.38.5 and
scarthgap 3.45.1 -> 3.45.3. wrynose is at 3.51.3 with no in-series bump
yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 22cd1dfc82049e47be5e73057c2f12cda036f352)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 94dbc38ec5e..8791749dc85 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo upstream-stable-release-point
 
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"

