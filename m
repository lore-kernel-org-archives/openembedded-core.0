Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF08C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:53:12 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.16516.1713873187128123028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a4uwUJ4Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6184acc1ef3so52006107b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713873186; x=1714477986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NcD+Pjs+d8MWXGuKS24vsAEUd9PujaXhc5kycEFN5U=;
        b=a4uwUJ4YMUBHyXjB1MauRnrKyYeHQELch5NpHES/TnCOvCH1Xt0jBBx/4ouTwcdsFq
         nrcLXDvm+hGs3ozUZJI11n1f6/MBNvj3RXB/7pqCOZWhNnRgjTij6tEG18T22NdwMqkY
         VhbGbklju6IDHzJ8FTtMzAXP4FwH0+nTZ3iEq0BAOErEDTzC0JW6hHiwDMsjutP+8odW
         N4mpKPM0TrLFBg1JIRex41mT+S6a/5mALaoIszvFh9RxyadcPt/Y9R6OKLvoRl0EeFrx
         Ip+gKcpFg+ABLur7d/hY5BCs2puVKwiZo4inWYjPnWGc+sskZoHGc+lPGpku3oz59zI6
         uv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713873186; x=1714477986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NcD+Pjs+d8MWXGuKS24vsAEUd9PujaXhc5kycEFN5U=;
        b=hlP5nY4H/b7TIZwUVFNQXfQzhQEuMGy1SdBrGbIT3O8xKH9vH1gBVXG2z2CcLl2Wkf
         YWeORLcFJBpGanPr/52D4nTEbFqBOT64orni5dEzGapj1LhhfQ2wTQR7qtbkzh6cOuky
         hBppko2zbdeawPdbSYg56MO4VuDIjsEq0dZs7lgVYZaEMoPNQlrRsVVr0ZC4osyF7cxJ
         VoeeAibZvxrsAis8PxpID3Uw2bWJMStFEkY/GSCnJUQRQxuWagsBbPqsEEuj5HeDnh0m
         wMsGcly/CJuIJlQTfpGHwQUwl8sDR3HYR+qXFHNbWvRs6vfcvWnXsVrnLOd5H57aCaAL
         JWaA==
X-Gm-Message-State: AOJu0YwcbGS3z+4aJwzlW6JXvN6VAgVVmuAqvLIScVNiLrVT711YCLMG
	XIWn4lV39rmGeZYytSWAdKif49OH8Y20JkBtaCdLC/ufyv9Ch85mwCYp+tZrlTygJtEG0y1pg5X
	PS7bSUVEMRiFJw44COPHdqvJhC518uiLam+Cx8Idk3lfWQ9/8Tv3TgQ==
X-Google-Smtp-Source: AGHT+IFE0gWUBXruHpbg1F6cx9Y8PpJlBi0i55cR3Z6n3+TIvY7dkErtKJ0p6VeR66//2pXI8iyD1qmdelBiJYCSMYM=
X-Received: by 2002:a05:690c:724a:b0:61b:3345:d24d with SMTP id
 jm10-20020a05690c724a00b0061b3345d24dmr18208470ywb.9.1713873186325; Tue, 23
 Apr 2024 04:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240415072048.2008418-1-timon.bergelt@pm.me>
In-Reply-To: <20240415072048.2008418-1-timon.bergelt@pm.me>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Apr 2024 04:52:55 -0700
Message-ID: <CAOSpxdafnFxcoeaqr+_Bz7-9hYzSnHVEh0o43SrJUXF+McZwuA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] populate_sdk_ext.bbclass: only
 overwrite lsb string if uninative is used
To: timon.bergelt@pm.me
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198619

Dunfell has reached end of life and we are no longer taking changes.
The final build was done on April 15.

Steve

On Mon, Apr 15, 2024 at 12:21=E2=80=AFAM Timon Bergelt via
lists.openembedded.org <timon.bergelt=3Dpm.me@lists.openembedded.org>
wrote:
>
> Overwriting the lsb string without inheriting from uninative causes
> shared state cache entries to end up in the wrong path where they are
> not beeing picked up by the extensible SDK environment.
>
> Signed-off-by: Timon Bergelt <timon.bergelt@pm.me>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populat=
e_sdk_ext.bbclass
> index 1bdfd92847..899f198659 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -449,7 +449,7 @@ python copy_buildsystem () {
>      bb.utils.remove(sstate_out, True)
>
>      # uninative.bbclass sets NATIVELSBSTRING to 'universal%s' % oe.utils=
.host_gcc_version(d)
> -    fixedlsbstring =3D "universal%s" % oe.utils.host_gcc_version(d)
> +    fixedlsbstring =3D "universal%s" % oe.utils.host_gcc_version(d) if b=
b.data.inherits_class('uninative', d) else ""
>
>      sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D =
'1')
>      sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198221): https://lists.openembedded.org/g/openembedde=
d-core/message/198221
> Mute This Topic: https://lists.openembedded.org/mt/105531768/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

