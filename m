Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AA8CD98EF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5800.1781637425409212172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LZQwKwfA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-460662fcb4eso3418724f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637424; x=1782242224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYijPXHZyHlLgh9pPKQnEYGHAXAZVZt2OnhZdQ0slmE=;
        b=LZQwKwfA3IuG7NjujrD3NzwZj331O/VuzZs01sL0BpI6AtGUkrWXhtywErh2m8eh/p
         EiR/hWbTYsULCnNX8XhUbKWHIp3s1qrd5Ix/4h5eWKS5hUYYWocfi6yYmdFz1tzPuQ8D
         ixbUr4Go5X+v190qcW2bGnDM4GEHJMaR49QWaFeckSlSU/pLBGf+irjeujyvehgTa2qI
         YocySB57sN9EIPnhLcA59yGJG5G8AjCwNdw4YlfgDKfslE43eMgjDdzlVL39MznZ7BEI
         kYSi4Jqb7qfpbt/m1FPhfdvfxHOgEQV5L2irMJJaqc6FKOoxWeR7GiNni9R/hzhMXslG
         4leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637424; x=1782242224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYijPXHZyHlLgh9pPKQnEYGHAXAZVZt2OnhZdQ0slmE=;
        b=Z207mZ71+4ud7/2+3HYqNbJ6H3jQmPsXz6bE3VkSglNlCG2vyNmA5uuH+y1b6KL4PE
         b3HmVq86IGG1MY6LOE/wOEZuLzEIlNOPRedMpmLNlbRmFcsD2Hm+R/1eT79HokCHcG4v
         ywU3bggbz+E/LU4ezJjnMEOzIOPQA3HhneWPCDVB3Z5/L4wzBbyR2C7GG2ttvbr1cjJa
         viMoXPfCO+jvsbIENr6+UuWXzDkx7e93vThL/+zIsUdXFTEnIeTU0YNI0cGHYGcecBro
         GxpZ4B28zQK7UM/Wdg5WrDcAg97kPdcrWJptSRx9uA4yzxxUMkmD5N4JUD8/mBAmCtMd
         MW1Q==
X-Gm-Message-State: AOJu0Yzpe/7q7FJ+6PoryQPU+30CvDfs6LGhlNZ0sf8cZEQUCaW+R75B
	9x0wMu7buS3BqSZeOgyYEnwq4UhtRbvSGCw4GMg7aQNZ3pNIAMuUohUi32yth59b
X-Gm-Gg: Acq92OHbM8C+/m2XhrZ1FhbkZUKCvdrxdtNfqkvBPgwMcdFh11wqo0MEm86thyHtD91
	IciW/mc/Ia/lJjZKjaREAvqyRaTg7uEAYyqZsSzsVaNhzKt5QfUXV1qMimh/rFB+/1WWFPYI+9K
	OQnRl3Nd6I1iPlfTyciTnKNNKbSEdGA53fjZypG8uRLi7Z+UyC6z0zqKo3+Bud+Lxa8aKvF0kHs
	V7Fi4vNSBqSPJLxSDxFHRaQ8vmuabe97eHpHxLwvmCafnQe22mnYzbC1As6qEM21Rk+rFMbscoX
	QTcWYnlNkQKOR5qKq6VvDe6aUKtWqX6nrrKHWrJwMmAcR0YJoSVDm+FdedYArvJ1hbxXvzESJy8
	3rIQAmiLXzVg6MRKKklcwHxJ6mOwFxqVTUjMf2UFz0xdAlIK9whejWO2zetWZ/m/czQ+FHNvnLJ
	1hBvh1mpIP1UoR4nzhNQE8jYkG6su3Aff9jwkq/uI0SFFraxfKUUIH3deIfK8=
X-Received: by 2002:a05:600c:4ec6:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-49233430b4dmr11396725e9.34.1781637423425;
        Tue, 16 Jun 2026 12:17:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/30] ppp: upgrade 2.5.2 -> 2.5.3
Date: Tue, 16 Jun 2026 21:16:22 +0200
Message-ID: <20260616191628.2014553-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238951

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ....h-remove-erroneous-generated-header.patch | 98 -------------------
 ...d-session-Fixed-building-with-GCC-15.patch | 33 -------
 ...pdump-Fixed-building-with-GCC-15-548.patch | 75 --------------
 .../ppp/{ppp_2.5.2.bb => ppp_2.5.3.bb}        | 11 +--
 4 files changed, 5 insertions(+), 212 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch
 rename meta/recipes-connectivity/ppp/{ppp_2.5.2.bb => ppp_2.5.3.bb} (89%)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
deleted file mode 100644
index a00706c184..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Mar 2025 11:12:07 +0100
-Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
-
-Upstream-Status: Inappropriate [tarball generation issue tracked at https://github.com/ppp-project/ppp/issues/541]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pppd/pppdconf.h | 80 -------------------------------------------------
- 1 file changed, 80 deletions(-)
- delete mode 100644 pppd/pppdconf.h
-
-diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
-deleted file mode 100644
-index 51a8f02..0000000
---- a/pppd/pppdconf.h
-+++ /dev/null
-@@ -1,80 +0,0 @@
--/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
--/* 
-- * Copyright (c) 2022 Eivind Næss. All rights reserved.
-- *
-- * Redistribution and use in source and binary forms, with or without
-- * modification, are permitted provided that the following conditions
-- * are met:
-- *
-- * 1. Redistributions of source code must retain the above copyright
-- *    notice, this list of conditions and the following disclaimer.
-- *
-- * 2. Redistributions in binary form must reproduce the above copyright
-- *    notice, this list of conditions and the following disclaimer in
-- *    the documentation and/or other materials provided with the
-- *    distribution.
-- *
-- * 3. The name(s) of the authors of this software must not be used to
-- *    endorse or promote products derived from this software without
-- *    prior written permission.
-- *
-- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
-- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
-- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
-- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-- */
--
--/*
-- * This file is generated by configure and sets the features enabled
-- *   in pppd when configured.
-- */
--
--#ifndef PPP_PPPDCONF_H
--#define PPP_PPPDCONF_H
--
--/* Have Microsoft CHAP support */
--#define PPP_WITH_CHAPMS 1
--
--/* Have Microsoft LAN Manager support */
--/* #undef PPP_WITH_MSLANMAN */
--
--/* Have Microsoft MPPE support */
--#define PPP_WITH_MPPE 1
--
--/* Have multilink support */
--#define PPP_WITH_MULTILINK 1
--
--/* Have packet activity filter support */
--#define PPP_WITH_FILTER 1
--
--/* Have support for loadable plugins */
--#define PPP_WITH_PLUGINS 1
--
--/* Have Callback Protocol support */
--/* #undef PPP_WITH_CBCP */
--
--/* Include TDB support */
--#define PPP_WITH_TDB 1
--
--/* Have IPv6 Control Protocol */
--#define PPP_WITH_IPV6CP 1
--
--/* Support for Pluggable Authentication Modules */
--/* #undef PPP_WITH_PAM */
--
--/* Have EAP-SRP authentication support */
--/* #undef PPP_WITH_SRP */
--
--/* Have EAP-TLS authentication support */
--#define PPP_WITH_EAPTLS 1
--
--/* Have PEAP authentication support */
--#define PPP_WITH_PEAP 1
--
--/* The pppd version */
--#define PPPD_VERSION "2.5.2"
--
--#endif
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
deleted file mode 100644
index d95c72e96b..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Mar 2025 14:38:26 -0700
-Subject: [PATCH] pppd/session: Fixed building with GCC 15
-
-Fixed building with GCC 15 which defaults to C23
-and find conflicting declration of getspnam() here
-with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
-
-Fixes
-../../ppp-2.5.2/pppd/session.c: In function 'session_start':
-../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
-  185 |     struct spwd *getspnam();
-      |                  ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pppd/session.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pppd/session.c b/pppd/session.c
-index f08d8e1..9cc7538 100644
---- a/pppd/session.c
-+++ b/pppd/session.c
-@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
-     char *cbuf;
- #ifdef HAVE_SHADOW_H
-     struct spwd *spwd;
--    struct spwd *getspnam();
-     long now = 0;
- #endif /* #ifdef HAVE_SHADOW_H */
- #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch
deleted file mode 100644
index 2a3b3cc84a..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
-Date: Thu, 27 Feb 2025 23:00:16 +0100
-Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-GCC 15 defaults to C23 which does not allow K&R declarations.
-
-Credit Yaakov Selkowitz in:
-https://src.fedoraproject.org/rpms/ppp/pull-request/12
-
-Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/548]
-
-Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pppdump/pppdump.c | 20 +++++++-------------
- 1 file changed, 7 insertions(+), 13 deletions(-)
-
-diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
-index c24208a..1534036 100644
---- a/pppdump/pppdump.c
-+++ b/pppdump/pppdump.c
-@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
- extern int optind;
- extern char *optarg;
- 
--void dumplog();
--void dumpppp();
--void show_time();
-+void dumplog(FILE *);
-+void dumpppp(FILE *);
-+void show_time(FILE *, int);
- 
- int
--main(ac, av)
--    int ac;
--    char **av;
-+main(int ac, char **av)
- {
-     int i;
-     char *p;
-@@ -97,8 +95,7 @@ main(ac, av)
- }
- 
- void
--dumplog(f)
--    FILE *f;
-+dumplog(FILE *f)
- {
-     int c, n, k, col;
-     int nb, c2;
-@@ -241,8 +238,7 @@ struct pkt {
- unsigned char dbuf[8192];
- 
- void
--dumpppp(f)
--    FILE *f;
-+dumpppp(FILE *f)
- {
-     int c, n, k;
-     int nb, nl, dn, proto, rv;
-@@ -375,9 +371,7 @@ dumpppp(f)
- }
- 
- void
--show_time(f, c)
--    FILE *f;
--    int c;
-+show_time(FILE *f, int c)
- {
-     time_t t;
-     int n;
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
similarity index 89%
rename from meta/recipes-connectivity/ppp/ppp_2.5.2.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.3.bb
index 37e223b4ab..07cf4cc037 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
@@ -23,12 +23,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
-           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
-           file://0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch \
-           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
-SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"
+SRC_URI[sha256sum] = "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c5509158e99e148f572d4f"
 
 inherit autotools pkgconfig systemd
 
@@ -60,7 +57,7 @@ do_install:append () {
 }
 
 CONFFILES:${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
-PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
+PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools ${PN}-dhcpv6relay"
 FILES:${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_system_unitdir}/ppp@.service"
 FILES:${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
 FILES:${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/*pppoe.so"
@@ -69,6 +66,7 @@ FILES:${PN}-winbind  = "${libdir}/pppd/${PV}/winbind.so"
 FILES:${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
 FILES:${PN}-password = "${libdir}/pppd/${PV}/pass*.so"
 FILES:${PN}-l2tp     = "${libdir}/pppd/${PV}/*l2tp.so"
+FILES:${PN}-dhcpv6relay = "${libdir}/pppd/${PV}/dhcpv6relay.so"
 FILES:${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump"
 SUMMARY:${PN}-oa       = "Plugin for PPP for PPP-over-ATM support"
 SUMMARY:${PN}-oe       = "Plugin for PPP for PPP-over-Ethernet support"
@@ -76,6 +74,7 @@ SUMMARY:${PN}-radius   = "Plugin for PPP for RADIUS support"
 SUMMARY:${PN}-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
 SUMMARY:${PN}-minconn  = "Plugin for PPP to set a delay before the idle timeout applies"
 SUMMARY:${PN}-password = "Plugin for PPP to get passwords via a pipe"
-SUMMARY:${PN}-l2tp     = "Plugin for PPP for l2tp support"
+SUMMARY:${PN}-l2tp     = "Plugin which can be used to provide IPv6 RAs to the remote side and relay the subsequent incoming DHCPv6 requests to a DHCPv6 server"
+SUMMARY:${PN}-dhcpv6relay     = "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-tools    = "Additional tools for the PPP package"
 
-- 
2.47.3


