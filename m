Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79F6CF2591
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 21:53:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.40901.1728856400693865494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 14:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAcaAZ7K;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47b38336so2145226f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 14:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728856398; x=1729461198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4+lOyR2QTVDtgIVxyySwBPeyCF739sNPAa44JxIl7Y=;
        b=XAcaAZ7KTHumeoFT8JTSFTfxTMzRccqTFpsgRU3lOf9Hibl+7o8orsVi0gzBN4XqIQ
         +/QyuyGHyD1V95mM/giwR+Gc1SpZ/qWT05ERI0JTZMX9+ehGnfV43tOY6rffVSNCu3vJ
         SNkGEB3NSogG45Y+AKlK2bli12f3Q3bHLqqYTpMpmfoAg99LF3IUl4qTtPSDNihYSVye
         qs9hTY3Cgq55VDMz6QIXO7wprZTnGwJ7+8CNpp1EREYHu1r6ylAv2fIXF6E9L/zlXvUr
         1MdVuWHLFfs7bZuyYRjw4/7hUS4sg9rrOTk0T0jjJMhb1xK/UCjWqh4vb9j4YL/3clZ7
         OVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728856398; x=1729461198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4+lOyR2QTVDtgIVxyySwBPeyCF739sNPAa44JxIl7Y=;
        b=VRzAv89YX2mCled0Z1AB9T0MXehQF+CAGbYgVlZh/bHcbq5mQYmhYQ6NlswTmtchTJ
         HUms2N5fzp+ZXUdHreZKyrZkDuzORYTaJsRbXPQsPvDeq9Tie97aQ5t+bOAsdPrZYMwA
         sJknLsgpg2CQ0IJ99Tc3ZGNZYezvoO1Hl/u92hzjfIS9HMRxYK9GY5/arFxcvGeEYYEU
         /kyn+JB9pSKJMrueGZ9SErJRCpe9ZFivq2E1SwYPl7fU1zPOMxXY7fINIyK1CbLeoo2Q
         BZ2XMoZSW2bxwOwtIsO582lTY+mYeccydmHHfmlWH/7dN1W3xMKpwhyJ+Icbppwb233Z
         HD/w==
X-Gm-Message-State: AOJu0YzhTO06CY3OAd615LDaLhoJUNmhP7xQYoQgeldER1/+VWA28uJA
	L0KVkdkuRvybmtKwBmSxiyJUH0BC+sn7OnCkGeb0/H5aUolrTJtPC0z7nA==
X-Google-Smtp-Source: AGHT+IHR8ZxVWbIsVjfc5mrgXuX9Fja7Edxu2Qk8H7AIj//f55XWD6PLgjPvrkE1snM+FX/0d0qo9w==
X-Received: by 2002:adf:ea51:0:b0:37d:4afe:8c9b with SMTP id ffacd0b85a97d-37d5531b500mr6739382f8f.54.1728856397783;
        Sun, 13 Oct 2024 14:53:17 -0700 (PDT)
Received: from localhost.localdomain (ip5f5af7df.dynamic.kabel-deutschland.de. [95.90.247.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79f679sm9694740f8f.73.2024.10.13.14.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 14:53:17 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iproute2: upgrade 6.10 -> 6.11
Date: Sun, 13 Oct 2024 21:52:51 +0000
Message-Id: <20241013215251.95050-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205730

This is regular release of iproute2 corresponding to the 6.11 kernel.
Most of the changes are to the man pages.
Release is smaller than usual less activity during summer vacations

The two musl build fixes have been backported from upstream.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...02-bridge-mst-fix-a-musl-build-issue.patch | 76 +++++++++++++++++++
 ...e-mst-fix-a-further-musl-build-issue.patch | 59 ++++++++++++++
 ...{iproute2_6.10.0.bb => iproute2_6.11.0.bb} |  7 +-
 3 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.10.0.bb => iproute2_6.11.0.bb} (92%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
new file mode 100644
index 0000000000..3e266b9298
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
@@ -0,0 +1,76 @@
+From 6a77abab92516e65f07f8657fc4e384c4541ce0e Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 16:50:10 +0200
+Subject: [PATCH] bridge: mst: fix a musl build issue
+
+This patch fixes a compilation error raised by the bump to version 6.11.0
+in Buildroot using musl as the C library for the cross-compilation
+toolchain.
+
+After setting the CFLGAS
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
+                        -D__UAPI_DEF_IPV6_MREQ=0
+endif
+
+to fix the following errors:
+
+In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
+                 from ../include/libnetlink.h:14,
+                 from mst.c:10:
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
+   23 | struct in6_addr {
+      |        ^~~~~~~~
+In file included from ../include/uapi/linux/if_bridge.h:19,
+                 from mst.c:7:
+../include/uapi/linux/in6.h:33:8: note: originally defined here
+   33 | struct in6_addr {
+      |        ^~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
+   34 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../include/uapi/linux/in6.h:50:8: note: originally defined here
+   50 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
+   42 | struct ipv6_mreq {
+      |        ^~~~~~~~~
+../include/uapi/linux/in6.h:60:8: note: originally defined here
+   60 | struct ipv6_mreq {
+
+I got this further errors
+
+../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
+   72 |         struct in6_addr flr_dst;
+      |                         ^~~~~~~
+../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
+  711 |                         struct in6_addr ip6;
+      |                                         ^~~
+
+fixed by including the netinet/in.h header.
+
+Upstream-Status: Backport
+[https://kernel.googlesource.com/pub/scm/network/iproute2/iproute2/+/6a77abab92516e65f07f8657fc4e384c4541ce0e]
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index 873ca536..c8f7e660 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+
+ #include <stdio.h>
++#include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+
+--
+2.39.5 (Apple Git-154)
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch b/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
new file mode 100644
index 0000000000..6a30f6dcf8
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
@@ -0,0 +1,59 @@
+From 043ef90e2fa94397eb5c85330889ca4146a6d58a Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 16:50:11 +0200
+Subject: [PATCH] bridge: mst: fix a further musl build issue
+
+This patch fixes the following build errors:
+
+In file included from mst.c:11:
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
+   50 |                                     type value);                        \
+      |                                     ^~~~
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
+   55 |                                             type value)                 \
+      |                                             ^~~~
+../include/json_print.h: In function 'print_tv':
+../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
+   58 |                                                value);                  \
+      |                                                ^~~~~
+      |                                                |
+      |                                                const struct timeval *
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      | ^~~~~~~~~~~
+../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
+   50 |                                     type value);                        \
+      |                                          ^
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+
+Upstream-Status: Backport
+[https://kernel.googlesource.com/pub/scm/network/iproute2/iproute2/+/043ef90e2fa94397eb5c85330889ca4146a6d58a]
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index c8f7e660..fccb7fd6 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+
+ #include <stdio.h>
++#include <sys/time.h>
+ #include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+--
+2.39.5 (Apple Git-154)
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
similarity index 92%
rename from meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
index 9f0c9aab59..652484a94d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
@@ -15,7 +15,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce"
+SRC_URI:append:libc-musl = "\
+           file://0002-bridge-mst-fix-a-musl-build-issue.patch \
+           file://0003-bridge-mst-fix-a-further-musl-build-issue.patch \ 
+           "
+
+SRC_URI[sha256sum] = "1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


