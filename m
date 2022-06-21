Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A4CCA486
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.48530.1655842615956589455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H6JhYzWY;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id o7so29864954eja.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rhpMGdwIXdZFTVXIBOCqEq43GofCswaJmbVG9NNx6CU=;
        b=H6JhYzWYQ9vCuZ7efbQ4ZuqpQnw087FZo9dWcY1pYg4uiHNz2o0KNzMYMdDDKQ96Jh
         i+wAHCejLGMgVKoJwHjWRR/tjcAhDrvd0owDB+4+lmaXxBFDLJhLRNl3JV0XJZgvv7kb
         yc97PagEU/LbcBYMmF9+aEUgSDRQamCvm5PVJW2JXugmUClJ0bUHJ1lqTSwaaPOudP+p
         LDBlISsB+reYg7nCtiDalUrktSQ0YZYg3v0EGH6GAikLM9jthhT/CdjBzL8I78z6MdbA
         +SAHeQUjuYQgSrvxizXrKNIc4f+GfMCzwzoWVE3GNtPwo3GgJIiTKF3Edy/8W77wmI1r
         hXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rhpMGdwIXdZFTVXIBOCqEq43GofCswaJmbVG9NNx6CU=;
        b=m1dJkH18OqgxFB/6ACXiUc9GMXW8CENf0J9ImtA9LWOgJOxYFmCH7/dRAmjUekiE1U
         QAgkO9T8RJzSFbpewEvLjOK18PSld1UN/aHWXSylD4njs0KhBH8o5+Yr1a58n3NbUjEh
         q6gcFOWhryT2rV35mXUxHk4wsdaGplTadlGU4wIbWiZzuS3BtOOmdYBtE+6U2hrrU43K
         BF/MxzMB5705C0Ze6zW3QG2IfHHuReqa8dTx1DwxNjjCyjA6bhi0Yo/J9YMCa3yG/ubW
         AZZRg+vVVeRlnMAcwMkMjWeVlEQ7thOrYItvATXTKLkcl+NxWwZswo2slzYrynaTw/lC
         sxng==
X-Gm-Message-State: AJIora8xK8Y1TahHAJ3XfUwyhfdPQRTFke2ScBJXJvXPTbA/IIWxn6G5
	LUsWImp0Qrm8OzqQY+NmoOD5VIZwVOpPcA==
X-Google-Smtp-Source: 
 AGRyM1vksfrbtk7XwswpcL3ZP7rnfm04cJrv6kaJ6s2hyey99jlzITl31Wp3htqU5USQWcTyWdUKww==
X-Received: by 2002:a17:906:b048:b0:6fe:be4a:3ecf with SMTP id
 bj8-20020a170906b04800b006febe4a3ecfmr27810307ejb.104.1655842614486;
        Tue, 21 Jun 2022 13:16:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/18] ell: update 0.50 -> 0.51
Date: Tue, 21 Jun 2022 22:16:28 +0200
Message-Id: <20220621201637.1378306-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167177

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-fix-time.h-related-breakage-on-musl.patch | 79 +++++++++++++++++++
 .../ell/{ell_0.50.bb => ell_0.51.bb}          |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
 rename meta/recipes-core/ell/{ell_0.50.bb => ell_0.51.bb} (82%)

diff --git a/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch b/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
new file mode 100644
index 0000000000..02b5a9f21e
--- /dev/null
+++ b/meta/recipes-core/ell/ell/0001-build-fix-time.h-related-breakage-on-musl.patch
@@ -0,0 +1,79 @@
+From cd9513a025174181b66ac13de45813f6e15727d3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Milan=20P=2E=20Stani=C4=87?= <mps@arvanta.net>
+Date: Mon, 6 Jun 2022 22:05:39 +0200
+Subject: [PATCH] build: fix time.h related breakage on musl
+
+missing time.h for struct timeval usage
+forward declaration of struct timeval in time-private.h
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ell/dhcp-transport.c  | 1 +
+ ell/dhcp6-transport.c | 1 +
+ ell/icmp6.c           | 1 +
+ ell/time-private.h    | 2 +-
+ ell/time.c            | 1 +
+ 5 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ell/dhcp-transport.c b/ell/dhcp-transport.c
+index ef030de..c4cf0ca 100644
+--- a/ell/dhcp-transport.c
++++ b/ell/dhcp-transport.c
+@@ -40,6 +40,7 @@
+ #include <linux/filter.h>
+ #include <net/if_arp.h>
+ #include <errno.h>
++#include <sys/time.h>
+ 
+ #include "io.h"
+ #include "util.h"
+diff --git a/ell/dhcp6-transport.c b/ell/dhcp6-transport.c
+index 30c425f..5ff6516 100644
+--- a/ell/dhcp6-transport.c
++++ b/ell/dhcp6-transport.c
+@@ -35,6 +35,7 @@
+ #include <net/if.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <sys/time.h>
+ 
+ #include "private.h"
+ #include "missing.h"
+diff --git a/ell/icmp6.c b/ell/icmp6.c
+index 368977f..7319903 100644
+--- a/ell/icmp6.c
++++ b/ell/icmp6.c
+@@ -36,6 +36,7 @@
+ #include <net/if.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <sys/time.h>
+ 
+ #include "private.h"
+ #include "useful.h"
+diff --git a/ell/time-private.h b/ell/time-private.h
+index 5295d94..83c23dd 100644
+--- a/ell/time-private.h
++++ b/ell/time-private.h
+@@ -19,7 +19,7 @@
+  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  *
+  */
+-
++struct timeval;
+ uint64_t _time_pick_interval_secs(uint32_t min_secs, uint32_t max_secs);
+ uint64_t _time_fuzz_msecs(uint64_t ms);
+ uint64_t _time_fuzz_secs(uint32_t secs, uint32_t max_offset);
+diff --git a/ell/time.c b/ell/time.c
+index 10e10b0..41e5725 100644
+--- a/ell/time.c
++++ b/ell/time.c
+@@ -26,6 +26,7 @@
+ 
+ #define _GNU_SOURCE
+ #include <time.h>
++#include <sys/time.h>
+ 
+ #include "time.h"
+ #include "time-private.h"
diff --git a/meta/recipes-core/ell/ell_0.50.bb b/meta/recipes-core/ell/ell_0.51.bb
similarity index 82%
rename from meta/recipes-core/ell/ell_0.50.bb
rename to meta/recipes-core/ell/ell_0.51.bb
index 243ac01530..806833bc7d 100644
--- a/meta/recipes-core/ell/ell_0.50.bb
+++ b/meta/recipes-core/ell/ell_0.51.bb
@@ -15,8 +15,9 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-build-fix-time.h-related-breakage-on-musl.patch \
            "
-SRC_URI[sha256sum] = "0fe51d51c6eddc2a2784092f1dfdd1143a5ef27f15c274ecfbadd680d3a72fd9"
+SRC_URI[sha256sum] = "ba86cfa4aaf10151443edd63a7687914465d969f5dda00a2c1fcb11bd85e417f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.30.2


