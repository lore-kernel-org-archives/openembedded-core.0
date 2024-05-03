Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98239C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 12:05:28 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.10809.1714737923604566975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 05:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+7luTJZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a58e787130fso493307066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714737922; x=1715342722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L7eKfwaDrZSMkYH4iqiUK0aXA190SMiTJ12jH2+XJo=;
        b=a+7luTJZpKuELS3h/KQv/Hg/0fRFMDN8C4pcyj75PdWl1MzFeF8UyAcgx0wO+lV3n8
         CXv7ytPjouGn6ps42UhbQ+S42SMVPHHYVfRuV6/OV8B75FSMq+jY/bLh0O3WOcmbMyEq
         uZ+JQzwdKwc9a2jf12ECwuyNITBijrxf91yeZ7NbKMmAzSY8ENVfqm1yKWZasVlNjXgZ
         5GotkTTWysMGGScpAO4Tn7LI92hZLij4xv6IvQhwCgsx6QUchwFg29nnj9nTsgVPdmV8
         Zo8yIkJC0W9yWfHWvS4MePWH6oTLe0Vj/5V45I0xQ/jpBYQwjF7lD5895WJd0m5KfWZz
         iOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737922; x=1715342722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L7eKfwaDrZSMkYH4iqiUK0aXA190SMiTJ12jH2+XJo=;
        b=AJ+MVRamMu0FNd69Ozfw6IuAWeDWvGDF4HHnfYP/sg0RzPjJkE8yeXoa7AZi9p8I7l
         LyOhJAKuIVUeNoidXdY8g2Pw04htSrJ5AV3x0Ab23U4T5/fki/1CpR9GCcaV8QOYXSDZ
         KShVj6EJzXoaRVoe9sA+jFMz560sF06RgYXyQHwIWY3mU4DoytLXZHirG+tJp3Nsezil
         oga6se8gu0l6KMaF6vu67liDHEYG8JQzH2oo7FoJRbCbWCStJhlNRxV+lLaK7mtNOdrX
         CG7h97/pPNanLwsTkH8JSpV3QXUn8LyBhPXefv26s5KcGZq3Tb0VRTCsPDLjIksDWLSo
         sbWA==
X-Gm-Message-State: AOJu0Ywp1Prur8k8TXlYE+8wxlmWMvkM4lElTEL5FIq6OzcJnd6sFnCM
	FNzeDT7tjIvKCfBBDUp5BSQIp3Wpks0QsOnfdzNJQR8WgN20e/v3OSHhoQ==
X-Google-Smtp-Source: AGHT+IGo1JDdeX9MhZ33KkmNw6mskgxAad9uNWJ7fYFrzzS/qQKdm5Ddzgi82N7e7aT/k3zzvjLTtA==
X-Received: by 2002:a17:906:4a4b:b0:a59:908e:42d with SMTP id a11-20020a1709064a4b00b00a59908e042dmr1097840ejv.32.1714737921809;
        Fri, 03 May 2024 05:05:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id mc20-20020a170906eb5400b00a599a85777dsm306362ejb.153.2024.05.03.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 05:05:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] python3-pyproject-hooks: fix upstream version check
Date: Fri,  3 May 2024 14:05:14 +0200
Message-Id: <20240503120515.1428284-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198981

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
index 9d08e7acc41..c3f1fb75ed1 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -22,5 +22,3 @@ RDEPENDS:${PN} += " \
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
-
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.39.2


