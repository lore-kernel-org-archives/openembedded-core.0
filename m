Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2519C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:54:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5735.1742280859670380157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3XM1iXV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so32942755e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280857; x=1742885657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n46etVeNqzEP9uE5aIUdStdyGcMr4CZKN/7ufmLSQ+E=;
        b=f3XM1iXVywAdgTv+xnLGFO8aB1ErpgnkyTsn99tAzkw9Wj2TDrIU09l/LkRR9i9dx7
         6Ra5/15pvdfZt3WhjtHS9r9bzLPFxHDFKYppjZgl7JYURI5WHl+EbGzlVCrI3dkHiKZ1
         2Q5zkprEXjsfukAtSQ5W+mI7QmXeZ696y+36cFecvX6DDky2d7UJfuire+w80o4pqYcI
         kN9Jk8GdXP48fbcO7kRS4zGi/YYzdjPbaephK0HSKIvwChGk2ox1s0yBayouD44sLDzJ
         FX05htIcVWxoL5K//twRUoeYRpwH8/3m4T6ieoHSpf5OS0SmgTNWncAD2ChYq3EXFota
         qdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280857; x=1742885657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n46etVeNqzEP9uE5aIUdStdyGcMr4CZKN/7ufmLSQ+E=;
        b=ZWSq0mgR1wU7x1mRyndwgzUEV/9IiRhCX0q1UginzaZyzkJqYN2C7MUGI77/psgXg3
         OChPxXurn4Re/lx6LX3AeqwkSG8WwXz3nTcbD3bxIWVxTLnzhECb7WCDD0T6bHTwNfoq
         7+fPVREv9efM0ayofY+JRllpCQvBftjuWdKSGTfCFQAhVRL4Cbrx7wdhQ6UqsV3TNXTz
         vBxBKOV+bkJNDpeD6oZakxN2vCAEj8M41Qsh+kVmsNVZLWBhnlas41trJpZ6yhme3Dli
         gSgNgfL707I2isd2zdkqg4AflLJwz2XVzFNJ6GXp7MYy9p922Tov1hy6rTVeD5TdXcgj
         UF+A==
X-Gm-Message-State: AOJu0YxE0kjYllKVLm/vPyjs4t/7WJoYhpIG3iiqG3GW7ENSMOjHhHlj
	+IIihXjbOOoosn6aWqe7beeX0+azssV0tNfSQGdshA6N78D1iHj82GbXYA==
X-Gm-Gg: ASbGncsGrZj1WEqe9D9pcVB2YVO3+jLWfXeBDsGaHD7w9Bc8gwKZLxNjr4gBlfo6VR1
	dxWlPc0A0oDLYhzVIFjpNM23FOpN70P5c8LTOxrgNjtiXGQAY4jClW4d3AP7igV7a7jkO449qP6
	AaHvfvKwfBD/JnCdLAgytvX6cQTcjyUbnA3qybvusIe7PI4Q2aPXhd7VFsXDNjDG7waODDDXT/D
	h3XHlvfqmhzhXmK+3ZwA8LDucyRVkDxM+qw/HFfGlFy+aW8WYYpYF5l0o87pa58t1oDa7GKXA5C
	VA2LLEolIY355p68d6zbav+ag8O4X+zD4OmnIAE+pEImhYytiay0ZyKgcw==
X-Google-Smtp-Source: AGHT+IFs/MGEB3CSIBpWndiggXAeDT31lUwH2+2MQDm1EXVSG0vDy//6XpNL6LcVNWgZVUKpkAItvA==
X-Received: by 2002:a05:600c:3d85:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d3ba30defmr8984455e9.31.1742280857076;
        Mon, 17 Mar 2025 23:54:17 -0700 (PDT)
Received: from voyage.lan ([2a0d:3341:cd44:6c10:e1b0:cd27:b26d:be53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc3e72sm125085675e9.18.2025.03.17.23.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:54:16 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH] cve-check: change the default feed
Date: Tue, 18 Mar 2025 07:54:02 +0100
Message-ID: <20250318065403.8198-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213179

Move to the FKIE feed by default, as it is showing better stability
than NVD2. Content of the feed should be the same.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c6a410e2b2..555fdaad77 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 # Possible database sources: NVD1, NVD2, FKIE
-NVD_DB_VERSION ?= "NVD2"
+NVD_DB_VERSION ?= "FKIE"
 
 # Use different file names for each database source, as they synchronize at different moments, so may be slightly different
 CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"
-- 
2.45.2


