Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37D8CD4F25
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.16002.1695367487606817644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VRV+LNSH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-530ab2d9e89so2131718a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367486; x=1695972286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4DAHWz6elnzR2GWtWz4ahnhmiMgasyvyWikcWF2mjM=;
        b=VRV+LNSHd8U2IV8w9afykVu6xP0Q6VAFitbdZ2wnCl7ls5gaZkSGSNPlunBeNzftCk
         0GRG6nfnKhFX9UdEvBIREIrPW1XNMvlwTE/kK93tn9BXQfI38Jet6ctO/n0Fr8N3LYvP
         1CCcFBK5n91hPxf6CGt9mBklPYWe+0HtSc0mYTQ2pGhZjvm9N0VcCEce2pbaaypWiZVL
         jJcfMKLfj0X0IraFNqv5Ep0QX2A3ZsCssGa5kokpJbD3idj5J+KxR7lKZHD2ak0IxMiL
         6ONibMK0PiZWyCKzjoUeL85XhecElvt9gO4SP4cE0BxQy3lZ1Jo9KjAQdAxyIo/wIu5A
         iKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367486; x=1695972286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4DAHWz6elnzR2GWtWz4ahnhmiMgasyvyWikcWF2mjM=;
        b=INvTSJN3wTeBV9/aWqc8IZL64zj6b0zKwTCdcz/I+Z+t8l1eRSvP4/kNeIYjv4un3c
         EiaeAGUJRnDYC7TbDrmqpjbP0faORTxl0M5sg9ho4uv/rNXI5rFc2lAUz2VMoLv7AFfQ
         hphEkAf27o98txS+BCD55T37RSgkLeRWoK477tbuSN3a81ue0uZU9uXmNhrzmzVAvcwi
         IohWs5r7KhVY3gLvhWW16aYn6Hjq8tyGoh2uzZp6ldWS1liyS0v3TbzIUv+XvJjno1IY
         nWVHZ4cF+Hm9aSdJpdda1IQC3wTQIHtiGSxgSYdz+P5mg8HPB99AQB9jU4vMQ/8T8+BK
         1LQg==
X-Gm-Message-State: AOJu0YxcY/g+hjFJ7jjnR5Va877ckdXZYDsTnJHRQ1v8D8dyat891vhG
	bUxYvhZesHRHZfHgacHMvLpM3bhLEu8=
X-Google-Smtp-Source: AGHT+IFtDbTgbCYC9/UBnNxp9kiyao05w+VQx2kb6wQTDv5kJQn7cGqoei8LuOPXFc4FPaGm3W8R9g==
X-Received: by 2002:a17:906:846a:b0:9ae:7d2d:f2b0 with SMTP id hx10-20020a170906846a00b009ae7d2df2b0mr351993ejc.63.1695367485958;
        Fri, 22 Sep 2023 00:24:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/40] iproute2: upgrade 6.4.0 -> 6.5.0
Date: Fri, 22 Sep 2023 09:24:09 +0200
Message-Id: <20230922072431.1481743-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188061

Set CONF_USR_DIR explicitly as upstream hardcodes 'lib' in it.

Fix up iproute2-ip packaging to reflect that, and fix multilib error
where the executable would end up in the main package.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-bridge-mdb.c-include-limits.h.patch  | 41 -------------------
 .../{iproute2_6.4.0.bb => iproute2_6.5.0.bb}  |  6 +--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.4.0.bb => iproute2_6.5.0.bb} (93%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
deleted file mode 100644
index f9a0e35d83a..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 20 Jul 2023 14:32:23 -0400
-Subject: [PATCH] bridge/mdb.c: include limits.h
-
-Upstream-Status: Submitted
-(https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/)
-
-While building iproute2 6.4.0 with musl using Yocto Project, errors such
-as the following were encountered:
-
-| mdb.c: In function 'mdb_parse_vni':
-| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
-|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
-|       |                                               ^~~~~~~~~
-| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
-
-Include limits.h in bridge/mdb.c to fix this issue. This change is based
-on one in Alpine Linux, but the author there had no plans to submit:
-https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- bridge/mdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mdb.c b/bridge/mdb.c
-index fbb4f704..18793458 100644
---- a/bridge/mdb.c
-+++ b/bridge/mdb.c
-@@ -15,6 +15,7 @@
- #include <string.h>
- #include <arpa/inet.h>
- #include <netdb.h>
-+#include <limits.h>
- 
- #include "libnetlink.h"
- #include "utils.h"
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
similarity index 93%
rename from meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
index 32e2f8176bf..2b28b10c20e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-bridge-mdb.c-include-limits.h.patch \
            "
 
-SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
+SRC_URI[sha256sum] = "a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463"
 
 inherit update-alternatives bash-completion pkgconfig
 
@@ -37,6 +36,7 @@ EXTRA_OEMAKE = "\
     DOCDIR=${docdir}/iproute2 \
     SUBDIRS='${IPROUTE2_MAKE_SUBDIRS}' \
     SBINDIR='${base_sbindir}' \
+    CONF_USR_DIR='${libdir}/iproute2' \
     LIBDIR='${libdir}' \
     CCOPTS='${CFLAGS}' \
 "
@@ -82,7 +82,7 @@ FILES:${PN}-lnstat = "${base_sbindir}/lnstat \
                       ${base_sbindir}/ctstat \
                       ${base_sbindir}/rtstat"
 FILES:${PN}-ifstat = "${base_sbindir}/ifstat"
-FILES:${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
+FILES:${PN}-ip = "${base_sbindir}/ip.* ${libdir}/iproute2"
 FILES:${PN}-genl = "${base_sbindir}/genl"
 FILES:${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES:${PN}-nstat = "${base_sbindir}/nstat"
-- 
2.30.2


