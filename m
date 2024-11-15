Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C03D65C7E
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 14:14:53 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.21624.1731680087619827065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Nov 2024 06:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xY2WuAgd;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea7c26e195so8507207b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731680087; x=1732284887; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+Ix8IGvl+AYetsC+NK73pCYIwT0lGr5NNkRYFClkOk=;
        b=xY2WuAgdJ3EAot3+/96NTdF8g6W2yugVjQO6+/A3LESxIsX97Tg20wx3/sGEcBPmAV
         MG+tSbC7+Ia7TydB+uudLywZ9Y54TgzR5kRIXrQA7dgW+HGvxJaNfVK8CRYOIuDyU0bl
         BbudJX4fJDunP3WIi1cmGhE2uhIsZb1ATT74YGEurzNnTFCKJMdAz/AMd5g4FfH0s7RL
         Y9su/idE4V8ptspv8mLeiWjk2+osTDKgqNGt1J4hc3zbpnCny4eVFGXrgtn+X7AFL4hq
         rcCz6CB9l3fXayQMtgfyi7EOkIOWX03iQByeEdDorRSFOEb8OGtfHVhEHrvVL0CD8yMP
         VguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731680087; x=1732284887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+Ix8IGvl+AYetsC+NK73pCYIwT0lGr5NNkRYFClkOk=;
        b=PLcDoZ3u3FvYEj9m+AUdhDM+os6xNvKkzlzoFYPzyfPnRPKFjTkDEeWkPbgr7/E0wK
         vqCexhd4MX/2Jt6POnX/TLDPVSV10B64LeG3slWS7HO6jOi9SgqonbQ7T5D6dxCYhMfw
         bgwAn8ybrg8c8XU9mDjuEZjbK0nSBRLubi8GONW6rAK3OVaGkZuyt7+ms/IOu6CkVidV
         r8Vs5RWIS9JHRMdHLahve/oAU+kulRr/koGkrGzvd5vL9bZeZDxkly6t0KXh4rqf836G
         gThEGFXkaOoiNBqlfGxQhkeA6NYUJR7itX/28p1ximE32xdqR92ZkOU22alOwnJ924p8
         2ltA==
X-Gm-Message-State: AOJu0Yx5P485DNpaX6RroeK6DmOSsT+hMEkKtJMVU9HQOkIOalCyWe+B
	vziqn41cTvGrIfszKJeQOht6nDcUdvc0nLtDbzjP3X+oRPDt0dsF+//O7kUd4VPSC2FI8EEtdHV
	+Jno5LmC+eq8iXwzqMgQ0738Lkb9UOWg8ULIFnaUedGxCStnY
X-Google-Smtp-Source: AGHT+IGDWieZ84wbI2NB2DZxTFWR3OgaMymExUlUCYysCzZPBrGRoxQozs3XJ/0/8BnaEclKM5tGAPCv8u7YVFL/epw=
X-Received: by 2002:a05:690c:6206:b0:6e5:9d3c:f9d3 with SMTP id
 00721157ae682-6ee55c888a2mr35401457b3.41.1731680086589; Fri, 15 Nov 2024
 06:14:46 -0800 (PST)
MIME-Version: 1.0
References: <12abdca1-293e-4615-993d-6f8ccec3506b@gmail.com>
In-Reply-To: <12abdca1-293e-4615-993d-6f8ccec3506b@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 15 Nov 2024 06:14:35 -0800
Message-ID: <CAOSpxdbmBdkdyEZZxBbTgHL+OtSQ55au1HYgQ7VnBR=OPaQFKg@mail.gmail.com>
Subject: Re: [BACKPORT] uboot-sign: fix concat_dtb arguments
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 14:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207185

On Thu, Nov 14, 2024 at 6:25=E2=80=AFPM Clayton Casciato
<majortomtosourcecontrol@gmail.com> wrote:
>
> Hi, Steve!
>
> I would like to backport this from master to Styhead and Scarthgap.
>
> Please let me know if there's a better format to request this.

No, this is fine. I have added it to my test queue for scarthgap and styhea=
d.

Steve

>
> Thank you!
>
> Clayton Casciato
>
> --
>
> commit b3c473785e5ceef677ff2b77c5fc17f5704c622f
> Author: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> Date:   Thu Nov 7 10:10:47 2024 -0700
>
>     uboot-sign: fix concat_dtb arguments
>
>     Fixes [YOCTO #15642]
>
>     Ensure empty argument passed from do_uboot_assemble_fitimage is passe=
d to
>     concat_dtb
>
>     Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 3e5f5dcf66..a17be745ce 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
>         binary=3D"$2"
>
>         if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ]=
 ; then
> -               concat_dtb $type $binary
> +               concat_dtb "$type" "$binary"
>         fi
>
>         if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}"=
 ]; then

