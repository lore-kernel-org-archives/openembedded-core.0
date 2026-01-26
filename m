Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E105CD13C31
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:23:57 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22083.1769441036654951919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhuCY+BO;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c6c922850cso481070485a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441036; x=1770045836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsVH4CnR5i3mYFD81YJGjZK/gL2KgzrkFB+4t5K0ilM=;
        b=IhuCY+BOJ85VwNExf+I5spNjx8JFWo8NZBUjuFeUBSvl/a0vz5fhA/F46CK7eOC+s7
         osku2/UbyBwsJMrxLGbUwH6FgcU5H/W5mVlspYbbnMtmvurcc2BUFRDWwYY06gUvBW2H
         wy2bKLQZy/8jqgiqKp8EC360scXB2ufl6VtkhxEI1V8a+2qPmUnIp6BhJY9TaMmeR6rr
         AId6QwCsFFFAmMyytWhvFeR547khF4fyO7zYBaP3QZpA34O+NFocoevIS7yACET17oGm
         lf7iID5eLBnO+WO2t5DpqTMIlIslWH5DVfgYUIJZocyjV62vst0h2vEqe3yPWiKZjyeK
         WYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441036; x=1770045836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsVH4CnR5i3mYFD81YJGjZK/gL2KgzrkFB+4t5K0ilM=;
        b=IwnUf4OD50EJymP/BSEmE5t+synSNIJr7SD7X0neFT5WjLXhFNYRvyiWFzkP+62T8g
         YoWOTgfOhmnpILCZnUugzO/mRRybwI8zip4jlE0YJ48KR9bULvuTtWQreEnNXjKmaN9h
         t220BJBomy6hmKRhQ5dtlXpuM0Iuo8J+988fjPZLIt2Ekn6EF6s/9gIIMalDIf6SJ9rV
         kIEb1NfQ23n5obpUXidzpeC/kwjdrDeAVytQDVuZdm3ebtVnj8HJUYtCq0RXAblUwgrP
         h9Tc27VAR0at0eCu4we9XuLtCtpiijm97WcAdRrTlWVDRjYp6tE0dycBLb9T7aIbpraR
         2hpw==
X-Gm-Message-State: AOJu0YxPjfBjPonJOyGcuLqnuRuPW+0wEkxJax1mPwppq1nkyuEOtpPI
	kYTKTv+e/LeavBOQXAv3geZSzucxPwh+0vtKslfnKSr1W2U0vPJE6R61p18Qiw+YF4E=
X-Gm-Gg: AZuq6aIlS3/rQ4wkVLlSVtVlFhMyEu/hTG9es2xroeiEmldJR8SNheopS5Db9bm2o2d
	ZDeoH5KNbISy4xuGZALB9Jo9QXNLu6BK6DJdiq9aULQgo46gROaI3VqQpLiGTJ63hfEEEUPxa83
	XdC0cuID4TWhb0LamJMupGU9O0Dj0MT6DNm1TD3SBUbx+uNQQOZf4R1VuA1raltkzFQo+1K1SKo
	yhXnVV+0umDTa6X9RgUwb1CEko1c8xC1ToReg/o2+u4w79JYuati11MldgqZkVjRey/aCwxjLjt
	zQTKlxOq8WhU24W4KKeHwy/MnoYJvQtb355LHz6opgspIznpMXX3xjw5R/VGnZIxnSoCrP/QFrp
	2kjsm0VO6re1mNgeR2qT6xPQBhX6bxiGpVjLvR6TJI9/wtymrwI9NmjTAJrXI3txbm4y7x2ptp4
	PyRXutTBwVwLVUdq6gfuUgBesAI1u0qhGqAsF/2mWP1YgekpkT6dTQPwhX/z9oV5z6lC1hHyqMM
	WveTn7eYji5DK8=
X-Received: by 2002:a05:620a:294f:b0:8b2:f29e:3b00 with SMTP id af79cd13be357-8c6f96155bbmr546383385a.51.1769441035470;
        Mon, 26 Jan 2026 07:23:55 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:23:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: -stable and -dev updates
Date: Mon, 26 Jan 2026 10:23:46 -0500
Message-ID: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230011

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of 6.18/6.12 stable updates, as well as a
bump of the -dev kernel to 6.19.

We are getting closer, but not quite ready to remove 6.12 from
master.

Bruce


OE-core (7):
  linux-yocto/6.12: update to v6.12.65
  linux-yocto/6.12: update CVE exclusions (6.12.65)
  linux-yocto/6.12: update to v6.12.66
  linux-yocto/6.12: update CVE exclusions (6.12.66)
  linux-yocto/6.18: update to v6.18.6
  linux-yocto/6.18: update CVE exclusions (6.18.6)
  linux-yocto-dev: update to 6.19

 OE-core:
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 294 ++++++++++++++++++++-
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 286 +++++++++++++++++++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |  28 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 +-
 9 files changed, 610 insertions(+), 50 deletions(-)

-- 
2.43.0

