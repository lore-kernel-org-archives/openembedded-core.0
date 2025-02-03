Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AF7C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.92650.1738600906993986933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bYFBeJRW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so54751035e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600905; x=1739205705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEnwIEVRcILOkOMCmSCTv7nEM3cRUfVrDQBU8EmgYoc=;
        b=bYFBeJRWB6PfqcK06nwP+tGV2Gw/0GpNK9z8dRr4b207HfTQ9RFxtJz/Ot3M89vB34
         cc8+nBBpjP5m4rCaTJh0+4LazZ/7mRM9//lQveHlPFLSxjh2yps3pQpo5B2tjf9Tfb8Q
         kKpGA6nHfsxjNMEdi8uVYb1wL7QYL+MBPJhoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600905; x=1739205705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEnwIEVRcILOkOMCmSCTv7nEM3cRUfVrDQBU8EmgYoc=;
        b=UGMlunKjqKg7oelHwa7fvZI6OLmtDvUh76t6QmS57amgkc98L1+QSDJloPjRvxHU/v
         KHvVKaBF/0WzLpgsZCPbLu5MHnNoMTb1QYvn6NZ/R3M87j+xKfc6ypZjF0wlolLvc9pC
         ByHqw5dVLNz1aCvNqyE5gJ4Iiz8qLOJVYwJ104ysD0jL6ytgRkS0nCWFmKlMTyFLMeTX
         VavS8rQUz+W0gNqRpEvL+jdjSLmTZ0C5zSKKEZbGuRfLuMHMzWsZ10z46+Zf8i1AlOw+
         66+6OYFhUFTUQY1nbB7E4ojU6njaTWaMhQHyWgYOrHmSUn6MwPrwiP3wjYP8sAn5ymus
         14Jw==
X-Gm-Message-State: AOJu0YyUPjt+Co+QiSSB2A25mKOd5bTcs6x1rVNrT3vnbm5i8ROm2WXT
	tQEbzRpnDIawUzPVM8LgzN/C4UTiht12Bp7VDDAC+CY7lEDcoUtqNW+ZzZFp04Tj1mX6TwkgR68
	x
X-Gm-Gg: ASbGnctLoGY4H3pY4JBPEZCdCHNwsZ+mjo7hfcwiLRczy1fV54QXfH6O/ZXJsSjGNow
	mEACh4GtgaHBl5ty/Czs2CcRdSNZu/fBvbVo9DBdL0OAg/BjGMKr1zlO/7Ya/GDMsdKkzJxev/D
	cKeE5U7U7JPYeDW3V6XALmycPKIvRwAouft81b6Ye6uYi+V+XWsIhYhWgGTstCO//OCpi17jMbx
	G95SeMwQ21BTDf2MgpdScaAjwOpA5DxKeCQw9J9SJckR4j3yWSr5BZTxwEZJRA1IgJFs6Z6WDAK
	aTXCCKinfCRB+8hT3xrHXxXg1GtrCqhr5eLsLcLkCufm
X-Google-Smtp-Source: AGHT+IEvauipRm/UcZ2J8KOWaTyXL/X4fWeADANlPdvBupnxrEo5Pibtpaq6/LmzQMB6ddvhWrN0ig==
X-Received: by 2002:a05:600c:a45:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-438dc3ca7aamr225585815e9.13.1738600904992;
        Mon, 03 Feb 2025 08:41:44 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <auh@yoctoproject.org>
Subject: [PATCH 14/46] iproute2: upgrade 6.12.0 -> 6.13.0
Date: Mon,  3 Feb 2025 16:40:58 +0000
Message-ID: <20250203164130.3403325-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210687

From: Upgrade Helper <auh@yoctoproject.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nk.h-add-missing-include-for-htobe64.patch |  6 +-
 ...-ip-rearrange-and-prune-header-files.patch | 90 -------------------
 ...{iproute2_6.12.0.bb => iproute2_6.13.0.bb} |  3 +-
 3 files changed, 4 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.12.0.bb => iproute2_6.13.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 03af400ecd2..f1746c5096e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 4dc0613e229f6b4a57beb00dde14ef319a2dcad8 Mon Sep 17 00:00:00 2001
+From 5b3a2008631c7ab09252335fad42c2d347b7691d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/include/libnetlink.h b/include/libnetlink.h
-index 30f0c2d..77e8181 100644
+index 7074e91..3dbfa42 100644
 --- a/include/libnetlink.h
 +++ b/include/libnetlink.h
-@@ -12,6 +12,7 @@
+@@ -13,6 +13,7 @@
  #include <linux/neighbour.h>
  #include <linux/netconf.h>
  #include <arpa/inet.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
deleted file mode 100644
index 2f779106142..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-rearrange-and-prune-header-files.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 714291a63246cb3e6b86eb2a78fa84216d768a4b Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Tue, 10 Dec 2024 13:38:08 -0800
-Subject: [PATCH] ip: rearrange and prune header files
-
-The recent report of issues with missing limits.h impacting musl
-suggested looking at what files are and are not included in ip code.
-
-The standard practice is to put standard headers first, then system,
-then local headers. Used iwyu to get suggestions about missing
-and extraneous headers.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7e23da91fca6e5dedeb32a7d308cf20982e897c3]
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ip/iplink.c  | 13 +++++--------
- ip/ipnetns.c | 19 +++++++++----------
- 2 files changed, 14 insertions(+), 18 deletions(-)
-
-diff --git a/ip/iplink.c b/ip/iplink.c
-index e650a5c2..8df367ed 100644
---- a/ip/iplink.c
-+++ b/ip/iplink.c
-@@ -11,17 +11,14 @@
- #include <fcntl.h>
- #include <dlfcn.h>
- #include <errno.h>
-+#include <string.h>
-+#include <strings.h>
-+#include <limits.h>
-+
- #include <sys/socket.h>
-+#include <arpa/inet.h>
- #include <linux/if.h>
--#include <linux/if_packet.h>
- #include <linux/if_ether.h>
--#include <linux/sockios.h>
--#include <netinet/in.h>
--#include <arpa/inet.h>
--#include <string.h>
--#include <sys/ioctl.h>
--#include <stdbool.h>
--#include <linux/mpls.h>
- 
- #include "rt_names.h"
- #include "utils.h"
-diff --git a/ip/ipnetns.c b/ip/ipnetns.c
-index 5c943400..a20cd8bc 100644
---- a/ip/ipnetns.c
-+++ b/ip/ipnetns.c
-@@ -1,21 +1,21 @@
- /* SPDX-License-Identifier: GPL-2.0 */
- #define _ATFILE_SOURCE
--#include <sys/file.h>
--#include <sys/types.h>
--#include <sys/stat.h>
--#include <sys/wait.h>
--#include <sys/inotify.h>
--#include <sys/mount.h>
--#include <sys/syscall.h>
-+
- #include <stdio.h>
-+#include <stdint.h>
- #include <string.h>
--#include <sched.h>
- #include <fcntl.h>
- #include <dirent.h>
- #include <errno.h>
- #include <unistd.h>
- #include <ctype.h>
--#include <linux/limits.h>
-+#include <limits.h>
-+
-+#include <sys/file.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <sys/inotify.h>
-+#include <sys/mount.h>
- 
- #include <linux/net_namespace.h>
- 
-@@ -23,7 +23,6 @@
- #include "list.h"
- #include "ip_common.h"
- #include "namespace.h"
--#include "json_print.h"
- 
- static int usage(void)
- {
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
index 741d54799d5..f2ed3811324 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.12.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
-           file://0001-ip-rearrange-and-prune-header-files.patch \
            "
 
-SRC_URI[sha256sum] = "bbd141ef7b5d0127cc2152843ba61f274dc32814fa3e0f13e7d07a080bef53d9"
+SRC_URI[sha256sum] = "a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819"
 
 inherit update-alternatives bash-completion pkgconfig
 

