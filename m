Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C9FEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 19:26:29 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.1068.1689881182856913262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 12:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=B8buD1zg;
 spf=pass (domain: baylibre.com, ip: 209.85.217.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-440ac4b44a8so493686137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689881181; x=1690485981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVDeUOAREtK0ZWBpD0+WEWySNHF7OyYxomCsEaDQAjE=;
        b=B8buD1zgBZnCO0qXG6NiIjXawtY5mtUegd7Xdmq3tQdVp7THdTHudK5co/tSWK3Nn3
         lLFKYjmqWlna9VmQtraVyHSV+OsXT4IdTsniLQe+fmwCKfwhs79rrMFKPo4Ciz/gkUOw
         wZP0gNGWGJR+5hmpz2K5ab5SGeaCKXT9FLO3R5EZqLqrC3Uxu0iUhduvGsc32tiSS7RD
         ht2dl8EOcurHd1nKvrzvJQrKjLTdY3rAci6PNyQ2HHqaJXZnWvHiwyMJ8qW61B4sZpiJ
         4zxj+FYMP6PBdhfZ0Tdv9FzybXOq0ABmEZkD33QDyeZ0Hljr+AU20Jw1qckzc1CpSsUo
         xyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881181; x=1690485981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVDeUOAREtK0ZWBpD0+WEWySNHF7OyYxomCsEaDQAjE=;
        b=OLvcgi45lyeLXIi8GXFd+8PqhwGMCr+F1jibFlz2JaHPNMZbc2P7G3M+Hi2WR8LTZx
         Zh71DNZ7CFZCeC1AS2+iBUJ+c8Ca0Rv2xqM6Egwfy/zprrHV9XNd4GhcWcN1yu3FXhdC
         pLi8/h+lqCXTZ6O3ZtLCNZlx/BsJxmhYs24uvcawe5rFYMJqDnNhNo7pJFbiMXFZya0X
         5k2PhNblSHTHyXtMq9MI8+mvwWp0Z6+JTk+SyMoNGoFbW0GPk4or6q7KoskNrh+J4GZV
         sx7wocSdvjdBggGBX8WAfARpB9ezTVO62d+OyOzvxMWv5iOLZ9wjPayoe4bkM0tRZfmB
         ThJA==
X-Gm-Message-State: ABy/qLbovjySBw0ZH1nNJo9XXNFg7HLSmZyrewrW9VoNDqLs4mELHK9J
	JJrGdImLBRtIhCztI5gUT+gVUXrL+PMq4L5Q/hk=
X-Google-Smtp-Source: APBJJlFdtC60hvibhl23RARuC3CrZq76rXJcrtu5sVDruhSqDn33eYtGuVjluYMkrh2NGnx0vvgdeA==
X-Received: by 2002:a05:6102:3641:b0:443:92a5:f454 with SMTP id s1-20020a056102364100b0044392a5f454mr4416904vsu.26.1689881181461;
        Thu, 20 Jul 2023 12:26:21 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id g22-20020a05620a13d600b00767b7375eadsm571039qkl.39.2023.07.20.12.26.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:26:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iproute2: upgrade 6.3.0 -> 6.4.0
Date: Thu, 20 Jul 2023 15:26:20 -0400
Message-ID: <20230720192620.1853222-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 19:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184656

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
 .../0001-bridge-mdb.c-include-limits.h.patch  | 31 +++++++++++++++++++
 .../{iproute2_6.3.0.bb => iproute2_6.4.0.bb}  |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
new file mode 100644
index 0000000000..0330163ae5
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
@@ -0,0 +1,31 @@
+From 3d6fee6b55992d185f3af4f254b86ea1ac11acfe Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Thu, 20 Jul 2023 14:32:23 -0400
+Subject: [PATCH] bridge/mdb.c: include limits.h
+
+Upstream-Status: Pending
+
+Based on
+https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069,
+but the author has no plans to submit it upstream.
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


