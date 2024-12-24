Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A28E7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 10:26:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.31290.1735035977463759071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 02:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dan+sXQY;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3863c36a731so3739077f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735035975; x=1735640775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RkYGuFORsTyZTqodsTelA4+1TjwMYQeizddCHCSQ6A=;
        b=dan+sXQYWFMaybxKL9WYpek7waKo4ec6rT4+ZvCaMEpdbb+A3omaGfqTWlVjtjgCwx
         lhLa/ylDzvpK0kpSfoLgDMoIOsiLTPCaaGKadVa1jLbN+7908deddHSHmaVuUamLUlCU
         CJQLud0R1aPmadEqNi44nJvOs63wT9o75wZQ700Uwg+8E/Qhi8JDi9IbxdVUZdet98B8
         joaCXmzkqPbDXkyyZbsc3WteGi/vD3ND76T6pwboY2SLxIryvYis2KcqPLjhpAttyGyy
         l+/2EiZX8qdk/3alpf4VwNDKu8tNCGpo3LxHi80yojVYO/wvd+A3CzSeIK3KL0ZGoSW2
         VXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035975; x=1735640775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RkYGuFORsTyZTqodsTelA4+1TjwMYQeizddCHCSQ6A=;
        b=HEHJ30sxRPWCdT/zM6mQVKxpo18lEOnf9jMtu4UYopCe+v5TmF9saCgDEp2kwuuPel
         WzqougyAq8k5WhO+XEKi3qlJhRyBBl9+9h3sdgoLVM3FYfmlr4bhtt7Ev2KFG49hUSnd
         0NDNCIN0zHndhe5Mvg0oOLHqx/AbVmu0rRgN/PkKUeuIQtfU5MT1m9TkRnqIW6NXJMZz
         ox4GsIPupXao/dVvhOlZ/Yfkgjnq3jAw5Q/Cpy7k1iL0eemeNQOufmIfcXpcSAVsFHbr
         RtmcpC1elyRQabheovKCPYzavJyHIWBTNRbyKtzSYkTrOusz5Y1rFlEj1veJDU1WuJSt
         KyNg==
X-Gm-Message-State: AOJu0YxopenWMhrbHMW63Xa7e7npodjBB7wqR8X4wfLtLrTLX7YHCsud
	8eTy7pvyJAdrRgHTOp/BNonnSGT27/rmmsznu9t+V7WY3Pgmp8xLlciUTQ==
X-Gm-Gg: ASbGncvZEU/jEXxcx35EX+XYymr3819vS2Bm+gLNueH+yctfOqSwDaHb03292bfpiYC
	UCF451ezenOZN8cTHw9T8MbRVjd409AKtgH6k1ioTt3iJ/0mlBomPTwbBD27Qga1Fo7qu1MpdFP
	Vzk7PFAzcO9+oQTjK1egZXB8ZyJVcW5tYb/WyJLeQ9+m6YqDNscAn72HBH+2xOApQ+54kxioq5u
	uRT/jgImRwR5T1GrJAOLaLUkqeDwP/5Hpq5LnrNgilLPBZGx0UOEjRpqJf4wRDEjjBP4VuvbL4b
	peI=
X-Google-Smtp-Source: AGHT+IElvS0xEWKXUCVlXpjLO50yzBNz78PBF6J74qABymhUghsX0a8+YFze7cshtpmoyMqXCsnAhw==
X-Received: by 2002:a05:6000:70a:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38a221e2c89mr14411893f8f.10.1735035974946;
        Tue, 24 Dec 2024 02:26:14 -0800 (PST)
Received: from localhost.localdomain ([80.215.86.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm13788030f8f.41.2024.12.24.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:26:14 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v2][OE-core 0/4] Allow choosing the NVD feed
Date: Tue, 24 Dec 2024 11:25:35 +0100
Message-ID: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 10:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209061

This series is allowing choice of the NVD feed to use, you can
configure them using the NVD_DB_VERSION variable in local.conf

Available feeds:
- NVD2 (default) - the current NVD API v2 feed
- NVD1 - the old NVD feed (deprecated, but still working)
- FKIE - the NVD feed restoration from FKIE-CAD

Marta Rybczynska (4):
  cve-update-db-native: restore
  cve-update-db-native: update structure
  cve-update-db-native: add the fkie source
  cve-check: allow feed choice

 meta/classes/cve-check.bbclass                |  13 +-
 .../recipes-core/meta/cve-update-db-native.bb | 405 ++++++++++++++++++
 2 files changed, 416 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

-- 
2.45.2


