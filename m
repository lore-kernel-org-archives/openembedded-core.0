Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E3D5B172
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:13 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45213.1765793106255887310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=rFhWsD3U;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64981647564so479753a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765793105; x=1766397905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=rFhWsD3UVmS09MnBqfkyjsFqCOwL/6JJeNeyEqfskm0D0BBbB/ByRGBDfj1Cym2iDf
         CnaArCr6o6M1yuhX/5obyL8Ey3e5mNxGg1R3ubmVCOwWA9yaXAOrfFeKM79HO2/ukpu8
         D9sGw51OtQPzMJWF5y89WDVCZdUTxTcWnCZk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793105; x=1766397905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=HEOGlg+xOEn7nmdl9B6tnmxm3IOEVpTgLm4QW4ejYrT6Y2+X4ZgdkhGjfZ45AZb0nQ
         0OSWAqna9KvZoNzitM/Qnot2vpPxTH+SQtWu4XuS83VaL3/zwypLnjNUAjyrErq4k0UV
         aqzRKHUhoO9coWtZ/jVudTXF5q91TpWhosh8K0QpYms2nihkVpFx3bYuqSDGXPvgMzkA
         Bx0axNb4r8dwqNiOTrwIL4uf0fJX5rNPRi3hiMEgx/hKGWmQv/YL1KrY0O1KJQkflvie
         6rz0/TwAqWZxi33G4lgUylIRbqxnjOnnjQYWcyf+O/blqu1fXM50840DHGoSGjRB7Y3P
         aOaA==
X-Gm-Message-State: AOJu0YwhRawKW8q/mGF18g3iMvLAfIgQXL9lJqXOzwTThfftirkn9IcD
	F721jCQ4ZTp3tvNJrnMvlIQRkXxk516QrWC/x+QO4jcnOcbCstEi5ccQGxhKWUctmwn5j4voCZV
	A2KDc
X-Gm-Gg: AY/fxX4N3Bgvu0OBeYYFGjwJXhn61rAbBu1US+qFr8lxtQRXH25UFOzOBjxkZzkIGOO
	oMzv2dHNhfPsA0/A1+pg2A6rBid+UWGmn0fmDhcxhEVzChzmTct/1nRvjImUHmsMwRKDEWnm0Rv
	wSKpJ1TkskGyQnTShZhXuQDs7kM1HdsBWJh6tNsZ54oswA888DmiBuw26Hf+54iAocBY41mocBZ
	WTobJ1KTTHxOQUJdz1u+butJBpxQ/ri2zfaERQav6lEMgwCrcyS8ZKGZfhqnJSHzeoXxZNHyqWn
	fdf+q1XOfc3fYzdemdUGVJR61B78kJHKlH0OUtzRJlIDpLhezpZM9oeyYS43KnU7x2Qz3MzPz42
	MnPBrCfFIwXEh6mkZgF4Vb1BHYpYUqUCoCIP3cRTjcqZAXkwm/IB9VyWPY07RgUm1aRG/0KvsB/
	PbcUNpm9snehT9Q2oI7UjB0zYsuCQ99sD+dUZhHrmak6ZqooSCUxvDC2gUuWVZF5KdE7OEQnmKA
	ca2ZfwjN7vrIPviRV1Qjo3EpmyZw5k3+jFUkdMoUnM5ALPxHIyIwZGLUw==
X-Google-Smtp-Source: AGHT+IEGJ/NIECIDv4wyFse7vM/j/6FVgpWt84GMcOGPOh/X6ntpedCJ5ib3ea9d02K0LW8adRIJ9g==
X-Received: by 2002:a17:907:d27:b0:b72:5d4a:45d4 with SMTP id a640c23a62f3a-b7d237b540bmr656451466b.3.1765793104569;
        Mon, 15 Dec 2025 02:05:04 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1336898366b.53.2025.12.15.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:05:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 4/6] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon, 15 Dec 2025 11:04:58 +0100
Message-ID: <20251215100500.1626964-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
References: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227709

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..52bbc1c4a3 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.52.0


