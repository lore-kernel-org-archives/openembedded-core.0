Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C74C28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.33757.1741599421977782903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fev3Tmqb;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1018397f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599420; x=1742204220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cV1KZvQcLmft8s8Flz+qvXl+PgT+4/juUwwBlFFDi0=;
        b=Fev3TmqbTn95+StjF9dRblcApxtpKRIK4AJAy+42/HHMddRVmv3guE1aZxQQ720QVd
         IgxRzitDBbtB7EaWOYQAbWoP/R4FQg9Wtdyg4fn0V80i0LrRE6KIRuG/vGfA7u5epHC8
         hR1vkqjC8x+Zt2YMqjX6DeIiKnEY6WOPyFcG9R11uHHDZCCcKJKzppdLHMbqWn7cwEwW
         aiU4H1IOIxxbYoQie9CRMmbvlUrYEUKdnS1nmIQ5IdKkXiHgZiY5Xe/Jgbjh50qIgSyn
         9LTgMuyviizvV80xEdPg4+fGGiVRnBBjtkpxex+Y/eq0Q6lLqmdnLxHwrYvVb5wKwpBd
         juWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599420; x=1742204220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cV1KZvQcLmft8s8Flz+qvXl+PgT+4/juUwwBlFFDi0=;
        b=WnOHjNgBrYYYUKIvtF0zT9Bc3jxICdXy+w8Mm4ZTNWr4d25Cve1oYziWeGnktLdydx
         CJP7WXw/AIjJUvZOaBTcXFrKujsSV4quae/5dGwchtWp8WJ+DOi+pvCo1IDB1+NB7Xgs
         esCbPWK1UASp6sS+KpCb6gnqCDGKWJunsTeALlMwjkXcsZAXXBtOyzksOe2ld8hT8UX+
         1vf5xqswxrHd3vu/cD8hqiSsXDv73c4c6gJWBrtXrZH7jTH8kYorbF/ZL3puL8wS+vg1
         PyINibHvVea5OybQqg9LQVSz9XVh5rzAgx90/dQxeYVBn56TVY4HsR/zcHEVZEkou5lk
         YeiQ==
X-Gm-Message-State: AOJu0YxkGoU/bg8GU75mMs/gCaPguKHgImWZEra4rz5NjirUW5FsmWHF
	dRzE8rji2Bt/s3e/zFhCUMVFPpHKSvSo/Y+yTgDXpfb/YJSR6wrAX0LfVQ==
X-Gm-Gg: ASbGnctXq8Bh3mJW/U5aA3iWrkt0tU7D1v5djXRyI8TSmhrN99c8WiTxHnkhEyF/+o9
	VZxQ2dYvJW0pAoywnZQHHCnpy410Rxz5LWB9gjaW/ogTFpkuPRcrLQeLDdgvDJqBnPUgFc+fA9x
	PV0m8lVzgZUXlUs3ncdslhpoEb2jIRPAUKaDC9ympkverpl4tHkuv1jcr5gNLolOFo9b0791yit
	c4aBmuspgjr7TV0iLtmvKBChpj+xIYBhf4qoW8uHmnSjpio8hI5Hjln0G3gVcTwcmFOJHnFX22j
	SCREl43wMZ+4MaNpurMG8nv8/qxI0CUWicMuhXN9hu/Ga9LYQQhMNU4oHurMvOtzofs=
X-Google-Smtp-Source: AGHT+IEKJHH4fw1ybJ6WT/zvW1Ij34DNPzidCphapaeGfM+lC85GJgJKdwvu7S64YfvsExRu1BJpHQ==
X-Received: by 2002:a5d:6d8a:0:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39132d292e3mr8125831f8f.20.1741599420072;
        Mon, 10 Mar 2025 02:37:00 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:36:59 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/7] oe-selftest: drop redundant imports
Date: Mon, 10 Mar 2025 10:35:43 +0100
Message-ID: <20250310093641.1983560-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212497

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/oe-selftest | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 18ac0f5869c..afc48d9905c 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -18,8 +18,6 @@
 
 import os
 import sys
-import argparse
-import logging
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
-- 
2.47.1


