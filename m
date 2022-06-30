Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352E7CCA480
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:52 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.27230.1656606225068557096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vJyHryzM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id m14so17474059plg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fF8k5f5bM7j4obN3txkWBMpiIGGYy4BrJbv+uPJvASU=;
        b=vJyHryzM4Wzw9jCdzNUMgvBLHoUuxPVuTCpj9g2EIu2mXzQNAZ0qbDTsMENWlEZZoI
         jGq2z8t4162rkZ8QlWlaqb44ywx3YfmGAmBYuyDvUmcnUHk+5bEQwVi7xcCZQ76GOrTr
         tfyLZFeLyowU6AHbQ8tKeLqEwv7OC+dOGEyKX1sXpJ2rzU5C7d5H8RcLFN2ylYNq01PH
         HQj5SzkiS7Xe31hQOKfwEsCQ+IgWl2Qrl0oCewa+daMfFs2SxzP468IvlhcU2cv7Z5Pi
         /M1CoA+UcGn88CjReuGFLUV7Sf5T6ceVQNv5wjGuxFFKiq+CtelxyLHHTp08qEEgtv5b
         EFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fF8k5f5bM7j4obN3txkWBMpiIGGYy4BrJbv+uPJvASU=;
        b=L1dKTEkRqxp85ZRZt5v6F3DGzsYuju7NgXmm8rgc6elvLINMsQiHCnZNLBNOQ4Ur1/
         kO3g1zMcfvuqKGYzo1NagHb2H0GZShSQBvHOxsaBpsDkNtedbAQ3kFFnD3qE7gXDZ4HM
         hblfEDzSRj/G/ALk6rHrmK0bQldYDtav28Pcqlok7BrAkIq0Mc+gEgs8jdZyiOuBdLmd
         hVyt9krDW4PZjGWYYux7PfmEOI4e2VWfMfvzcOVQT/eSPql7CnvbvSNfGdcNhYKhFc0H
         4ZpPnEvqhzyh/VHlF+TKzRcboNLR/K+GXterTGnRRnZa5ueJeDu3Xh7MYHbUy7qkofAJ
         LcmQ==
X-Gm-Message-State: AJIora/ogL/jCVintC4LweMgRDKwkQVW1zVLmhr/yX8Lo2+BPvSQpG0e
	Y5wQkZ2ZMberhE0ZJSYWWQJ8B+GezEGDGUSz
X-Google-Smtp-Source: 
 AGRyM1t3rW5YtkWUk2nwDIP1mG0q38CDESMafuBRMrFyxOUpq1fttMA/q9o3cCOZANzkJqoY9yC88g==
X-Received: by 2002:a17:90a:ea07:b0:1ec:fe4f:f850 with SMTP id
 w7-20020a17090aea0700b001ecfe4ff850mr10991034pjy.59.1656606223856;
        Thu, 30 Jun 2022 09:23:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] lttng-modules: Backport Linux 5.18+,
 5.15.44+, 5.10.119+ fixes
Date: Thu, 30 Jun 2022 06:23:09 -1000
Message-Id: 
 <9f301f5563df868626d624c2d0781dae1b81a4c0.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167425

From: Marek Vasut <marex@denx.de>

The Linux kernel commit 14c174633f349 ("random: remove unused tracepoints")
removed unused tracepoints and has been backported to stable Linux kernel
releases. This causes build failure of lttng-modules:

"
lttng-modules-2.11.6/probes/lttng-probe-random.c:18:10: fatal error: trace/events/random.h: No such file or directory
|    18 | #include <trace/events/random.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
"

Backport patches from lttng-modules master branch to address the build
failure on all of Linux 5.18.y, 5.15.y 5.10.y, 5.4, 4.19, 4.14, and 4.9 kernel versions.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ndom-remove-unused-tracepoints-v5.18.patch | 46 +++++++++++++++++
 ...emove-unused-tracepoints-v5.10-v5.15.patch | 45 ++++++++++++++++
 ...racepoints-removed-in-stable-kernels.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.11.6.bb             |  3 ++
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch
new file mode 100644
index 0000000000..3fc7fd733d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch
@@ -0,0 +1,46 @@
+From 25b70c486bb96de0caf7cea1da42ed07801cca84 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 14:33:42 -0400
+Subject: [PATCH 17/19] fix: random: remove unused tracepoints (v5.18)
+
+See upstream commit :
+
+  commit 14c174633f349cb41ea90c2c0aaddac157012f74
+  Author: Jason A. Donenfeld <Jason@zx2c4.com>
+  Date:   Thu Feb 10 16:40:44 2022 +0100
+
+    random: remove unused tracepoints
+
+    These explicit tracepoints aren't really used and show sign of aging.
+    It's work to keep these up to date, and before I attempted to keep them
+    up to date, they weren't up to date, which indicates that they're not
+    really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Backport [369d82bb1746447514c877088d7c5fd0f39140f8]
+Change-Id: I3b8c3e2732e7efdd76ce63204ac53a48784d0df6
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 3ae2d39e..58da82b8 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -215,8 +215,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
+   CFLAGS_lttng-probe-printk.o += -Wframe-larger-than=2200
+ endif
+ 
++# Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ $(VERSION) -ge 4 \
++    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
++      -a \
++      $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge 2 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge 9 \) \
+-- 
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
new file mode 100644
index 0000000000..5c324a9bde
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
@@ -0,0 +1,45 @@
+From da956d1444139883f5d01078d945078738ffade4 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 2 Jun 2022 06:36:08 +0000
+Subject: [PATCH 18/19] fix: random: remove unused tracepoints (v5.10, v5.15)
+
+The following kernel commit has been back ported to v5.10.119 and v5.15.44.
+
+commit 14c174633f349cb41ea90c2c0aaddac157012f74
+Author: Jason A. Donenfeld <Jason@zx2c4.com>
+Date:   Thu Feb 10 16:40:44 2022 +0100
+
+  random: remove unused tracepoints
+
+  These explicit tracepoints aren't really used and show sign of aging.
+  It's work to keep these up to date, and before I attempted to keep them
+  up to date, they weren't up to date, which indicates that they're not
+  really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Backport [1901e0eb58795e850e8fdcb5e1c235e4397b470d]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I0b7eb8aa78b5bd2039e20ae3e1da4c5eb9018789
+---
+ probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 58da82b8..87f2d681 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -217,7 +217,10 @@ endif
+ 
+ # Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
++    if [ \( ! \( $(VERSION) -ge 6 \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
+       -a \
+       $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+-- 
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch b/meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch
new file mode 100644
index 0000000000..73ba4d06bc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch
@@ -0,0 +1,51 @@
+From 2c98e0cd03eba0aa935796bc7413c51b5e4b055c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 31 May 2022 15:24:48 -0400
+Subject: [PATCH 19/19] fix: 'random' tracepoints removed in stable kernels
+
+The upstream commit 14c174633f349cb41ea90c2c0aaddac157012f74 removing
+the 'random' tracepoints is being backported to multiple stable kernel
+branches, I don't see how that qualifies as a fix but here we are.
+
+Use the presence of 'include/trace/events/random.h' in the kernel source
+tree instead of the rather tortuous version check to determine if we
+need to build 'lttng-probe-random.ko'.
+
+Upstream-Status: Backport [ed1149ef88fb62c365ac66cf62c58ac6abd8d7e8]
+Change-Id: I8f5f2f4c9e09c61127c49c7949b22dd3fab0460d
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ probes/Kbuild | 16 ++++------------
+ 1 file changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 87f2d681..f09d6b65 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -216,18 +216,10 @@ ifneq ($(CONFIG_FRAME_WARN),0)
+ endif
+ 
+ # Introduced in v3.6, remove in v5.18
+-obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
+-      -a \
+-      $(VERSION) -ge 4 \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge 2 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge 9 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 0 -a $(SUBLEVEL) -ge 41 \) ] ; then \
+-      echo "lttng-probe-random.o" ; fi;)
++random_dep = $(srctree)/include/trace/events/random.h
++ifneq ($(wildcard $(random_dep)),)
++  obj-$(CONFIG_LTTNG) += lttng-probe-random.o
++endif
+ 
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+   if [ $(VERSION) -ge 4 \
+-- 
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
index 3145f0298c..76b9f13618 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -28,6 +28,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0014-Revert-fix-include-order-for-older-kernels.patch \
            file://0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch \
            file://0016-fix-adjust-version-range-for-trace_find_free_extent.patch \
+           file://0017-fix-random-remove-unused-tracepoints-v5.18.patch \
+           file://0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
+           file://0019-fix-random-tracepoints-removed-in-stable-kernels.patch \
            "
 
 SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
-- 
2.25.1


