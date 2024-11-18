Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF406D591BA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:15:58 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.4741.1731964556065965284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B3aBgNkc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ee6a2ae6ecso27469327b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731964555; x=1732569355; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe92mA0u22U9pmN3vQZ4QMSWsWhNGsQVpqVo+5KGpjA=;
        b=B3aBgNkcgNQP1DwcIGVBIKCbtQt4u4aTrblql/8LWcZHkgAPvMuhJ+PeaQgwRCj2SD
         m6s6Zz4B0rkmLqnIFTSXAAEaE4QcdSFlB7nwgmHfhMM/dsYf4jpvJiT5LnIPmDNuk8Id
         YSxrYK3KlMLi0TcioCBVECvu5de74vRs8hQy/pUk2mC4Z8G3lz5ZMjH642xSpCJdVGEt
         DB37kDxr2Fvh956U07nNf8cCCzh5uNdOfWzLRK4ipkOKvv2PLVbxcciS5n/ggXVyKIUO
         Y7SaLG+TSMofc0W2ok1jo6k/530xuwFdLBqQfQmvOIPgTGVENkg+iLFwhyVCT2DHx5JH
         S4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731964555; x=1732569355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe92mA0u22U9pmN3vQZ4QMSWsWhNGsQVpqVo+5KGpjA=;
        b=bm5HuMIu6FX6LWisypUqNnim9rAWKoLh7LaOqp8Sk0PXCqZv2e9IpODuhTlSZ70lRF
         1scxv4/5+/3p4nuu5AWYwym9e9rLYDwr4SoKy9A0Zqmcl69PEUuTHukom+BONqtzVNcF
         3qLrzPskL0NTFHNGanniJ5jIVXTsH6PB52t0ZArvnpRTpAOLcGpSfKkIFUfMvv7qLfj/
         Nn0k0NC5lUe216erDlShSenSbTed5EnYabLbbMXE+HwwohmbEgRBeDj0W+843RADJMW6
         UXJGyFnf2T8W7SJ/eVCudoHXIZke5BIjDZavNnYCpi/523zOIxmc8ftRdnD0Pk744qwP
         ac7A==
X-Gm-Message-State: AOJu0YyNAJlcTCl3/zBthqBKq2PpSg2tLgPPVvR46v7wGyt7ZnWTkmDy
	0yeWwxs3Bezy30zU8XvyOIWx+Bam/V7Mi/9x89JR8CaJIH7dto/Ne0JcxRIEdfWQOBE5koH3Jlg
	xC+9QuxgFjBbEAwOh7/+Zqy0oRWzmyeHaa1nuGHasve74op6Oew0=
X-Google-Smtp-Source: AGHT+IFecYaKQdMAdedVx8XSpvKQz/H8fMotqGWDEXUyM6FzTHWB1ia/q7M4TqxzDWYKLRovLitBV25t9swT8Nnm4CU=
X-Received: by 2002:a05:690c:2010:b0:6ee:6e71:e6cf with SMTP id
 00721157ae682-6ee6e71e8f1mr93383757b3.29.1731964555187; Mon, 18 Nov 2024
 13:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20241114123903.5013-1-vanusuri@mvista.com>
In-Reply-To: <20241114123903.5013-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Nov 2024 13:15:44 -0800
Message-ID: <CAOSpxda14hwe7PQLGd-SsChSLNy9N3bWrL6qXx0HeoxhUuhZyA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glib-2.0: Backport fix for CVE-2024-52533
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207230

Unfortunately I am getting ptest errors with this patch on both
qemux86-64 and and qemuarm64:

AssertionError: Failed ptests:
{'glib-2.0': ['glib/gdatetime.test']}

https://valkyrie.yoctoproject.org/#/builders/73/builds/403
https://valkyrie.yoctoproject.org/#/builders/61/builds/403

Steve

On Thu, Nov 14, 2024 at 4:39=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/comm=
it/ec0b708b981af77fef8e4bbb603cde4de4cd2e29
>
> Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2024-52533.patch    | 49 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.pa=
tch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> new file mode 100644
> index 0000000000..3a06a9d782
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> @@ -0,0 +1,49 @@
> +From ec0b708b981af77fef8e4bbb603cde4de4cd2e29 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Thu, 19 Sep 2024 18:35:53 +0100
> +Subject: [PATCH] gsocks4aproxy: Fix a single byte buffer overflow in con=
nect
> + messages
> +
> +`SOCKS4_CONN_MSG_LEN` failed to account for the length of the final nul
> +byte in the connect message, which is an addition in SOCKSv4a vs
> +SOCKSv4.
> +
> +This means that the buffer for building and transmitting the connect
> +message could be overflowed if the username and hostname are both
> +`SOCKS4_MAX_LEN` (255) bytes long.
> +
> +Proxy configurations are normally statically configured, so the username
> +is very unlikely to be near its maximum length, and hence this overflow
> +is unlikely to be triggered in practice.
> +
> +(Commit message by Philip Withnall, diagnosis and fix by Michael
> +Catanzaro.)
> +
> +Fixes: #3461
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
ec0b708b981af77fef8e4bbb603cde4de4cd2e29]
> +CVE: CVE-2024-52533
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + gio/gsocks4aproxy.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gio/gsocks4aproxy.c b/gio/gsocks4aproxy.c
> +index 3dad118eb7..b3146d08fd 100644
> +--- a/gio/gsocks4aproxy.c
> ++++ b/gio/gsocks4aproxy.c
> +@@ -79,9 +79,9 @@ g_socks4a_proxy_init (GSocks4aProxy *proxy)
> +  * +----+----+----+----+----+----+----+----+----+----+....+----+------+=
....+------+
> +  * | VN | CD | DSTPORT |      DSTIP        | USERID       |NULL| HOST |=
    | NULL |
> +  * +----+----+----+----+----+----+----+----+----+----+....+----+------+=
....+------+
> +- *    1    1      2              4           variable       1    variab=
le
> ++ *    1    1      2              4           variable       1    variab=
le    1
> +  */
> +-#define SOCKS4_CONN_MSG_LEN       (9 + SOCKS4_MAX_LEN * 2)
> ++#define SOCKS4_CONN_MSG_LEN       (10 + SOCKS4_MAX_LEN * 2)
> + static gint
> + set_connect_msg (guint8      *msg,
> +                const gchar *hostname,
> +--
> +GitLab
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
> index 35b51a3ec9..c628ac19af 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> @@ -49,6 +49,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://CVE-2024-34397_16.patch \
>             file://CVE-2024-34397_17.patch \
>             file://CVE-2024-34397_18.patch \
> +           file://CVE-2024-52533.patch \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207156): https://lists.openembedded.org/g/openembedde=
d-core/message/207156
> Mute This Topic: https://lists.openembedded.org/mt/109572074/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

