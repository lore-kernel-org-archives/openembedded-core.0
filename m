Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1293DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:34:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.10420.1738150439356899327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PeljU5/q;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: pmi183@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38637614567so3279668f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738150438; x=1738755238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GggrCXN6Zi56PwnxsZ43GvAiGKfTaSKvtkFEYz3J73U=;
        b=PeljU5/q9FEk7enQdCeINvBDDhTChtSS5ctAjaq9Dmfnrs6cQfeG7Mx1m/NMS5Rwky
         8PgytnQZAtvO8o1i/D0oi6VNi8bcTDu2Z+9lgcswJLsC1jh/tgrzsLk1apMbtNHoYPPq
         Oz8svdpx7jZorc6uyuV9zFWBspLSCtjopnwCQULjshLy2nfPDrdH+aeS3cS2sNhPodUj
         XJ8dNEqa+mt587fUiEht2dvXtdSrgaAJxOacHbJx89HFULDWcsasLDQxivyXooILNUry
         e9AULaaJSpEtHaf1qVW/09dJRDu8VpgJ5W+L9BRyMR7hjFUtIt6oyx4nxKa/Dj9E4o7e
         6qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150438; x=1738755238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GggrCXN6Zi56PwnxsZ43GvAiGKfTaSKvtkFEYz3J73U=;
        b=do5MwVdoAIO4fViD4UsoC+SHsjY7KzGO7UsZ/v9kw1WrPhNuctNvsTD+42ltWHiam7
         ve9fyB336FFQqxci7Ar9Wtsx8o636B4UzR5SW+gU0W4oVvIiMxg5LyaAjbGoL7Q/Nxfw
         UdC2CTkROrQ1c6TtdpQcSC87IsF+uH9sfNzQ0AbugkBNTmBIDijmJq9DjCljaTsjvLms
         62eCNYD2b5Y9/pnP8s97zOCh36uw+q/BX5jVoikRUQe7JoA6h2NZFgiGbopXi0a2W9ru
         sc0yoG7rI9oaBLbk19fbuW1nmJb/SPk3/m6mUHoSR4qCnM3y2TahT5d/1Tfe53bUbWLt
         5jzw==
X-Gm-Message-State: AOJu0YwmJgZhgzveVtPawMiWijDOQM9gw5NuUwwIg53iS5KBaBkrSQQU
	PtyLryfcD24quXsZrywcippNQfdL3DAa2aex/ANOHMlw3BLY/k/GOK3JXg==
X-Gm-Gg: ASbGnctTq2e+58QN7nlchYmExnEMyI66yeqm4l+TFU2IAQgLPw2FYBLVBh7XQgaI9VV
	ensA64am0AERXhzzjowgQF3CsCB0ZD7dT5flKsdMk7zwIqSaECx6Zp1+n+LUVTWZYIIzqDfvmGK
	Qz/xHuVlKxeMhC+qe1kYQlhdVHFBwK2xPf9P2wp6yg+td0Q+cM0INXmxvx6d+RBeMyCQRWlBZl+
	enrBvuX/3hDYitCW9v+eFV0ik6PZ2iM3kgK9yd04Y3HAbls5kksRv7BAP7u7oW9D2krdXxIZcg1
	Lru+ydZydTaUzP9uF8agL09IuS88FMJnL0+TSxbTNeJKYw==
X-Google-Smtp-Source: AGHT+IEwwrbw9pVtXJTC4Xfu5PZdZMzreiIZTW8mD9vWrWktd7+ndPhyYPWIWzy57cBRemKei6trxw==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38c5194a53dmr2250346f8f.14.1738150437392;
        Wed, 29 Jan 2025 03:33:57 -0800 (PST)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f88sm19712265e9.2.2025.01.29.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:33:56 -0800 (PST)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: [PATCH] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Wed, 29 Jan 2025 11:33:24 +0000
Message-Id: <20250129113324.52760-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210376

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

As a user i want to override `RUSTLIB` path on a bbclass, lets
call it `XYZ.bbclass`.

If a certain recipe inherits `cargo.bbclass` and `XYZ.bbclass` the
value of `RUSTLIB` is dependent on the order of the inherit.

If `cargo.bbclass` is inherit before `XYZ.bbclass` this will reflect
the desired value of `RUSTLIB`, on the oposite, if the `XYZ.bbclass`
is inherit before `cargo.bbclass` then the `RUSTLIB` defined on
`rust-common.bbclass` will prevail.

Changed definition of `RUSTLIB` to soft assignment to make it overridable.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
---
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index baa3869c47..31331c7a26 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -13,7 +13,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
+RUSTLIB ?= "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??= "libstd-rs"
-- 
2.34.1


