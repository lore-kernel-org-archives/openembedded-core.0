Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB39CED628
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 23:04:25 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.31035.1728515060528603743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 16:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4rbd7gP;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-287b8444ff3so177097fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728515060; x=1729119860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iULueVNj3P6nqZaw4LupmggiMpa0OB088X61s0NxkEg=;
        b=l4rbd7gPh9qw5c1AZBtQqflljayPwGIth32zfgv4n5rtyMhY0Lss6Fv1rxPfk4cz1s
         F1N/XQWi3PU75iR+eYi9iyoUNHOwANWC/TKII1cZZNXfY1UxE3I5X6K8bKjcBgvBOkbM
         zKIjHaA+SHLCm/rZKFc2+Zk0wqXknRYXF2zJWvdt5w5+VIp7nmftX4hLIYTPdo7q/31U
         1XuCNyLOz0nSJWuMjUun6GYnNmrqKvnNgN2d9VBrXA7/xT6o5jA+BuLdlN4x5xFQyrbM
         ftyHHuENwMTdb02aJJpCNM/vT8lyFAmrgYfDuzuBliHLHmePhdxbnyalndXre2x/95eM
         l37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728515060; x=1729119860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iULueVNj3P6nqZaw4LupmggiMpa0OB088X61s0NxkEg=;
        b=VsHBoAkBQUy/myb1wTjejCY/ui1cDPUv3NbGBSA+tpWDfyD2ljENzMreDS0g1tqjf8
         IsT0FdDSfLCiTjNrLd2aButwABGJhHukNXII4kdQPHctkNu9BpM7UHEe7OwcBA/GgxFT
         ntqr7HoTtBFwEnBH+vDZp5NFibx1pkEpMFNrRPNPsOz3B1hRzn8LHhc1D/tKH11yDE5f
         kmXH+bMU/d1l9YYdTZsj3lezxvNd7kxBUSVaLJtUUbbX52t0JbAF8ZacDxWrEBo0ltvG
         ANfocv+FC6sFM/3BFSreLjVJYQK5BCD++aejjC7qn4xksvzfmD2ajjTcH/Y8iBYgHTuX
         b0OA==
X-Gm-Message-State: AOJu0Yz+UoAqRj00bvIolfeuRtm/QJOL2Wu9jzuVJ0My5YcdGZ/ncEII
	vbC4pctoMroxKdkZjGNE+t5/Vrui9ANb1c2ncQdaSCSVmKYGVV6mL5kBDiYkgbOizbsQuw4WTsU
	wpDxNvEGaeUQGzpSgrADkF1c4YQI=
X-Google-Smtp-Source: AGHT+IEH2L/g6C+fR0g7KenUiTFubw2NJJAm9h72GOQjCFCJ//bB5VQ9FstXujrNLmDYOs958iorygGnkTkoDU2ZrO0=
X-Received: by 2002:a05:6870:224f:b0:261:360:8e26 with SMTP id
 586e51a60fabf-28833e30023mr3891986fac.0.1728515059728; Wed, 09 Oct 2024
 16:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241009104716.711424-1-ross.burton@arm.com>
In-Reply-To: <20241009104716.711424-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 16:03:53 -0700
Message-ID: <CAMKF1srfs=2UtG4yZ8F-3K8agBGvy80S7SV=xn=gKweBcyB4Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bitbake.conf: don't force musl on mips to use classic
 sysv hashing
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 23:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205374

On Wed, Oct 9, 2024 at 3:47=E2=80=AFAM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> This is no longer needed, qemumips with musl generates the expected
> DT_MIPS_XHASH table as it already does with glibc:
>
> Dynamic Section:
>   NEEDED               libc.so
>   SONAME               libz.so.1
>   DT_MIPS_XHASH        0x000001a8
>

I am afraid we can not do this. xhash is supported by toolchain that's
is correct but
it also needs to be supported by dynamic linker and musl does not have
this implemented

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/bitbake.conf | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3f583668f66..8000baba389 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -636,8 +636,6 @@ ASNEEDED ?=3D "-Wl,--as-needed"
>
>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
>  TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBU=
G_PREFIX_MAP}"
> -# mips does not support GNU hash style therefore we override
> -LINKER_HASH_STYLE:mipsarch:libc-musl =3D "sysv"
>
>  # Pass parallel make options to the compile task
>  EXTRA_OEMAKE:prepend:task-compile =3D "${PARALLEL_MAKE} "
> --
> 2.34.1
>

