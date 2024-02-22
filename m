Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578EC48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:35:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.9964.1708598149104440776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hL5E+thZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-564a53b8133so4808067a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708598147; x=1709202947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Nntsavy3OICxtm/3O9rvFHFNTnHT6/deTKO5pmhU9M=;
        b=hL5E+thZ2c6haCvPphf4OlY4M/AnEyigwYknr94z/1hkzP+oK0BMsR6tzYCGgxE9Aq
         pTnJkhI0g1bhJZQV4XK3FCt/+rqAHRoyM1FpRYTuAa0O30VjGj5LVkkmNCjFxYsV01D5
         K+pf6Lr8M0EKxkBl427UlLlLi42CYtPKBk4UwJfgz/umvXvwZyJwN4EM7mG0rGe9sYle
         xZkeJsGtJamOdJdXfYIAAhdXwiVTp8LfwcM53fP2ZcccAOcKGyYea2y3E362zLXNciNZ
         LiBIYz5SksL3TbZSHsGaSuyTDxuzEcGWVetA5PxFvc6GPQB2hDDj63Mg1Bz7nQ4wVuwC
         0FiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598147; x=1709202947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Nntsavy3OICxtm/3O9rvFHFNTnHT6/deTKO5pmhU9M=;
        b=mPVUOhzVPdPxsEzpRldwNPt61HVGxPWdzVAfW/CPTWIEBLwqS0wV+6H8hfuq4w03Pe
         0sgf8QjO4kgF/n/FpxnLQqveAVDcHv2K4Unx6ACKAVqVnnPIP1n0hLd7gon00YgYEr0k
         XtzH7StWSvgvmPKwqjcas05SwSOIiqT70KF68w9CJqcUAdoPYWoT7BQ4SLv/3RqHxl+Z
         i8D6LDxdVc5munK/mOs3lcXC5MCmJ96sH1KRzIqYt3JsyLoOCOFTq6QJIfPCJihzjiYk
         wjnf6xX262zq3VgqD6tolBEzJR1ur8pLYEyCDbrzZ3tMOJhu/LijValrxxrTYfxactVX
         2bTA==
X-Gm-Message-State: AOJu0YyEbq0sPxb7xCNuAxKiiD5L44Y+NMeImcx6aYRjCbDG7yeBXI4Z
	TbYYyP0YJSMR41kqmBCVpyhUMqRJMOMgtBZvHfPoMrDA+WYeb0aOsbHZYhdl
X-Google-Smtp-Source: AGHT+IHyarqFKTNeJldsTkTJatzJNj33tPgUdo6Khm2QNyjLMlStEkftTBM+9v24zgcqsznErpt0PA==
X-Received: by 2002:a50:ef14:0:b0:564:4f6d:ddc3 with SMTP id m20-20020a50ef14000000b005644f6dddc3mr8555078eds.39.1708598147125;
        Thu, 22 Feb 2024 02:35:47 -0800 (PST)
Received: from localhost.localdomain (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm5382260edb.64.2024.02.22.02.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:35:46 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: reatmon@ti.com
Subject: [kirkstone][PATCH 0/3] kernel: Backport v6.3+ localversion fixes
Date: Thu, 22 Feb 2024 11:35:42 +0100
Message-ID: <20240222103545.2970387-1-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196011

Without this, kernels v6.3 and later have wrong localversion '+' appended.

Bruce Ashfield (2):
  kernel: fix localversion in v6.3+
  kernel: make LOCALVERSION consistent between recipes

Ming Liu (1):
  kernel.bbclass: introduce KERNEL_LOCALVERSION

 meta/classes/kernel-arch.bbclass              |  1 -
 meta/classes/kernel.bbclass                   | 24 +++++++++++++++++--
 meta/classes/kernelsrc.bbclass                |  1 +
 meta/classes/linux-kernel-base.bbclass        | 11 +++++++++
 meta/classes/module-base.bbclass              |  1 +
 meta/conf/documentation.conf                  |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  3 +++
 7 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.43.2


