Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC18DD116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10266.1764310757975558698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfN89x+u;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29808a9a96aso16839125ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310757; x=1764915557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qMjBsQbXnPcuegu3zduO4RC/hNL/k87fJc6ZUnXhGY=;
        b=lfN89x+u1OARN7+OwL0ok8gTxodJu4j9PI4xx8FvNkJ9oCn9bvfAiGwQyld/h/yp29
         ybHSJUDcXB6J83P8TjQXW58ghJDrEJsPYjx0ndhF4KP4XzDJzpL1ZcWJ8WgPz1muVqA1
         MkKIjm1elOO4bFWLFxJPmTfgSBiLp00o2f142UpEwUHbIloCKFa9rszQ7ebytWp5ofrJ
         m49gmRHNLY6kEVjGW/LBK9UjIpdJpgICpGkpfQhFUovHCT6G24nRdoOSGwMOb1iwNqVW
         bMlXRBNp5TNKoFTTTdYd432nmRwySk9n0AsRrw6rspLbxa4+Xkau18sYTLv5YOuWdOCA
         C0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310757; x=1764915557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qMjBsQbXnPcuegu3zduO4RC/hNL/k87fJc6ZUnXhGY=;
        b=E7JOSqP3gPqsW9snm0PKeQI/Sm+DTcIa5QNw/HLwRCIpYiHuY568WAxn3j+zm9bO4v
         nM+qmNN01hdzrQBfa4W0+PvtOaQc52nsaJJ65KgWB5jdHwrzfUSSyCQM+auxwSrcXT4m
         wzcKt5TAif+fiGTzhKpJA5VrfS9HXr9L7TgZ1TYw5e2S4tPeWgW0YtFYKU45EkFB9S+W
         r7vBx/FZttdfYJ0l6FxyJ1yuYhSXV01jixRJclYCw5uLYUes5lGq4V6xEWuOOjIaL2mz
         7zB/hvENfbQ6KTP6hLKGpterkPTaPUHOGSLKrIBaZDchYO9nOZ5ImaBCti8MggsJ3X/v
         xyzQ==
X-Gm-Message-State: AOJu0YyH2drC6VBe5Ckzx1V0UKFh8M0yAx5rN7E8zrqzuQ8r/kOxaOPI
	4wEkj2ORblUGGoo6gVa6JO1t3ZA7EUZkBwEWnYzrv00wExvJLC6geaoO9ygvbw==
X-Gm-Gg: ASbGncvh+8w1r2iS+GJGRfXIlaGEi/PlQe6wLkTjGS6WPD1ZZCkSidWaEQw4ZVeDZHK
	1jNLe+xKUMN2Y85Ki4dyX3OwPVbykcY6rMNjVcTGg4cYac/6wXe8suhC+NhN3H2AVTZQJ1/mDx7
	4nS5QDFCE10X0F0OCPd8HXaSxmyhTpqXxzpcwgQxmYn1qqei5rvUyMnN3K6tP8KBVXBBLa9cY3x
	fJ7xwBG+TkHwIrFdQt/2N7qWOx0larL40//U9chcredrtE/BPycOx1PGuXzLGY+MHkY+xLF+llr
	AvAMboSYYD1d6fyX39UUcY5pFe1uCQ8iA3kmkvnIJXgjJczUxULIfYVLBHjWiB/b82T8qgG4eeX
	bLhK5HJmJtk4W23MiWZBMbmi8ub8LFJhSevrVYi7cGKZQTLnL0ZpVGjeEg6GTKbdM6qaipwz+oh
	dwKPW2M7oPfLhtcZYk90O3NYQW
X-Google-Smtp-Source: AGHT+IE5Uvi+/ygVFj1PjdPGxup7msPPnp69OvsDV2vJaDwOJpPNW+8XA7BSQ5fVRKNcjK0dwmuj6A==
X-Received: by 2002:a17:902:d548:b0:297:dad8:f25b with SMTP id d9443c01a7336-29b6bd571b2mr302093795ad.0.1764310757095;
        Thu, 27 Nov 2025 22:19:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 11/14] libxmlb: upgrade 0.3.23 -> 0.3.24
Date: Fri, 28 Nov 2025 19:18:48 +1300
Message-ID: <20251128061851.1634479-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226894

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.24

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
ptest result:

SUMMARY: total=1; passed=1; skipped=0; failed=0; user=0.2s; system=0.1s; maxrss=6776
DURATION: 1
END: /usr/lib64/libxmlb/ptest
2025-11-27T19:09
STOP: ptest-runner
TOTAL: 1 FAIL: 0
---
 .../libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
index 54df81c718..24eb62c98c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
+SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
 
 DEPENDS = "glib-2.0 xz zstd"
 

