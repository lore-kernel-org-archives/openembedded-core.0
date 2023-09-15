Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF0EED615
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:34:26 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.23789.1694792059030233573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=II5vvDaY;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c1ff5b741cso20890965ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694792058; x=1695396858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Q/mPi+S15R38uY6FUKZdthE9U3trxgQ7iz7hZTOXM=;
        b=II5vvDaY7L+tZGQ2pM/0q/nNUdX+peo6qVDI4kD13oamsKWtxgkcEJ7IXzUJxUD9d7
         R680BiqYfTLYAgBNJRlbMfrEzNLij+a1XMt1gKy5aPbgwXSDCKOM237MiOppjZ42ztrT
         bsWLkwaoJ1PCHGe9nkIrdWRl69Qj9NmN+pq9p1eVVRnFTVXxCB0DGkbVTvv8kZClf8Yy
         AG2YGtxZ3Vl8BOrbT6u9BHduhl6+6A4MVMNdvXfsQKVEyzaabuWXvLHpp8X+PpiWNfDz
         dOUcdKhzwUSPaa/fc7ZlXwfxvLiN3dOgcq5r/Iax+jn63ILrnPPqRYptP7PYOySJlpuT
         RF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694792058; x=1695396858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6Q/mPi+S15R38uY6FUKZdthE9U3trxgQ7iz7hZTOXM=;
        b=Z/yFj2RPK8obuZ3csbv9AN++aRyGm3br1nyaNDFeqAqBqpAdskbCW+ys8M9ghcLQwh
         gJNFPi7RZHFkxBpqwu8NbfncXiBABMExptyNMkdTN2T62qn1KhlO+Hco7VunpLfXkLI4
         IO20Ct7/xJ+wz6p9z/eThva61Fvu54yT5E3AaWAvfj1VGFdy1EKQ6VYkYRf6XI+HnnCG
         QbUrINtJIkWN8ssySKwfNrG7EV8xCYotqunn4xvkBSsYixU0kv1h+22lnVesOruVMiun
         pfqiRtG86ALk+ro9wmTJLlGwYBU7SDv/v5WIo6i7lYPkpfffvONNZyDrxFLN5T8iN50w
         Ieuw==
X-Gm-Message-State: AOJu0YzaayFlmpJgnb3764Y0XSJpI1c2sPoL8MLM3MpxXC5Lbm6YdVUv
	wgRnHN3/tzbr5SD7p102mhJ6no9nBVw=
X-Google-Smtp-Source: AGHT+IG0xZILaZ13K83KiO6Ca31U7+1qmS/00AjKq4bpUwjGu6utpstNbWCEDj298UnYRVVWciBliA==
X-Received: by 2002:a17:902:d487:b0:1c0:e630:5031 with SMTP id c7-20020a170902d48700b001c0e6305031mr1968381plg.28.1694792058159;
        Fri, 15 Sep 2023 08:34:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001b66a71a4a0sm3647309pls.32.2023.09.15.08.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:34:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] util-linux: Fix lscpu on musl
Date: Fri, 15 Sep 2023 08:34:13 -0700
Message-ID: <20230915153415.3241307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187678

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...-buffer-size-for-cpuinfo_parse_cache.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-larger-buffer-size-for-cpuinfo_parse_cache.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 99ce2a24b0a..214fcb03908 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-lscpu-Use-larger-buffer-size-for-cpuinfo_parse_cache.patch \
            "
 
 SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-larger-buffer-size-for-cpuinfo_parse_cache.patch b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-larger-buffer-size-for-cpuinfo_parse_cache.patch
new file mode 100644
index 00000000000..6182e4b6fbf
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-larger-buffer-size-for-cpuinfo_parse_cache.patch
@@ -0,0 +1,36 @@
+From 4697f1555fae2d24518ed00ac22387a258d0ca33 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Sep 2023 00:18:18 -0700
+Subject: [PATCH] lscpu: Use larger buffer size for cpuinfo_parse_cache
+
+BUFSIZ can vary quite a bit  e.g. glibc/linux systems its 8192
+but on musl/linux and OSX its 1024, on mingW it is 256, some tests e.g.
+x86_64-64cpu-linux6.2.tar.gz has added really long line for cpu flags
+line which is greater than 1024 characters and hence this test fails
+on musl because lscpu -s reports truncated string
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2492]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sys-utils/lscpu-cputype.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sys-utils/lscpu-cputype.c b/sys-utils/lscpu-cputype.c
+index 3fd5f7a3c..863f63152 100644
+--- a/sys-utils/lscpu-cputype.c
++++ b/sys-utils/lscpu-cputype.c
+@@ -462,7 +462,11 @@ static int cpuinfo_parse_cache(struct lscpu_cxt *cxt, int keynum, char *data)
+ int lscpu_read_cpuinfo(struct lscpu_cxt *cxt)
+ {
+ 	FILE *fp;
++#if BUFSIZ <= 1024
++	char buf[BUFSIZ * 8];
++#else
+ 	char buf[BUFSIZ];
++#endif
+ 	size_t i;
+ 	struct lscpu_cputype *ct;
+ 	struct cpuinfo_parser _pr = { .cxt = cxt }, *pr = &_pr;
+-- 
+2.42.0
+
-- 
2.42.0


