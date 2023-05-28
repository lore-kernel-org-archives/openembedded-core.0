Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E33C77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 04:31:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.23524.1685248294440076037
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 21:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e+2aOnc5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-96fe2a1db26so403416566b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 21:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685248293; x=1687840293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paS3WIGO6RSzcnfUTvJv7tpzKWOvZvcclISJ/hkznC0=;
        b=e+2aOnc5nQSFCNlBjCMwcR15G+IMVfLam6v/AjTWI77XIdlYOTCK5pOwPCoXwtjZJB
         SI/V5VOYIAb8B8ZPEoHdsAxie6Uu4Ypm3aUFzX9pkV0mc3WwGEtMVPoXpDImkdZBkKxV
         fa2q0I1C4Z4qvz/WafZ7poc8BWJu/FYLa7D7qbKLwb94J2rYXDTzVGFxy00AuHBgiIeE
         nAd9YdOT//THtYzeGf26vBvUrJwbGrEBJL265rrz8lT3xJAG6vCMOsDNyP0MMBotVstU
         Pe/ejzALirMUvKzmUmPNOjQJqPcOwW5WK0nZEnVvqGWQPTOm0jWCykM7q4nO5b6DsLOX
         X4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685248293; x=1687840293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paS3WIGO6RSzcnfUTvJv7tpzKWOvZvcclISJ/hkznC0=;
        b=JwdoD2ZnL514b+4QEztPjgfGLZp9trLhtCGT2D7YPlxwsHbakl36zyOlah9osQAjfF
         xjWPFsCP6GAwMtMHfBHVKFBihBqsZQWiw29ZjkpMEz1bQJ08RJvni+SzILQvWl96BrdT
         ASbwsZWQtTK4kiYr3yjQqy0r81xkDj0tk1ntGzvAVknmZS2xz5WcjUyvJExjWAhMorGr
         dUrBZEnCNUyTbz3XbYKiUMBFGcokt/UKQsYsJU4F1iBOu1c1x7DcRX4B9yuETpeuiF+I
         +HLVfdVqFBz/orrFallGLPnUF6ZZy9fXzvcKhvofpEVc5xRaOUt/9si53SzNd2qJ08LW
         OQug==
X-Gm-Message-State: AC+VfDxOVZuKEx1bbSB/QoSvewIDtPZMFx0iCy99xLJY+oMHVWOBE7pE
	3A/xHQfZArp6fDdMs26jahD5eBl8oy4=
X-Google-Smtp-Source: ACHHUZ7yiestJEDNmud8dwHNCmpw3Fzl1IxYl25M4d/Goi4tfj1MivSgoI1vlNhQiPuR+zE9ZAksrg==
X-Received: by 2002:a17:907:1c03:b0:96f:d63a:9508 with SMTP id nc3-20020a1709071c0300b0096fd63a9508mr7680862ejc.33.1685248292466;
        Sat, 27 May 2023 21:31:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906394600b0096f8ec46498sm4192627eje.2.2023.05.27.21.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 21:31:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] connman: backport a fix for build with pppd-2.5.0
Date: Sun, 28 May 2023 06:31:22 +0200
Message-Id: <20230528043122.923231-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 04:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181811

* pppd was upgraded in:
  https://git.openembedded.org/openembedded-core/commit/?id=5512bf4dfd299b8d5d474d9f26c2146b3e53514a

* connman fails to build with pptp or l2tp PACKAGECONFIG is enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...upport-for-latest-pppd-2.5.0-release.patch | 274 ++++++++++++++++++
 .../connman/connman_1.41.bb                   |   1 +
 2 files changed, 275 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch b/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
new file mode 100644
index 0000000000..83343fdda5
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
@@ -0,0 +1,274 @@
+From 5f373f373f5baccc282dce257b7b16c8bb4a82c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eivind=20N=C3=A6ss?= <eivnaes@yahoo.com>
+Date: Sat, 25 Mar 2023 20:51:52 +0000
+Subject: [PATCH] vpn: Adding support for latest pppd 2.5.0 release
+
+The API has gone through a significant overhaul, and this change fixes any compile issues.
+1) Fixes to configure.ac itself
+2) Cleanup in pppd plugin itself
+
+Adding a libppp-compat.h file to mask for any differences in the version.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a48864a2e5d2a725dfc6eef567108bc13b43857f]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac            |  42 ++++++++-----
+ scripts/libppp-compat.h | 127 ++++++++++++++++++++++++++++++++++++++++
+ scripts/libppp-plugin.c |  15 +++--
+ 3 files changed, 161 insertions(+), 23 deletions(-)
+ create mode 100644 scripts/libppp-compat.h
+
+diff --git a/configure.ac b/configure.ac
+index a573cef..f34bb38 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -135,14 +135,6 @@ AC_ARG_ENABLE(l2tp,
+ 	AC_HELP_STRING([--enable-l2tp], [enable l2tp support]),
+ 			[enable_l2tp=${enableval}], [enable_l2tp="no"])
+ if (test "${enable_l2tp}" != "no"); then
+-	if (test -z "${path_pppd}"); then
+-		AC_PATH_PROG(PPPD, [pppd], [/usr/sbin/pppd], $PATH:/sbin:/usr/sbin)
+-	else
+-		PPPD="${path_pppd}"
+-		AC_SUBST(PPPD)
+-	fi
+-	AC_CHECK_HEADERS(pppd/pppd.h, dummy=yes,
+-			AC_MSG_ERROR(ppp header files are required))
+ 	if (test -z "${path_l2tp}"); then
+ 		AC_PATH_PROG(L2TP, [xl2tpd], [/usr/sbin/xl2tpd], $PATH:/sbin:/usr/sbin)
+ 	else
+@@ -160,6 +152,18 @@ AC_ARG_ENABLE(pptp,
+ 	AC_HELP_STRING([--enable-pptp], [enable pptp support]),
+ 			[enable_pptp=${enableval}], [enable_pptp="no"])
+ if (test "${enable_pptp}" != "no"); then
++	if (test -z "${path_pptp}"); then
++		AC_PATH_PROG(PPTP, [pptp], [/usr/sbin/pptp], $PATH:/sbin:/usr/sbin)
++	else
++		PPTP="${path_pptp}"
++		AC_SUBST(PPTP)
++	fi
++fi
++AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
++AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
++
++if (test "${enable_pptp}" != "no" || test "${enable_l2tp}" != "no"); then
++
+ 	if (test -z "${path_pppd}"); then
+ 		AC_PATH_PROG(PPPD, [pppd], [/usr/sbin/pppd], $PATH:/sbin:/usr/sbin)
+ 	else
+@@ -168,15 +172,23 @@ if (test "${enable_pptp}" != "no"); then
+ 	fi
+ 	AC_CHECK_HEADERS(pppd/pppd.h, dummy=yes,
+ 			AC_MSG_ERROR(ppp header files are required))
+-	if (test -z "${path_pptp}"); then
+-		AC_PATH_PROG(PPTP, [pptp], [/usr/sbin/pptp], $PATH:/sbin:/usr/sbin)
+-	else
+-		PPTP="${path_pptp}"
+-		AC_SUBST(PPTP)
++	AC_CHECK_HEADERS([pppd/chap.h pppd/chap-new.h pppd/chap_ms.h])
++
++	PKG_CHECK_EXISTS([pppd],
++	    [AS_VAR_SET([pppd_pkgconfig_support],[yes])])
++
++	PPPD_VERSION=2.4.9
++	if test x"$pppd_pkgconfig_support" = xyes; then
++	    PPPD_VERSION=`$PKG_CONFIG --modversion pppd`
+ 	fi
++
++	AC_DEFINE_UNQUOTED([PPP_VERSION(x,y,z)],
++	    [((x & 0xFF) << 16 | (y & 0xFF) << 8 | (z & 0xFF) << 0)],
++	    [Macro to help determine the particular version of pppd])
++	PPP_VERSION=$(echo $PPPD_VERSION | sed -e "s/\./\,/g")
++	AC_DEFINE_UNQUOTED(WITH_PPP_VERSION, PPP_VERSION($PPP_VERSION),
++	    [The real version of pppd represented as an int])
+ fi
+-AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
+-AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
+ 
+ AC_CHECK_HEADERS(resolv.h, dummy=yes,
+ 	AC_MSG_ERROR(resolver header files are required))
+diff --git a/scripts/libppp-compat.h b/scripts/libppp-compat.h
+new file mode 100644
+index 0000000..eee1d09
+--- /dev/null
++++ b/scripts/libppp-compat.h
+@@ -0,0 +1,127 @@
++/* Copyright (C) Eivind Naess, eivnaes@yahoo.com */
++/* SPDX-License-Identifier: GPL-2.0-or-later */
++
++#ifndef __LIBPPP_COMPAT_H__
++#define __LIBPPP_COMPAT_H__
++
++/* Define USE_EAPTLS compile with EAP TLS support against older pppd headers,
++ * pppd >= 2.5.0 use PPP_WITH_EAPTLS and is defined in pppdconf.h */
++#define USE_EAPTLS 1
++
++/* Define INET6 to compile with IPv6 support against older pppd headers,
++ * pppd >= 2.5.0 use PPP_WITH_IPV6CP and is defined in pppdconf.h */
++#define INET6 1
++
++/* PPP < 2.5.0 defines and exports VERSION which overlaps with current package VERSION define.
++ * this silly macro magic is to work around that. */
++#undef VERSION
++#include <pppd/pppd.h>
++
++#ifndef PPPD_VERSION
++#define PPPD_VERSION VERSION
++#endif
++
++#include <pppd/fsm.h>
++#include <pppd/ccp.h>
++#include <pppd/eui64.h>
++#include <pppd/ipcp.h>
++#include <pppd/ipv6cp.h>
++#include <pppd/eap.h>
++#include <pppd/upap.h>
++
++#ifdef HAVE_PPPD_CHAP_H
++#include <pppd/chap.h>
++#endif
++
++#ifdef HAVE_PPPD_CHAP_NEW_H
++#include <pppd/chap-new.h>
++#endif
++
++#ifdef HAVE_PPPD_CHAP_MS_H
++#include <pppd/chap_ms.h>
++#endif
++
++#ifndef PPP_PROTO_CHAP
++#define PPP_PROTO_CHAP 0xc223
++#endif 
++
++#ifndef PPP_PROTO_EAP
++#define PPP_PROTO_EAP  0xc227
++#endif
++
++
++#if WITH_PPP_VERSION < PPP_VERSION(2,5,0)
++
++static inline bool
++debug_on (void)
++{
++	return debug;
++}
++
++static inline const char
++*ppp_ipparam (void)
++{
++	return ipparam;
++}
++
++static inline int
++ppp_ifunit (void)
++{
++	return ifunit;
++}
++
++static inline const char *
++ppp_ifname (void)
++{
++	return ifname;
++}
++
++static inline int
++ppp_get_mtu (int idx)
++{
++	return netif_get_mtu(idx);
++}
++
++typedef enum ppp_notify
++{
++    NF_PID_CHANGE,
++    NF_PHASE_CHANGE,
++    NF_EXIT,
++    NF_SIGNALED,
++    NF_IP_UP,
++    NF_IP_DOWN,
++    NF_IPV6_UP,
++    NF_IPV6_DOWN,
++    NF_AUTH_UP,
++    NF_LINK_DOWN,
++    NF_FORK,
++    NF_MAX_NOTIFY
++} ppp_notify_t;
++
++typedef void (ppp_notify_fn) (void *ctx, int arg);
++
++static inline void
++ppp_add_notify (ppp_notify_t type, ppp_notify_fn *func, void *ctx)
++{
++	struct notifier **list[NF_MAX_NOTIFY] = {
++		[NF_PID_CHANGE  ] = &pidchange,
++		[NF_PHASE_CHANGE] = &phasechange,
++		[NF_EXIT        ] = &exitnotify,
++		[NF_SIGNALED    ] = &sigreceived,
++		[NF_IP_UP       ] = &ip_up_notifier,
++		[NF_IP_DOWN     ] = &ip_down_notifier,
++		[NF_IPV6_UP     ] = &ipv6_up_notifier,
++		[NF_IPV6_DOWN   ] = &ipv6_down_notifier,
++		[NF_AUTH_UP     ] = &auth_up_notifier,
++		[NF_LINK_DOWN   ] = &link_down_notifier,
++		[NF_FORK        ] = &fork_notifier,
++	};
++
++	struct notifier **notify = list[type];
++	if (notify) {
++		add_notifier(notify, func, ctx);
++	}
++}
++
++#endif /* #if WITH_PPP_VERSION < PPP_VERSION(2,5,0) */
++#endif /* #if__LIBPPP_COMPAT_H__ */
+diff --git a/scripts/libppp-plugin.c b/scripts/libppp-plugin.c
+index 0dd8b47..61641b5 100644
+--- a/scripts/libppp-plugin.c
++++ b/scripts/libppp-plugin.c
+@@ -29,14 +29,13 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <pppd/pppd.h>
+-#include <pppd/fsm.h>
+-#include <pppd/ipcp.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
+ #include <dbus/dbus.h>
+ 
++#include "libppp-compat.h"
++
+ #define INET_ADDRES_LEN (INET_ADDRSTRLEN + 5)
+ #define INET_DNS_LEN	(2*INET_ADDRSTRLEN + 9)
+ 
+@@ -47,7 +46,7 @@ static char *path;
+ static DBusConnection *connection;
+ static int prev_phase;
+ 
+-char pppd_version[] = VERSION;
++char pppd_version[] = PPPD_VERSION;
+ 
+ int plugin_init(void);
+ 
+@@ -170,7 +169,7 @@ static void ppp_up(void *data, int arg)
+ 			DBUS_TYPE_STRING_AS_STRING DBUS_TYPE_STRING_AS_STRING
+ 			DBUS_DICT_ENTRY_END_CHAR_AS_STRING, &dict);
+ 
+-	append(&dict, "INTERNAL_IFNAME", ifname);
++	append(&dict, "INTERNAL_IFNAME", ppp_ifname());
+ 
+ 	inet_ntop(AF_INET, &ipcp_gotoptions[0].ouraddr, buf, INET_ADDRSTRLEN);
+ 	append(&dict, "INTERNAL_IP4_ADDRESS", buf);
+@@ -309,9 +308,9 @@ int plugin_init(void)
+ 	chap_check_hook = ppp_have_secret;
+ 	pap_check_hook = ppp_have_secret;
+ 
+-	add_notifier(&ip_up_notifier, ppp_up, NULL);
+-	add_notifier(&phasechange, ppp_phase_change, NULL);
+-	add_notifier(&exitnotify, ppp_exit, connection);
++	ppp_add_notify(NF_IP_UP, ppp_up, NULL);
++	ppp_add_notify(NF_PHASE_CHANGE, ppp_phase_change, NULL);
++	ppp_add_notify(NF_EXIT, ppp_exit, connection);
+ 
+ 	return 0;
+ }
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 3f2e29820f..d8ac1f5cde 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -9,6 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://CVE-2022-32293_p2.patch \
            file://CVE-2022-32292.patch \
            file://0001-gdhcp-Verify-and-sanitize-packet-length-first.patch \
+           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.40.1


