Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609A9EF4EAE
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49602.1775456854352932548
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=evsV+1bv;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so24312975e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456852; x=1776061652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=evsV+1bvPuigOmbB5NuzAYkCwNrZFNs31tFrMHiT36vh0CC2y83EvoygcHjr0hYZ9e
         Tt+y6Z2JjrwK+IZtBb5S0oZ9JFOqv0FVJ5rrkv1R27eK3No5p9sOwZ3sGys8aIwb7uaO
         QsdGHf4LzgGHOgaoOFFiR3VR6LRV4TMB01BMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456852; x=1776061652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=P88ue9fnuHgB00X5B0RPMmwIuYsOVc7ukSsxg98cdhzc/7yoZ+nOybsB43lxRc1Lj1
         2BKB5e1xmBDICWeu0DMvF1gy5cJEODdSkF37t31a9q5lJpug715HRPJPMOD0DP6bHp5j
         9jeKuw6jFErTZ0zRDS5i8CjlS6vj2HKPFx1Emoskgu5GFdEYr+Yrz3ZnlyKW2HrDx2vK
         zsdiUhWxQV/4q/qgmKE9p63XkLDfp89i5lbl2EcBGHFfPg8SXQDnsZ7edYHkNcYOiXKe
         Fu0YHQmwk88H33OH8OKId1TnqqYuoqGdw9QqkQAOqhlOGF7/5mGstuHNOuUjON8mypOJ
         k3vw==
X-Gm-Message-State: AOJu0YwgLrc6sy0ReW8JOJDrLdfq3I+F7imddmxc57oDqwNN5G3vBEQm
	5GcdZ8xDIIwV6EWpjf4JX6r/6IJTuG2YkVuvacMYoZUohSfsC0ogaNGGr4kTsJYkpkKQxm0AqZO
	Z1obmdlw=
X-Gm-Gg: AeBDieuLXVv/4jQUNRfKPine/yMN/+23wIHi+wquwAXM3bfBB5Vw9NqJ51nE8hqZbhZ
	TXmmZrL45tzLjkFJNhwEJjD80B5G+xs9Tdu7zctQYAs34jlcEP9AHlDaG4eY50F7OhpZYQGpz4S
	INOdZIBmyQq3T66pcgR73tR3N9N5+BM3qkjyePyPE1HR0P22dC/D4V/r9fuCdGhom2zC1o7id3S
	RDP+mt1dKcK3JuRC+ACYpBzFKb6WNqkjhqRyFmIn/onuO9d4Ol7wF5qbGXyZzXi5m+wnvrQ8Upu
	EeNv4ijQnGCGMeHcbg/j/H8BnImooKP1JqsJVHXjxl7tk74RHT1pDDww4/OHCWadf6D47kIiPNY
	jceAnNdnym3lq5CTksLt3NVoOJY9CrVIcVat5ARZAfWrRwtr7/ai3iAl0FojFdQirB0quZOqrv8
	yyBVVJT0aHsa6+Fg7x8makZKLKf/wBt5q9UnqXWIPJa792hiLPf0VwJf2c53TGpXGPEAKoigNru
	sea8qHtv/k50yuUeSVAH7PDrhc=
X-Received: by 2002:a05:600c:1396:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-488997d1371mr171155985e9.17.1775456852448;
        Sun, 05 Apr 2026 23:27:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/18] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Mon,  6 Apr 2026 08:26:34 +0200
Message-ID: <b9d75be7bc2eaa88a280d52ee0fff322e56d52e2.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234651

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

