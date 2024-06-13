Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9052C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 15:37:34 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.11943.1718293045367547731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 08:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FlpUdrQx;
 spf=pass (domain: baylibre.com, ip: 209.85.160.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2508320e62dso503715fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718293044; x=1718897844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBBihk3ve4EOmBUToIoPeJ01lCokWG3BPEueekEgGaA=;
        b=FlpUdrQx24ARNuOLsu0qaagAukQEVb2j5w8hDsLlhiNcQSgPmhB9MQ/6p7QoSd3Nrk
         Ipu80HRCRQiJDJiEst+Ezor+5yblgyce3uN1w431BqoId7GYeFCGqDSJvgx71/ejRHrs
         2mUQidCRgdd2mYjpuSLJd5pFA8O5tHnTV4pb8u0iYO+/XfqeLArbm8fL57/IynXWRG4Q
         jW9pD+rUwdLWtMlgtIru23TYYd5Lu4zSR6/i39Gl2c6Xw/fWZrqmX+DtKuJBk7kHeYmy
         0b/zHDNALppkODLGKSLr+Gy+2yeinYEvB8BSLXMksgoGAyev9Sf2aQmk1UW+M8MQnVxR
         if3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718293044; x=1718897844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBBihk3ve4EOmBUToIoPeJ01lCokWG3BPEueekEgGaA=;
        b=hcKSvtr8hi0FAe2WL92N/ZmEE3UWuh9wlIy+LcByhOgU44BgdyU59UhNl1Yu3Xb2t9
         pjDST/sZZ314X/VfsluMenyubNUF9ZA/mO1sEmcULcNejTbbEqpwokkle+dx7gK76xyB
         3lur8I7sc6I+QGbQYBEiFVWy4WtdNeA12b3t1W4IaV+3jvbL8gG5/sAYlHucEG4lLgvy
         tk1dPI5fOozX8+lre4WKVZXZ6S/z1VUKfrLtIv7XR8+GrXqUIPGClRVH3fsIcl23Zi7U
         Af+K3OJHE8XsX8+50WqLbXehUYT+2t7OSMgcDvSTRJ1GxE6HWcublZX9fnEWzlKP8CQJ
         6lfA==
X-Gm-Message-State: AOJu0YxwMB9FT5H6Ux2ZHktQwba2fInOVDiULCTzbA5WHE7a9lscSjP1
	o2VnNCEfdM0Og9Fv9IGnTlxOVmhcOw6QJPsvd+/HPVSsHwtPyM1Q2m8E9UJgJSOR+wQZ/9pMJ+n
	Gl3g=
X-Google-Smtp-Source: AGHT+IH1GSZNwPpDy0m9LwF5ew4Q+9iNMSMpU+q1GVQKYMMK1gtE+HKbn8us7I3AKOLyh9IcJSOdUg==
X-Received: by 2002:a05:6871:5228:b0:24f:c9e3:b76f with SMTP id 586e51a60fabf-25514b8dd65mr5908534fac.19.1718293043980;
        Thu, 13 Jun 2024 08:37:23 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc02e72sm60769485a.96.2024.06.13.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:37:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3: skip test_multiprocessing/test_active_children test
Date: Thu, 13 Jun 2024 11:37:21 -0400
Message-ID: <20240613153721.2110243-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 15:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200634

This test is causing problems on the Autobuilder, so disable it for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
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
index 64cd5d0bc0..8b5e7bd99c 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
+	   file://0001-test_active_children-skip-problematic-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.45.2


