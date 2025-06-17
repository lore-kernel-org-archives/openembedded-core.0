Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C65CC7115E
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.23251.1750176289111911354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JmCG/Hqj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23508d30142so69259005ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176288; x=1750781088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK9t2gfLlqtEsFz4ZlZ32FwN4NC+Ud1CefWjT077nKs=;
        b=JmCG/HqjjrXKonBJqXtZP6mqouFrd7yU1buf+Uzo14eiThBHOiPwIuFoMy5YP10ffx
         78snP1sfACIp7gE0gKTiJ7bZYfHPzFdIYmMa9OM4/CaI8gBM5pGJNW6RC2a6t09f7nCZ
         mBFnajKGAqoQB+6hP1Ro40bcxF67NwES6or8fJwu6SycSBq4sx4EyNkRhj2ZJZGzw4kh
         uUAOcCQshduNtW0D6LWR9pAoZk/Pv9d3LB+PdbJ/2yDn9ejRwvkGw1I2j8zD14dJzQ6I
         przIeNH58wMxOnD3f/t18Q4HHAgILnENX8zT79Dr8Cn60fVSvd8ddJtiuhoAidZhK+eW
         mzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176288; x=1750781088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK9t2gfLlqtEsFz4ZlZ32FwN4NC+Ud1CefWjT077nKs=;
        b=Jpra4CClGRqQDWsl1yDY8Wn+7cJcViaYucA4Lr700cGprfPVpBsD3grfE10kZjAaju
         hry2Y5z2N1hO5tsK7Ef6oORLxysMzadyiR0UszFY2kPCCiqI5EKv3ceKk6XlSnK1Xhk2
         2Gu1jwI6iNVA0AOQPmEI3QCedqu9qQqkfXRCc657du6ZaoLM6RZK/4WqvKgUKaVjyrdf
         zzLPAtka8DhqlBMCAVyl13iISSrs6+kuVxROhrL+cgsCMVF6fEmBpNxpAY2IBD16MVpb
         whV9ORmdCgsJWE9fbhKFRt46lvjHCAeLnX4tb1SzHP/NDiFPwRk2YHlRO2cDnBfSER5Z
         tymg==
X-Gm-Message-State: AOJu0YwpQURsjQoZfiZUQB3xl/Fhnq1aKsOiutpdvucnKrnEUY9euT75
	wVThQgjFJ0y6WJARX00wBHQOgBJap+UZWOaZTWI5lZ68zFsYwrY8CeKb/0SO1LCCRD0vhi0N+UF
	OR0KT
X-Gm-Gg: ASbGncviY9ij+Q6DNweD1Uh5kDnb3FtXCDjXRjTT68IZGsVzIBi0ntEjFJgeNIqWYfV
	QJrF/1IrR4d1To5JZUiC01ccP3dvTosNl7a3ljjzbfHxzeTdXvGxwSCtHnSI/c4oLK4mmPkGRdB
	3rM/XY37/x5m5uvvXsghm7yRMmSSCMIGQU+q8Ze6iWOeX6eF1uw5apRjJHIGXVXyTB0Zi1cu8/Z
	nxfgxOZEUKUPWKfWBCbEHStYhu0sqmyVZgwueJ83ManqUlc1PfMHxfVp1Qrc3GQT/TokHWVkm5j
	dxmmQTpRv2pjLzyZvkEaU9pGGrQgE+A8FRoOQb6mA3Thp5zkToAlvQ==
X-Google-Smtp-Source: AGHT+IHFoSTzxqHydzz/pfIlL8KiZLCA76X/BlqF5Wtal5DKpGOarGa3xtqNlp0JAmuKOfuMKIfHYg==
X-Received: by 2002:a17:902:c946:b0:234:d292:be95 with SMTP id d9443c01a7336-2366b149f20mr184328915ad.42.1750176288349;
        Tue, 17 Jun 2025 09:04:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to systemd_255.21
Date: Tue, 17 Jun 2025 09:04:26 -0700
Message-ID: <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218909

From: Savvas Etairidis <setairidis@gmail.com>

The recipe was accidentally renamed with a 'v'
prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.

Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_v255.21.bb
rename to meta/recipes-core/systemd/systemd_255.21.bb
-- 
2.43.0


