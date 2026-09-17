Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42A9C982DD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1590.1789682895613281577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sKKH4Hr/;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so1217415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682894; x=1790287694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iSXlHMYpiXCM7Hl89IMes8px9euHPY2Z0uJPd2LUpJU=;
        b=sKKH4Hr/E/uqwHL5EHRqa8oqeDgzD2oIJMU6hoBodpLW9HrABjGgshkPYoOhyqYdB8
         XxoH65HNU2tBhu2H6clwxT02qihRx0aYSsujfVyRm8BHolMgbrm8ljWXIJwUTuw7f3Qq
         V8TjNpoCJsZe9paCbHUh8NVA3MAi2bUkkJzBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682894; x=1790287694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iSXlHMYpiXCM7Hl89IMes8px9euHPY2Z0uJPd2LUpJU=;
        b=AeqEuryaeyGuZIlsFjbgWw6cgpqYfEQEGdeJDr68nsjtKev6NgKvFOWdPnSqrZHyGp
         +Ze6fbR5dq5wWK0YfuHlXIKnWngzkHcwBzCaj9wdDGmlk0SE8QTRpQ7VOgz5DlerDHg0
         VElHuYVhQs+PLzP3gO01L2Pg2RQ0brWXUpOGWGXDpSK7DbRR5xVJss+TmohwU5xXx441
         927HETmHyaGBxofbjv9Q5lmiCVp5LER29kcF1/ZtM7J5of5XuiOXFlRh4isPNs9eiiTe
         sWw0JN2mXj+4Y6660cuX+LgRKKS5XlE+hE7H4yYyagsV/5RVqNATGLPn4qiIbUL7YpVz
         v0Yw==
X-Gm-Message-State: AFuF++nVQwQPkqPC46cJbBXRj14zSGEDq7RPqwnDMH0Akpk2yuT+zYD8
	v4BtrruvzRx92oZ2K8VqyC7kxi0pU5u1I8AM0cd5srCBNGGwaWDqLAwD6UpDdMUTGpOQo2IKvGC
	VXGDSeNs=
X-Gm-Gg: AYBFou0vVkZQTlCAh3rjh87lPouq/9mxwKHpvWcGKedPsCWe1UMriZ4ZrFj5/B4gkbq
	92m/OfYve17wiuY3f9NBDXCdjYuJoMJmMCTIkooOWp0IH02VZpzAyPhn+6Sfv1l5gGBT2G/pMHT
	u6UhTOtXKaKWmI+RD1imTe94bIEcB7Ov3KadD9OCnwc7p7igF70e2y0JAX44/mQDTaxMYlVVQ1Q
	gzxlWvMrgOEDeWWlfqN55vPsDGKQCvyoUGDhARK9il0+ydfD5GUq9cGU04QGONGe3HLDvQlu6WJ
	gFhFVfUj3Skh7Eza+n8+Wl12pV0LHLhzBTdDnyFLtNe/6Kpsvu7KbYi2eiD/lAJ2fQO8Zezll35
	UZzOh3mldwMRDxqhP64yzI4kaTy9TKL3W7HZDD4Q3aAn0VZuppB+sW6WaQXiJ+gaF+jp11GjSw1
	obdG1/sngjw0taPDUMIvptWPC+74ORNOUn22j1LB1YXKtjXORnhpbkyeEyQE1Wncg/bek+Hjhb1
	9px4f52gecPlzTL2XSn6zKKjO8CBf/Q+Oj1HsNZvQ/65rao2Q2smsY/gdXHBj4NFEjMDBqpvxM=
X-Received: by 2002:a05:600c:3556:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49fc57360damr3385215e9.21.1789682893836;
        Thu, 17 Sep 2026 15:08:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 46/79] lttng-modules: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:31 +0200
Message-ID: <104bd209ec7eec8b3ff046e40d363b35e9a9829b.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246141

From: Daniel Turull <daniel.turull@ericsson.com>

The LTTng project documents its stable-branch policy in README.md,
"Supported versions" at L171: fixes are backported to the last stable
version unless they would break the ABI or API, and security fixes to the
last two. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/lttng/lttng-modules/blob/v2.15.2/README.md#supported-versions
  https://github.com/lttng/lttng-modules/tree/stable-2.15

This recipe's policy differs from the rest of the project in one respect
worth stating. Where lttng-ust and lttng-tools do not backport new
features at all, L185 says kernel-version enablement is backported to the
last stable version. That is the only non-fix content a point release
carries, and for a kernel tracer it keeps existing probes working against
newer kernels rather than adding anything a user can call: no new options,
no new API, no changed defaults. Upstream labels these entries "fix:"
alongside the rest.

Six branches are maintained in parallel, stable-2.11 through stable-2.16,
and released from together: 2.14.6 and 2.15.2 the same day in June 2026,
2.14.5 and 2.15.1 in April, seven such days in the last two years.

The ChangeLog entries for the current series are fixes throughout. 2.15.2
(Jun 19 2026) is 13 entries: a leaked file and fd on channel create error,
plus twelve probe adjustments tracking kernel changes to ext4, btrfs, vfs,
vmscan and hrtimer tracepoints. 2.15.1 (Apr 24 2026) is three, covering
kallsyms on powerpc64 with ABI V1, a snd_soc_dapm_context move and a btrfs
probe range.

This recipe must share its minor version with lttng-ust and lttng-tools:
lttng-tools README.adoc L123 states it supports the kernel and user space
tracers "sharing the same _minor_ version", and that cross-version
combinations are untested. Pinning the regex to the minor is what keeps
that guarantee, permitting 2.15.x -> 2.15.y and excluding the 2.15 -> 2.16
bump that would need the three coordinated. Within a series they have
never moved together on any branch: taking modules, tools and ust in turn,
kirkstone ships 2.13.14, 2.13.9 and 2.13.6; scarthgap 2.13.12, 2.13.13 and
2.13.10; wrynose 2.14.4, 2.14.1 and 2.14.0. The minor agrees in every row
and the patch in none, and scarthgap has lttng-tools ahead of this recipe
rather than behind. There is no build dependency between them either.

Already tracked this way on the OE stable branches, and more thoroughly
than most: counting only bumps since each branch forked, kirkstone took
2.13.4 -> 2.13.5 -> 2.13.7 -> 2.13.8 -> 2.13.9 -> 2.13.14, scarthgap
2.13.9 -> 2.13.10 -> 2.13.11 -> 2.13.12, and wrynose 2.14.0 through
2.14.4. Each also carries local "fix build for kernel N" patches between
those bumps, which is the burden that staying current within a series
reduces.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to lttng-modules_2.14.4.bb (upstream: lttng-modules_2.15.2.bb).
(cherry picked from commit d4666244a51c7fb8fa7e66c11d91692197c89ce7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
index b2c697d365d..d0983f58cbe 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
@@ -7,6 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=018e002dbdda3306682e394ddd65fa32"
 
 inherit module
 
+# lttng-modules publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches. Point releases also carry kernel-version enablement,
+# which keeps existing probes working against newer kernels rather than adding
+# user-visible functionality.
+inherit upstream-stable-release-point
+
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \

