Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D662C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:51 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14311.1716552883171568707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a3XQDLKn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f44b5ba445so6366145ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552882; x=1717157682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OG1xLXf675T5Ty12UNyC+0pqPt883OH0JuFYbrSiwhk=;
        b=a3XQDLKnznLA0m4EWiA+dZsT0FaLLtdxlMZCYyIfY8Ju4cnmBjXexzCeZL7ZHGIO0f
         osmQ732TrhkwyXnfEDxWarlk+kOmAnAN8oJnktYlgo1pbVRlyQ+kirL8Pxg0GVdB+BOY
         m68I24TY3cVxXJCy4rDdaRycnm0+c0tKmqK3A5dmD78VkP3BXsB/P6om0BzEnvUyiECm
         lNc67weR5dP+yi5WWlo+SQWdg8A/plKKUr4grxe/53EQ/X1NIV0gwzPAJ2OIOlSCjFqI
         tcuAlbCoe2l1akTmrTFDHPLPS3h3zaGDeyoLzd9xEMi3nX90YPYjtEmnpdWKZ3mgLdk4
         BSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552882; x=1717157682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG1xLXf675T5Ty12UNyC+0pqPt883OH0JuFYbrSiwhk=;
        b=pgdLPvzusnds1d15fFIjbSB7dXDer2UN0nvfZaptFrb7y2DnFjjLN8gXxvlP1RoA3/
         1JeX89esmATrayI9TuKF5dkxSChnlZlwT0Lj3ZZxZ32pUmDOn3vhoAiEIBraZY8zS9Uv
         DALeCpgxJ5Gdg3OPCgfPHQzshPhPKVx/OtfQALSeUJ/o7KBnflUut7sXPYEmMM6Thr/2
         FGVD7vDeQPH21mLH8sKddGfw17hxLt8r8uJ6csMuhGKYdcn5TuyFx4dk2cQlKQXYQxTE
         4QMb+T3cgw/7y/QXi4DkwA13kYFqskd589n02Bbnj6OViFVKgcvFtPt3SKD5BCoGKeiG
         Ds0w==
X-Gm-Message-State: AOJu0Yz5KzFFEkw6M7k8r3OxpGYTrDnfHBbhVJL2+oOifX9QNedEnzE/
	4+bh8ccgnTmK1Px21wIkf4QIcjroY+uOwFzqlcagjBWL2e7mLOvwLwa8oAJtIl8FwTFlnQtgAJN
	A
X-Google-Smtp-Source: AGHT+IHvuXnqXEqEOvSH7ZLHx4JKhg+Q/hnt2FP/LQTJp+7rG/FoUr8KF+NaFpvwzjLeg30vehVwAw==
X-Received: by 2002:a17:903:228e:b0:1e4:6519:816d with SMTP id d9443c01a7336-1f4497df620mr20038635ad.48.1716552882439;
        Fri, 24 May 2024 05:14:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] classes: go-mod: do not pack go mod cache
Date: Fri, 24 May 2024 05:14:22 -0700
Message-Id: <c850931590ff22da4d38756f957b88e04078c76c.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199848

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Clean go module cache from builddir to prevent it of beeing packed.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 328bea56dec8f83b5c118f567e122510f9243087)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go-mod.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
index 674d2434e0..1ad782a304 100644
--- a/meta/classes/go-mod.bbclass
+++ b/meta/classes/go-mod.bbclass
@@ -18,3 +18,7 @@ inherit go
 
 GO_WORKDIR ?= "${GO_IMPORT}"
 do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
+
+export GOMODCACHE = "${B}/.mod"
+
+do_compile[cleandirs] += "${B}/.mod"
-- 
2.34.1


