Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92F9EE14B5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4173.1694019402229630979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TuEsBbBC;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdcade7fbso565841466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019401; x=1694624201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHCvr+R6XogpGCmdLnWz6zo8Kykc5VpNu8+tzMV4VVM=;
        b=TuEsBbBCqI1t5/rv2MS1B84l1J1sNKIcqv5HzJXz+oEcLLRi1hONx5BRBA87Rg4U9x
         soyt4R8Km+WGD3Z3w5E/W8lcui8k9e4XxRvbpT2IS8DR2OHPzt+vmS9pePyXXJSWoDW+
         64+a/rwrDk8gzQXXA3dn4wAYeEsYFYsCgxqj2JY7WYJY3EJ0CsEntWtmC5As/4x3inz7
         gJ61sazNC4EFzPB42852TeDncg2JLy2LWBsUUeX612B07NG0NVqBGo433l/V0tQVNuFJ
         1hXDCmhvqZtH8OpiC0UIFNJX07tP8vudhVOsl1X4d6yVwOFozITI67EjrJN5CweGKWTC
         g8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019401; x=1694624201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHCvr+R6XogpGCmdLnWz6zo8Kykc5VpNu8+tzMV4VVM=;
        b=BQ4wPpzR24IWD3X7CoH2TmIJ30vabMGlXRzOIQcM1+84fDI/CU7d5EZy0UHZ2ava0H
         BUZg09eAwQEV2HsudY2gzK6WxhQrS/BdKxdRiQwvbn9YvrwLnG+qo68EeqMsE1657z3z
         Q9qengKSPlM9rza/58WZy9Bu72HbFEcw5E6eDdvheJ6tL1L6IC3j0Lv4nkUMZvcFueaT
         G6ffcEoDrBG55vQwVADgd334jc+t+EfMS7G9A33pBacYZ4ZmF3eRhvG9gHZ6LZPxqa4i
         abNm7prs0W3vqx8jAKKB8yUdh4DN4zaaK8rjr68jj/1HiRxFO3e80fFUuKTudAUSShwi
         fUcQ==
X-Gm-Message-State: AOJu0YyuZhzRXfmvu4QwaB/NhZ7arzQMHFV4jSwYc1Z07onTn7D4Fi8Q
	IEnpww0iRb36BzuOqDun3ulhNlerpKQ=
X-Google-Smtp-Source: AGHT+IHmXYn6OInQMPWJj7fiPnwR6BKq0cOFE5+8e8SOcTaDf0nps2AFA8GVrScE4c6Q6Ql8fuvYqA==
X-Received: by 2002:a17:906:53d1:b0:9a5:ca17:b586 with SMTP id p17-20020a17090653d100b009a5ca17b586mr2989569ejo.34.1694019400550;
        Wed, 06 Sep 2023 09:56:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/17] connman: update 1.41 -> 1.42
Date: Wed,  6 Sep 2023 18:56:19 +0200
Message-Id: <20230906165633.2382629-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187325

Drop backports. 0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
is partially dropped, as upstream hasn't included the newly added header
into the tarball (issue addressed after the release).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ify-and-sanitize-packet-length-first.patch |  63 -------
 ...upport-for-latest-pppd-2.5.0-release.patch | 128 +------------
 ...ve-musl-does-not-implement-res_ninit.patch |   8 -
 .../connman/connman/CVE-2022-32292.patch      |  37 ----
 .../connman/connman/CVE-2022-32293_p1.patch   | 141 --------------
 .../connman/connman/CVE-2022-32293_p2.patch   | 174 ------------------
 .../{connman_1.41.bb => connman_1.42.bb}      |   6 +-
 7 files changed, 4 insertions(+), 553 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
 rename meta/recipes-connectivity/connman/{connman_1.41.bb => connman_1.42.bb} (66%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch b/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
deleted file mode 100644
index 8e2f47a1d55..00000000000
--- a/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 99e2c16ea1cced34a5dc450d76287a1c3e762138 Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@monom.org>
-Date: Tue, 11 Apr 2023 08:12:56 +0200
-Subject: [PATCH] gdhcp: Verify and sanitize packet length first
-
-Avoid overwriting the read packet length after the initial test. Thus
-move all the length checks which depends on the total length first
-and do not use the total lenght from the IP packet afterwards.
-
-Fixes CVE-2023-28488
-
-Reported by Polina Smirnova <moe.hwr@gmail.com>
-
-CVE: CVE-2023-28488
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- gdhcp/client.c | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/gdhcp/client.c b/gdhcp/client.c
-index 7efa7e45..82017692 100644
---- a/gdhcp/client.c
-+++ b/gdhcp/client.c
-@@ -1319,9 +1319,9 @@ static bool sanity_check(struct ip_udp_dhcp_packet *packet, int bytes)
- static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
- 				struct sockaddr_in *dst_addr)
- {
--	int bytes;
- 	struct ip_udp_dhcp_packet packet;
- 	uint16_t check;
-+	int bytes, tot_len;
- 
- 	memset(&packet, 0, sizeof(packet));
- 
-@@ -1329,15 +1329,17 @@ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
- 	if (bytes < 0)
- 		return -1;
- 
--	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
--		return -1;
--
--	if (bytes < ntohs(packet.ip.tot_len))
-+	tot_len = ntohs(packet.ip.tot_len);
-+	if (bytes > tot_len) {
-+		/* ignore any extra garbage bytes */
-+		bytes = tot_len;
-+	} else if (bytes < tot_len) {
- 		/* packet is bigger than sizeof(packet), we did partial read */
- 		return -1;
-+	}
- 
--	/* ignore any extra garbage bytes */
--	bytes = ntohs(packet.ip.tot_len);
-+	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
-+		return -1;
- 
- 	if (!sanity_check(&packet, bytes))
- 		return -1;
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch b/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
index 83343fdda50..9e5ac8da152 100644
--- a/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch
@@ -1,4 +1,4 @@
-From 5f373f373f5baccc282dce257b7b16c8bb4a82c4 Mon Sep 17 00:00:00 2001
+From af55a6a414d32c12f9ef3cab778385a361e1ad6d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eivind=20N=C3=A6ss?= <eivnaes@yahoo.com>
 Date: Sat, 25 Mar 2023 20:51:52 +0000
 Subject: [PATCH] vpn: Adding support for latest pppd 2.5.0 release
@@ -11,82 +11,12 @@ Adding a libppp-compat.h file to mask for any differences in the version.
 
 Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a48864a2e5d2a725dfc6eef567108bc13b43857f]
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- configure.ac            |  42 ++++++++-----
  scripts/libppp-compat.h | 127 ++++++++++++++++++++++++++++++++++++++++
- scripts/libppp-plugin.c |  15 +++--
- 3 files changed, 161 insertions(+), 23 deletions(-)
+ 1 file changed, 127 insertions(+)
  create mode 100644 scripts/libppp-compat.h
 
-diff --git a/configure.ac b/configure.ac
-index a573cef..f34bb38 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,14 +135,6 @@ AC_ARG_ENABLE(l2tp,
- 	AC_HELP_STRING([--enable-l2tp], [enable l2tp support]),
- 			[enable_l2tp=${enableval}], [enable_l2tp="no"])
- if (test "${enable_l2tp}" != "no"); then
--	if (test -z "${path_pppd}"); then
--		AC_PATH_PROG(PPPD, [pppd], [/usr/sbin/pppd], $PATH:/sbin:/usr/sbin)
--	else
--		PPPD="${path_pppd}"
--		AC_SUBST(PPPD)
--	fi
--	AC_CHECK_HEADERS(pppd/pppd.h, dummy=yes,
--			AC_MSG_ERROR(ppp header files are required))
- 	if (test -z "${path_l2tp}"); then
- 		AC_PATH_PROG(L2TP, [xl2tpd], [/usr/sbin/xl2tpd], $PATH:/sbin:/usr/sbin)
- 	else
-@@ -160,6 +152,18 @@ AC_ARG_ENABLE(pptp,
- 	AC_HELP_STRING([--enable-pptp], [enable pptp support]),
- 			[enable_pptp=${enableval}], [enable_pptp="no"])
- if (test "${enable_pptp}" != "no"); then
-+	if (test -z "${path_pptp}"); then
-+		AC_PATH_PROG(PPTP, [pptp], [/usr/sbin/pptp], $PATH:/sbin:/usr/sbin)
-+	else
-+		PPTP="${path_pptp}"
-+		AC_SUBST(PPTP)
-+	fi
-+fi
-+AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
-+AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
-+
-+if (test "${enable_pptp}" != "no" || test "${enable_l2tp}" != "no"); then
-+
- 	if (test -z "${path_pppd}"); then
- 		AC_PATH_PROG(PPPD, [pppd], [/usr/sbin/pppd], $PATH:/sbin:/usr/sbin)
- 	else
-@@ -168,15 +172,23 @@ if (test "${enable_pptp}" != "no"); then
- 	fi
- 	AC_CHECK_HEADERS(pppd/pppd.h, dummy=yes,
- 			AC_MSG_ERROR(ppp header files are required))
--	if (test -z "${path_pptp}"); then
--		AC_PATH_PROG(PPTP, [pptp], [/usr/sbin/pptp], $PATH:/sbin:/usr/sbin)
--	else
--		PPTP="${path_pptp}"
--		AC_SUBST(PPTP)
-+	AC_CHECK_HEADERS([pppd/chap.h pppd/chap-new.h pppd/chap_ms.h])
-+
-+	PKG_CHECK_EXISTS([pppd],
-+	    [AS_VAR_SET([pppd_pkgconfig_support],[yes])])
-+
-+	PPPD_VERSION=2.4.9
-+	if test x"$pppd_pkgconfig_support" = xyes; then
-+	    PPPD_VERSION=`$PKG_CONFIG --modversion pppd`
- 	fi
-+
-+	AC_DEFINE_UNQUOTED([PPP_VERSION(x,y,z)],
-+	    [((x & 0xFF) << 16 | (y & 0xFF) << 8 | (z & 0xFF) << 0)],
-+	    [Macro to help determine the particular version of pppd])
-+	PPP_VERSION=$(echo $PPPD_VERSION | sed -e "s/\./\,/g")
-+	AC_DEFINE_UNQUOTED(WITH_PPP_VERSION, PPP_VERSION($PPP_VERSION),
-+	    [The real version of pppd represented as an int])
- fi
--AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
--AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
- 
- AC_CHECK_HEADERS(resolv.h, dummy=yes,
- 	AC_MSG_ERROR(resolver header files are required))
 diff --git a/scripts/libppp-compat.h b/scripts/libppp-compat.h
 new file mode 100644
 index 0000000..eee1d09
@@ -220,55 +150,3 @@ index 0000000..eee1d09
 +
 +#endif /* #if WITH_PPP_VERSION < PPP_VERSION(2,5,0) */
 +#endif /* #if__LIBPPP_COMPAT_H__ */
-diff --git a/scripts/libppp-plugin.c b/scripts/libppp-plugin.c
-index 0dd8b47..61641b5 100644
---- a/scripts/libppp-plugin.c
-+++ b/scripts/libppp-plugin.c
-@@ -29,14 +29,13 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#include <pppd/pppd.h>
--#include <pppd/fsm.h>
--#include <pppd/ipcp.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
- 
- #include <dbus/dbus.h>
- 
-+#include "libppp-compat.h"
-+
- #define INET_ADDRES_LEN (INET_ADDRSTRLEN + 5)
- #define INET_DNS_LEN	(2*INET_ADDRSTRLEN + 9)
- 
-@@ -47,7 +46,7 @@ static char *path;
- static DBusConnection *connection;
- static int prev_phase;
- 
--char pppd_version[] = VERSION;
-+char pppd_version[] = PPPD_VERSION;
- 
- int plugin_init(void);
- 
-@@ -170,7 +169,7 @@ static void ppp_up(void *data, int arg)
- 			DBUS_TYPE_STRING_AS_STRING DBUS_TYPE_STRING_AS_STRING
- 			DBUS_DICT_ENTRY_END_CHAR_AS_STRING, &dict);
- 
--	append(&dict, "INTERNAL_IFNAME", ifname);
-+	append(&dict, "INTERNAL_IFNAME", ppp_ifname());
- 
- 	inet_ntop(AF_INET, &ipcp_gotoptions[0].ouraddr, buf, INET_ADDRSTRLEN);
- 	append(&dict, "INTERNAL_IP4_ADDRESS", buf);
-@@ -309,9 +308,9 @@ int plugin_init(void)
- 	chap_check_hook = ppp_have_secret;
- 	pap_check_hook = ppp_have_secret;
- 
--	add_notifier(&ip_up_notifier, ppp_up, NULL);
--	add_notifier(&phasechange, ppp_phase_change, NULL);
--	add_notifier(&exitnotify, ppp_exit, connection);
-+	ppp_add_notify(NF_IP_UP, ppp_up, NULL);
-+	ppp_add_notify(NF_PHASE_CHANGE, ppp_phase_change, NULL);
-+	ppp_add_notify(NF_EXIT, ppp_exit, connection);
- 
- 	return 0;
- }
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 9dca21a02f1..aefdd3aa065 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -18,14 +18,6 @@ diff --git a/gweb/gresolv.c b/gweb/gresolv.c
 index 954e7cf..2a9bc51 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
-@@ -36,6 +36,7 @@
- #include <arpa/inet.h>
- #include <arpa/nameser.h>
- #include <net/if.h>
-+#include <ctype.h>
- 
- #include "gresolv.h"
- 
 @@ -878,8 +879,6 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
deleted file mode 100644
index 182c5ca29c2..00000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d1a5ede5d255bde8ef707f8441b997563b9312bd Mon Sep 17 00:00:00 2001
-From: Nathan Crandall <ncrandall@tesla.com>
-Date: Tue, 12 Jul 2022 08:56:34 +0200
-Subject: gweb: Fix OOB write in received_data()
-
-There is a mismatch of handling binary vs. C-string data with memchr
-and strlen, resulting in pos, count, and bytes_read to become out of
-sync and result in a heap overflow.  Instead, do not treat the buffer
-as an ASCII C-string. We calculate the count based on the return value
-of memchr, instead of strlen.
-
-Fixes: CVE-2022-32292
-
-CVE: CVE-2022-32292
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312bd]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gweb/gweb.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gweb/gweb.c b/gweb/gweb.c
-index 12fcb1d8..13c6c5f2 100644
---- a/gweb/gweb.c
-+++ b/gweb/gweb.c
-@@ -918,7 +918,7 @@ static gboolean received_data(GIOChannel *channel, GIOCondition cond,
- 		}
- 
- 		*pos = '\0';
--		count = strlen((char *) ptr);
-+		count = pos - ptr;
- 		if (count > 0 && ptr[count - 1] == '\r') {
- 			ptr[--count] = '\0';
- 			bytes_read--;
--- 
-cgit 
-
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
deleted file mode 100644
index b2802035943..00000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 72343929836de80727a27d6744c869dff045757c Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@monom.org>
-Date: Tue, 5 Jul 2022 08:32:12 +0200
-Subject: wispr: Add reference counter to portal context
-
-Track the connman_wispr_portal_context live time via a
-refcounter. This only adds the infrastructure to do proper reference
-counting.
-
-Fixes: CVE-2022-32293
-CVE: CVE-2022-32293
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=416bfaff988882c553c672e5bfc2d4f648d29e8a]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/wispr.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 42 insertions(+), 10 deletions(-)
-
-diff --git a/src/wispr.c b/src/wispr.c
-index a07896ca..bde7e63b 100644
---- a/src/wispr.c
-+++ b/src/wispr.c
-@@ -56,6 +56,7 @@ struct wispr_route {
- };
- 
- struct connman_wispr_portal_context {
-+	int refcount;
- 	struct connman_service *service;
- 	enum connman_ipconfig_type type;
- 	struct connman_wispr_portal *wispr_portal;
-@@ -97,6 +98,11 @@ static char *online_check_ipv4_url = NULL;
- static char *online_check_ipv6_url = NULL;
- static bool enable_online_to_ready_transition = false;
- 
-+#define wispr_portal_context_ref(wp_context) \
-+	wispr_portal_context_ref_debug(wp_context, __FILE__, __LINE__, __func__)
-+#define wispr_portal_context_unref(wp_context) \
-+	wispr_portal_context_unref_debug(wp_context, __FILE__, __LINE__, __func__)
-+
- static void connman_wispr_message_init(struct connman_wispr_message *msg)
- {
- 	DBG("");
-@@ -162,9 +168,6 @@ static void free_connman_wispr_portal_context(
- {
- 	DBG("context %p", wp_context);
- 
--	if (!wp_context)
--		return;
--
- 	if (wp_context->wispr_portal) {
- 		if (wp_context->wispr_portal->ipv4_context == wp_context)
- 			wp_context->wispr_portal->ipv4_context = NULL;
-@@ -201,9 +204,38 @@ static void free_connman_wispr_portal_context(
- 	g_free(wp_context);
- }
- 
-+static struct connman_wispr_portal_context *
-+wispr_portal_context_ref_debug(struct connman_wispr_portal_context *wp_context,
-+			const char *file, int line, const char *caller)
-+{
-+	DBG("%p ref %d by %s:%d:%s()", wp_context,
-+		wp_context->refcount + 1, file, line, caller);
-+
-+	__sync_fetch_and_add(&wp_context->refcount, 1);
-+
-+	return wp_context;
-+}
-+
-+static void wispr_portal_context_unref_debug(
-+		struct connman_wispr_portal_context *wp_context,
-+		const char *file, int line, const char *caller)
-+{
-+	if (!wp_context)
-+		return;
-+
-+	DBG("%p ref %d by %s:%d:%s()", wp_context,
-+		wp_context->refcount - 1, file, line, caller);
-+
-+	if (__sync_fetch_and_sub(&wp_context->refcount, 1) != 1)
-+		return;
-+
-+	free_connman_wispr_portal_context(wp_context);
-+}
-+
- static struct connman_wispr_portal_context *create_wispr_portal_context(void)
- {
--	return g_try_new0(struct connman_wispr_portal_context, 1);
-+	return wispr_portal_context_ref(
-+		g_new0(struct connman_wispr_portal_context, 1));
- }
- 
- static void free_connman_wispr_portal(gpointer data)
-@@ -215,8 +247,8 @@ static void free_connman_wispr_portal(gpointer data)
- 	if (!wispr_portal)
- 		return;
- 
--	free_connman_wispr_portal_context(wispr_portal->ipv4_context);
--	free_connman_wispr_portal_context(wispr_portal->ipv6_context);
-+	wispr_portal_context_unref(wispr_portal->ipv4_context);
-+	wispr_portal_context_unref(wispr_portal->ipv6_context);
- 
- 	g_free(wispr_portal);
- }
-@@ -452,7 +484,7 @@ static void portal_manage_status(GWebResult *result,
- 		connman_info("Client-Timezone: %s", str);
- 
- 	if (!enable_online_to_ready_transition)
--		free_connman_wispr_portal_context(wp_context);
-+		wispr_portal_context_unref(wp_context);
- 
- 	__connman_service_ipconfig_indicate_state(service,
- 					CONNMAN_SERVICE_STATE_ONLINE, type);
-@@ -616,7 +648,7 @@ static void wispr_portal_request_wispr_login(struct connman_service *service,
- 				return;
- 		}
- 
--		free_connman_wispr_portal_context(wp_context);
-+		wispr_portal_context_unref(wp_context);
- 		return;
- 	}
- 
-@@ -952,7 +984,7 @@ static int wispr_portal_detect(struct connman_wispr_portal_context *wp_context)
- 
- 		if (wp_context->token == 0) {
- 			err = -EINVAL;
--			free_connman_wispr_portal_context(wp_context);
-+			wispr_portal_context_unref(wp_context);
- 		}
- 	} else if (wp_context->timeout == 0) {
- 		wp_context->timeout = g_idle_add(no_proxy_callback, wp_context);
-@@ -1001,7 +1033,7 @@ int __connman_wispr_start(struct connman_service *service,
- 
- 	/* If there is already an existing context, we wipe it */
- 	if (wp_context)
--		free_connman_wispr_portal_context(wp_context);
-+		wispr_portal_context_unref(wp_context);
- 
- 	wp_context = create_wispr_portal_context();
- 	if (!wp_context)
--- 
-cgit 
-
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
deleted file mode 100644
index 56f8fc82de9..00000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 416bfaff988882c553c672e5bfc2d4f648d29e8a Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@monom.org>
-Date: Tue, 5 Jul 2022 09:11:09 +0200
-Subject: wispr: Update portal context references
-
-Maintain proper portal context references to avoid UAF.
-
-Fixes: CVE-2022-32293
-CVE: CVE-2022-32293
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/wispr.c | 34 ++++++++++++++++++++++------------
- 1 file changed, 22 insertions(+), 12 deletions(-)
-
-diff --git a/src/wispr.c b/src/wispr.c
-index bde7e63b..84bed33f 100644
---- a/src/wispr.c
-+++ b/src/wispr.c
-@@ -105,8 +105,6 @@ static bool enable_online_to_ready_transition = false;
- 
- static void connman_wispr_message_init(struct connman_wispr_message *msg)
- {
--	DBG("");
--
- 	msg->has_error = false;
- 	msg->current_element = NULL;
- 
-@@ -166,8 +164,6 @@ static void free_wispr_routes(struct connman_wispr_portal_context *wp_context)
- static void free_connman_wispr_portal_context(
- 		struct connman_wispr_portal_context *wp_context)
- {
--	DBG("context %p", wp_context);
--
- 	if (wp_context->wispr_portal) {
- 		if (wp_context->wispr_portal->ipv4_context == wp_context)
- 			wp_context->wispr_portal->ipv4_context = NULL;
-@@ -483,9 +479,6 @@ static void portal_manage_status(GWebResult *result,
- 				&str))
- 		connman_info("Client-Timezone: %s", str);
- 
--	if (!enable_online_to_ready_transition)
--		wispr_portal_context_unref(wp_context);
--
- 	__connman_service_ipconfig_indicate_state(service,
- 					CONNMAN_SERVICE_STATE_ONLINE, type);
- 
-@@ -546,14 +539,17 @@ static void wispr_portal_request_portal(
- {
- 	DBG("");
- 
-+	wispr_portal_context_ref(wp_context);
- 	wp_context->request_id = g_web_request_get(wp_context->web,
- 					wp_context->status_url,
- 					wispr_portal_web_result,
- 					wispr_route_request,
- 					wp_context);
- 
--	if (wp_context->request_id == 0)
-+	if (wp_context->request_id == 0) {
- 		wispr_portal_error(wp_context);
-+		wispr_portal_context_unref(wp_context);
-+	}
- }
- 
- static bool wispr_input(const guint8 **data, gsize *length,
-@@ -618,13 +614,15 @@ static void wispr_portal_browser_reply_cb(struct connman_service *service,
- 		return;
- 
- 	if (!authentication_done) {
--		wispr_portal_error(wp_context);
- 		free_wispr_routes(wp_context);
-+		wispr_portal_error(wp_context);
-+		wispr_portal_context_unref(wp_context);
- 		return;
- 	}
- 
- 	/* Restarting the test */
- 	__connman_service_wispr_start(service, wp_context->type);
-+	wispr_portal_context_unref(wp_context);
- }
- 
- static void wispr_portal_request_wispr_login(struct connman_service *service,
-@@ -700,11 +698,13 @@ static bool wispr_manage_message(GWebResult *result,
- 
- 		wp_context->wispr_result = CONNMAN_WISPR_RESULT_LOGIN;
- 
-+		wispr_portal_context_ref(wp_context);
- 		if (__connman_agent_request_login_input(wp_context->service,
- 					wispr_portal_request_wispr_login,
--					wp_context) != -EINPROGRESS)
-+					wp_context) != -EINPROGRESS) {
- 			wispr_portal_error(wp_context);
--		else
-+			wispr_portal_context_unref(wp_context);
-+		} else
- 			return true;
- 
- 		break;
-@@ -753,6 +753,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 		if (length > 0) {
- 			g_web_parser_feed_data(wp_context->wispr_parser,
- 								chunk, length);
-+			wispr_portal_context_unref(wp_context);
- 			return true;
- 		}
- 
-@@ -770,6 +771,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 
- 	switch (status) {
- 	case 000:
-+		wispr_portal_context_ref(wp_context);
- 		__connman_agent_request_browser(wp_context->service,
- 				wispr_portal_browser_reply_cb,
- 				wp_context->status_url, wp_context);
-@@ -781,11 +783,14 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 		if (g_web_result_get_header(result, "X-ConnMan-Status",
- 						&str)) {
- 			portal_manage_status(result, wp_context);
-+			wispr_portal_context_unref(wp_context);
- 			return false;
--		} else
-+		} else {
-+			wispr_portal_context_ref(wp_context);
- 			__connman_agent_request_browser(wp_context->service,
- 					wispr_portal_browser_reply_cb,
- 					wp_context->redirect_url, wp_context);
-+		}
- 
- 		break;
- 	case 300:
-@@ -798,6 +803,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 			!g_web_result_get_header(result, "Location",
- 							&redirect)) {
- 
-+			wispr_portal_context_ref(wp_context);
- 			__connman_agent_request_browser(wp_context->service,
- 					wispr_portal_browser_reply_cb,
- 					wp_context->status_url, wp_context);
-@@ -808,6 +814,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 
- 		wp_context->redirect_url = g_strdup(redirect);
- 
-+		wispr_portal_context_ref(wp_context);
- 		wp_context->request_id = g_web_request_get(wp_context->web,
- 				redirect, wispr_portal_web_result,
- 				wispr_route_request, wp_context);
-@@ -820,6 +827,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 
- 		break;
- 	case 505:
-+		wispr_portal_context_ref(wp_context);
- 		__connman_agent_request_browser(wp_context->service,
- 				wispr_portal_browser_reply_cb,
- 				wp_context->status_url, wp_context);
-@@ -832,6 +840,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
- 	wp_context->request_id = 0;
- done:
- 	wp_context->wispr_msg.message_type = -1;
-+	wispr_portal_context_unref(wp_context);
- 	return false;
- }
- 
-@@ -890,6 +899,7 @@ static void proxy_callback(const char *proxy, void *user_data)
- 					xml_wispr_parser_callback, wp_context);
- 
- 	wispr_portal_request_portal(wp_context);
-+	wispr_portal_context_unref(wp_context);
- }
- 
- static gboolean no_proxy_callback(gpointer user_data)
--- 
-cgit 
-
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
similarity index 66%
rename from meta/recipes-connectivity/connman/connman_1.41.bb
rename to meta/recipes-connectivity/connman/connman_1.42.bb
index d8ac1f5cdee..c2fcd617aea 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -5,16 +5,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://no-version-scripts.patch \
-           file://CVE-2022-32293_p1.patch \
-           file://CVE-2022-32293_p2.patch \
-           file://CVE-2022-32292.patch \
-           file://0001-gdhcp-Verify-and-sanitize-packet-length-first.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[sha256sum] = "79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589"
+SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.30.2


