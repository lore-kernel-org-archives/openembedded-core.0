Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFDBEED616
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 16:02:46 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.24766.1694793763611686981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 09:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGazguGD;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68fb46f38f9so2205970b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694793763; x=1695398563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8gCH9EDDvmS8IHhLDJjb5/9PCiO99FPYKyZ2oxRfJA=;
        b=FGazguGD/j7H/vVkO7w52P40GD6P36ZRX7NUeAtSm/1sWu0Jaq4DBlM04FIhKvTIXw
         pL98nntxGxFlkKGdWvHG33RX4QHoRGZFaIld54oxM/H6LV3jv0dllfTEwfj1/JiPp8Ve
         /fYij+PbH6NypS88/XgJCAzS6lh5Z2G9L4ZlKy5/4ykfroMtlwuIsw5D+PYZdXLrKbkR
         cJS9qWq0l0SKbxz5lSOz/tlODeft4QSczWq0h0fIYHRum9Nk463MBUb34JNy7GXLBBPq
         GrFJoN8Rn2C2Fp5ILRvOlnj9Q/Q4mTjkI63RMBtdwhM1a0qZGHsnhp4Hmmxm1SciQ0Yj
         s4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694793763; x=1695398563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8gCH9EDDvmS8IHhLDJjb5/9PCiO99FPYKyZ2oxRfJA=;
        b=eDPUYYk7uRTHrEqqGnxQbYxOcAFm7Xksjux6jAUR8fSGomNl3zGv0UxfFMNdj2WlIo
         BH93qSKx8jx5q1RfrmhykfCEHeqezy6lzJE0ETInwGmSxpWjRCXl+e3cS9W9PkqkuwhF
         HwwTkyV1dXB1KA31iajTSxwxRrT5UrP8upeRzaJixr8Ly1QFLz8GnkBY1vc6Y1K3P4Ow
         smZv0VTgcv4fkeK4S9P2Zuziqp6qQcqGYmbFVoSqpnuiBOpTglrXqylAHpAI3A42PJxu
         CAHwd5Q2KdK703C9vhlaFGyciHHqc9LQRj8qsJCVSAT1bUOK+hkjJcQ7diR9B+upK0vs
         y8bA==
X-Gm-Message-State: AOJu0Yz0eYpSPsw4lqUs+GoinYElOJS96uVnEVhr4Xl6MwePePwKvIar
	weyRBQllZFn1CktVmJrl/g7oThfxpx4=
X-Google-Smtp-Source: AGHT+IF690ObR6NvCe2gds9A1f4jWWGwwSo2ICQAV2tQMbAwAaOu6sXrsY9iQGdZh/LDAAPNTX4bvg==
X-Received: by 2002:a05:6a21:608:b0:154:9943:7320 with SMTP id ll8-20020a056a21060800b0015499437320mr2134136pzb.28.1694793762599;
        Fri, 15 Sep 2023 09:02:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id u4-20020a62ed04000000b0068fb9965036sm3129541pfh.109.2023.09.15.09.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:02:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] util-linux: Fix lscpu on musl
Date: Fri, 15 Sep 2023 09:02:39 -0700
Message-ID: <20230915160239.260998-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187681

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use v2 from upstream submission

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...Use-4K-buffer-size-instead-of-BUFSIZ.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 99ce2a24b0a..57f366f6c08 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch \
            "
 
 SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
new file mode 100644
index 00000000000..4d7487c4f74
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
@@ -0,0 +1,38 @@
+From 95b0405338440cf5cd6d4b2b5c66cda8bf381b28 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Sep 2023 00:18:18 -0700
+Subject: [PATCH] lscpu: Use 4K buffer size instead of BUFSIZ
+
+Some lines in /proc/cpuinfo can be large e.g. flags and can then
+truncate them in displaying them
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
+ sys-utils/lscpu-cputype.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sys-utils/lscpu-cputype.c b/sys-utils/lscpu-cputype.c
+index 3fd5f7a3c..c8f72ab8a 100644
+--- a/sys-utils/lscpu-cputype.c
++++ b/sys-utils/lscpu-cputype.c
+@@ -462,7 +462,9 @@ static int cpuinfo_parse_cache(struct lscpu_cxt *cxt, int keynum, char *data)
+ int lscpu_read_cpuinfo(struct lscpu_cxt *cxt)
+ {
+ 	FILE *fp;
+-	char buf[BUFSIZ];
++	/* Used to be BUFSIZ which is small on some platforms e.g, musl,
++	 * therefore hardcode to 4K */
++	char buf[4096];
+ 	size_t i;
+ 	struct lscpu_cputype *ct;
+ 	struct cpuinfo_parser _pr = { .cxt = cxt }, *pr = &_pr;
+-- 
+2.42.0
+
-- 
2.42.0


