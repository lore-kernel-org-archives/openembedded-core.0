Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4C7CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:00:40 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.96603.1755075636805022248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KczbhN2J;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11918530a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755075635; x=1755680435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZadanoukZ2u0mBPEtK/+i51yFYKmhcJb0kUAEDm8QE=;
        b=KczbhN2JFh02amvV3OWqTJAjhR2pPAz4PH8lj9Xb2Y3Rbxd82jbU/dNqKW8K8jhMk4
         v78EQTDHtFvO4zz85V9Lv2Ft7Ca3FEClfU4mQh+tE5E4umfFu4N8g417ZI+ZJi0+ppji
         RXUVUn6IiItsd/EOheGDOoNoJdUs+3aeFis/Nr0xukg96q5RD1ZCPR9UefMf7dwsoxMD
         xH7FRWcKSojKQtSqhyEOhSps8t/iLHTNQRYbtoiDTvSTFm5jBcgsLadevvtJMWsrR40z
         yEq6pIsqWZgPib4VpdcpXtqbk/pSwxf9ZAVt7v2Z8APAKSx7AzPvMM21y7/TusUCvRRL
         j9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075635; x=1755680435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZadanoukZ2u0mBPEtK/+i51yFYKmhcJb0kUAEDm8QE=;
        b=bRp1dm7Q+msraylzwym2Q50g8dZ85gKEOhrg9A2ESutTw72StUOauoibuvBNyjJwUO
         hdAmKAyQlUo/za8j7zK+DbBfyY386gSgonWAwR00C5mirKEVRcQgrBtwBLf/7hwu4HnK
         ugdlPedAYwiVdWeTL/HD2ka4Fj3JM0qMq3aXMjurwnxjuUidIFQ8LLp84xO25ecjSHyB
         tu0M1fCeWBa7eXlt5EJiUPpMNAj5bFTU69Zmmamf8EMRf1r2KEcOUz9UM+fDL9pIG+lA
         GU6IfopV+A/JFFd+TQNYLd3cXUvdeTjEfXmLZEfJso14mGi6NFM2q0X16QoFKMvCfq1I
         pPqA==
X-Gm-Message-State: AOJu0YxY4mpCa9yKv+DBQacNVazm2uwtdV89eC5HumsJQIbiG11Tpwgl
	fPHoiTE1OQbN1Ft0vOc4XYFqIvXKvJhbxthT4JfFiGBo7L/KY0bXVKeD05IvGA==
X-Gm-Gg: ASbGncuxbB7VEichxSHTJBWBJztMTr8AEXJHIi27k0I63B13kCpSwOmKhyDQYsRUTep
	Fg+w34TdlE1DN1bQgL8joM8MIiWzmaXdo7+skeW1pvqQUWqMfV47hI5IDcb4fgVLe6hfIOapJSS
	Ei7mWGdnVy2e+Pvak3bB7LK/TNGunJHJKwwlB9mLDyrE0RWrFIyf4Y/ecOmqQI8Rqtr1zdejMNO
	Q43Vf97gMAOgdwxGzGwE0JjLHUWWUyRYWNB8vpiKK8P+xi1sG1f+ZPqYiSOpGKeT/sx6pqCd7Xw
	u8BrRKWLE2GNJTq09iKZ67hqcF/vT9DJ02CjDfgScdSxIKCBKCuHNVV1S5Mkun9UCm4BWS9fV70
	gB/i0hajJsj/Q1sn3m2q4l/T7FymsMQ==
X-Google-Smtp-Source: AGHT+IEiGF0L1TSs8irvW2Eb29wpz8cFWMrMl1NZ8haI+T4PXEON2wootZB3SLI+Cj+lqo+2A+nlYg==
X-Received: by 2002:a05:6402:1d4c:b0:615:4106:9c10 with SMTP id 4fb4d7f45d1cf-6186c00c619mr1898975a12.17.1755075634826;
        Wed, 13 Aug 2025 02:00:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6181ad55ebasm6363797a12.55.2025.08.13.02.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:00:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ell: upgrade 0.78 -> 0.79
Date: Wed, 13 Aug 2025 11:00:33 +0200
Message-ID: <20250813090033.239717-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221793

Changelog:
Fix issue with D-Bus client and watch removal handling.
Fix issue with D-Bus client and service name handling.
Fix issue with D-Bus proxy and filter rule handling.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-core/ell/{ell_0.78.bb => ell_0.79.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.78.bb => ell_0.79.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.78.bb b/meta/recipes-core/ell/ell_0.79.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.78.bb
rename to meta/recipes-core/ell/ell_0.79.bb
index ad16426bad..8bd0f8badd 100644
--- a/meta/recipes-core/ell/ell_0.78.bb
+++ b/meta/recipes-core/ell/ell_0.79.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28ee1a586b4891c96e68667a424684e64ad35120f345e89d6705bd4023d2d40a"
+SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"

