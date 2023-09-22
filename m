Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC59CD4F2E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.16354.1695367493361082575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XfQu0Nt9;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-986d8332f50so230709666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367492; x=1695972292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/MRn+NeF4D2Mu7IqejuMYRMr2q7gRNj/2BNQMmL4K0=;
        b=XfQu0Nt9prBvQXJHqROCv9VwkiDuqUju7rKeNsguybl5SsPrcxZVrEfnQPY2hLWPkM
         zw3IjZv0b5/Uq89wjbx7mDiuId4p6377Oylk3DvA+POIg878E6pDsw7sguurnSq5Hp/t
         Za53Zvd4kihnU6pgiQQvscKEoh+KPlTxuamdtcvHuqUVAIcCA2rg+S1AUN0nltFKdeBx
         dKVEtjeMsCGQNBXhC8aoBf6FiNcV5VAm1aU8TJKJaCH8kvDrwOF8AiEbjpeA3Zaj6cUq
         Nw/4tBGD6WQ9S4l1yftmRKr+4NMn8ShJ2vqKzALUfu/cEr5Hha2GsoNy1FXO/Ef/EoUX
         T44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367492; x=1695972292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/MRn+NeF4D2Mu7IqejuMYRMr2q7gRNj/2BNQMmL4K0=;
        b=lsJc+Td6bB6isDwLw1kRVETITCpMb1G6C1y34Q7HP+Tla16862XwJhHD7mJk4pHyet
         CNpcAmFJwKF1VYiThUpIVx1D2tv5pGjblMuChSjiLwQZjVmT2thIPKNP3eHPFqJsAVwV
         4ho71xiuizS3rI/S3q/8Wi8PklU8aRRPJeXs4G0sL9BbVI3ZpMiOTPozu1prFfc+aLy5
         Kr+LWtiG5ME2QixJ19Tl/LKLf3DVbyY5InXUFOHo8xR3cKxgkbAUPksE6Z/W/k6j4IeF
         2oJhpKdVove0lA3GOPqT+gr8R5IvBBsk5TI6K5cIilE1ys/TY7W4US26A1O/GJXGpnLq
         av8A==
X-Gm-Message-State: AOJu0Yysaj3A97wkcEElAPihlyJ7uUwiz3YjbYKiAaD1d75LJV9jxKRv
	r63gJ0ekroLKNbhu7M9YaKuQWSrmr6A=
X-Google-Smtp-Source: AGHT+IH5oDfnjZWJHw8dyuNMB/+uiMKSKQJu0zNgDVEbZcCKWmFJ+lEiqh3oiDs/elpsQMbeHKJZAw==
X-Received: by 2002:a17:906:b1d5:b0:9ae:3d17:d5d0 with SMTP id bv21-20020a170906b1d500b009ae3d17d5d0mr6574275ejb.31.1695367491820;
        Fri, 22 Sep 2023 00:24:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/40] mtd-utils: upgrade 2.1.5 -> 2.1.6
Date: Fri, 22 Sep 2023 09:24:18 +0200
Message-Id: <20230922072431.1481743-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188070

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index cdcc7667482..4b27528f646 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.5"
+PV = "2.1.6"
 
-SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
+SRCREV = "219e741f40f4801bae263e0b581b64888d887b4a"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


