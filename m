Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17922C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:25:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.27007.1702571102191688928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QK5nsNvH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a1e2f34467aso764285266b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702571100; x=1703175900; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGM7B2f+pA/kW2oRO/PX6aH7Fz9HTylihxJzaULHLa0=;
        b=QK5nsNvHO6QJge0l5uTpaRGoK/yYGpRSW0hcAhsju2zciqvMX4+j6kiyoYD58Pi86D
         WSy+0EVE8QR3w42lwftJwE7DMfLReVdDQh5vRXbn4secDYFC1mJ4u6GHcciIU/ziQ5jF
         YnTwDododFumyKe85uWvzkDtveqM27Xs4Nw1WOGKFvHJYV3OMGImdQOWWygAyspGRqYa
         ZXD3Lg3oa/ZDrD9O2rIpPDEu1VLzW8WUs0GJV6lzclNrp6lXBpSOugSnC7JYxw2eAmN4
         os96qb1GlS05nXCD3BuaMY6PNN32a2xyj7asb6dq/mDVSt/Iklp6cBz4/FB37mQ4UTZv
         uZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571100; x=1703175900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGM7B2f+pA/kW2oRO/PX6aH7Fz9HTylihxJzaULHLa0=;
        b=LVUuTL71p9m6ZlZ+4AZdmEFLN6c0tjxAqIT8imjWyABkoGs7tGPZqx5nC+RRbVLZxX
         2PQ3ck1AIgyEIn7lGIFOpXLYGEPegqIdtac3yFo7wSG6guEN6l3jfcf7MuVDJTbmvpR2
         ybryExNkzNQRrNVlG8Vu4m1Sd3mSpOFGqLmEs35ghAGe6tRg3P1H+vCHGx/jlBW9581j
         x0UWHl62vnd69tjH1IFB6nbHLitiklpM0nM2MkLR7gDBOnCCgTm20zLzCfTgKpxBxiVy
         /Pt+BoFcF840IUvqlrv0jK46zxu2EXebVBRUgvBrZ1XK5DU9zBX1iw9iHX/vz3Q274ou
         pWIw==
X-Gm-Message-State: AOJu0Ywnlrb/kZgIf5p8d+cKkhhrQB7ntTfkqldQlWvRlb+ZqL7Xd/FS
	TUsLTLTn9OsXLJuxkP/dHTttc1t2AytIFTMPSopnuA==
X-Google-Smtp-Source: AGHT+IHkCOsECRRrVRKxiz4oLRV39mlyrMSIe2Ub1csCkETBC6aq0IwJbrcyRQRc/oWzh9pywbzjbxk2IWqabsXXqE8=
X-Received: by 2002:a17:907:3a03:b0:a18:7f88:af01 with SMTP id
 fb3-20020a1709073a0300b00a187f88af01mr5432475ejc.32.1702571100344; Thu, 14
 Dec 2023 08:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20231207223258.3273718-1-yoann.congal@smile.fr>
In-Reply-To: <20231207223258.3273718-1-yoann.congal@smile.fr>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 14 Dec 2023 06:24:48 -1000
Message-ID: <CAOSpxdbVCTyG5Y0Pay7G+PPxLHHhxcg-UOunTOQvWD7MkHSDRw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] externalsrc: Ensure SRCREV is processed before
 accessing SRC_URI
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Chris Wyse <chris.wyse@wysechoice.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192390

This patch resulted in oe-seftest failures on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6322

A representative log:

https://errors.yoctoproject.org/Errors/Details/746003/

Steve

On Thu, Dec 7, 2023 at 12:33=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Call bb.fetch.get_srcrev() before accessing SRC_URI. Without this new
> bb.fetch.get_srcrev() call, SRC_URI might be accessed before SRCREV had
> a chance to be processed.
>
> In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=
=3D62afa02d01794376efab75623f42e7e08af08526
> However, this commit is not suited for backport since it is quite invasiv=
e.
> The part of the commit that fix the bug is:
>     --- a/meta/classes/externalsrc.bbclass
>     +++ b/meta/classes/externalsrc.bbclass
>     @@ -63,6 +63,7 @@ python () {
>              else:
>                  d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
>     +        bb.fetch.get_hashvalue(d)
>              local_srcuri =3D []
>              fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(=
), d)
>              for url in fetch.urls:
>
> NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
> equivalent to bb.fetch.get_srcrev().
>
> Fixes [YOCTO #14918]
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
> ---
> Richard, Steve: This is the commit we discussed at today's bug triage.
> ---
>  meta/classes/externalsrc.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 97d7379d9f..eb6afca4ab 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -62,6 +62,9 @@ python () {
>          else:
>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
> +        # Ensure SRCREV has been processed before accessing SRC_URI
> +        bb.fetch.get_srcrev(d)
> +
>          local_srcuri =3D []
>          fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d=
)
>          for url in fetch.urls:
> --
> 2.30.2
>

