Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839AEE7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.28159.1735901135812185240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BgIGraZ0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43626213fffso76756955e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901134; x=1736505934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iS5z+rbGoSZdXoLRQGUPPkgXwWEEWGEjn5ZgBJjzUU=;
        b=BgIGraZ0EF5EHGu/dc/Flo/KDN7Kr+v7xt+pQPyl5U7hR+Ph2Xt54/GbwKPT4GrhMz
         UHRBji5oqY8Va1X8uSoJfVJ4KPuiiGfaR8W0kzWCuIbsL8zJaqGqlRXdf0ldKkcgjBFr
         pejVN5QpSEVptqjaBGSsxLiPK9EeWWYVVxNogsZxM1ztLdiDNSSJv6vcRq1Np/OkmTRg
         P4WQN0r8Kr7nNC0s8lN4Sn5BhpBTLn8GBTGnJWIAkQvkyJSdia49Rf9T+DeUNg1XvSMV
         hT++9/v3qBOsPL+juqhVgr0d4dirvbjcN2aaFyfZXgAJrNH6GjmqTMvfeNX+cnfGy2TV
         MtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901134; x=1736505934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iS5z+rbGoSZdXoLRQGUPPkgXwWEEWGEjn5ZgBJjzUU=;
        b=M/DjAnknIgrwU/quDWz2TYhLoesAqecKvYWe8DouglgXg9Q9ESqM4/7QcK8nZsVScR
         Bqnfp1UKf+SM70RmC4hAfFh6QdWC6BOF23nRswGnnyyjSEy1IymWW5K9SGCckC3vz2SN
         oBSCm1XNZAgGAn44VnPivfib88ysUBsGNgcxyvbCBf7owUtPrr6nTXAhuVpfVBDYEezs
         7Yhk1qbgOJlk6F9rxyTJkVLOtwI6JA82q1XIgQy+oa+Vh2dCKstWnNVnnyhPJqR7qsWT
         dz7S8pkBCHmOLLp6Dib4tFmThHloMc86IyZ4CTXONTHPLa+/dGoIY+uCKceEn9DJLxjY
         1oHg==
X-Gm-Message-State: AOJu0Yy6DrYr5YLr1EKaf2FWDzSkzyun0V68ES5EnMdu+oVkkYbd2LHY
	tayTwjLMBJ6syBGoroFOJd1FBAEfbfdA7dqRbKMW7Iu7PhqsNvnzcGLCNg==
X-Gm-Gg: ASbGncuV9rr2mcW0LPu6zarDoITIjmXz9j7BWkpcfv3Srs6++xgjmwgRnrldjUFquOj
	Y7FvEg1vwW+zIbkV7ZPsIWo+lhw8GhmTvXUT7/Y0rfJo016t86b8ggMlFDey8ATqjo61uiNsVGP
	UNzXGQOr9/CIJIQcP4XN7sY8q2l9vtgijZUGcjpUErvspWKriF0Mr1bNMPsMPaASdg0Wwmiidw3
	7t9TvROMBADi1cJDNSFnd8GYVylsp6gqx+iG948BWFexNEINaKWH4/KRVPAMVO/yh+4xbOSPb76
	MG1RiOzspUp072eWFg==
X-Google-Smtp-Source: AGHT+IE35bJU/Dnc8hlVbYHnR31TEMCQ2b/hyLWQCShODiYkz3rlTxlA/71Yf9LPBTiAvf2953l3ug==
X-Received: by 2002:a05:600c:3147:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-43669a22df3mr397387595e9.11.1735901134011;
        Fri, 03 Jan 2025 02:45:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/11] iproute2: update 6.11.0 -> 6.12.0
Date: Fri,  3 Jan 2025 11:45:18 +0100
Message-Id: <20250103104524.4053846-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209336

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nk.h-add-missing-include-for-htobe64.patch |  2 +-
 ...-ip-rearrange-and-prune-header-files.patch | 90 +++++++++++++++++++
 ...02-bridge-mst-fix-a-musl-build-issue.patch | 76 ----------------
 ...e-mst-fix-a-further-musl-build-issue.patch | 59 ------------
 ...{iproute2_6.11.0.bb => iproute2_6.12.0.bb} |  8 +-
 5 files changed, 93 insertions(+), 142 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.11.0.bb => iproute2_6.12.0.bb} (92%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 555d63b2403..03af400ecd2 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From f3c574b27000fd887cee84ab47adf23f767cbea1 Mon Sep 17 00:00:00 2001
+From 4dc0613e229f6b4a57beb00dde14ef319a2dcad8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
new file mode 100644
index 00000000000..2f779106142
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
@@ -0,0 +1,90 @@
+From 714291a63246cb3e6b86eb2a78fa84216d768a4b Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Tue, 10 Dec 2024 13:38:08 -0800
+Subject: [PATCH] ip: rearrange and prune header files
+
+The recent report of issues with missing limits.h impacting musl
+suggested looking at what files are and are not included in ip code.
+
+The standard practice is to put standard headers first, then system,
+then local headers. Used iwyu to get suggestions about missing
+and extraneous headers.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7e23da91fca6e5dedeb32a7d308cf20982e897c3]
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ip/iplink.c  | 13 +++++--------
+ ip/ipnetns.c | 19 +++++++++----------
+ 2 files changed, 14 insertions(+), 18 deletions(-)
+
+diff --git a/ip/iplink.c b/ip/iplink.c
+index e650a5c2..8df367ed 100644
+--- a/ip/iplink.c
++++ b/ip/iplink.c
+@@ -11,17 +11,14 @@
+ #include <fcntl.h>
+ #include <dlfcn.h>
+ #include <errno.h>
++#include <string.h>
++#include <strings.h>
++#include <limits.h>
++
+ #include <sys/socket.h>
++#include <arpa/inet.h>
+ #include <linux/if.h>
+-#include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+-#include <linux/sockios.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-#include <string.h>
+-#include <sys/ioctl.h>
+-#include <stdbool.h>
+-#include <linux/mpls.h>
+ 
+ #include "rt_names.h"
+ #include "utils.h"
+diff --git a/ip/ipnetns.c b/ip/ipnetns.c
+index 5c943400..a20cd8bc 100644
+--- a/ip/ipnetns.c
++++ b/ip/ipnetns.c
+@@ -1,21 +1,21 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ #define _ATFILE_SOURCE
+-#include <sys/file.h>
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <sys/wait.h>
+-#include <sys/inotify.h>
+-#include <sys/mount.h>
+-#include <sys/syscall.h>
++
+ #include <stdio.h>
++#include <stdint.h>
+ #include <string.h>
+-#include <sched.h>
+ #include <fcntl.h>
+ #include <dirent.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <ctype.h>
+-#include <linux/limits.h>
++#include <limits.h>
++
++#include <sys/file.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/inotify.h>
++#include <sys/mount.h>
+ 
+ #include <linux/net_namespace.h>
+ 
+@@ -23,7 +23,6 @@
+ #include "list.h"
+ #include "ip_common.h"
+ #include "namespace.h"
+-#include "json_print.h"
+ 
+ static int usage(void)
+ {
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
deleted file mode 100644
index 3e266b9298d..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-bridge-mst-fix-a-musl-build-issue.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 6a77abab92516e65f07f8657fc4e384c4541ce0e Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sun, 22 Sep 2024 16:50:10 +0200
-Subject: [PATCH] bridge: mst: fix a musl build issue
-
-This patch fixes a compilation error raised by the bump to version 6.11.0
-in Buildroot using musl as the C library for the cross-compilation
-toolchain.
-
-After setting the CFLGAS
-
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
-                        -D__UAPI_DEF_IPV6_MREQ=0
-endif
-
-to fix the following errors:
-
-In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
-                 from ../include/libnetlink.h:14,
-                 from mst.c:10:
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
-   23 | struct in6_addr {
-      |        ^~~~~~~~
-In file included from ../include/uapi/linux/if_bridge.h:19,
-                 from mst.c:7:
-../include/uapi/linux/in6.h:33:8: note: originally defined here
-   33 | struct in6_addr {
-      |        ^~~~~~~~
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
-   34 | struct sockaddr_in6 {
-      |        ^~~~~~~~~~~~
-../include/uapi/linux/in6.h:50:8: note: originally defined here
-   50 | struct sockaddr_in6 {
-      |        ^~~~~~~~~~~~
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
-   42 | struct ipv6_mreq {
-      |        ^~~~~~~~~
-../include/uapi/linux/in6.h:60:8: note: originally defined here
-   60 | struct ipv6_mreq {
-
-I got this further errors
-
-../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
-   72 |         struct in6_addr flr_dst;
-      |                         ^~~~~~~
-../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
-  711 |                         struct in6_addr ip6;
-      |                                         ^~~
-
-fixed by including the netinet/in.h header.
-
-Upstream-Status: Backport
-[https://kernel.googlesource.com/pub/scm/network/iproute2/iproute2/+/6a77abab92516e65f07f8657fc4e384c4541ce0e]
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- bridge/mst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mst.c b/bridge/mst.c
-index 873ca536..c8f7e660 100644
---- a/bridge/mst.c
-+++ b/bridge/mst.c
-@@ -4,6 +4,7 @@
-  */
-
- #include <stdio.h>
-+#include <netinet/in.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
-
---
-2.39.5 (Apple Git-154)
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch b/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
deleted file mode 100644
index 6a30f6dcf84..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0003-bridge-mst-fix-a-further-musl-build-issue.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 043ef90e2fa94397eb5c85330889ca4146a6d58a Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sun, 22 Sep 2024 16:50:11 +0200
-Subject: [PATCH] bridge: mst: fix a further musl build issue
-
-This patch fixes the following build errors:
-
-In file included from mst.c:11:
-../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      |                              ^~~~~~~
-../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
-   50 |                                     type value);                        \
-      |                                     ^~~~
-../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      |                              ^~~~~~~
-../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
-   55 |                                             type value)                 \
-      |                                             ^~~~
-../include/json_print.h: In function 'print_tv':
-../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
-   58 |                                                value);                  \
-      |                                                ^~~~~
-      |                                                |
-      |                                                const struct timeval *
-../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      | ^~~~~~~~~~~
-../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
-   50 |                                     type value);                        \
-      |                                          ^
-../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-
-Upstream-Status: Backport
-[https://kernel.googlesource.com/pub/scm/network/iproute2/iproute2/+/043ef90e2fa94397eb5c85330889ca4146a6d58a]
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- bridge/mst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mst.c b/bridge/mst.c
-index c8f7e660..fccb7fd6 100644
---- a/bridge/mst.c
-+++ b/bridge/mst.c
-@@ -4,6 +4,7 @@
-  */
-
- #include <stdio.h>
-+#include <sys/time.h>
- #include <netinet/in.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
---
-2.39.5 (Apple Git-154)
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb
similarity index 92%
rename from meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb
index 652484a94d1..741d54799d5 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb
@@ -13,14 +13,10 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
+           file://0001-ip-rearrange-and-prune-header-files.patch \
            "
 
-SRC_URI:append:libc-musl = "\
-           file://0002-bridge-mst-fix-a-musl-build-issue.patch \
-           file://0003-bridge-mst-fix-a-further-musl-build-issue.patch \ 
-           "
-
-SRC_URI[sha256sum] = "1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3"
+SRC_URI[sha256sum] = "bbd141ef7b5d0127cc2152843ba61f274dc32814fa3e0f13e7d07a080bef53d9"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.39.5


