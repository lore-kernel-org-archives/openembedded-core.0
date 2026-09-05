Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1447CC79FA3
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2583.1788641117770358734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yRBoH5nB;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482ea739de2so1437623f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641116; x=1789245916; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLlvdmO5VyM64NwnGuTqUAnCT6np2mhc69Ct63Xr7gQ=;
        b=yRBoH5nB7zZuI8gfW7rBUbW0PqPhg0NwKC9Qaf/bGI+kqtmq2+3wyho1vKlsdDVy0b
         oBqT4HuqkUxp0p5yT7wf5D/3RNNK4e5GOzjqrw+quoUB68bTcm0M8P6PkvaZ5sTVDG/W
         LOaTVUntal4aXhoqZfx0DiF5KV1rSBdZGWAZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641116; x=1789245916;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLlvdmO5VyM64NwnGuTqUAnCT6np2mhc69Ct63Xr7gQ=;
        b=iD/DRRbIGafClX3XJojDA03AOQCK62o+RIpqtWGPi6JY0vRuVW0BO1kT5FomCmDpuD
         lMNd4AE9OiwMCw97RffL56UMCGfK339W8n5syzCs65rlhrCa7uotSEK4LTKcnCPZSN0L
         HB2nHKGmonmpFp5BT5usg2QrOYjzvhPFATgzShAs4J7tfvMtqHITs/KZgNUKGddOdLSV
         hHVd8Y32iha7KYHDVBDLI+tfVY3Nu6a+KKV02UFaQxL4iJXxe7M6/uAGqhnze04RmwWu
         DzGx8AuY2EZfZcCiQAuaiH9UFPaTDakVYl4wVHukGHGa6Bh+/15HMXO0rGUKn7xBQbA+
         dB1Q==
X-Gm-Message-State: AFuF++m5bgPcfyUYRJYXr0VGBYQzbDdSYgplrRzT8d4K/gP9D/Q67U//
	0yD+i6ypkDvJS+oYV3sPKV3J7M1ysUQC7Ts/RQLC6dyloBa08MupUgcktQ8klfYEKG+b6R5CC8d
	lJBfQSBg=
X-Gm-Gg: AYBFou1MeQgF/joWzCcw4EEKKHEH6bdiVi4ebFis2eh0udoRUwmVyKsVp5aHUJ23DzI
	Peqrcc9SjpY3k3qGo1rraU7P73Sj3rkZ8+1GAbjCkQviJS0K8oZHJM300cyG9AAC7WM0iZyLIsc
	WSVjBZQRin5f3+iLYrP86dqv/md7TeBbYROifnHSCIhjRdbEgneUKbQvyg3XA24KgNn/GyrY/wm
	w3NbMEFE4O44XrdzcubNf8OWkh21m2z97OGnW6rAu6Kq9FMQYHZVPVpT7l/9CBtkBnSAuIzlZhO
	dQ5V7a2bUcL5Jc3PindUufmX9p8beKMP2H4/WX5qEe6UwVXyv9EkPJAtIL/inAc/89/gFULWv6D
	TUVtIIG5167ZsxelFe+O8jn6qCaMtAIqm2MWUQEVZGrkYxAYOKFkndV2lwcpBDJtAPxBOIaHpue
	vy8naXjqqfJhqcBMh7BP+31YX0JyG/T4SMC2sN6CQshpRDNiTMsmQT3IxN4LJ0CsRz4pDqyYcTA
	GGo5U4SCpsm/Q+V2Xmk0OiTisYP4KKW+zgOCMa0lZtnEjnAMDyIR1uo4002pVW/JYDp1nGmQitk
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr103498065e9.18.1788641116025;
        Sat, 05 Sep 2026 13:45:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/40] python3-wheel: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:11 +0200
Message-ID: <f070ad1f1b73eefbe3973aea4de1a4b074de2c07.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245162

From: Tim Orling <tim.orling@konsulko.com>

The proper CVE_PRODUCT is "wheel_project:wheel".

BEFORE: python:wheel -> 0 CVEs
AFTER: wheel_project:wheel -> 2 CVEs

* Already patched at 0.46.3.
  - CVE-2022-40898 — DoS in wheel CLI via malicious input. Affects <0.38.1.
  - CVE-2026-24049 — malicious wheel file can modify permissions of arbitrary
    files. Affects 0.40.0–<0.46.2.

Note: The original commit targeted python3-wheel_0.47.0.bb. This is
adjusted for Wrynose, where the recipe version is 0.46.3.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe55278e01bbe434452191109278b436bf008ebc)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-wheel_0.46.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
index 2545e5496e9..7338e8edcd8 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a8308351
 
 inherit python_flit_core pypi ptest-python-pytest
 
+CVE_PRODUCT = "wheel_project:wheel"
+
 RDEPENDS:${PN} += "python3-packaging"
 
 # One test is skipped but requires the "full" python3-flit, not just python3-flit-core

