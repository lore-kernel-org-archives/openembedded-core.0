Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81105D59F7E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 08:24:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2106.1765614277785583935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 00:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vic50Dpj;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1475938a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 00:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765614277; x=1766219077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZCEa9aaR15V/P5ZJ5glsm9Y1Dcj7DyxdW/wdifL1PM=;
        b=Vic50DpjUzl9lq7TrTVAH4Y3zKEWS6KfJxxHRZsfcFdAoCb3apKvS4S3CtoufkAU34
         DllqN9WtB2ZqDsPNrh33Xwn7Ei0HBcgAJCXLQIhdfEtq68p2fltXfmfw6CLCl+YDahHG
         5BDDPW5idNWW8do58yoKdxL/tftQGPizwyDlY2sxnM/4BUHWKWNlDEeY5Ia8BVe4mgcG
         WII0Vl7CZgvTbgfn4csj3vHh/7vz5hwooCQ2wzjJkPmxGjLDfyGc9+zsOefV5uIQVQrH
         o2wJ75gZP7X4bi+uo3woGUoyh0tKTkAaScR7bwlB48Csvo8o4y/nhZVZE38EeOU9Meeh
         h6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765614277; x=1766219077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZCEa9aaR15V/P5ZJ5glsm9Y1Dcj7DyxdW/wdifL1PM=;
        b=LzLOoGS9vAQEC6PB0l4pjspfKAK0YUabEus4LjAfyIJ9nmLm18m3iWvaxqedmwoqme
         hQjhKypU2atwocY753YyJfQg1nBLPyvIlu2iYk24S89XpzdMledGrCVYNIyXQAp0ZzPl
         Ax7VKt0w65cqOlKr8sgYX918mokATakSHZJyqmx86+rS5z1FDav6XkAyC61JsBAU+UI9
         QxWN+IvMJE6Gpn4X5DcVzi+zifT1X6UDAknxGqTF7EUnLW+8dxlFKHfIY1BGRHeY7LpL
         Q+QOmONDKRc4z+EhZ633SqdX5nBsNDLKUFYEYrSt5gVoC5ySb5vCVaztf4foWRmms4BU
         SgXA==
X-Gm-Message-State: AOJu0YxmsQlwchyytO8SlpHKXiW3fNtrB5QdnzVvgnh8f7fO0k/TDEzk
	7jlrvI7GGGmIgbNsUp2ngvd/aQAkGImt6V7fqId642TbNdBqT2y3nEAW+zH5Ezl3
X-Gm-Gg: AY/fxX5bzgpaeLU6ImJyt/5WohTbI/HHQRtGnyZOOMfp30fOLDNImDhn1v/RYMnK2zs
	/WUlz6B2VhIheL6ECA5ewOI+cSr0d27OW/m6QTW7FnPwvrJ+RxwndPzpq7ZbLIF3m39OQzmzupO
	9dX2RoqkcMRO72mx9gyb3uzhhE7g+c3cWs0qF8PgSwDWNwFVTKD7yZwKfg7GNxtLXk3YXHS/wXK
	+c5IFTw2O6oiF0yuoVGv8VCjjA5zV9O0rFOlNp3raMDollDdy77ydZVRt9f3YMtYqaRA6m62Bsc
	Ehrn3afkkw4wJ8InSOOHv4OcTQ1B0rGpS4qYqmpkJhhG17qjM7zT7qTWCMIkDlnw3j8ag1etXMA
	h1y/XTQWs/fm0563wDntkW772PpRlH7SdfiG0gWx34TdqlTdGrMKvhgqtiwGMWwv4bSOYv+JfxU
	T+zkYRtb8H4XQYOK9Ws5+mLPFmBlSSFoHI3EQhDJr8BeOJ2iZdyIS+jgyr/tmAmGMgXWCz40SFs
	a/DHQmk5eWxwlfDRmxx9zSgzSDeO63Q
X-Google-Smtp-Source: AGHT+IFXosVNZxn/mvHSlVx55IV4n/mIvbXJReEvPo4M27yciF/2LkHRd2tT2k8fMXrMRvDF2SyujQ==
X-Received: by 2002:a05:7300:d409:b0:2a4:3593:c7d1 with SMTP id 5a478bee46e88-2ac2f8b1e69mr2626907eec.17.1765614276615;
        Sat, 13 Dec 2025 00:24:36 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm24566161c88.15.2025.12.13.00.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 00:24:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ptest-packagelists: Include libseccomp only when seccomp distro feature is enabled
Date: Sat, 13 Dec 2025 00:24:33 -0800
Message-ID: <20251213082433.930428-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 08:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227616

This package does not get included without this distro features so there
is no need to synthesize ptest image for libseccomp without it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index eb1c2a440d..5cde60fb52 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -116,7 +116,7 @@ PTESTS_SLOW = "\
     libgcrypt \
     libmodule-build-perl \
     libpng \
-    libseccomp \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)} \
     lttng-tools \
     lz4 \
     openssh \

