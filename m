Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8493AC433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.66650.1638882436112715366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aaIWMtim;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso1699494wml.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pouj7Q6ai/OQUkcrabGlPf3Cxxw3hI2GAUzH+nMdaOs=;
        b=aaIWMtim0bpeeKTgGYROAAnJr+zYiEzz/yagcuGL0ZxxpEn+RPPrdIFdFR3gQ5o3xc
         359BAo4Uyq89EoXAmu3fnKeslp0AzvQ+LCBWvdtQL0rAGbQhECMhqH9trmZHJI9p2EDX
         NZVNrCR39buizyvoq4Jzc0W2M+tUvmrnAiV5Ad5lCjSjtu+Tihv/rL7dB1ZN38O90z6X
         /vidgmZ/NyzE/35+AiZ/J1rCy5yUy6RhYQq1UmFfeGxq0roQWyF8g9H2blvKwCFmfU05
         lwvjrgbQgXQiZ84xZuPOpFI4QoH5ioJN1h/I7LZLP/VsrgU8R/Vzuq5LzylKkI80mZEp
         fhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pouj7Q6ai/OQUkcrabGlPf3Cxxw3hI2GAUzH+nMdaOs=;
        b=TOYJaO4yQ/6Ljx+tkROwtHLgg0ekLubgM2mTTzBg4dqkkv5zCeL2CzXlKf0ZU3f3vK
         R9gkSDU9sVlSExcZihsRZtH1xqRKWlgst58gMQwG54MKgh0SYweTnKmEkS+Mut60E153
         o6GAcW4Wd6txpwnKNsdJeXtcE2z0fGj+Fv4lzs/QD1aizcDp5zcExV3j5aClgrs2ecGV
         nJBZ9T9pcuvEH3YuItykzU4Om1fxi9LG92LdKq/otWvR92wzHfIuhwRKz26/duLq7gVP
         mNj8Iy7b0fILkYQLwCv7ttuBRzhcADM4bBY1E2b5R/mZAAbvDTBH8zrZz6iYNW68wlo6
         rIRA==
X-Gm-Message-State: AOAM532jJm2zzKvypzO9S1Zu0LON9DfFs5MUBRMmW4INBItigFhmWric
	S2S6AYBqmaMTu6nSaRqGqi5PV366EMog7w==
X-Google-Smtp-Source: 
 ABdhPJx1tmm1NYUPOF4RJiPLtvwnK1F9E5QL4EicN6t12eTpSiR6vMwmFvQdGxuPAUdfL/m9FeV4hw==
X-Received: by 2002:a1c:a710:: with SMTP id q16mr6909149wme.138.1638882434735;
        Tue, 07 Dec 2021 05:07:14 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 09/16] strace: update 5.14 -> 5.15
Date: Tue,  7 Dec 2021 14:06:56 +0100
Message-Id: <20211207130703.3196805-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159294

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ------------------
 .../strace/{strace_5.14.bb => strace_5.15.bb} |   3 +-
 2 files changed, 1 insertion(+), 153 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
 rename meta/recipes-devtools/strace/{strace_5.14.bb => strace_5.15.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch b/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
deleted file mode 100644
index e791b4130d..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 197f712ea96c12dcabc9fe98889a425d61ad6a60 Mon Sep 17 00:00:00 2001
-From: Eugene Syromyatnikov <evgsyr@gmail.com>
-Date: Wed, 3 Nov 2021 00:48:59 +0100
-Subject: [PATCH] Avoid relying on presence of ipx.h
-
-After Linux has broken UAPI in commit v5.15-rc1~157^2~207, it is well
-possible that neither kernel nor libc (such as musl, for example)
-provide IPX-related header.  Avoid relying on its presence
-in the strace's code and conditionalise the relevant checks in the tests.
-
-* configure.ac (AC_CHECK_HEADERS): Add linux/ipx.h.
-* src/net.c: Remove <netipx/ipx.h>/<linux/ipx.h> includes.
-* src/sockaddr.c: Likewise.
-(IPX_NODE_LEN): New macro constant.
-(struct sockaddr_ipx): New type definition.
-* src/xlat/sock_ipx_options.in (IPX_TYPE): Provide a fallback value.
-* tests/net-sockaddr.c [!HAVE_LINUX_IPX_H]: Do not include
-<linux/ipx.h>.
-[!HAVE_LINUX_IPX_H && HAVE_NETIPX_IPX_H]: Include <netipx/ipx.h>.
-[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)]: Do not define
-check_ipx.
-[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)] (main): Do not call
-check_ipx.
-
-Closes: https://github.com/strace/strace/issues/201
-
-Upstream-Status: Backport [commit cca828197c0e1 branch esyr/5.15]
-
-[bva: changed context to apply to a released strace 5.14 tarball]
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
----
- configure.ac                 |  1 +
- src/net.c                    |  5 -----
- src/sockaddr.c               | 16 ++++++++++------
- src/xlat/sock_ipx_options.in |  2 +-
- tests/net-sockaddr.c         | 10 +++++++++-
- 5 files changed, 21 insertions(+), 13 deletions(-)
-
-Index: strace-5.14/configure.ac
-===================================================================
---- strace-5.14.orig/configure.ac
-+++ strace-5.14/configure.ac
-@@ -423,6 +423,7 @@
- 	elf.h
- 	gcov.h
- 	iconv.h
-+	linux/ipx.h
- 	mqueue.h
- 	netinet/sctp.h
- 	netipx/ipx.h
-Index: strace-5.14/src/net.c
-===================================================================
---- strace-5.14.orig/src/net.c
-+++ strace-5.14/src/net.c
-@@ -28,11 +28,6 @@
- #include <arpa/inet.h>
- #include <net/if.h>
- #include <asm/types.h>
--#ifdef HAVE_NETIPX_IPX_H
--# include <netipx/ipx.h>
--#else
--# include <linux/ipx.h>
--#endif
- 
- #include <linux/ip_vs.h>
- #include "netlink.h"
-Index: strace-5.14/src/sockaddr.c
-===================================================================
---- strace-5.14.orig/src/sockaddr.c
-+++ strace-5.14/src/sockaddr.c
-@@ -24,12 +24,6 @@
- #include <linux/if_ether.h>
- #include <linux/x25.h>
- 
--#ifdef HAVE_NETIPX_IPX_H
--# include <netipx/ipx.h>
--#else
--# include <linux/ipx.h>
--#endif
--
- #include "xlat/addrfams.h"
- #include "xlat/arp_hardware_types.h"
- #include "xlat/ethernet_protocols.h"
-@@ -45,6 +39,16 @@
- const size_t arp_hardware_types_size = ARRAY_SIZE(arp_hardware_types) - 1;
- const size_t ethernet_protocols_size = ARRAY_SIZE(ethernet_protocols) - 1;
- 
-+#define IPX_NODE_LEN	6
-+struct sockaddr_ipx {
-+	uint16_t sipx_family;
-+	uint16_t sipx_port;
-+	uint32_t sipx_network;
-+	unsigned char sipx_node[IPX_NODE_LEN];
-+	uint8_t sipx_type;
-+	unsigned char sipx_zero;
-+};
-+
- static void
- print_sockaddr_data_un(struct tcb *tcp, const void *const buf, const int addrlen)
- {
-Index: strace-5.14/src/xlat/sock_ipx_options.in
-===================================================================
---- strace-5.14.orig/src/xlat/sock_ipx_options.in
-+++ strace-5.14/src/xlat/sock_ipx_options.in
-@@ -1 +1 @@
--IPX_TYPE
-+IPX_TYPE	1
-Index: strace-5.14/tests/net-sockaddr.c
-===================================================================
---- strace-5.14.orig/tests/net-sockaddr.c
-+++ strace-5.14/tests/net-sockaddr.c
-@@ -24,7 +24,11 @@
- #include <linux/if_ether.h>
- #include <linux/if_packet.h>
- #include <linux/x25.h>
--#include <linux/ipx.h>
-+#if defined HAVE_LINUX_IPX_H
-+# include <linux/ipx.h>
-+#elif defined HAVE_NETIPX_IPX_H
-+# include <netipx/ipx.h>
-+#endif
- #ifdef HAVE_BLUETOOTH_BLUETOOTH_H
- # include <bluetooth/bluetooth.h>
- # include <bluetooth/hci.h>
-@@ -269,6 +273,7 @@
- 	printf("connect(-1, %p, %u) = %d EBADF (%m)\n", in6, len, ret);
- }
- 
-+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
- static void
- check_ipx(void)
- {
-@@ -295,6 +300,7 @@
- 	       c_ipx.sipx_node[4], c_ipx.sipx_node[5],
- 	       c_ipx.sipx_type, len, ret);
- }
-+#endif /* HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H */
- 
- /* for a bit more compact AX.25 address definitions */
- #define AX25_ADDR(c_, s_) \
-@@ -773,7 +779,9 @@
- 	check_un();
- 	check_in();
- 	check_in6();
-+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
- 	check_ipx();
-+#endif
- 	check_ax25();
- 	check_x25();
- 	check_nl();
diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-devtools/strace/strace_5.15.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_5.14.bb
rename to meta/recipes-devtools/strace/strace_5.15.bb
index 4fbff04137..716806d22f 100644
--- a/meta/recipes-devtools/strace/strace_5.14.bb
+++ b/meta/recipes-devtools/strace/strace_5.15.bb
@@ -13,9 +13,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
-           file://0001-Avoid-relying-on-presence-of-ipx.h.patch \
            "
-SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
+SRC_URI[sha256sum] = "ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc"
 
 inherit autotools ptest
 
-- 
2.20.1


