Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2B4CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5765.1781637426995921795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h7NUo2nL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so53402555e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637425; x=1782242225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoqQwIT0WY3n4lJAmY/2Cpd+D1QYdxkOgHtRWJ9RgA4=;
        b=h7NUo2nLqVGQ0lc/1wP776hbE6jcNXH2m/jgI4Kv7PqSYBxODXuqLiy12UHUcqz+bn
         MMCv22l1hExyfaaxQ6PvwyJYDkHTeIUBwrxPO6cwZjv8LtWYDHczF4szETpyQJ+Ef9Qn
         oS/t1h02vBo2YIt32JionBz0Rt/HbweGia49ZroQ8WFwjQWMEWbW6/f+U4apbIesSLoM
         wmaAZrVQ9mreMM5TYuB/k7T8R5KJOAQVc58OYZMdVKIRr0pYIZYqe4dZX2KvkfDCLD3P
         o/xe3H0kTmwtwLZdwZ6ZPqBQ7defOPYIbnms55eCETvLh+/+lhvBT8OgQEnciBD50w/o
         bD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637425; x=1782242225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoqQwIT0WY3n4lJAmY/2Cpd+D1QYdxkOgHtRWJ9RgA4=;
        b=reoNt1YKuBopduPSg6qpokeAv66KsCwVmpEvQGlWZ7Tfagc1xHoGS4tN9H9/TlLrtf
         VTrFCsZeQJCgYNiMI+npg6CLNsr4nnsctSoqluDlkCqlb1Kj3KwuJA5sVjNI4QxPhUNe
         D04EfG9xQi+vrofMPRzsHiEe2pJgbCFwZtnpz1y7E8cUn1ZXEX3Lt6gN8tSoQZbvzOjU
         gREMFAh0aOxrMgKIE+bx4NgwzKdFnxs+e7C0ZntPyi258Uih09F6NvcMif/lgS5nwkFh
         xy5n2BP1CAVXIfWp1gt4ldSmPompc47+RCnM1k3UlqmfDy2W9Kd9i2Ke7MRC+bS5VYdZ
         5HTA==
X-Gm-Message-State: AOJu0YxW2uSR6h+97GAAXlNE1aYhc5igIEexxWCySukaoU8J51X4qHe2
	FzlIQc3R2w0V9CG0F7VhPUfeLO1Ya1C0XD0G2wr0QGKAcAtM6ondk14NsCWyVYd9
X-Gm-Gg: Acq92OF1xNIlm7hueB3TKJyBviZJ1V3bJqjOsEPp29pKr3UCq9HVnc2rvIEiLRQP984
	Tr/mcq1doarf+3Am4L/X3IcK8u7meQgH86AEYSRNsuuv99wK+zAiDHSqcAfz1qXw3bOU6ULn2Hu
	ZP6mBoHm0Q7i+YxjNpuTjhMipRY/73GXWsUlFN8S+hQs2lrnz0VdJ77hLtY3Zs/wCGxU61gHzQU
	nHmeYge6fANpN91P6p6CMAnvTPYmWvxTGbCtDO2VQ5Ci8FXgd4RyEt8k2ptqdiyPhd8Q+sQqPR/
	JcqEAq+RkwfBiLE179fGrJADxtDksRnfMcwgvI4uYuhVAa/+R9qNd+DUhg3GBJ1VmGX3nX0EeK3
	MpuvrTOhjhPcBcMg3EUtnp2Ja48fZkUPhRCTK81huSMGOU5hmF1PfX5f64ZMmxjpWs662SrlMQN
	rwuh24btOXh408GLYou1h2MTNmIVXeJmXeihHJb++DZHP6ed/S4yegHc1lSWDTp8xp4Ps8Zg==
X-Received: by 2002:a05:600c:c491:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-492333bf72cmr13460985e9.11.1781637425137;
        Tue, 16 Jun 2026 12:17:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/30] python3-dtc: upgrade 1.7.2 -> 1.8.1
Date: Tue, 16 Jun 2026 21:16:23 +0200
Message-ID: <20260616191628.2014553-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238952

From: Alexander Kanavin <alex@linutronix.de>

Switch to python_mesonpy.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-dtc_1.7.2.bb => python3-dtc_1.8.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dtc_1.7.2.bb => python3-dtc_1.8.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-dtc_1.7.2.bb
rename to meta/recipes-devtools/python/python3-dtc_1.8.1.bb
index 9525c340cd..314107883f 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -13,10 +13,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
+SRCREV = "8f48565e5cfedc74d3f7512f1e0188e9d85dc1de"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
 
-inherit setuptools3 pkgconfig
+inherit python_mesonpy pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


