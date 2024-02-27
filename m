Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65D8C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 01:59:17 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.3254.1708999148986240278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 17:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pi1cgTt1;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-21f2f6a1035so2162972fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 17:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708999148; x=1709603948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgavnvC72VmNLP5bFhrXSEOe56CSeg9isBYzmhy42vA=;
        b=Pi1cgTt1YC5OhIOmqoF0m1tRE9hSZNNn7BihZyd9weRnUnov0H54Y9pZOvkrQQER26
         CoN2GOv+KxB45gmFDblb+f4Jmh0Dd6jxub3TBrYrDsrC+ZDpvveVZhTEUf6Nhf+YXtKR
         l0NAqukeDnkISk0/wIZSBR7w1qwDD65rGd254jz/ybOgiWBrIu4DbCo3T+imbs+SA1PI
         RJyvqC+H6UPMf7DLTN6ahHtNf7C594Vx62KJLfLfEgW3jh9DrQt0RjvEW+CoU3cDuVfx
         UEp9h2cVSmRDkguTiCLmmZvPUg/PX4c52ZB8hYZD/PPB05leuk3kzrvr5CypBJSkcgTh
         pebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708999148; x=1709603948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgavnvC72VmNLP5bFhrXSEOe56CSeg9isBYzmhy42vA=;
        b=GYLWxufIXcwE+mdbtu8Xkp/5MJFx8GpxegK8sCfq21teFV1QBjzsc2W+lCLMKFTObK
         ahvSz0Ytfi0VwrSanZNPBi06ufQ1q2dubZdQX2tLIBIb/0xUsUO0PbXGtwN8nv/M/1FW
         3Osd9w60LH7JD1mG3ot3cpI6115b0G8NPMb/59jcTjVUVOEUawuUr31ZJWDMEA+JllKy
         I6GJyDRBZjoTSPmSvIp7RUSvuptK6JEbJbryxbUdq9SkMq8cwkC1tWCARByTjBKz6RPA
         idHgecwsgWDXug+FOt3FajHKumzuRBnKF9C/Eg7lpoya9tGu4Kyq3fpAItxQg2tx062b
         xjkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJhnQf/vrVQy1cCAwfTWBtyyZULnZT5pBpdz9+Hu4pldzMfaYSAQHX5hJuNEitYBO3vLUq3hGilOZDI8jGkab/mbat8xuszWLV2R9UI7ZDxs6JqZNg3w4f
X-Gm-Message-State: AOJu0Yx8V4ES8saWTt/KnFN1S4rXzEX4WZcdpV0/PX4TW+LV5vFUTHIO
	GqTjKoQxL3pHqq4+0AEhsKbN5xbNpH2divTevDqvkQ5f2fnZeirSkH3f2mEujEZAcnUJbgNE4Lu
	Qj6upVnLFlWK1k3ZLTycVNS1KR7A=
X-Google-Smtp-Source: AGHT+IEBKPlDnyPNuah2QASBhJzK1fMyb4hn2pP/+ONLe8qFsCRo+hFPHqzx+iN4Lro4L/39pty8GA49f6QgbBkOQGc=
X-Received: by 2002:a05:6871:4e88:b0:21e:7156:a6ad with SMTP id
 uk8-20020a0568714e8800b0021e7156a6admr8018234oab.48.1708999148030; Mon, 26
 Feb 2024 17:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20240226095921.363844-1-xiangyu.chen@eng.windriver.com> <81fee331-31ed-4ca9-9a8d-2522857a54ef@windriver.com>
In-Reply-To: <81fee331-31ed-4ca9-9a8d-2522857a54ef@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Feb 2024 17:58:41 -0800
Message-ID: <CAMKF1sof-2XS1mBWPOumZxNcUn7w0BY_w21XrR9Zc1Hc0yZEpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libc-locale: fix ASCII compatible warning cause
 build failure.
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: xiangyu.chen@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, jonathan@joggee.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196237

On Mon, Feb 26, 2024 at 5:16=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-02-26 4:59 a.m., Xiangyu Chen via lists.openembedded.org wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Some locales are not listed in glibc locales support list, but can be gen=
erated,
> here using ja_JP.SHIFT_JIS as an example. We can add following line into =
local.conf
> to enable and generate it:
>
> GLIBC_GENERATE_LOCALES +=3D "en_GB.UTF-8 en_US.UTF-8 ja_JP.UTF-8 ja_JP.SH=
IFT_JIS"
> IMAGE_LINGUAS +=3D "ja-jp en-us ja-jp.shift-jis"
>
> The localedef tool would report a warning and exit with 1, that cause bui=
ld failure,
> error message as below:
>
> [warning] character map `SHIFT_JIS' is not ASCII compatible, locale not I=
SO C compliant [--no-warnings=3Dascii]
>
> So add a --no-warnings=3Dascii in libc-package.bbclass to fix build failu=
re if someone needs those locale
> in yocto.
>
> For context, Xiangyu is changing the libc-package.bbclass so that we can =
generate a ja_JP.SJIS  / ja_JP.SHIFT_JIS locale
> to make another of the bash ptests pass.
>
> I don't know if that locale is commonly used these days but apparently it=
's not POSIX complaint:
>
> https://discourse.nixos.org/t/building-unsupported-locales-ja-jp-sjis/361=
2
>
>
> Richard, Mark, Sundeep, Jonathan, Khem,
>
> Any idea if this is a change that we should be merging to master
> rather than skipping the bash ptest?

yes, it should be merged into master, this is default behavior in
glibc, but since we do generate the locales using cross localedef
we do not get that, so this change will make it so.

>
> Xiangyu,
>
> Did you test musl? ( I don't know if musl even supports locales, off-hand=
! ;-)  )

We do not have to worry about musl for glibc locales, it does not use them.

>
> ../Randy
>
>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/classes-recipe/libc-package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-reci=
pe/libc-package.bbclass
> index bf160b115d..c06a2ce90a 100644
> --- a/meta/classes-recipe/libc-package.bbclass
> +++ b/meta/classes-recipe/libc-package.bbclass
> @@ -278,7 +278,7 @@ python package_do_split_gconvs () {
>                  bb.fatal("unknown arch:" + target_arch + " for locale_ar=
ch_options")
>
>              localedef_opts +=3D " --force --no-hard-links --no-archive -=
-prefix=3D%s \
> -                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s/%s=
" \
> +                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s/%s=
 --no-warnings=3Dascii" \
>                  % (treedir, treedir, datadir, locale, encoding, outputpa=
th, name)
>
>              cmd =3D "PATH=3D\"%s\" I18NPATH=3D\"%s\" GCONV_PATH=3D\"%s\"=
 cross-localedef %s" % \
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196197): https://lists.openembedded.org/g/openembedde=
d-core/message/196197
> Mute This Topic: https://lists.openembedded.org/mt/104579284/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

