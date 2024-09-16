Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57147C3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 09:41:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4793.1726479657295391377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 02:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4hjFjQS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb806623eso35741835e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726479654; x=1727084454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEKqyW2H4KxnHqXFlEObe7uJeQpUm0YLnvRjPEwgUUo=;
        b=j4hjFjQSY/Q1gTs0wQ+Uhr0mclXWtcJ1wfnWMhTRelz9oRqmX+oZuvPzEm9NokBBrj
         FetheE/eVgh9RgsoBOhbMoCIIvjgfiB2+dXlkyDDg8RyAvhv4Pe4bVVkZfqdrnYeUUgx
         8jy2Qn/rytLYmPtpdkl16G3xUo9K/FuKgMCnJbqc0C9J6PHkwKDKxuJ5+KJOQES+Kl4X
         3jsQQSlhiOEsdkD+c+Rq4pF5lDmXPODUGcMcW6IJ5Lb01a6QPE82QZhoQgBlX/Qwme7l
         N0Cc3hOl5afrU9MQicNlzblvuwOo2wLP+BDct3ZX+RRO9GjeYwrqtM1pNbsskCYYF4oE
         Y7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726479654; x=1727084454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEKqyW2H4KxnHqXFlEObe7uJeQpUm0YLnvRjPEwgUUo=;
        b=LvZqzrPhj06wqwMg+ZhhAtCfq6lsKHAMk6uu+t1sWJF4Hx7O36ccNgB1dU5xWlV1PR
         gj5WcZ1w/uR1BagxrJy/6Co4sd5aoMzs5TkJPN3IPLMy0datxbhXNHJOGyHirm2WEaaC
         +qGMHpnPkq2cd2C2oT/I/NmxL/rsjYZXZ2d91gkv8yhUp/V5MKzHr0bBnR4ck+e11RFh
         BQtAPH6c6xIWkEyh/CQtOv5mxs0B8rWQ1G7wJPyKQgA4Me7U+FQBfVSnJJhzRCz1r8/R
         dbwFtpjDG9q1AsE6ToYOq3LpK6x3Ih/+TSG1nUM10xxTw4EjasbRaCBCjY39a9eBKAVA
         hBxA==
X-Gm-Message-State: AOJu0YyY6RXSJAiNwtY10ILZ0Gx9uGF72oMQLdFZGcDoH2dDEC8DF80R
	mOgrrYBMNCiIcmgx68by3ECpWT0lWeCGvoBiqilebJxAP1W55tqUM+YHUA==
X-Google-Smtp-Source: AGHT+IGRX3K8kGez5RGfEqfjZhwed8Y45+dNw0T5op52s1LRhkEVOlaXRKersKgwyey5D0iKHDSl7Q==
X-Received: by 2002:a05:600c:1d12:b0:42c:b22e:fc23 with SMTP id 5b1f17b1804b1-42cdb53b958mr111814645e9.15.1726479653567;
        Mon, 16 Sep 2024 02:40:53 -0700 (PDT)
Received: from localhost.localdomain ([141.113.242.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800237sm6730049f8f.83.2024.09.16.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 02:40:53 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] connman: upgrade 1.42 -> 1.43
Date: Mon, 16 Sep 2024 09:40:50 +0000
Message-Id: <20240916094050.47290-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 09:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204606

Changlog:
- Fix issue with device creation when using LTE.
- Fix issue with regulatory domain when powering up.
- Fix issue with resolving ISO3166 code from timezone data.
- Fix issue with handling DNS proxy zero termination of buffers.
- Fix issue with handling DHCP packet length in L3 mode.
- Fix issue with handling DHCP upper length checks.
- Fix issue with handling IPv6 and URL parsing.
- Fix issue with handling online check updates.
- Fix issue with handling proxy method and WISPr.
- Fix issue with handling default gateway setup.
- Add support for low-priority default routes.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ....c-Include-libgen.h-for-basename-API.patch |  55 -------
 ...upport-for-latest-pppd-2.5.0-release.patch | 152 ------------------
 .../{connman_1.42.bb => connman_1.43.bb}      |   4 +-
 3 files changed, 1 insertion(+), 210 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
 rename meta/recipes-connectivity/connman/{connman_1.42.bb => connman_1.43.bb} (66%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch b/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 8012606db7..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From cbba6638986c2de763981bf6fc59df6a86fed44f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Jan 2024 17:42:21 -0800
-Subject: [PATCH v2] src/log.c: Include libgen.h for basename API
-
-Use POSIX version of basename. This comes to front with latest musl
-which dropped the declaration from string.h [1] it fails to build with
-clang-17+ because it treats implicit function declaration as error.
-
-Fix it by applying the basename on a copy of string since posix version
-may modify the input string.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lore.kernel.org/connman/20240102015917.3732089-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-
- src/log.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/log.c b/src/log.c
-index 554b046..2df3af7 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -24,6 +24,7 @@
- #endif
- 
- #include <stdio.h>
-+#include <libgen.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <stdlib.h>
-@@ -196,6 +197,7 @@ int __connman_log_init(const char *program, const char *debug,
- 		const char *program_name, const char *program_version)
- {
- 	static char path[PATH_MAX];
-+	char* tmp = strdup(program);
- 	int option = LOG_NDELAY | LOG_PID;
- 
- 	program_exec = program;
-@@ -212,8 +214,8 @@ int __connman_log_init(const char *program, const char *debug,
- 	if (backtrace)
- 		signal_setup(signal_handler);
- 
--	openlog(basename(program), option, LOG_DAEMON);
--
-+	openlog(basename(tmp), option, LOG_DAEMON);
-+	free(tmp);
- 	syslog(LOG_INFO, "%s version %s", program_name, program_version);
- 
- 	return 0;
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch b/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
deleted file mode 100644
index 9e5ac8da15..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From af55a6a414d32c12f9ef3cab778385a361e1ad6d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eivind=20N=C3=A6ss?= <eivnaes@yahoo.com>
-Date: Sat, 25 Mar 2023 20:51:52 +0000
-Subject: [PATCH] vpn: Adding support for latest pppd 2.5.0 release
-
-The API has gone through a significant overhaul, and this change fixes any compile issues.
-1) Fixes to configure.ac itself
-2) Cleanup in pppd plugin itself
-
-Adding a libppp-compat.h file to mask for any differences in the version.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a48864a2e5d2a725dfc6eef567108bc13b43857f]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- scripts/libppp-compat.h | 127 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 127 insertions(+)
- create mode 100644 scripts/libppp-compat.h
-
-diff --git a/scripts/libppp-compat.h b/scripts/libppp-compat.h
-new file mode 100644
-index 0000000..eee1d09
---- /dev/null
-+++ b/scripts/libppp-compat.h
-@@ -0,0 +1,127 @@
-+/* Copyright (C) Eivind Naess, eivnaes@yahoo.com */
-+/* SPDX-License-Identifier: GPL-2.0-or-later */
-+
-+#ifndef __LIBPPP_COMPAT_H__
-+#define __LIBPPP_COMPAT_H__
-+
-+/* Define USE_EAPTLS compile with EAP TLS support against older pppd headers,
-+ * pppd >= 2.5.0 use PPP_WITH_EAPTLS and is defined in pppdconf.h */
-+#define USE_EAPTLS 1
-+
-+/* Define INET6 to compile with IPv6 support against older pppd headers,
-+ * pppd >= 2.5.0 use PPP_WITH_IPV6CP and is defined in pppdconf.h */
-+#define INET6 1
-+
-+/* PPP < 2.5.0 defines and exports VERSION which overlaps with current package VERSION define.
-+ * this silly macro magic is to work around that. */
-+#undef VERSION
-+#include <pppd/pppd.h>
-+
-+#ifndef PPPD_VERSION
-+#define PPPD_VERSION VERSION
-+#endif
-+
-+#include <pppd/fsm.h>
-+#include <pppd/ccp.h>
-+#include <pppd/eui64.h>
-+#include <pppd/ipcp.h>
-+#include <pppd/ipv6cp.h>
-+#include <pppd/eap.h>
-+#include <pppd/upap.h>
-+
-+#ifdef HAVE_PPPD_CHAP_H
-+#include <pppd/chap.h>
-+#endif
-+
-+#ifdef HAVE_PPPD_CHAP_NEW_H
-+#include <pppd/chap-new.h>
-+#endif
-+
-+#ifdef HAVE_PPPD_CHAP_MS_H
-+#include <pppd/chap_ms.h>
-+#endif
-+
-+#ifndef PPP_PROTO_CHAP
-+#define PPP_PROTO_CHAP 0xc223
-+#endif 
-+
-+#ifndef PPP_PROTO_EAP
-+#define PPP_PROTO_EAP  0xc227
-+#endif
-+
-+
-+#if WITH_PPP_VERSION < PPP_VERSION(2,5,0)
-+
-+static inline bool
-+debug_on (void)
-+{
-+	return debug;
-+}
-+
-+static inline const char
-+*ppp_ipparam (void)
-+{
-+	return ipparam;
-+}
-+
-+static inline int
-+ppp_ifunit (void)
-+{
-+	return ifunit;
-+}
-+
-+static inline const char *
-+ppp_ifname (void)
-+{
-+	return ifname;
-+}
-+
-+static inline int
-+ppp_get_mtu (int idx)
-+{
-+	return netif_get_mtu(idx);
-+}
-+
-+typedef enum ppp_notify
-+{
-+    NF_PID_CHANGE,
-+    NF_PHASE_CHANGE,
-+    NF_EXIT,
-+    NF_SIGNALED,
-+    NF_IP_UP,
-+    NF_IP_DOWN,
-+    NF_IPV6_UP,
-+    NF_IPV6_DOWN,
-+    NF_AUTH_UP,
-+    NF_LINK_DOWN,
-+    NF_FORK,
-+    NF_MAX_NOTIFY
-+} ppp_notify_t;
-+
-+typedef void (ppp_notify_fn) (void *ctx, int arg);
-+
-+static inline void
-+ppp_add_notify (ppp_notify_t type, ppp_notify_fn *func, void *ctx)
-+{
-+	struct notifier **list[NF_MAX_NOTIFY] = {
-+		[NF_PID_CHANGE  ] = &pidchange,
-+		[NF_PHASE_CHANGE] = &phasechange,
-+		[NF_EXIT        ] = &exitnotify,
-+		[NF_SIGNALED    ] = &sigreceived,
-+		[NF_IP_UP       ] = &ip_up_notifier,
-+		[NF_IP_DOWN     ] = &ip_down_notifier,
-+		[NF_IPV6_UP     ] = &ipv6_up_notifier,
-+		[NF_IPV6_DOWN   ] = &ipv6_down_notifier,
-+		[NF_AUTH_UP     ] = &auth_up_notifier,
-+		[NF_LINK_DOWN   ] = &link_down_notifier,
-+		[NF_FORK        ] = &fork_notifier,
-+	};
-+
-+	struct notifier **notify = list[type];
-+	if (notify) {
-+		add_notifier(notify, func, ctx);
-+	}
-+}
-+
-+#endif /* #if WITH_PPP_VERSION < PPP_VERSION(2,5,0) */
-+#endif /* #if__LIBPPP_COMPAT_H__ */
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.43.bb
similarity index 66%
rename from meta/recipes-connectivity/connman/connman_1.42.bb
rename to meta/recipes-connectivity/connman/connman_1.43.bb
index 5c60b9cb83..1100599490 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.43.bb
@@ -5,13 +5,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://no-version-scripts.patch \
-           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
-           file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
 
-SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
+SRC_URI[sha256sum] = "1257cebe327e7900b7e2b84c0fb330aa90815e455898cd2f941f4308ed2be3bc"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.34.1


