Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13E2C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:12:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.50847.1742213526769567914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5jT+btg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3641959f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742213525; x=1742818325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySQZSwFRGZUWraxKbLuF1iW2k5dluymW13+LyfQ5AmU=;
        b=I5jT+btgyVfGFu8xS+QMag6e98MvsHLXDs/xKxZ5tVz7yC6difsiuc5AbN1sC2dcAo
         Tpregm4Fu8tssknX4CY45CWzE08iRzkowFuz2SzFUrKC8nx0cXUzgew5tXeBuppAtWFg
         7yzh2ZLseMkYdG2QpsEBO8QAKNx3yhZVkq2ZijFleRJpQQk2POHN0iBFFc/abAz1y9Hq
         zHCodAYWY6iAi0rCIqNOISIYRm7ReXh20rXLS63Jj3UPjfsN7ZE9qvsg/r1U3JT53LmJ
         ZkFXhyxlRS8J3T/grd3liNal4lQ42JRD9XGYsshj+cygFD0bsNQBenK9ZvPZsiV4Oaad
         x5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213525; x=1742818325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySQZSwFRGZUWraxKbLuF1iW2k5dluymW13+LyfQ5AmU=;
        b=e9/K7VcRy0Snob++uIqsObXiRkClvrCbCSOL73Bt4re8l2E9sNen9MnuA2roqPbFP4
         qfszLzKGsXhH1IE+D6VIDI3RINaKhxWXWhd5w3GbEqLLTashb6raNLZmoex0ArBkL9+/
         AfYgb34ephDbVWR6UbNyCOfP8on6OmiEklH0CN2vAJomW7u6dwbW9u1E6bMIAFTJW9sB
         e0iYgmVVBO5VngWta0p05w01e23VAKOrIWSRfwGMVOFcyDppyEgLMjmkaZiWEZuif6wf
         oAcYmnoaqBV0htbWnpPPollC7s2X58qOMzHkF8f8XYoFwTzW68vUnFw/Yubbz7oSip68
         5Hvg==
X-Gm-Message-State: AOJu0YwSf/C5iOvUoKI2XAmNZ92J42Nud9LzZ4eOosuYjwWI4UlDEaoW
	e+qwd7yIvGkkWmmiANT8qC20e+hG+9BOItRkRK9ZTlYgfq31F445EUiV3Q==
X-Gm-Gg: ASbGncu90B25AFCWILOfVgwrQnJScPEDT4ZAsOF6laN2zQNnx1K0PzNoN1azwLX2lXd
	zmdKHAuin6X3RpvYS/8OEWK22derX/xiDGKjsE80mlX13g2PZtRNtMsYa3xr6SkAx2GdaXlCyCF
	Smf2GYAx26LxHJuuchCYANDxMdT4/hw9x+K4/R0tbcTSQfdX9ER021q5YptzJc3dRKcexprxIQ6
	KZECKU+74uJsruWJTUIUVbUFBE9exmfGlVmWPsj9IprKkCFbXJR/buYG69ebRrgOG9nIR9Vpj6l
	+pQTy7SvX7mht5lKnJ9oT2sfakBmb9uQwGWMgzNMUfi/+/6rEwfQ1k0zR2LSlbp27JA=
X-Google-Smtp-Source: AGHT+IFZnJwR9NgIReXI0qN+q8rqJUaOcpuGzUwSpD6B1hmiFDyWTRHi+NiqxC75DQmJcyPLC1nQ6w==
X-Received: by 2002:a05:6000:1f8e:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3971d70cae9mr13058670f8f.21.1742213524666;
        Mon, 17 Mar 2025 05:12:04 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3974d771160sm11066893f8f.19.2025.03.17.05.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:12:04 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 0/2] oe-selftest: fitimage add more u-boot tests
Date: Mon, 17 Mar 2025 13:10:12 +0100
Message-ID: <20250317121120.130476-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213078

changes in comparison to v2:
- Split into 2 patches
- Fix a typo: ftc-native -> dtc-native
- Add one more similar change as a preparation for my next patches

Adrian Freihofer (2):
  oe-selftest: fitimage improve bb_vars access
  oe-selftest: fitimage add more u-boot tests

 meta/lib/oeqa/selftest/cases/fitimage.py | 138 ++++++++++++++++++++---
 1 file changed, 123 insertions(+), 15 deletions(-)

-- 
2.48.1


