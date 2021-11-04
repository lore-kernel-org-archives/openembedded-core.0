Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FC2C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:48:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.2787.1636055316593713209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EPfhJFZW;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id h16so5283560qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12HLpntPgDNd3f7Vy3e9QdciGHtiwRa0RkSIAM/FQM8=;
        b=EPfhJFZWI4CPr5WZfoNSnP/azrPiqdt2UGPPb5NWWzB+u8InEfvhkOFUUjdMjHlxTy
         kRCriWMEmBlO0CcQyGLhw9P7GDoXGgvQVmDwXAPhmYp2LpkUkTqaZaSREf7r02hs0Ljo
         bLi+eRQZeCxyKBgVDpCGA+2kqEF383zXcm9r+66phHaSdT2rLPeKI/IkRr8u7A8dcFjM
         en0DB2yPUJHAXRe+YTCucXc8YC3cu7ocdc1YlMR8VwvZeaWcF8CHSHtZeN91bzZNKIlN
         Q5ioj5lS471yGgEF9ZZZS5cGeo+0r+pvgTFRNlMLoqS6eP5mZqQXXszyU6huaOcjcP0M
         jI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12HLpntPgDNd3f7Vy3e9QdciGHtiwRa0RkSIAM/FQM8=;
        b=rfKeOIR0nFuGcAaFpp6BG0hbYwP9JNSZLM6UYVyH21L2PgyM25ld/M/G2iCxH+ot4m
         joe2J/RLwNimQO6v1SGd02ElZv1kbBRls+sGAIx0HG9Kc3gOpL954B6fFFcEgmcNqj+V
         IXemkf+joofSJW0MD26qbtfKd3ELoutF7V+OK6+lvD4vPCZ0SvVpiIU0q5bXlUI1NtL1
         WsmJ40rVLa9ysIIizMeihOS1lnRUqZIfon/NRsJHXfekWeove+hT6iwZ2rd9o6HDe6a4
         rQJXAiwCn3wdKJNJyKd4wj7nj/1ob5yvKunL4EPvFKAhA/E0hRvmYnUL5DNyv7n9zUxt
         qAOA==
X-Gm-Message-State: AOAM530mF/VHKtRRMqAtW4l2KeR4ZCaxnD89BgSXsvOgXMSdPTOmRSYW
	9HERkNg0FTmVdm8tCCKS2ojIK+mpEvBiOQ==
X-Google-Smtp-Source: 
 ABdhPJwaxY6f88Q9LA3vd2KCXoUmPnCuoheFtESCcVAtHfBdZggsp+xRJOd3/gBq3JI0afQT71+cxw==
X-Received: by 2002:ac8:7d8e:: with SMTP id
 c14mr44365663qtd.209.1636055315692;
        Thu, 04 Nov 2021 12:48:35 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 br17sm4276771qkb.10.2021.11.04.12.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:48:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] strace: fix build against 5.15 kernel/kernel-headers
Date: Thu,  4 Nov 2021 15:48:26 -0400
Message-Id: 
 <ce21ae9dc9c4f10aa66d624714370e57f429039c.1636054726.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636054726.git.bruce.ashfield@gmail.com>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157868

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel 5.15 removed ipx.h from the uapi, but strace hasn't adjusted
its tests to the removal.

There is a WIP patch on the esyr/5.15 branch that solves the problem,
so we grab it here, adjust for context and fix our build problem.

When strace updates to 5.15, and we can bump our version and drop
this patch.

Upstream-Status: Backport [commit cca828197c0e16c2599129114]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.14.bb   |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch b/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
new file mode 100644
index 0000000000..6df673fa95
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
@@ -0,0 +1,151 @@
+From 197f712ea96c12dcabc9fe98889a425d61ad6a60 Mon Sep 17 00:00:00 2001
+From: Eugene Syromyatnikov <evgsyr@gmail.com>
+Date: Wed, 3 Nov 2021 00:48:59 +0100
+Subject: [PATCH] Avoid relying on presence of ipx.h
+
+After Linux has broken UAPI in commit v5.15-rc1~157^2~207, it is well
+possible that neither kernel nor libc (such as musl, for example)
+provide IPX-related header.  Avoid relying on its presence
+in the strace's code and conditionalise the relevant checks in the tests.
+
+* configure.ac (AC_CHECK_HEADERS): Add linux/ipx.h.
+* src/net.c: Remove <netipx/ipx.h>/<linux/ipx.h> includes.
+* src/sockaddr.c: Likewise.
+(IPX_NODE_LEN): New macro constant.
+(struct sockaddr_ipx): New type definition.
+* src/xlat/sock_ipx_options.in (IPX_TYPE): Provide a fallback value.
+* tests/net-sockaddr.c [!HAVE_LINUX_IPX_H]: Do not include
+<linux/ipx.h>.
+[!HAVE_LINUX_IPX_H && HAVE_NETIPX_IPX_H]: Include <netipx/ipx.h>.
+[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)]: Do not define
+check_ipx.
+[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)] (main): Do not call
+check_ipx.
+
+Closes: https://github.com/strace/strace/issues/201
+
+Upstream-Status: backport [commit cca828197c0e1 branch esyr/5.15]
+
+[bva: changed context to apply to a released strace 5.14 tarball]
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+---
+ configure.ac                 |  1 +
+ src/net.c                    |  5 -----
+ src/sockaddr.c               | 16 ++++++++++------
+ src/xlat/sock_ipx_options.in |  2 +-
+ tests/net-sockaddr.c         | 10 +++++++++-
+ 5 files changed, 21 insertions(+), 13 deletions(-)
+
+Index: strace-5.14/configure.ac
+===================================================================
+--- strace-5.14.orig/configure.ac
++++ strace-5.14/configure.ac
+@@ -423,6 +423,7 @@
+ 	elf.h
+ 	gcov.h
+ 	iconv.h
++	linux/ipx.h
+ 	mqueue.h
+ 	netinet/sctp.h
+ 	netipx/ipx.h
+Index: strace-5.14/src/net.c
+===================================================================
+--- strace-5.14.orig/src/net.c
++++ strace-5.14/src/net.c
+@@ -28,11 +28,6 @@
+ #include <arpa/inet.h>
+ #include <net/if.h>
+ #include <asm/types.h>
+-#ifdef HAVE_NETIPX_IPX_H
+-# include <netipx/ipx.h>
+-#else
+-# include <linux/ipx.h>
+-#endif
+ 
+ #include <linux/ip_vs.h>
+ #include "netlink.h"
+Index: strace-5.14/src/sockaddr.c
+===================================================================
+--- strace-5.14.orig/src/sockaddr.c
++++ strace-5.14/src/sockaddr.c
+@@ -24,12 +24,6 @@
+ #include <linux/if_ether.h>
+ #include <linux/x25.h>
+ 
+-#ifdef HAVE_NETIPX_IPX_H
+-# include <netipx/ipx.h>
+-#else
+-# include <linux/ipx.h>
+-#endif
+-
+ #include "xlat/addrfams.h"
+ #include "xlat/arp_hardware_types.h"
+ #include "xlat/ethernet_protocols.h"
+@@ -45,6 +39,16 @@
+ const size_t arp_hardware_types_size = ARRAY_SIZE(arp_hardware_types) - 1;
+ const size_t ethernet_protocols_size = ARRAY_SIZE(ethernet_protocols) - 1;
+ 
++#define IPX_NODE_LEN	6
++struct sockaddr_ipx {
++	uint16_t sipx_family;
++	uint16_t sipx_port;
++	uint32_t sipx_network;
++	unsigned char sipx_node[IPX_NODE_LEN];
++	uint8_t sipx_type;
++	unsigned char sipx_zero;
++};
++
+ static void
+ print_sockaddr_data_un(struct tcb *tcp, const void *const buf, const int addrlen)
+ {
+Index: strace-5.14/src/xlat/sock_ipx_options.in
+===================================================================
+--- strace-5.14.orig/src/xlat/sock_ipx_options.in
++++ strace-5.14/src/xlat/sock_ipx_options.in
+@@ -1 +1 @@
+-IPX_TYPE
++IPX_TYPE	1
+Index: strace-5.14/tests/net-sockaddr.c
+===================================================================
+--- strace-5.14.orig/tests/net-sockaddr.c
++++ strace-5.14/tests/net-sockaddr.c
+@@ -24,7 +24,11 @@
+ #include <linux/if_ether.h>
+ #include <linux/if_packet.h>
+ #include <linux/x25.h>
+-#include <linux/ipx.h>
++#if defined HAVE_LINUX_IPX_H
++# include <linux/ipx.h>
++#elif defined HAVE_NETIPX_IPX_H
++# include <netipx/ipx.h>
++#endif
+ #ifdef HAVE_BLUETOOTH_BLUETOOTH_H
+ # include <bluetooth/bluetooth.h>
+ # include <bluetooth/hci.h>
+@@ -269,6 +273,7 @@
+ 	printf("connect(-1, %p, %u) = %d EBADF (%m)\n", in6, len, ret);
+ }
+ 
++#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
+ static void
+ check_ipx(void)
+ {
+@@ -295,6 +300,7 @@
+ 	       c_ipx.sipx_node[4], c_ipx.sipx_node[5],
+ 	       c_ipx.sipx_type, len, ret);
+ }
++#endif /* HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H */
+ 
+ /* for a bit more compact AX.25 address definitions */
+ #define AX25_ADDR(c_, s_) \
+@@ -773,7 +779,9 @@
+ 	check_un();
+ 	check_in();
+ 	check_in6();
++#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
+ 	check_ipx();
++#endif
+ 	check_ax25();
+ 	check_x25();
+ 	check_nl();
diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-devtools/strace/strace_5.14.bb
index aa6b06d2dd..4fbff04137 100644
--- a/meta/recipes-devtools/strace/strace_5.14.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
+           file://0001-Avoid-relying-on-presence-of-ipx.h.patch \
            "
 SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
 
-- 
2.19.1


