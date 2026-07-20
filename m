Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64798C44530
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2907.1784568230819479758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HB9S5xqk;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495635a85d2so6239195e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568229; x=1785173029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tu59LJJqXCreVJTXXGArLpUOZx3/D3UKy3zhMFY9Rh8=;
        b=HB9S5xqkXvM9ldfeVK0k3D+g84QrCjtYA2lQp5qAXyodwfehzZUtTrsRuKIBoJqLCK
         1sTr1YgY+VRPX6VIPbPXRlwPgbGjWMFTUC7K7LqN7FdKM3jRZAAO3WQb8GYNamYzq9jO
         VlCNR07WaUmB6ApCVdCAT+qEm99fu+DP/OP+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568229; x=1785173029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tu59LJJqXCreVJTXXGArLpUOZx3/D3UKy3zhMFY9Rh8=;
        b=RpBiGQJsgFqAG5mw4Bjspr0jhZpYGxPyqhyrc4IcpYTAbOAkCdq6Net2IMJggCx+zV
         /WrrLX1ePwMASK6EDhGDDbEWStJH+rnr1QaR3mVJgdeLVffY5NGOAJZ5uW+oCw7x8Ynw
         rzUhfDP+rKtwSUVUeko4UzFH98N0fSKzn/8m1e0hFaVKm2P/ZMFEON+jMYpc/MqYEZ3x
         1PxMGWwj/02ysPFOSz7W52Vh/Ho9+udUmvq+F/hxjuNg437Vvxju4YFaFknKClLh5apm
         9fv/p7SeDuvobxrvvv9JQJ8kByrR8tLwkNcnsE9MKBfcCIp9Gss0AsfEH5zq9Qz2J6Ns
         XKuw==
X-Gm-Message-State: AOJu0YyQsUn+kNCnUnnFIG9DYip2pIg3T+AYAJDH/+Py/6FxLXszs/IO
	s0HldPPbZ9bD3WYw2F5kFBGcBbDkfdnu1SQcq5+JH/DN6YFGzPTP+WsuJDN/ye4QWtrl0Ljd4gq
	NhoCu5pI=
X-Gm-Gg: AfdE7cntRw8fUI+Rujm9q2E9iRuskqXVTy3jZs9Pg2A9GMF8aDuIf8YB8WdBvJbDn4O
	AAclxlEXXsJN7SehEHlVQuqrYNvm46skc4NU8jpxFsYgqU4dSJUKjCtAW07VQ6jxx4EBbXgfkBR
	xK7Ra2GykFAHWLxxeWg7J5AMNv2K4VaMwoX3r74hKZzDQkSQnH/SFafeSMj633KtJpyEOnvE5i2
	zZAZcmiassK/A8nExyvqi2WZBLWXNQ3oX1C7+geT7bWPVa2LYLmMgMwyeHDC2rX2miTWaIkUT1N
	/rJkiOM1NhmbYHljKhDVUaHv0ePY49PdHNaf7RSR/vBAbJjoFzfGYDT6E9cmIOhJ7d0m9WyIoyA
	ILEFPx4+9/oHnl4xmJeM+SC607Ckoe27CSAKy8Okzu36YYMbWw8D5jjE5CUFITTZRgpr8a3L0nE
	I/G9fOxcQ4pRMytdwS9E7IIyXcNDjfwOoAyQQ8YJ41xr/mIgC10DEhubSroMMVJbQPimCKIFxYk
	IHcXw8l
X-Received: by 2002:a05:600c:4e88:b0:495:636b:e519 with SMTP id 5b1f17b1804b1-495636bea4dmr30733625e9.21.1784568229051;
        Mon, 20 Jul 2026 10:23:49 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/33] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Mon, 20 Jul 2026 19:23:02 +0200
Message-ID: <ce7c2eeecedd502c306483bdbfa54c92710ba53c.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241463

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97a940bfdeaa3f9f4442a6fbb0fabe1ce5eaff69)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: Changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/log/?qt=range&q=master-2026-02-04..master-2026-03-18
"wireless-regdb: Replace M2Crypto with cryptography package" only
impacts signing code that maintainers run.
]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c8160434..a70e9dd0dae 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

