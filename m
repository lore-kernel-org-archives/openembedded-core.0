Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C54DEEAA5D
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 17:30:41 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.739.1694712640818149022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 10:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZL1zh1iT;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1d637f9c587so431309fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694712640; x=1695317440; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXn0+SNEoTd2eHHcSEBHFZaQ+qKP4Z5FnzoI9O+UxQ4=;
        b=ZL1zh1iTXWbFA0jF7tqsk1zLiimaHkcTr/B7SGKfgpBhu5ZSOlJAhL4Egt7a1s3nh3
         6f9ihM7w9a+3yGCtNxcp9EdJDl5L7Ggg4jznnb8TA6MNTF0RR195ACUw1AOmF1dlgeGl
         /ZLh9LZq847GjzRBoRcM6LlHDtyEuE8KUCLHirkOgSWdSIahbdGT8IMua6t1kU2Y5Sn/
         BcHtlF3voqUU2Xi5u5N37S8UoZqXIEAzeXht/lvln9QeCtZV8dAsyy4bNXwkxxWC4kcj
         mzoFjm6P/CaBATr/5aJEEPzLhuknEl6DxLi7vQ0C/r+yUQoDSYiuPwYvwn88cYVOVWoa
         +gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694712640; x=1695317440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXn0+SNEoTd2eHHcSEBHFZaQ+qKP4Z5FnzoI9O+UxQ4=;
        b=sJpCru+kwcLLAagPmIE2osFUXZFM6nYJTegK22WvzPoRz490aet5uvGB7mY5zDXptT
         jI1pLeOWgvTphCTiGm20+cfQ08TQLCpwCPrfHaH74DyMZTrOLPpCgjGnlbO/DHNCJqj8
         gftOzXZW6lkB+BMYSu/l5MHqm/h7KLIt0wDDA6LtdFt2SYENieHDFklX9RCbBPK3zfhC
         3fmW6Fohni7iaU+GTlNflJdoo3RadwMPG8LB9wg4AGoXqv55HaRUEjoXcPbT4CODJyAF
         C+St47hLEwqHntyyGXvDCffvejic8sGxwuxJ97JzSzBrf78INs8SYy8GcfbZyKf/RzcF
         LbzQ==
X-Gm-Message-State: AOJu0YxtVc5I2vLPeb6wBaYYPnG2ojvLXRI0Tn+V0iuUMk+rw3+m/FGO
	YpoC8jwwDK5Kf3q3woxflX8DGO9GTUoZgMXM3TE=
X-Google-Smtp-Source: AGHT+IHG+21vDLnR9OPXkH1EfYF6B/WXkh9LMMBd+Q4cAEBnnkxCA3FJDSZ3CsafjVuSvLpbQtnraSg0Nw2OEXoTDCs=
X-Received: by 2002:a05:6870:1704:b0:1d5:987b:e8a7 with SMTP id
 h4-20020a056870170400b001d5987be8a7mr1703784oae.8.1694712640054; Thu, 14 Sep
 2023 10:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230914143919.985474-3-pidge@baylibre.com>
In-Reply-To: <20230914143919.985474-3-pidge@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 10:30:13 -0700
Message-ID: <CAMKF1sqCuMZX_DYROho1a1poSG-m0UGuWrdxS9TC+019v5Jd9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] update_mandb: deb fails due to missing man cache
To: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 17:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187646

On Thu, Sep 14, 2023 at 7:39=E2=80=AFAM Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in
<pidge@baylibre.com> wrote:
>
> This only occurs in debian package builds when populating the sdk
> and is a work around that seems to work. Eventually we should look
> at why this is failing (I have ideas, it's somewhere in
> lib/oe/package_management/deb/sdk.py), but for now, do this so we can
> fix the core issue with nativesdk-intercepts.
>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  scripts/postinst-intercepts/update_mandb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-=
intercepts/update_mandb
> index a061bb426a6..f91bafdb117 100644
> --- a/scripts/postinst-intercepts/update_mandb
> +++ b/scripts/postinst-intercepts/update_mandb
> @@ -9,6 +9,8 @@ set -eu
>  CONFIG=3D$(mktemp --tmpdir update-mandb.XXXXX)
>  sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf > $CONFIG
>
> +mkdir -p $D${localstatedir}/cache/man/
> +

mandb will generate index cache files. into D/var/cache/man and below
qemu usermode call is doing it.
Perhaps we can look into man_db.conf to select where these build time
generated caches should be stored
/var/cache seems a wrong place to me, since its r/w and populated at
runtime in many cases.

>  PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --conf=
ig-file $CONFIG --create
>
>  rm -f $CONFIG
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187644): https://lists.openembedded.org/g/openembedde=
d-core/message/187644
> Mute This Topic: https://lists.openembedded.org/mt/101359340/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

