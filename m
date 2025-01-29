Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AB0C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:09:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8152.1738138160376525212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUEHo+/7;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2992561f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138158; x=1738742958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUGdOP/x66zI6nZrSHK4+xIIlaJ5KKvwJgUVJZ2UK44=;
        b=gUEHo+/75iQa/hFOAN/OFob3dSD0dsUdUJt5wb5dfx3iIpS2qWCohvgsCag+g/wt0k
         jyHBXH75FlVChBcikqDqiHRAMdCN0zheNL1aQRMEEQWzU1Mg+J3l4gfvM08tE6b3Bh9a
         kFTw+eqCX6hyyNNgIJ73DWYKkZBf1prJNfvso0VwnpTze4oyhvQWKB9gwJPlzhWDSP2s
         F/3lKAmvu+jkhSGINLlmggaXEq/gNiCwcsmllYYNTL93+8g0hLsBt40j644IPspFkKr2
         m/sEsykxpcHbW+vv7fi9JNX61y5IjVaEO+K3OVqDc099jAvLzN1CSn1Yb0/YtzeJ6Eh9
         /JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138158; x=1738742958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUGdOP/x66zI6nZrSHK4+xIIlaJ5KKvwJgUVJZ2UK44=;
        b=PvFpKk1HBCfETaP2h9hw2IQNt61USHILmIFWSp2uhZjYiZF80kjpcboYZQUg+LAZSm
         g41o05vEHOuLF5eR3etO7qWpi8JWqPj05AL5QpVlZQjG6hJG0h843GS2nnN40OgkGgLu
         F5iLwGdhWYrE9mf3UiIxUmS2Tjnr8IsHofco5WyoO/RPKWFNQs3DajP0Q1uPGoqa5BRi
         TdPe4sbpT6TPKNyGM4b70lrIvuLHqZt2RI5nDDVXweJMaopmIibR6A39sOSpO6XYaZA8
         Ox7JIzH0C+4ocKpGjIxZ+ma8TeKliMxX+rtOfD02zuldfKLJfDw+SnOwNDre1Pc46eBO
         oJtw==
X-Gm-Message-State: AOJu0Yw1DxCotazegjlVVDjjORJhuX20EqL/haazp3k0CVEHUvyHWHrG
	JYm5f8keeX5Ti7s8K1HZvT6sz/iZJwBvyXGrz3pzPOEnRJs5RyQa/SWlnQ==
X-Gm-Gg: ASbGncvCGH9iQdNb0s/+rslJBQJH1sBzhtOGynlC8KqMeL2lLfQnctuTcF5o/FOvIzE
	WifWIeXzmIqmZ3FXUzTtH366TlhF6AaGA51t+MDdI1eVQPTjRibYQC0d5cb+t5rtnKd1ZFm42Pb
	cjfxkB6CTMsYel0w7WV56OWO6XUBIP2g7896mglcbRpCU+kS3XgYLQsFlXGPb0j3++x+o/6KBTE
	Xgf2nHs7qWZY9zK1erjNIeNWAnBuvGHipzBgt8Z6910pvqCqNhxDG/Jb1izPX/40s4iG7dUrZzv
	MeSJWFVZ9jeB8AXuLyIb29chD1JzPrCUdaKf6mHRYiH41Q==
X-Google-Smtp-Source: AGHT+IGZ4ik1mPQpuOps6awd3j4wDLONGD1JJLlHGQk+OMS8GjmoxHnTPRUn4UN7KJxpKPaNR0zSnA==
X-Received: by 2002:a05:6000:1567:b0:385:faad:bfb9 with SMTP id ffacd0b85a97d-38c5193202fmr1590809f8f.8.1738138158493;
        Wed, 29 Jan 2025 00:09:18 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188fd0sm16618394f8f.58.2025.01.29.00.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:09:18 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH 3/3] rpm: Automatically enable using rpm-sequoia for signed packages
Date: Wed, 29 Jan 2025 09:09:02 +0100
Message-ID: <20250129080902.1863054-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129080902.1863054-1-zboszor@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210348

When PACKAGE_CLASSES includes sign_rpm, add sequoia to
PACKAGECONFIG.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c..bf71d0d08a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -62,7 +62,7 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= "archive"
+PACKAGECONFIG ??= "archive ${@bb.utils.contains('PACKAGE_CLASSES', 'sign_rpm', 'sequoia', '', d)}"
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
-- 
2.48.1


