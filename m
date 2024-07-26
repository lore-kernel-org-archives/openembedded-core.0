Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE31EC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 15:21:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.63333.1722007289476957334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 08:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CD34PbHV;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01afa11cso2061061e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722007288; x=1722612088; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIwrEOWWnA+3GlFmiWvmtnq9OuBOb1XmkMVX7pEd38E=;
        b=CD34PbHVzrPZOFv+pzvk1bKX4iDlS6zH9dvHHFib9wL1h/i+4goCRscTCUSWrxN4Me
         OhCJt1UorxEO4sFedGNLQKXUwcxQf8haa23HVh+cVnqcwEEYlRitljgzIrhbTympMv9z
         t9reQIgEqyOzjp5ZH0NzX+5GqYRVGAVg75Znq/y//9cwl69kCwurQORFH0ejEbntfg98
         1Ny5jcqOAb1lt6HfsHaAYs+GWVEMr/HlsYnp2MwrEHux5yJjgYC0j7bWArR6OEe6xQMm
         OjsdTfe566f9UhtwD7Iedqj9BY5lKVISL2KOLg7ZR5iMnbRIZahyc1FAoSAG+cCVTZNH
         CEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007288; x=1722612088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIwrEOWWnA+3GlFmiWvmtnq9OuBOb1XmkMVX7pEd38E=;
        b=obA2rLF0iVf1eiWSQZcps6ufRrZ8r+EjYC07VjTGTxfTSBm1JXCZ6KcF4CKmZ/SSei
         AOWsgbWRQAGngqj6rLHYf8PF3HE318NyidWKcpw9zUhKHj1akANbEg1WnnGphSJW8zNY
         GYO0ZYLeswWneNCnCz1z3+rmW8ldAJ4YjW+Hb0hG28zPguXGRUs2AwnFUSaV54HAMlaA
         q3P4Fy62/WOVgr/oWKc3nt3oHokNKe9ZovsHz8UVo6Ps7CT+SFmEoP36iMMCnDpkO5oD
         VC1c2tkZegXnvXxlsuQIEALmpuSLsjlnumXpxPI5idG+MtA0FOoJAdZFXEOa6479e2Qb
         H+Xg==
X-Gm-Message-State: AOJu0YxL79WHPLCf+yXHhkVRlHfnw7ubkjLirHH3e7D5h6Vjjt9OnPBW
	0bwa7lh/jznk6gibVNZSyH+1ULLq8tzuNMib1wiXyVGNW10wjeBMmdBqM0IFvM+RWWhazSHWjxm
	HpoTaD6xBCHaRXl3lQ+OPkocekFM=
X-Google-Smtp-Source: AGHT+IHtwpv/VHMBVJAi+7p2+xnB41GtuGEI13UqXE/tCiec7ev2e8m/rBsjVqRA+z9CsvblzNKcefyNxIZgSE6KK+c=
X-Received: by 2002:a05:6512:3257:b0:52e:be84:225c with SMTP id
 2adb3069b0e04-5309b280e1amr73815e87.33.1722007287137; Fri, 26 Jul 2024
 08:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240726112431.698884-1-zboszor@gmail.com>
In-Reply-To: <20240726112431.698884-1-zboszor@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 26 Jul 2024 09:21:14 -0600
Message-ID: <CAJdd5GYtvYx8szx6W2hMgKh=UHkAX7+FJ4gmaVJ4eyNj4F7teA@mail.gmail.com>
Subject: Re: [PATCH] rpcbind: Fix boot time start failure
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 15:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202542

On Fri, Jul 26, 2024 at 5:24=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com> wrote:
>
> With commits 90bc1810 ("bitbake.conf: Add runtimedir") and
> 561e853e ("rpcbind: Specify state directory under /run") rpcbind
> still can fail during startup.
>
> It has two problems:
> * The lockfile is still hardcoded as "/var/run/rpcbind.lock".
>   It needs to use the same internal define for RPCBIND_STATEDIR
>   as the paths for rpcbind.xdr and portmap.xdr.
> * Using --with-statedir=3D/run/rpcbind doesn't guarantee that this
>   directory exists when rpcbind.service starts. Add this guarantee
>   by running rpcbind.service with After=3Dsystemd-tmpfiles-setup.service
>   and add the tmpfiles.d entry for /run/rpcbind.

The original patches have been working for me on nanbield (and
kirkstone), so I'm a little confused as to why this is not working for
you; I'd like to avoid patching the source code if at all possible as
carrying patches like this is a burden

>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...ke-the-lockfile-follow-with-statedir.patch | 31 ++++++++++++++++++
>  ...ice-after-etc-tmpfiles.d-is-processe.patch | 32 +++++++++++++++++++
>  .../rpcbind/rpcbind/rpcbind.tmpfiles          |  1 +
>  .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  6 ++++
>  4 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-l=
ockfile-follow-with-statedir.patch
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbin=
d.service-after-etc-tmpfiles.d-is-processe.patch
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfile=
s
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile=
-follow-with-statedir.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Ma=
ke-the-lockfile-follow-with-statedir.patch
> new file mode 100644
> index 0000000000..d487312d22
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow=
-with-statedir.patch
> @@ -0,0 +1,31 @@
> +From f10db88174e73c78c028561715f16ed38148ebde Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Fri, 26 Jul 2024 12:36:06 +0200
> +Subject: [PATCH 1/2] Make the lockfile follow --with-statedir=3D
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +---
> + src/rpcbind.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/rpcbind.c b/src/rpcbind.c
> +index 36a95b9..948a284 100644
> +--- a/src/rpcbind.c
> ++++ b/src/rpcbind.c
> +@@ -105,7 +105,7 @@ char *nss_modules =3D "files";
> + /* who to suid to if -s is given */
> + #define RUN_AS  "daemon"
> +
> +-#define RPCBINDDLOCK "/var/run/rpcbind.lock"
> ++#define RPCBINDDLOCK RPCBIND_STATEDIR "/rpcbind.lock"

/var/run should be a symlink to /run, so I really don't think this
should be necessary (at least with the default value for $runtimedir)

> +
> + int runasdaemon =3D 0;
> + int insecure =3D 0;
> +--
> +2.45.2
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.servi=
ce-after-etc-tmpfiles.d-is-processe.patch b/meta/recipes-extended/rpcbind/r=
pcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
> new file mode 100644
> index 0000000000..f454fdbb3b
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-afte=
r-etc-tmpfiles.d-is-processe.patch
> @@ -0,0 +1,32 @@
> +From 408b18c77c254baaa9111b3e7031ebf12149db38 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Fri, 26 Jul 2024 12:54:38 +0200
> +Subject: [PATCH 2/2] Run rpcbind.service after /etc/tmpfiles.d is proces=
sed
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +---
> + systemd/rpcbind.service.in | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
> +index f45ee1e..e9d94ce 100644
> +--- a/systemd/rpcbind.service.in
> ++++ b/systemd/rpcbind.service.in
> +@@ -9,6 +9,9 @@ RequiresMountsFor=3D@statedir@
> + Requires=3Drpcbind.socket
> + Wants=3Drpcbind.target
> +
> ++# Make sure the runtime directory exists
> ++After=3Dsystemd-tmpfiles-setup.service

I'd rather have the recipe provide a drop file for this instead of
patching the source

> ++
> + [Service]
> + Type=3Dnotify
> + EnvironmentFile=3D-@_sysconfdir@/rpcbind.conf
> +--
> +2.45.2
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/met=
a/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
> new file mode 100644
> index 0000000000..fecee72c09
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
> @@ -0,0 +1 @@
> +d /run/rpcbind 0755 root root -
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipe=
s-extended/rpcbind/rpcbind_1.2.6.bb
> index e751eb631c..477092b37d 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> @@ -13,8 +13,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db46486e4c4a=
416602693a711bb5bfa39 \
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>             file://init.d \
>             file://rpcbind.conf \
> +           file://rpcbind.tmpfiles \
>             file://rpcbind_add_option_to_fix_port_number.patch \
>             file://0001-systemd-use-EnvironmentFile.patch \
> +           file://0001-Make-the-lockfile-follow-with-statedir.patch \
> +           file://0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-proce=
sse.patch \
>            "
>  SRC_URI[sha256sum] =3D "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2b=
b5e83b9defeee8de"
>
> @@ -49,6 +52,9 @@ do_install:append () {
>                 ${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
>         chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
>         install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbi=
nd.conf
> +
> +       install -d ${D}${sysconfdir}/tmpfiles.d
> +       install -m 0644 ${UNPACKDIR}/rpcbind.tmpfiles ${D}${sysconfdir}/t=
mpfiles.d/rpcbind.conf
>  }
>
>  ALTERNATIVE:${PN} =3D "rpcinfo"
> --
> 2.45.2
>

