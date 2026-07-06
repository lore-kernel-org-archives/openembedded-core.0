Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7762C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155281.1783358227648644429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RwGq9Agn;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36378475e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358226; x=1783963026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVCbhEE2Z0mV7C26EprkUYaHrGLwbB+tMB37JDBzOJs=;
        b=RwGq9Agn6CZ56HNbOxZlXTFURaUYiLJhdSImjh5lvMxXf3Mfao4ycCtJ8hJHuiOUEt
         rpG0o11MREZ6+MKsss7RtmZVSWGHz1cLKSsVcQ9P9fQKBuGju68PftdJEpKqKDfOTRhb
         ttviVrAng+94x9us6pvI9Y/RSf7wVbZScu7644NfVJxrEuhinS0mAgB0thJDrVe3S4v4
         tgnYFH+3WDaJITk4qIB4Uai2yrHBt5j1qMCw5JhLr94ZtXzGj0wmQWUXIqT8s43bbAru
         UBnq6Z1EMcDUd4zmJ8H3ZV0n+2SUe7+X/GUeWbHmAbA1x7mpG0GI1SeN1tEm6l0DAhbv
         igdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358226; x=1783963026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVCbhEE2Z0mV7C26EprkUYaHrGLwbB+tMB37JDBzOJs=;
        b=UEMHxZLkOkRSEPhpkeP9i83Zutw8q8W4WPfYvwBrmETcHeInkohyg+0tGYb0T0JMy9
         Jku7ssYxwHfQIcQlVh32hi0iLxOLyVLHztQxnR3bLc4YFsueTI3CdtTd+zWTE8LNDXEX
         jvVKn9CQJGiBsYHhrykMXkDMSSWN4dVHLt8RnqBRUzDvTjRRyg5+FZ1VMORDSiZaTDsv
         km1Xlde9VC1eh0DeYNl7P7F/3hTpSYw3ffnP+6Pn0wmjddZnNaG+t2tomTl3JklB7vA3
         595aLSf3AvMFhyeh51RhQEZGd7KHM5teXzx2OdTSN4xTxvK5I5y9k6qb7Y6EKn65ZsPe
         EQig==
X-Gm-Message-State: AOJu0YxAe4mmhoiQiYHNfJ4mNfgic1+1LMLJTFZkXABHXN4RkXAfAaXT
	LEtvE4IYRUZHUMZ5tG9UaGTpspvT/+JnVkU5+QYJiI0QKimgxat2nLW1RScqNA==
X-Gm-Gg: AfdE7clfdjL2QKwHmNNMciWgtYalxFx1BRgOV247p2BznNi7aD015TujkaXO0qIfmuc
	VZL/mDiPU2Jz6lQvLV0z3VMR4MqvNIuD9IFCYKFjbJ8TdQ3ogABnBORrVcdPEY5Yfr6TyamQZkR
	ELH/g3EA83vq/0UTYYSHBColEH4T0A2lhHBAxzEzH9+HUm068yzfwAO3w6umhCA5W7k/GfNJbH3
	ussxcKTUnAbhd/9x+gPhnmy9SSEcjg/WoSXrE2MQjCPp5+BhA48XK8l0fyMU8+FfI5+7ToBijxO
	AEUPiAdKPvwD7+K1S3snCLUaocWAMD/OcswlPStHc1nTEUfXI8oKD9G7ZtQ/LyChfp0DRyFkSqh
	RpKAAE37ua+KpGZ/x+44t9ZzHrl0DzdcEEkXtPyWzIQ2BKWLA4tnIQVNnGGXks1TfUtU6+YZ/0D
	YdMpg3bWxccILqbj9V1LfcI/eZp7hHWv2nzA8LkiEUu5IgmMmx
X-Received: by 2002:a05:600c:5294:b0:493:bda2:543c with SMTP id 5b1f17b1804b1-493df041cf0mr15164905e9.14.1783358225671;
        Mon, 06 Jul 2026 10:17:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/45] selftest/locales: opt out of ptests in DISTRO_FEATURES
Date: Mon,  6 Jul 2026 19:16:15 +0200
Message-ID: <20260706171701.70536-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240287

From: Alexander Kanavin <alex@linutronix.de>

selftests/locales tests configure glibc-locales to produce a restricted set,
and build core-image-minimal. This is problematic if something in
the dependency chain of that image relies on locales not in that set.

Until now, by coincidence, nothing did, but recent version updates
(particularly, json-c which relies on xxd in its ptest) pull in glib-2.0,
which for its ptest requires various locales not in the set. This causes
package_qa errors.

To address this particular error, and to minimize chances of it happening
again, let's build images for this selftest without ptest enabled; typically
only ptests want locales.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/locales.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
index ac4888ef66..9f04db2129 100644
--- a/meta/lib/oeqa/selftest/cases/locales.py
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -16,6 +16,7 @@ class LocalesTest(OESelftestTestCase):
         features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
         features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_DE.UTF-8 fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"')
         features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
+        features.append('DISTRO_FEATURES_OPTED_OUT += "ptest"')
         if binary_enabled:
             features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
         else:
-- 
2.47.3


