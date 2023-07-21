Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C70EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:48:20 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.6325.1689943692095034782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=YTXOQvWk;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-765942d497fso171304585a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689943691; x=1690548491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=00qDcsrNwYDQW6h/JmcRgYIa/fQyl6CIO+khrGUIaek=;
        b=YTXOQvWkYckXXiZLxoLFZzxdRU2VRIbr79ZQ0OupqNTIjdMloSJlgEwrdSSCNUZU+t
         mYnU76OKt1DH0qdpX5w5HP71M2sYaTGBUN7+EUSCGuquKRX+vgPKDU6tk7iJNWMkCIOV
         TkvAT5Rd71eJhMdJsiGS+rne1wy5/qeespdKe5G5t/lwxVJYPj9XvPtnvIjGG9jSV0JS
         DehAuHdsx/qygaR6iei68RusfGyrI1J+yqMG77uDfZ0xRVRApnHIjh3VHAFr1w6e2KYd
         wwFf0O5vdc81mmLbB1r8qVil7VWgyaSVjARBZWKei14iLi51rhjpQujZWhlQGH839Bi/
         jMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689943691; x=1690548491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00qDcsrNwYDQW6h/JmcRgYIa/fQyl6CIO+khrGUIaek=;
        b=e4b3mYn7RFun/Z+b3qo9hiQs2X9iilA2TIexsA6yN28Hs8iyb+d8Zxv9TGtVQlMlYG
         TliKQSVFQPAy/o5K9UxzPm0FOjVm/hthjz3e/RfrXz4qbH+aN0bx3yWlt5vBw7TVuhWw
         YPqFBwng95Bju9/OdWoWJzlNFsM2yn1W612SY9+VWXQ4ZH3y8B9+D6kHMHVsnWUpd1Ew
         fodWtiGNRmS8Kxid7u/QUs0U6q11I3ELAe34HRPjK49EzPd3WwSRVEWUjkjRdIWzNyGG
         X3/GFpf9dneVCXkKkG7AQvvfrRjntgLW+OfUewIrMYveL6mTspOXlWXFarouTRRbi8gW
         0yGw==
X-Gm-Message-State: ABy/qLYsxB6rbkc+giBQzpYxwCZBSB3Tw7V8t2+t/3Wnea7eB4BL0KKW
	6xqs6oHPD1kZ/D/PceI/8TGTDBWIMcGww33cZ68=
X-Google-Smtp-Source: APBJJlGrjmMWt4hS6K3OF5UmiImG5sLNtX4IGHRjScbcs8MmNxW/sbRUnujqOHZbq2s/tuwyXbOxCw==
X-Received: by 2002:a05:620a:470f:b0:765:a651:a60f with SMTP id bs15-20020a05620a470f00b00765a651a60fmr1844187qkb.60.1689943690780;
        Fri, 21 Jul 2023 05:48:10 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id u9-20020ae9c009000000b0076750a5503csm1066578qkk.63.2023.07.21.05.48.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 05:48:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] iproute2: upgrade 6.3.0 -> 6.4.0
Date: Fri, 21 Jul 2023 08:48:09 -0400
Message-ID: <20230721124809.2324399-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184694

Changelog: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/

Added a patch for including limits.h with musl builds, or else
we get failures such as:

| mdb.c: In function 'mdb_parse_vni':
| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
|       |                                               ^~~~~~~~~
| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 modifies the included patch to reflect that it has been submitted to
the upstream iproute2 project.

 .../0001-bridge-mdb.c-include-limits.h.patch  | 41 +++++++++++++++++++
 .../{iproute2_6.3.0.bb => iproute2_6.4.0.bb}  |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
new file mode 100644
index 0000000000..f9a0e35d83
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
@@ -0,0 +1,41 @@
+From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Thu, 20 Jul 2023 14:32:23 -0400
+Subject: [PATCH] bridge/mdb.c: include limits.h
+
+Upstream-Status: Submitted
+(https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/)
+
+While building iproute2 6.4.0 with musl using Yocto Project, errors such
+as the following were encountered:
+
+| mdb.c: In function 'mdb_parse_vni':
+| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
+|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
+|       |                                               ^~~~~~~~~
+| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
+
+Include limits.h in bridge/mdb.c to fix this issue. This change is based
+on one in Alpine Linux, but the author there had no plans to submit:
+https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ bridge/mdb.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mdb.c b/bridge/mdb.c
+index fbb4f704..18793458 100644
+--- a/bridge/mdb.c
++++ b/bridge/mdb.c
+@@ -15,6 +15,7 @@
+ #include <string.h>
+ #include <arpa/inet.h>
+ #include <netdb.h>
++#include <limits.h>
+ 
+ #include "libnetlink.h"
+ #include "utils.h"
+-- 
+2.41.0
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
index 892fa854da..32e2f8176b 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
@@ -13,9 +13,10 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
+           file://0001-bridge-mdb.c-include-limits.h.patch \
            "
 
-SRC_URI[sha256sum] = "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
+SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.41.0


