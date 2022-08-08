Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ED3C28B2C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.22248.1659940977695670407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPjI2Y0i;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gk3so14780543ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R153imJcQRldgeZixbdr5r1E4bhXbQruGaDZxNUyn3k=;
        b=RPjI2Y0iNyXWlY28VM3zLAGPwIIjLa2Mhx13SmGicd8VXQe/v0N2DWEt/vqZszIz8K
         5gIkEoRVjxk5bmaP5qlyrr7u9DwuJn7/KMwkI92KVb7cdiRDxI0K03e7PMXyq6THcQZO
         NNT3T8vyW7j44CmufxDEDxkOCtux2eYkUi4KL4vReE7SkO2dl50ooHSdKdImS+IGL68Z
         cMybWNl6uDtwv9ele202Ch2Uh9yGZTEf3FNPMoOsfpJCanV+67fddj8aX8HsJ5Wmfjm7
         ejsJevr8wMmRcHSuXY2Br2pYV7N4uTLO1zf6eZzHZU7WEU+b5lsWHB3DjZvWafifPRY6
         oftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R153imJcQRldgeZixbdr5r1E4bhXbQruGaDZxNUyn3k=;
        b=4NQeyxiFAv+90HfXv/n/t/S2MCQir5EIIChmwwqHxoWMAs9GyfraVidrMwnJkMjLRD
         SLDLt6fXwMZHAclmRsBwrsZ9buY7qEcCyZtv+ZxjpceoFIyMYd+UVjA0zJ1zre7BvuQH
         BXWxy0b/+USiJ+dYdrVnZXVccr0vyX1MOrDW89ycsqvwvltkFp638/eYoTKM8hmFgpD3
         VRUDCNodixGtTIzxeVYLvNBDs8B7aKZ4olYGvKgiDHlx81vZgixWdZ73TsbWlRRkRTSj
         6pXL6i1j5ZYVgHtPKsLwnOBLo3kn7R8JeO6AfCmvzaqm0E5fgcK+4fZHaesCAwrRud/L
         rFZQ==
X-Gm-Message-State: ACgBeo0lHrbhURwRGuiBzSDFLoekM+WHNH4+qakOTDe6Ax1dPo54kLqO
	FezzfnT6b9N8abdSKK+XOGjYSEMDvQc=
X-Google-Smtp-Source: 
 AA6agR4V5laojzyQrnL/dsMfQfWygN1xpklQQQOjJfzUwJRV8dNBCfEBjTgxQotLx0BqXCxMzJ3jIg==
X-Received: by 2002:a17:907:2cc9:b0:730:93c8:4177 with SMTP id
 hg9-20020a1709072cc900b0073093c84177mr12187163ejc.494.1659940976231;
        Sun, 07 Aug 2022 23:42:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 17/44] ell: upgrade 0.51 -> 0.52
Date: Mon,  8 Aug 2022 08:42:10 +0200
Message-Id: <20220808064237.3975347-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169041

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-fix-time.h-related-breakage-on-musl.patch | 79 -------------------
 .../ell/{ell_0.51.bb => ell_0.52.bb}          |  6 +-
 2 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
 rename meta/recipes-core/ell/{ell_0.51.bb => ell_0.52.bb} (78%)

diff --git a/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch b/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
deleted file mode 100644
index 02b5a9f21e..0000000000
--- a/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From cd9513a025174181b66ac13de45813f6e15727d3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Milan=20P=2E=20Stani=C4=87?= <mps@arvanta.net>
-Date: Mon, 6 Jun 2022 22:05:39 +0200
-Subject: [PATCH] build: fix time.h related breakage on musl
-
-missing time.h for struct timeval usage
-forward declaration of struct timeval in time-private.h
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ell/dhcp-transport.c  | 1 +
- ell/dhcp6-transport.c | 1 +
- ell/icmp6.c           | 1 +
- ell/time-private.h    | 2 +-
- ell/time.c            | 1 +
- 5 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ell/dhcp-transport.c b/ell/dhcp-transport.c
-index ef030de..c4cf0ca 100644
---- a/ell/dhcp-transport.c
-+++ b/ell/dhcp-transport.c
-@@ -40,6 +40,7 @@
- #include <linux/filter.h>
- #include <net/if_arp.h>
- #include <errno.h>
-+#include <sys/time.h>
- 
- #include "io.h"
- #include "util.h"
-diff --git a/ell/dhcp6-transport.c b/ell/dhcp6-transport.c
-index 30c425f..5ff6516 100644
---- a/ell/dhcp6-transport.c
-+++ b/ell/dhcp6-transport.c
-@@ -35,6 +35,7 @@
- #include <net/if.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <sys/time.h>
- 
- #include "private.h"
- #include "missing.h"
-diff --git a/ell/icmp6.c b/ell/icmp6.c
-index 368977f..7319903 100644
---- a/ell/icmp6.c
-+++ b/ell/icmp6.c
-@@ -36,6 +36,7 @@
- #include <net/if.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <sys/time.h>
- 
- #include "private.h"
- #include "useful.h"
-diff --git a/ell/time-private.h b/ell/time-private.h
-index 5295d94..83c23dd 100644
---- a/ell/time-private.h
-+++ b/ell/time-private.h
-@@ -19,7 +19,7 @@
-  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-  *
-  */
--
-+struct timeval;
- uint64_t _time_pick_interval_secs(uint32_t min_secs, uint32_t max_secs);
- uint64_t _time_fuzz_msecs(uint64_t ms);
- uint64_t _time_fuzz_secs(uint32_t secs, uint32_t max_offset);
-diff --git a/ell/time.c b/ell/time.c
-index 10e10b0..41e5725 100644
---- a/ell/time.c
-+++ b/ell/time.c
-@@ -26,6 +26,7 @@
- 
- #define _GNU_SOURCE
- #include <time.h>
-+#include <sys/time.h>
- 
- #include "time.h"
- #include "time-private.h"
diff --git a/meta/recipes-core/ell/ell_0.51.bb b/meta/recipes-core/ell/ell_0.52.bb
similarity index 78%
rename from meta/recipes-core/ell/ell_0.51.bb
rename to meta/recipes-core/ell/ell_0.52.bb
index 806833bc7d..b2af0d04f0 100644
--- a/meta/recipes-core/ell/ell_0.51.bb
+++ b/meta/recipes-core/ell/ell_0.52.bb
@@ -14,10 +14,8 @@ DEPENDS = "dbus"
 
 inherit autotools pkgconfig
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-build-fix-time.h-related-breakage-on-musl.patch \
-           "
-SRC_URI[sha256sum] = "ba86cfa4aaf10151443edd63a7687914465d969f5dda00a2c1fcb11bd85e417f"
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "83099b14beda2b253a2c69460f9613c5e955b63349e3c00cf2fd506f5b3ba7d0"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.30.2


