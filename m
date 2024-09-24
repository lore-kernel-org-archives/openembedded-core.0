Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1808CF9C5B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 00:21:29 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2541.1727137288280739648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 17:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OslXPQI7;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so3206132a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 17:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727137287; x=1727742087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr83YZ72JT+dOOJcBIuouz73dTCD9y6EvQm7xZbkQEQ=;
        b=OslXPQI7QuzjecER8+LcZ7XRFFEjRUwnIw8gnPWYDGzq7duvzphQQ4lN9DezvGPM+9
         UXQMNuFuLxlT3FLco6ojPUIYW4+/xyBMuI4ikuIob6m67xtZ5Ojt2kkNqyejLXptLtX3
         7UEFYWN5YB118zlSh2dwTgLW21AK+biUNgEEXKdTzgMwMW4XC5EtUyQ+QKWmjNM7VKT6
         rGOW9DuupzLiAKv9FyzMOyRhGPl9zymHgv5HY5tAs/WuilXInuPej7/BjDWdtdZ5aorP
         vDuQdyikQ2JKqYXILuYl9/1E97NIRmBUrk3jIQ4VROzFfEXzdFo1iu/cppdIzMEqCBe/
         mwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727137287; x=1727742087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lr83YZ72JT+dOOJcBIuouz73dTCD9y6EvQm7xZbkQEQ=;
        b=guKK506mX+zuuw7zh5AdgSBdYaI4UM17n7NKpswZL7ABFLtErhx0Ks5YATRo9AOizI
         QUagZczai0YJgzNo7hOA6zN0tpamShAtGfeM6XMJwobndGuGZVTVCx+sHssjkKDTmJDT
         +D1zLlUIKdppqR2s2Ez1iSdCJB1gNoHD4+BG+sqAleuHmOXQ6okrUJUVaK7xsq9fWKm6
         f7MHm/u7G7SlXyhYaoKJiKbPlPryS9rXz4FVoZvjlb2Ljbr7MP9zVMBuLLTVlEVbQLmD
         O5PRXBb0tZ1awbJiUaXm7iMs4/Km39e/9SCIZXSkJFY1ixQB5HhrP/L4t+OATERX59BN
         b1mQ==
X-Gm-Message-State: AOJu0YzH4N9oQpaUrrli4CRY0eP/VFMqkGtxdgao0Szt4LSossUGoAOA
	Pm04wI7wvzTWA9db9YVq9B69JB9bOu8iBg7LZt1RqZ+f41HeLpY55rl4NlBM
X-Google-Smtp-Source: AGHT+IHH3/5d82E+qmJqzFJjb66VBMz30zsPPgRMwC/82rnTZyBxzgPNJnIUJOK5oGSAbau4AoSmkw==
X-Received: by 2002:a17:90b:4f4e:b0:2cd:1e60:9c31 with SMTP id 98e67ed59e1d1-2dd80dd5c4amr17002281a91.30.1727137287392;
        Mon, 23 Sep 2024 17:21:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::47f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ee983b4sm10042893a91.14.2024.09.23.17.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 17:21:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] systemd-boot: Enable on all arches except x32
Date: Mon, 23 Sep 2024 17:21:24 -0700
Message-ID: <20240924002124.93673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 00:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204829

Add other architectures as and when found not working

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot_256.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
index 9a6d8e9d6e3..71c7041f8bf 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.5.bb
@@ -49,7 +49,6 @@ RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
-COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
 do_install() {

