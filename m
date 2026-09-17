Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69612C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1587.1789682893472513827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rjoeG9fw;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1006375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682892; x=1790287692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pj5yV0qoBpDeqOnXVp8Hw/rP6cqliaUFCFAlIJ4F67s=;
        b=rjoeG9fw5Zaq9SYjRlpYqx758zPF6G9kDvm9fAC9SOq/P8EC1nVn3V4xKYpFqUYRp1
         SqOAzwspOIS/lf+U/Fal6ANs42zPj6eDv2sc2y9odvZq/x5DeP1TSZxvtWj0MxUVoUBI
         IDzwb8XYa5g1/TWg22fcJunxklVcEZo8FwB8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682892; x=1790287692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pj5yV0qoBpDeqOnXVp8Hw/rP6cqliaUFCFAlIJ4F67s=;
        b=ajd+vcEKoqBIDXVLWMclh0JYgYmDx8ldDDlBLLmR/e0+Kf8dsVoL8GCQUVHS+6tNDy
         V6CELSkGC//Vw85hsawUEno37EfFij8/uK0oXH+2xDtUETiCxL7IDi/X4uR0h7d1AYML
         Ld/Or1njOYLq0aUn3UVl3ksBCD4Xy9bzeVzzHBZUQ+HTR3ovI7VD6m5LQVKPRoD8m5Z6
         +awoBAnXCUd2V2WggvQBwlW1FMn1FSsCmHx55KaDZ4av6fCaR8DaR7mmKlwJ0J25UOY5
         QFqV3Vz613LIS+q+q7C9e4xsYymmbSbrAzccTkOUloYjHdKIF21puuGvLsFDCBLhFIGQ
         IbWg==
X-Gm-Message-State: AFuF++nX+V0SQUS6CrfyKVve8czmuB3oeWwjcNLO2CR6+XOOl4qwUafA
	AaZsBr3WWDlKEryubsY13wFJ+z2BQH8Mq8i09lzX2ZNJWuL1s8n/S/6P7YzKhPSWC3u+KZpnAiu
	Cc1vGPs4=
X-Gm-Gg: AYBFou1KVnuGSUhtvw6kIrW3KiExXhICEXYCSlD/OOfmpimqd7nXNugNyfMMAU1uOS4
	uOQyPHFFo+f93cpVNhbB31DdGdD7StvxUTgMQLnrAI8wl3YYGelUmm8fUZIrvIJpEKHHfCMCLBi
	jre2mhi3uAkv0kLVbUVUYtDha87aKrEtughasLPG240gnZC4Be9wvB9FE1KUkml9wjguHxQN8W9
	bvMKu7IEGICLhmDuDGfm/+j3L60FUUQHVOxi2DSv5POaCZnqLV09AN31iMDtjdcNzHN8ZIYylLm
	tgpB9AVFdz3fR1UQgani3tJSHlQKxeMLS5iAumITjsJyilQCvpYz1L3t12dKxM11P3BMmZhQ+KE
	6Hzxy21I2S5D+QPX8FeLazIyJrY0uTOA+oEX+uRpO1Ax3eP1LIQsKcrhB3gqH/ofwGY6mUekeGJ
	WrqcgjJ94ltTLgYKH8ZqXquK4Dva6ZicMJGhJJRNMgfQH0zVXj4df+x/OSiarWyycmpPHT14ecd
	0QvvKLALzpws5DkHqzfFVBvI++Dzg3eDvjORn3lo7usraUfB9Ufw3jkXpyXs0X3+5fRW9wZtdsm
	PXd8BJ0pUQ==
X-Received: by 2002:a05:600c:190d:b0:49f:bd3c:bc26 with SMTP id 5b1f17b1804b1-49fc574f069mr2982545e9.33.1789682891706;
        Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 42/79] lttng-tools: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:27 +0200
Message-ID: <d11f7da730f828ea758e8436c131f2778cbe7b4b.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246137

From: Daniel Turull <daniel.turull@ericsson.com>

lttng-tools maintains a branch per minor series (stable-2.11 through
stable-2.16) and tags point releases from it, releasing from more than one
at a time: 2.14.2 and 2.15.1 went out the same day. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). There is no written
policy document, so qualification rests on the branch structure and the
release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/lttng/lttng-tools/blob/v2.15.1/ChangeLog
  https://github.com/lttng/lttng-tools/tree/stable-2.15

Upstream keeps a ChangeLog with a per-release entry list, and all 48
entries for 2.15.1 (Jun 05 2026, against 2.15.0 in February) are fixes,
tests, documentation or refactors. Seven address machine interface output
alone; the rest cover a consumerd lockfile fd leak across fork+exec, a
missing default kernel probe entry, an uninitialised read in uri_compare,
a musl compatibility fix, popt error handling, test fixes, and one
refactor preparing the CPU-mask escaping fix.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.13.4 -> 2.13.8 and 2.13.8 ->
2.13.9, scarthgap 2.13.11 -> 2.13.13. wrynose has taken none and sits at
2.14.1.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to lttng-tools_2.14.1.bb (upstream: lttng-tools_2.15.1.bb).
(cherry picked from commit 40f22582ff6989f9275808bfda229a8ec78504e4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: lttng-tools has a written stable policy:
     https://github.com/lttng/lttng-tools/tree/stable-2.15#supported-versions
     |The LTTng project supports the last two released stable versions
     |(e.g. stable-2.13 and stable-2.12).
     |
     |Fixes are backported from the master branch to the last stable version unless
     |those fixes would break the ABI or API. Those fixes may be backported to the
     |second-last stable version, depending on complexity and ABI/API compatibility.
     |
     |Security fixes are backported from the master branch to both of the last stable
     |version and the second-last stable version.
     |
     |New features are integrated into the master branch and not backported to the
     |last stable branch.
]
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c6..3df9ed1c00c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -54,7 +54,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
 
 SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
 
-inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
+inherit autotools ptest pkgconfig useradd python3-dir manpages systemd upstream-stable-release-point
 
 CACHED_CONFIGUREVARS = "PGREP=/usr/bin/pgrep"
 

