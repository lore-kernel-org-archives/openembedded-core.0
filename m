Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F154C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6329.1788939013568482827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zfyj8Lrm;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so4375269f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939012; x=1789543812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rlix+JwxD7UI1BfGKYXrDSbKOeIItmD9P/hXYa4zxZ0=;
        b=zfyj8LrmkuMZlIaxuyaXulER3Hn0QzqNx0PPx85EeScftyzhI5tz01Mj+5KKqFmLW3
         nk2SemFWem0TtYkkFk+CiQDNB0oosOMt2KZZLmv6U5w58SsyK613jbobwvnnJYlDo9gy
         4TzwOQN0maQxx13TwvU4XbEvLLV5Y2RCMaIQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939012; x=1789543812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rlix+JwxD7UI1BfGKYXrDSbKOeIItmD9P/hXYa4zxZ0=;
        b=GpjkvHgDeYhX06T7qD36NuyY7h+3OmiFjnsqtFOaAVqC54SJS+YakjdwhoRbsKePwt
         w6ofCIcR2Xbykv3ZUWC+t1ggrSyGCsj3fZVNbXAdboeWeKyS0kqy+X6/kTqGJzhT3e/a
         N1Yj2cH2PTAV7oa/PmXec1vAm2HaTCKMFM58Kt/AovHEmcEqMVYVwBifWUVoBKVWBAuP
         8yDVioNRqhllfHSfMmwZaKcvvE2TTrpHTzoj9Tt0pOG2IMyKe9twGDdqGCRbjMXWoYOk
         NcpGkYWMFxhI7/DNojrF6VGVcj4AQtvyY8FT9mEYKAEPYE4shDzoDhL3E1halG6h/Izs
         AkoA==
X-Gm-Message-State: AFuF++nk9buV8KTEdyXNh9jf4AYZyyjEfNpJCcHUtFYO3jXpwh5d0Qfz
	EN8HkvLuxCvNrHgokmkWZEiVVEyVEglBjPv0tq0Y2g1fewcQVrNSknrbEJXoqJ+7YJp9ao5iimS
	+wd8Njyg=
X-Gm-Gg: AYBFou344OuO4UmKsWb07b31lHIBd4pFsmAHaeyH/fgQeRkgKXTCGVqc5ymVN0Jzo1R
	nmr71ysq1KW5P3i5fdVbfTXtYdMcVstKfnjmqHtxet4hmqwNEzC8Mz7oDqjm7W991i+3ZjSxBs4
	dJQRoXhbYk2Sxdlu2eWQJhi6f2ShcUPvN3G2D1VoWEoLbpVmBwjBwzczFBBZ5Y7YT7VFh2sdd1i
	L5Mmvl3FXiBy0EkwXEB7GjtWaKxppamWGORcQ7DikO+WsjDCvvqNrAmjmpybqJLUsdicHkViVU9
	t9R3girZtsY+TL36YUD8UQmAlE7Thv5D4okf3JHaDBm88E09dIktpdgAhBU1f8wwwBKZpoaPY4s
	/TkM6UwSEXaZYGrlcXhDSix6jlT+c8XZJyxIZtxT3pYMrHK6y3souv/6ehrTVUe5cn6phJCMFgY
	6D/sUBlvCQ3CqlxfSFHyN1SF2dTFG/sduYeXtwg86iSQHXSsBqIXZ1dlBIPkENvZE3FI3rhVzwA
	oPXxksr2iQbO0t5jBreANz2VjoaAW99R0aftmTmZfgo/7CXJyXRu8DJJKsem6RT5K9D/ZXIAz0=
X-Received: by 2002:a05:6000:4a1e:b0:482:f0dc:b4f7 with SMTP id ffacd0b85a97d-48587091b97mr37547334f8f.4.1788939011638;
        Wed, 09 Sep 2026 00:30:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/38] libarchive: mark CVE-2026-14164 as fixed-version
Date: Wed,  9 Sep 2026 09:29:25 +0200
Message-ID: <ebe8e950b1e7df95623a1424db250318728da106.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245435

From: Daniel Turull <daniel.turull@ericsson.com>

- The RAR5 double-free in init_unpack() is a regression introduced
  upstream by commit 620bdafa on 2026-05-16 and existed only
  on the git master branch until it was fixed by PR #3071 (commit
  1c914cdf) on 2026-05-24. It was never part of an upstream release.
- The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
  init_unpack() with unchecked calloc and no early-return path, so the
  freed window_buf/filtered_buf pointers are never left dangling and the
  double-free cannot occur.

References:
 https://nvd.nist.gov/vuln/detail/cve-2026-14164
 https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f155ed4f880d072.camel@pbarker.dev/

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index e8c3a3bfe3d..afc06f85d4c 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -92,3 +92,7 @@ RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"
+CVE_STATUS[CVE-2026-14164] = "fixed-version: Double-free regression in the RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-05-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf, 2026-05-24). It was\
+ never part of an upstream release tarball."

