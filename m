Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEFEC982E3
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1582.1789682890395987619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yU7YfmWx;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so781335e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682889; x=1790287689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QHhbQhUNFOO1C9WP2xLF7BGBdHH+UiyNe9NemMYy1aI=;
        b=yU7YfmWx9mzvNVbL8zMmJBFrT/j/KCLFH5jTnm3iuaWKWavMdcibtp13eOfWGJhE4Y
         3J5QVdmbHFvWcgV34orqK8C1WgI7jJ77oN6dWjd4gbhnHj7qXjh5K4efp2fDSKUufe/Z
         n6OUDee3uul3jtgHVQztI2s/zxTBZwNbafuXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682889; x=1790287689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QHhbQhUNFOO1C9WP2xLF7BGBdHH+UiyNe9NemMYy1aI=;
        b=VgJqHXdTYasvIraKre6x/DDENuKm6hYOeBZB6fJ2HHdSUMaag0yvjOD/UiO2lbFlOm
         FoLh9wY5HnR8xDxc2eFeXKNcxlTx4J+jKD5kOB+erNrS3Rnnu4SByJ2o6VH/NVnCVKUm
         AV9vk1nsVItti0a4Ybj+XdUam0Czvvs/TfxXH+YzNQO11ZCwHklKVzRJ3tdtrIFpQbrR
         C/EuDitPl1KZuX7Fa2H87Ar4+vP8jPEBgETyfcSnTT9TKOk+jeQnOW6Jfr8IFNw152Yr
         58rksMHwGr3CV4ZT1RjYZfQK0qXpJYZokEpu6iXZ5C4YHFJy9W3OpLkfNcCabCSPGp7x
         Ey6A==
X-Gm-Message-State: AFuF++nx0yqIYYVbrpuYfZcs/D3WiQ+wwoXbCWBZiQP+H/FVi3hgWzR8
	oEoUd7JGDjyU9cRsdDvxIt9KWRC2UmXIysIVarzWjYB0YOh+lygGGeJe16YB01A0v2W3Ke4PSDs
	x3CWUEsk=
X-Gm-Gg: AYBFou2CF0+rNhR9r3YKsa/9lt6fRlF9+uyWUMAupDyWmHdmWrR4lXw2jTMptxr/M7C
	iY8nw0iu7sPfwwobtVvdEGfXS6HPR46aB0qmV0EG7cs4cb+T7MSqF/LnCIi1YRYQBj8tp0J6n4w
	z4FLx0c6lLhi6a5NSrjuKZhzetTMBvKbqAYSjA2R3+hpnhc5s0vO7OwOO9D040zjfSNEVw22oKZ
	XKSkpkhz+jeQZjP8mJ46EmeJxfw85Ia4ZoEFT/JCI61wVjAQORCvK8oGV3b5cBByAWQWdPc7LIb
	vxIgGoXacqG8kjFCtx0paoUUwJWXVf5Et1OYZKKXMmjIMtwhR8ZqUgs5LU9rZZMR78ZNagZXZ91
	1CduodYrNtB7/wjeYpzu4Ibc9zyg6QhEAB1tOc3YiuM7O0k5R6ybbOnra3uAV86G5YHAXiAhUKw
	3gSBJ3286b6RSRrdPFh1hRZFJv5LqkDC3JWEqwmGrGyqnDQz/EwHITN2Q0jDk2kSI/PblpIfn/M
	KZfJuwZVjF0fQOQ04TM3+VobKGfavlwE4EoABHCbftTP43tjeEGWz1ijWSRGNbINxunoi/G0FcD
	YCFDF+/ZPss=
X-Received: by 2002:a05:600c:3e05:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49fc5737ad0mr3260175e9.21.1789682888581;
        Thu, 17 Sep 2026 15:08:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/79] libxml2: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:21 +0200
Message-ID: <ee2f4006b73d518a250b36827acfe4e2db00049d.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246131

From: Daniel Turull <daniel.turull@ericsson.com>

libxml2 maintains per-minor stable branches (2.9 through 2.15) that take
only bug-fix micro releases, and releases from several of them in
parallel: 2.13.9 and 2.14.6 went out the same day, after 2.14.5 was
already out. So upgrades within a major.minor are stable point upgrades
per the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://gitlab.gnome.org/GNOME/libxml2/-/tree/2.15

Checked the last three point releases. 2.15.3 (Apr 15 2026) is five
security fixes plus an "Improvements" section that is also entirely fixes,
and 2.15.1 (Oct 16 2025) is security, regression and build fixes. 2.15.2
(Mar 03 2026) is five CVE fixes plus one addition, a --xpath0 option
confined to the xmllint command-line tool.

A public-header diff across the three shows zero added, removed or changed
libxml2.so declarations, so the library API and ABI are unaffected by that
addition.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone picked up 2.9.14, scarthgap 2.12.5 ->
2.12.10.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to libxml2_2.15.2.bb (upstream: libxml2_2.15.3.bb).
(cherry picked from commit a9fd7975e991124b8f54c4c763917e705fb4213c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxml/libxml2_2.15.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.4.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
index fc367892bfe..896b33f2677 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -30,6 +30,10 @@ BINCONFIG = "${bindir}/xml2-config"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
+# libxml2 publishes bugfix/security-only micro releases on its per-minor
+# release branches.
+inherit upstream-stable-release-point
+
 LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
 
 RDEPENDS:${PN}-ptest += "locale-base-en-us"

