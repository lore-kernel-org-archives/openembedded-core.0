Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6786EC52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.55950.1722258803547776582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MrOeQZrA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso2564972a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258803; x=1722863603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXuxnI9fKkf5z5q2X53sE8PJ9h4yQmP5kIHquG8YHDU=;
        b=MrOeQZrAuTKqtYhHS2K8hX90N9x3BWnbRJBAhdOa/U1JhgsKT9vqTjeMSlMh2DRhvT
         G+yIiN8Rp/Hgu6sY8eqSFqx0RBDLFPFOuDiLMZQGMBJhnts/FHijQFx920YEopG/Kh+K
         l3FE/JqY3dFjxGCaRUASk88MB0+q85rOPF87b/Y14beGgVL5zMvAwKX76bBN3u8zBgvt
         f9sWolWfEW3Zt7Q5t5jQf6x843RVHYZ1Ytrc+Ge2Po9EvsPqc+EhGTZ3jnuq8pMgVApv
         jETQBC5Z/d0Dk8sEWhNaXTxgFWmZmUhI04r1pJup8L6sPZEDbd1FAEGAULwRjisBrwkj
         FPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258803; x=1722863603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXuxnI9fKkf5z5q2X53sE8PJ9h4yQmP5kIHquG8YHDU=;
        b=GP6fjFi/a5ur73rBgcG9m2vuC33k6P6FNo06W5zOTqGcn6fj+uKar6ouhJNvMLV5P4
         V9V3BaXaivn9qwX5xZDwxdDmK3feMsNkLQQ/yuNbfHYdPvRoY/DIBJ+EjqNFBhLbvjFj
         G+5JiH/9jqO4//nSvzsRRDoGSwuB4PMFnVf6e5kBACejvvMAnn30zSf1wNSiHhchLAVY
         UPmkDi1ekIejdLsQAOZZNtnl3/0XiT4xFmvUeTQBwP+i3CFhXy4lAwBH8l2frj+K8ow2
         6CBP2jR9HMej+RB3aaV8DSOVu08PXSJWFsgU0svpcbDZePCtHKAbybEv8AAoH1VnFD9J
         5t0w==
X-Gm-Message-State: AOJu0Yz2R5A8srM3ohS1K49pj1TCws4bDaANEzQwjjujrTrXQOchiqKD
	pLm5guaR16lwpYtugkNlRoOdpkiouAH4fEazs2ldUZnBj1R2/eRVaGouSrybi54SrKFfQ+y+f87
	6+AiFMg==
X-Google-Smtp-Source: AGHT+IEOZGun8QaG7vVfMy+rTmaTyyAURLk7UlvBSax2h2jWJgajQwxWdWQZK8+P2bf218R8OBRWfQ==
X-Received: by 2002:a17:90b:1c86:b0:2c1:a9a2:fcea with SMTP id 98e67ed59e1d1-2cf7e20f3bemr9090518a91.24.1722258802722;
        Mon, 29 Jul 2024 06:13:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/37] python3: skip test_multiprocessing/test_active_children test
Date: Mon, 29 Jul 2024 06:12:29 -0700
Message-Id: <9eafd0c56b279a7c3025b0dcd00745baead15bb6.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202633

From: Trevor Gamblin <tgamblin@baylibre.com>

This test is causing problems on the Autobuilder, so disable it for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac000b00ec615b3e51dda8d819015d5e7110ed88)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ctive_children-skip-problematic-test.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
new file mode 100644
index 0000000000..6ebbaf10e0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -0,0 +1,30 @@
+From bf3eb28bba24509a3e1cd40f1f0e26db833779a2 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Thu, 13 Jun 2024 10:54:31 -0400
+Subject: [PATCH] test_active_children: skip problematic test
+
+This test is failing in some tests on the Autobuilder. Since it's of a
+similar nature to other failing/hanging tests, disable it for now.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/_test_multiprocessing.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
+index 3955123455..a1861fa3a0 100644
+--- a/Lib/test/_test_multiprocessing.py
++++ b/Lib/test/_test_multiprocessing.py
+@@ -579,6 +579,7 @@ def test_cpu_count(self):
+         self.assertTrue(type(cpus) is int)
+         self.assertTrue(cpus >= 1)
+ 
++    @unittest.skip("skipping problematic test")
+     def test_active_children(self):
+         self.assertEqual(type(self.active_children()), list)
+ 
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 9dd1417f2a..e4c3fbb673 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
+	   file://0001-test_active_children-skip-problematic-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


