Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B397CE9536A
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 09:51:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16913.1770198667515872573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 01:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4J2TDXW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-480706554beso72127845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 01:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770198666; cv=none;
        d=google.com; s=arc-20240605;
        b=GG4hazwTlFGJpJLAuZ7eSg44cbiTf00wWwwO4D8E69+k8x2q4xJhFUWpjydmViNGRd
         TIgzppdgDzzhOvvcxHkLfrjMsthQfu4kTwkGQeaBj2jXHup5H0LcGsUyqoe3ed4u5xfV
         gpoVmMWVzDTAB/S6IuXXMxyRWLmEbcdBNAAmuYw1537THLApU5Z6hCGuXpkMql9xncFg
         g9qR3PY4kOe7kv/rIWbWeYUyUJNraqFl1b4IjnVvFMHsIH+n8LS5zd5cuTc8bssHtAEn
         lEhUtcjb/6nAjUQjYsncgDP6OgVQtJt/wPSb/jWQghk5+8kTEqgSmzpS3L+gj8ZxpnGY
         ezPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNazGp4Yf7XxiNULjwvALkW06FEgqpngIieFlCZjqjQ=;
        fh=6hO8Pn/7gzEplTpyEWGte35Fw+9SZT3+h/WoY2xDoVY=;
        b=ifT03uYUq5CLBB6KOD13nM2zPfHYeEOKx1iZsukisM0OCQXLZxnE3AnfWOAXDDyROU
         YJpzT39bSzDGBNtXzaKLkxo2hItWGWcioP2PwzbauSfF0wI0YldT/ZDWRoOHBxCiI/SH
         G1yvuK0B36MBwvL+1ykiPZafl5/zSZY9AKMcQ+MkX7Yn/G+s0utDt7ikt38JKH9qn1IR
         J8H5EQ0BzxsX/79PJ2uz0b08rdodpw7RfWwsKWUmGwcA7XMOwAQvii42rTEXucUtbg9f
         5kyKRV3IfCGRzU6YMaPkb2B86tHHFi4K0f2FV1lDzApznjxAjENvmgrAm8ZrnvmRmWed
         7k8A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770198666; x=1770803466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNazGp4Yf7XxiNULjwvALkW06FEgqpngIieFlCZjqjQ=;
        b=G4J2TDXWOy+86SKKGHNvKq+UQW8Lx2xasmK9nejmZfGEPbv+wHsiToG1D49brG22ot
         XG2HPLdbapSIypF2jDWW3H8C/UZ14x1AwUOLJJZqQdsriz31j2TM6V5+E5VClyw6pEDK
         FHc8lpWtevPdYQ2FUJ+f1YKhJpEuhVyGoSmyhIXfSteAxK/LXNRsFgqigfYEb00v5Gb+
         RKThmxaz2aGCn4LaZS9VhDgm2KemV7UbF2P23R9SO6kKNlwtzmXzw5bqmxPdZXiatx0Z
         vKKRqjOekNKkoMkEt+8mPwYq4DnRtDOMh5Dr+7dW4j32VrHwHcc2mikxjSNySxxHhXeb
         9FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198666; x=1770803466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNazGp4Yf7XxiNULjwvALkW06FEgqpngIieFlCZjqjQ=;
        b=w1PcbZbYNxNDblJ61LtXfSW2vmkjxQkA/1Dqa6xJ6AYt/8gyrp2tWVI7MIRZfsrD3I
         tSwc8k212T7OpRUlmGPrv9nfYUzgj1VXuSpN56LUe3CvjajZz9ETpttB3WE8wEC55kOX
         Ekmo1zMaG81H+HFA0n29A7GewkCeUU3DIBm4cGmGWQbtoxohDlDZqKlGIgimxTHWG+Qu
         2WH01sKUHMeoj3ZXhLM1axiXIZ6GQr2Sj6WUWISVL0T8Gaac2eEhxmxWWarkX5sVNDX/
         EqFgf8wXEFFpQaIKK+hE7nz48kNaEu4oa5R9CPfUqr8mCfqH+Wo4I8OHXffI04gygARm
         JE0w==
X-Gm-Message-State: AOJu0YwrwMOXSBuWmgBwNTPw/EXjpTUZxi0eyfgY4nfGbu/p58lEqFQ1
	0e0fv3NFhPzn2+uoWdwM6o9IxFbUYnYLZS7Bu4CkoNaK5iaf47JzyE1DE6TBpk7cGlyBIy5ROFu
	7z5yAa54+NieCz9/tla0thR88hFkU4H5P2A==
X-Gm-Gg: AZuq6aKfJ5znxMqUtzBFc3/y8B6qsC7h4eEd9Ku8CB4EwvSBCjalLcckY7ZexCFWzJc
	bnGsv7ITTYE0fkm2e5eLQKCoy1ScMoPSOMsYN3MuW6H3ofTBHlce+j2eOikK6NkGkVc30A8wqwJ
	J5pgGqnS/5j7Dq+RtzLrL3VVFmMlJr154RYWeqBI81/+T3S51aH4SowKcz/Yr4hvf4miS0dm8AO
	FGEWOAKSCmnq07FAixWcQJ1EC6LV7JZny4BE0Gi4q73dtoXHtI3pvpW92oZ2RevCsLDa7di
X-Received: by 2002:a05:600c:1387:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-4830e97951emr31595395e9.28.1770198665311; Wed, 04 Feb 2026
 01:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20260126093655.2552127-1-max.oss.09@gmail.com>
In-Reply-To: <20260126093655.2552127-1-max.oss.09@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 4 Feb 2026 10:50:53 +0100
X-Gm-Features: AZwV_QjA0IUia6OHVQQfNZFN4msI_g6NkuZgBsGyug5QbTt_T9Nx6UyyI2iZhXU
Message-ID: <CAEHkU3XDAvdfwd_kwiCxDDq8A7Dz3gcRsEfF=pK028qg9Ua7oA@mail.gmail.com>
Subject: Re: [PATCH] alsa-utils: fix packaging of alsabat
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230506

Hi all

Gentle ping.

The alsa-utils package is currently broken if one sets `bat` in PACKAGECONF=
IG.

Regards,
Max

On Mon, Jan 26, 2026 at 10:38=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> If bat is in PACKAGECONFIG two additional binaries are created which
> by the dynamic package split creates two additional packages.
> However due to explicitely adding the file alsabat-test.sh to the
> alsabat package the alsa-utils-alsabat-test package now is empty
> and not created.
>
> Complete commit 4c6d5f96990d ("alsa-utils: fix packaging") which fixed
> the same issue for all other affected packages.
>
> Fixes: 26a28ee79350 ("alsa-utils: dynamically split the packages instead =
of doing it manually")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
> index 6d75bff09e5c..b792302c9fae 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552 \
>  DEPENDS =3D "alsa-lib ncurses libsamplerate0 bash"
>
>  # Only needed as the dynamic packaging was altered, remove on upgrade
> -PR =3D "r1"
> +PR =3D "r2"
>
>  # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
>  SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
> @@ -63,6 +63,7 @@ SUMMARY:${PN}-speaker-test   =3D "ALSA surround speaker=
 test utility"
>
>  RRECOMMENDS:${PN}-alsactl =3D "alsa-states"
>
> +RPROVIDES:${PN}-alsabat +=3D "${PN}-alsabat-test"
>  RPROVIDES:${PN}-aplay +=3D "${PN}-arecord"
>  RPROVIDES:${PN}-amidi +=3D "${PN}-aplaymidi ${PN}-aplaymidi2 ${PN}-areco=
rdmidi ${PN}-arecordmidi2"
>
> --
> 2.42.0
>

