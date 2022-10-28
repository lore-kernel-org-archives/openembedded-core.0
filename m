Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2EFC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 19:57:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.1251.1666987030814967589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 12:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dycXFZOP;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id q9so15532779ejd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhLPaQl8UY8sVtkwG4yHf5BHy6jiWLa+WxiJYyAgrwU=;
        b=dycXFZOP3jqXeFeGq79y9g95IWXk2pwRkaah8so0+LhKNngi3oMI0ouC44w7a7f7vU
         7UUYPsZZ85eF/3i00bMSzvG5JADMrIlauAKcVM/WdMnVQ9p3Xlmo2u4+mchLtRV7AjDz
         ZE881SZ/4jTbuxFdJkg7QI78i6fgtAddUoIVrW98Wt28mlYwnMKAPWXSPWCNcU93UcNW
         Of+NZAz3cZ59Qo6x6dBRJMREK5W3sTyJDxj2BC4m5SYSCiRUCEYjRDdFZjgLLykviGem
         hLlCSuey60f3WN1+RUN7WYadcU9ygo8mf9Kt1nuyG1/wcnnjBh1fO4v9d3teSqIp+NB3
         3bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhLPaQl8UY8sVtkwG4yHf5BHy6jiWLa+WxiJYyAgrwU=;
        b=LRPRLISyHtHnuPJjzyG7Sl/nLbAJPAJAwVU8v2DF/USaGPnB93lBwURfdm6Wj6ted5
         0p74kaP2FvXnSF8dENQZKGXIUkhlYrrjFw1G6MmOTRcrQ6TyoRB9lUhyeyFbcVcAD8eQ
         yp1cjRM3/Vl79pUx8xJvROaLfKuswqpyQcaUpxtjNPLVg9uz7M/yx+NonOuFliXHmaqs
         7YhfFiYySxSfTl2Lg6xOC/cMDxtjTjRKJR5gIRl1fFHWEgtehvlpTrYAYRbOfEjzPgkN
         Ed28cZ1KgHWaz1vATn3FUZOv9ITYDD/9pk6BjIYljZsAZtSrRHTONj5FMFClQSF1r8Ul
         Gyow==
X-Gm-Message-State: ACrzQf3+n5lef+Rr2sl4tn0R4Yp0a6GB4kYk/DA3VsaHNq+/+CZGdVCY
	EiVyyyOJ2a2Ikh7H1npRBh3YPjVTkpI=
X-Google-Smtp-Source: AMsMyM4slQoBCS57OLrwB7tFK8pthdFpqcJqwrpcv9qRiktrUxGu63nactmICaXB9iMfQx/fi1lU7A==
X-Received: by 2002:a17:907:2c59:b0:78d:8e03:134 with SMTP id hf25-20020a1709072c5900b0078d8e030134mr902158ejc.310.1666987028810;
        Fri, 28 Oct 2022 12:57:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aea4e.dynamic.kabel-deutschland.de. [95.90.234.78])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090603c700b007ad86f86b4fsm2676587eja.69.2022.10.28.12.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:57:08 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] iproute2: upgrade 5.19.0 -> 6.0.0
Date: Fri, 28 Oct 2022 19:56:59 +0000
Message-Id: <20221028195659.4683-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 19:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172273

Two patches are in upstream.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...-_GNU_SOURCE-when-checking-for-setns.patch | 28 -------------------
 ...-add-an-include-where-MIN-is-defined.patch | 25 -----------------
 .../{iproute2_5.19.0.bb => iproute2_6.0.0.bb} |  4 +--
 3 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.19.0.bb => iproute2_6.0.0.bb} (92%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
deleted file mode 100644
index 04d44ef444..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dc837a6b4c2cad7f31cddfe56cd652e26baadc02 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 22:31:03 -0700
-Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
-
-glibc defines this function only as gnu extention
-
-Upstream-Status: Submitted [https://lore.kernel.org/netdev/20220811053440.778649-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure b/configure
-index 440facb..c02753b 100755
---- a/configure
-+++ b/configure
-@@ -191,6 +191,7 @@ check_ipt_lib_dir()
- check_setns()
- {
-     cat >$TMPDIR/setnstest.c <<EOF
-+#define _GNU_SOURCE
- #include <sched.h>
- int main(int argc, char **argv)
- {
--- 
-2.37.1
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
deleted file mode 100644
index edd73818ba..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c8a99f1035ec7b158a204f90e9a7ed3c0b1e3d52 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 5 Aug 2022 11:31:56 +0200
-Subject: [PATCH] ip/ipstats.c: add an include where MIN is defined
-
-Otherwise, non-glibc systems error out (e.g. on musl).
-
-Upstream-Status: Submitted [by email to stephen@networkplumber.org,netdev@vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ip/ipstats.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ip/ipstats.c b/ip/ipstats.c
-index 5cdd15a..1ac275b 100644
---- a/ip/ipstats.c
-+++ b/ip/ipstats.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0+
- #include <assert.h>
- #include <errno.h>
-+#include <sys/param.h>
- 
- #include "list.h"
- #include "utils.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb
similarity index 92%
rename from meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb
index 3cbf80a810..9373dba5f5 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb
@@ -13,11 +13,9 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch \
-           file://0001-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch \
            "
 
-SRC_URI[sha256sum] = "26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791"
+SRC_URI[sha256sum] = "523139e9e72aec996374fa2de74be4c53d2dd05589488934d21ff97bae19580a"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.17.1


