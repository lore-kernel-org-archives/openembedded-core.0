Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21915C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 07:27:59 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19684.1780385276416802766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 00:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EyEoAqzb;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccea53f35cso44221676d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 00:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780385275; cv=none;
        d=google.com; s=arc-20240605;
        b=gUfgIODViF9pPqsKcPgYkt2WPnedjU/HSKJ6T9jtYM0Sa7WIkvYr2FfDtRNt/MkO1r
         p/+V79Ou5FuM9lShb1SWbXO0Wxwwk4EWSo88NBotMjJ0yH8myybE6HS4VBAvSQb341UW
         QH4/v7rAyTYDsrno1n5p7pstmrQ5Y2xAqqFL59f3L4VWuAXPSM52IUAKeQvfihF2RFsf
         KDitC2vFang0F18R9D9t3xNEcap4Ed59JhAIK/nRYWW6zb2+QL/CJNqQ361AB4F4tDTV
         kiqEgpSsgmBcgcyPSk6IfOH076kvgDyiArhpx+24py6mQmigMRkreHGlutuB3lnwVCno
         S6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4o538eEWVx9uqN4eSce9JvCvomtWWmrmDR9IBf++imQ=;
        fh=2KdgNeShX8mlIRBceZnpKx/WJtBSyUpuvyi/3B5KD+s=;
        b=UR4PsgdIrelCa78YH6xi8QjUuA2CkHgkWKdwlV9jClo3ftyaLK7svM+o8t6q0nfdZN
         n2tP89+wVH4hI/PBImqH6ScZCxg/MyTv6DeWV6V0y9bCMDqpygWYfRKXtTWIcQQRjXld
         nG6yaXo4RHKqjzIXYqJvgxxWa0DDXbgpNWnssY/ngplxomv/6ihYBvspRGOTl2cNz2If
         Vd1xu45kQzR1mydel5NhZZ2cM+kcjxnbZ2kbO6ZZVvlW2EOl6WbpdPpuerh5VtZKxyju
         S4VKJ6HaOfmC1N37wgcP+p7K6jZH1wt3ipyhk0JcP+S8yrQ/xDpB+qO1ZQiHjJ5GHYEJ
         nDDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780385275; x=1780990075; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o538eEWVx9uqN4eSce9JvCvomtWWmrmDR9IBf++imQ=;
        b=EyEoAqzbo0zP8MMuHygSPKrJFKPgvFCCL5ev6izlagMx5YrikbzXPOdgjWyPANXpO+
         tzi3hb4QKWbBc2BrH1fSb4ofxrnqhFtwvW/4aB4eFvf0vdWk/0shxE30zT6qbudIcdaf
         Y8TzfdzEPu5XHdNnWBuochDgMm60gQoe0CGJnZgliggeh00WrnPcz6MrD2ux+nJyjiWa
         lkb0e0iFy0sTTnE2XHmmoR+7rXPqBRmohTSwCSr1LWGR9GYYa+VHXBCMEku8bHpG8g4p
         m8ppkKNNQNTvyS4h470G2eO4p1IJz4E1m/C+tdC4CVe9NITfUOomiOtTqyWseZsfPDHT
         plTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385275; x=1780990075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4o538eEWVx9uqN4eSce9JvCvomtWWmrmDR9IBf++imQ=;
        b=RwlzFdHisLN+hErabB3XbtRXtpb1QX4Z4zMUJX/TTPmJu74D4sf9c2O2LtCg+oyjQI
         1OpvSqtSxyo4fJk15KkjhI9H9BJlUwHaEI5ME21lRu37baNVsZ3J5mSg8tKGBL1CC+OF
         eU8peJ4b01rmEXcjUzDnmZl8nuNeydXfqktU0E0Nu0OtYxFLGp41CodiYgXwg/wS+XQy
         awuoob7V7TqM5FurnNJsB7QBbXSMSJuu2jZ+4ASq6HLuozcxULIEjvE33Mflw//YsFu3
         BX7t5IBv+//4aGexKlTgHEMu/NIor13/WfLYiXoIl9VC7nDBoq8C0wYWYhmSqlO+wnhJ
         cPMA==
X-Gm-Message-State: AOJu0YxCZMV5VCCk2TN3n4jnLmYJENM2inhLTLjBY5nh5AzNtivLhQrE
	0PRXNmMz8NddbFHo2WwbSyoo3yzdfXSY5VDwmSFCLjHEWHg076yGwHzY4SOQEM3wJvhvghhaRCe
	KD4Q6cGyiYf80Pz4vYazsGiF6jaOFRrDszg==
X-Gm-Gg: Acq92OGwqjoHpQiC7LrjVqot/Dh2GHJscpGDzvtIgzNF+qDhRfU6WDY0SRQZyvuz7QM
	1TxtmMK0wDwi1naS3X99h2SgiYsSU4tfDN4CGqfiUNbxjUN97f2A/74ZBI6BYvv1S/vrKTbu6ut
	Lapm4cjUq+N5ZBhhgNe+Oqo7muiJQYrCwWK5xGOLTI5prbNTa0CHuYgATScQFYsFR8KLiCH6ZXI
	38sk7aYVVVc2DyAHTw106upcAhtwwNPfKiV94UkkFP85Bc6yO08OOJjhsUr1PpI9e6/l9qIfxBI
	BLdO9tJR5GK3H4JYoC0DweYI6heeWO4BpO6rLUG2u8s6yaXT5JFd
X-Received: by 2002:a0c:e008:0:b0:8cc:f30b:642c with SMTP id
 6a1803df08f44-8ccf30b6501mr198282986d6.43.1780385275244; Tue, 02 Jun 2026
 00:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2026 09:27:43 +0200
X-Gm-Features: AVHnY4LsZ-kscIlTxYN8PIF3mw9H21Pi8LedvsVe9WX31WybEr-dbvpdJ4wsdhg
Message-ID: <CANNYZj_y3KBe3Qgp3cu-VzxrFn61rkNwWuLcPtjp+UWV62QoFg@mail.gmail.com>
Subject: Re: [OE-core][master][wrynose][PATCH] ppp: upgrade 2.5.2 -> 2.5.3
To: peng.zhang1.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>, 
	Daniel Turull <daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238011

This has new features, it has been developed on master branch
upstream, and so isn't eligible for wrynose backport.

Chen, Daniel: this is why point releases can't be automatically
considered 'bugfix only'. Plenty of projects where that isn't the
case.

Alex

On Tue, 2 Jun 2026 at 09:04, Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> ChangeLog:
> https://github.com/ppp-project/ppp/releases/tag/v2.5.3
>
> Drop backported patches:
> - 0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
> - 0001-pppdump-Fixed-building-with-GCC-15-548.patch
> - 0001-pppd-session-Fixed-building-with-GCC-15.patch
>
> Add ppp-dhcpv6relay package for newly added dhcpv6relay plugin.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  ....h-remove-erroneous-generated-header.patch | 98 -------------------
>  ...d-session-Fixed-building-with-GCC-15.patch | 33 -------
>  ...pdump-Fixed-building-with-GCC-15-548.patch | 75 --------------
>  .../ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb}        |  9 +-
>  4 files changed, 4 insertions(+), 211 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.=
h-remove-erroneous-generated-header.patch
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-F=
ixed-building-with-GCC-15.patch
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-=
building-with-GCC-15-548.patch
>  rename meta/recipes-connectivity/ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb} (9=
1%)
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remov=
e-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp/0001=
-pppd-pppdconf.h-remove-erroneous-generated-header.patch
> deleted file mode 100644
> index a00706c184..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erron=
eous-generated-header.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 17 Mar 2025 11:12:07 +0100
> -Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
> -
> -Upstream-Status: Inappropriate [tarball generation issue tracked at http=
s://github.com/ppp-project/ppp/issues/541]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - pppd/pppdconf.h | 80 -------------------------------------------------
> - 1 file changed, 80 deletions(-)
> - delete mode 100644 pppd/pppdconf.h
> -
> -diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
> -deleted file mode 100644
> -index 51a8f02..0000000
> ---- a/pppd/pppdconf.h
> -+++ /dev/null
> -@@ -1,80 +0,0 @@
> --/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
> --/*
> -- * Copyright (c) 2022 Eivind N=C3=A6ss. All rights reserved.
> -- *
> -- * Redistribution and use in source and binary forms, with or without
> -- * modification, are permitted provided that the following conditions
> -- * are met:
> -- *
> -- * 1. Redistributions of source code must retain the above copyright
> -- *    notice, this list of conditions and the following disclaimer.
> -- *
> -- * 2. Redistributions in binary form must reproduce the above copyright
> -- *    notice, this list of conditions and the following disclaimer in
> -- *    the documentation and/or other materials provided with the
> -- *    distribution.
> -- *
> -- * 3. The name(s) of the authors of this software must not be used to
> -- *    endorse or promote products derived from this software without
> -- *    prior written permission.
> -- *
> -- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
> -- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> -- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
> -- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> -- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
> -- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
> -- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE=
.
> -- */
> --
> --/*
> -- * This file is generated by configure and sets the features enabled
> -- *   in pppd when configured.
> -- */
> --
> --#ifndef PPP_PPPDCONF_H
> --#define PPP_PPPDCONF_H
> --
> --/* Have Microsoft CHAP support */
> --#define PPP_WITH_CHAPMS 1
> --
> --/* Have Microsoft LAN Manager support */
> --/* #undef PPP_WITH_MSLANMAN */
> --
> --/* Have Microsoft MPPE support */
> --#define PPP_WITH_MPPE 1
> --
> --/* Have multilink support */
> --#define PPP_WITH_MULTILINK 1
> --
> --/* Have packet activity filter support */
> --#define PPP_WITH_FILTER 1
> --
> --/* Have support for loadable plugins */
> --#define PPP_WITH_PLUGINS 1
> --
> --/* Have Callback Protocol support */
> --/* #undef PPP_WITH_CBCP */
> --
> --/* Include TDB support */
> --#define PPP_WITH_TDB 1
> --
> --/* Have IPv6 Control Protocol */
> --#define PPP_WITH_IPV6CP 1
> --
> --/* Support for Pluggable Authentication Modules */
> --/* #undef PPP_WITH_PAM */
> --
> --/* Have EAP-SRP authentication support */
> --/* #undef PPP_WITH_SRP */
> --
> --/* Have EAP-TLS authentication support */
> --#define PPP_WITH_EAPTLS 1
> --
> --/* Have PEAP authentication support */
> --#define PPP_WITH_PEAP 1
> --
> --/* The pppd version */
> --#define PPPD_VERSION "2.5.2"
> --
> --#endif
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-bu=
ilding-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-sess=
ion-Fixed-building-with-GCC-15.patch
> deleted file mode 100644
> index d95c72e96b..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-=
with-GCC-15.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 17 Mar 2025 14:38:26 -0700
> -Subject: [PATCH] pppd/session: Fixed building with GCC 15
> -
> -Fixed building with GCC 15 which defaults to C23
> -and find conflicting declration of getspnam() here
> -with the one provided by shadow.h (extern struct spwd *getspnam (const c=
har *__name);)
> -
> -Fixes
> -../../ppp-2.5.2/pppd/session.c: In function 'session_start':
> -../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'get=
spnam'; have 'struct spwd *(void)'
> -  185 |     struct spwd *getspnam();
> -      |                  ^~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pppd/session.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/pppd/session.c b/pppd/session.c
> -index f08d8e1..9cc7538 100644
> ---- a/pppd/session.c
> -+++ b/pppd/session.c
> -@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, con=
st char *passwd, const char
> -     char *cbuf;
> - #ifdef HAVE_SHADOW_H
> -     struct spwd *spwd;
> --    struct spwd *getspnam();
> -     long now =3D 0;
> - #endif /* #ifdef HAVE_SHADOW_H */
> - #endif /* #ifdef PPP_WITH_PAM */
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-buildin=
g-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fi=
xed-building-with-GCC-15-548.patch
> deleted file mode 100644
> index 2a3b3cc84a..0000000000
> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-=
GCC-15-548.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Jaroslav=3D20=3DC5=3DA0karvada?=3D <jskarvad@redhat.co=
m>
> -Date: Thu, 27 Feb 2025 23:00:16 +0100
> -Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -GCC 15 defaults to C23 which does not allow K&R declarations.
> -
> -Credit Yaakov Selkowitz in:
> -https://src.fedoraproject.org/rpms/ppp/pull-request/12
> -
> -Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/548]
> -
> -Signed-off-by: Jaroslav =C5=A0karvada <jskarvad@redhat.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pppdump/pppdump.c | 20 +++++++-------------
> - 1 file changed, 7 insertions(+), 13 deletions(-)
> -
> -diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
> -index c24208a..1534036 100644
> ---- a/pppdump/pppdump.c
> -+++ b/pppdump/pppdump.c
> -@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
> - extern int optind;
> - extern char *optarg;
> -
> --void dumplog();
> --void dumpppp();
> --void show_time();
> -+void dumplog(FILE *);
> -+void dumpppp(FILE *);
> -+void show_time(FILE *, int);
> -
> - int
> --main(ac, av)
> --    int ac;
> --    char **av;
> -+main(int ac, char **av)
> - {
> -     int i;
> -     char *p;
> -@@ -97,8 +95,7 @@ main(ac, av)
> - }
> -
> - void
> --dumplog(f)
> --    FILE *f;
> -+dumplog(FILE *f)
> - {
> -     int c, n, k, col;
> -     int nb, c2;
> -@@ -241,8 +238,7 @@ struct pkt {
> - unsigned char dbuf[8192];
> -
> - void
> --dumpppp(f)
> --    FILE *f;
> -+dumpppp(FILE *f)
> - {
> -     int c, n, k;
> -     int nb, nl, dn, proto, rv;
> -@@ -375,9 +371,7 @@ dumpppp(f)
> - }
> -
> - void
> --show_time(f, c)
> --    FILE *f;
> --    int c;
> -+show_time(FILE *f, int c)
> - {
> -     time_t t;
> -     int n;
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.5.3.bb
> similarity index 91%
> rename from meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> rename to meta/recipes-connectivity/ppp/ppp_2.5.3.bb
> index 607678db8b..435559a815 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
> @@ -23,12 +23,9 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${B=
P}.tar.gz \
>             file://ppp_on_boot \
>             file://provider \
>             file://ppp@.service \
> -           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
> -           file://0001-pppd-pppdconf.h-remove-erroneous-generated-header=
.patch \
> -           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e=
8f701b8e55733cb2"
> +SRC_URI[sha256sum] =3D "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c55091=
58e99e148f572d4f"
>
>  inherit autotools pkgconfig systemd
>
> @@ -60,7 +57,7 @@ do_install:append () {
>  }
>
>  CONFFILES:${PN} =3D "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/cha=
p-secrets ${sysconfdir}/ppp/options"
> -PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools"
> +PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools ${PN}-dhcpv6relay"
>  FILES:${PN}        =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindi=
r}/pppd ${systemd_system_unitdir}/ppp@.service"
>  FILES:${PN}-oa       =3D "${libdir}/pppd/${PV}/pppoatm.so"
>  FILES:${PN}-oe       =3D "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV=
}/*pppoe.so"
> @@ -70,6 +67,7 @@ FILES:${PN}-minconn  =3D "${libdir}/pppd/${PV}/minconn.=
so"
>  FILES:${PN}-password =3D "${libdir}/pppd/${PV}/pass*.so"
>  FILES:${PN}-l2tp     =3D "${libdir}/pppd/${PV}/*l2tp.so"
>  FILES:${PN}-tools    =3D "${sbindir}/pppstats ${sbindir}/pppdump"
> +FILES:${PN}-dhcpv6relay =3D "${libdir}/pppd/${PV}/dhcpv6relay.so"
>  SUMMARY:${PN}-oa       =3D "Plugin for PPP for PPP-over-ATM support"
>  SUMMARY:${PN}-oe       =3D "Plugin for PPP for PPP-over-Ethernet support=
"
>  SUMMARY:${PN}-radius   =3D "Plugin for PPP for RADIUS support"
> @@ -78,4 +76,5 @@ SUMMARY:${PN}-minconn  =3D "Plugin for PPP to set a del=
ay before the idle timeout
>  SUMMARY:${PN}-password =3D "Plugin for PPP to get passwords via a pipe"
>  SUMMARY:${PN}-l2tp     =3D "Plugin for PPP for l2tp support"
>  SUMMARY:${PN}-tools    =3D "Additional tools for the PPP package"
> +SUMMARY:${PN}-dhcpv6relay =3D "Plugin for PPP for DHCPv6 relay agent sup=
port"
>
> --
> 2.50.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238010): https://lists.openembedded.org/g/openembedde=
d-core/message/238010
> Mute This Topic: https://lists.openembedded.org/mt/119607595/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

