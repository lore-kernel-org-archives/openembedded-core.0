Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1EFCCF9E2
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:08:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1763.1761109697352321170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjecCfj1;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so5993172a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 22:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761109696; x=1761714496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc1NpalSCfR47k2dqxa6IEAwNjtla9WFT4t6eqEOmRg=;
        b=jjecCfj1jrvb4MEBcsYiC4Vl2tdF+EMOxFdfxB47J5KJLsH/oUuYXOtjK0P4BpQgYg
         eeLRTo1NcY1J1HSt0jXfDH87z7DqEjufYeQcP1LlH82CoB1UZFTd+xlrsLnAwITjfgVo
         Kq8fF+tbWk6YVSWePlZs7NVEEITszFodCSvmaeLnTlA2fC7pegMgxP2zorZuUdzhaOYR
         b4BsmoOmMRd1QWIVaeXF7FietXa458G13MFiwoJ3DGsZQfg6y6wuF4SK6/jgKTUaTZx+
         oudVTmeVVBgvYThyaXVDD4iMwSx6IEmSiQWLcZmxJ6vUEuV6oKHVlueE1n3ucHCzZkFc
         dwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109696; x=1761714496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jc1NpalSCfR47k2dqxa6IEAwNjtla9WFT4t6eqEOmRg=;
        b=EJoVAMjuOrmssdSI4hzMmqEhhqnNT2pAasb/t80pkEt1CNRe8D4tYFEd3lCLqWh3Sb
         J9ZEUqpyN9PLWS+sYDT/7dwj/axjozgjKPqdNxwCRZWK/T8ZtgdeWmotl9LsQSrlHev8
         NqriPTv0ihytoKjak5zMhu52oW+T7/kej/pOt777+pV6zseE/zToqvXcteUsMhYlqeET
         9RHIMlcglEZhyidGnPEMNae+2X61e54izoDGdbRhTZymdkDtrSddbrtqWpogPiiOUKWr
         L+Z+d1YnQveISw1nRroWwYcRcgG7/KpPBz8ullkb+ldpe2XeAeWKD2hArFc/QW32Zi/B
         PCZg==
X-Gm-Message-State: AOJu0YwWczfTEtT03mU0QPAA0wu6mBSSMk5oiIVqyxNKrq0YRqosTK3u
	oBzkBBkvnMBqal5SpjxDTBliIO2CxP2CyM70zNF8xIYS0F8D2A36HzA5/elv3j95
X-Gm-Gg: ASbGncuZAXblbiIttr23wKmY/A38a2isefVfSOiO97f1jydl7o40EIO149mw4GHAZma
	LIr9hcahiqYedz8Hu8W9+wiBDUm76olKAk+D5WGtYTld47ZJaRAjxwN1YYJx0y6Wj/WDYPd9yYH
	2XLDicKYHzONqoCwkq3BkFHe8h/nZNI1/zXaxjhK0843yJA4xoHvS5RZZ8KovdoNWb3sikelHAv
	J7bK7dD5bLGtDvQqajzRnR2TMDVAf3yOHkD81FAI73FBXTeiFSTwfbWYkhSoHr2GOCF9Biqabbn
	JayM4FflplQtO6x2pkbGyMowbdDQGPdBexowSme+mWeoxph+mOGNC2Eks/xMydBr8y7AhX3KZyd
	DFTZ3pegSCihpekK/5L4c72OLWZSG9mJzOUKdxX8bLSCOmuipf3axWNi/sB8wFVl96XOcf8Ru8I
	VLluu4iVRiiJKx7gvqYZ7VdrwfWMYfRhxIzirI/bE1QEgUNk3c8Lzk1RZOvxs65w==
X-Google-Smtp-Source: AGHT+IHCkYMUWe2zXd5r6zrJO3iwz6upeEM0a9AmksM0o0fJXMOA1O6G6oFF7I7lcF76rlCKhZqY0Q==
X-Received: by 2002:a17:90b:4c11:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-33bcf91909fmr29885144a91.33.1761109696435;
        Tue, 21 Oct 2025 22:08:16 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13328563b3a.6.2025.10.21.22.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:08:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] pkgconfig: Always use gcc for native compiler
Date: Tue, 21 Oct 2025 22:08:09 -0700
Message-ID: <20251022050810.1572184-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251022050810.1572184-1-raj.khem@gmail.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225174

It has build errors with clang especially on native builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index f537c635ef2..103b3e042a0 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -20,6 +20,8 @@ SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;
 
 inherit autotools
 
+TOOLCHAIN_NATIVE = "gcc"
+
 # Because of a faulty test, the current auto mode always evaluates to no,
 # so just continue that behaviour.
 #

