Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5C2C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:47:50 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.2499.1709668060457151182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyhhNd6c;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-214ca209184so531372fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709668060; x=1710272860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+jLbloPmA1d7rToWEcXNLpZJbf5444V4845ndoBQ0=;
        b=TyhhNd6cMvkAMQj1VABAS+nZtHp7QxLL06g6YDJ3xWsbkKbM2GYhOw2PW3HbODky/L
         E+vza+25Ab3GUte09zpr+1M7uvmPaVGvboo0DmiT5kdWQgAtArJi+gaCdNeNU4CzRS8J
         24rI+EjtnZlK7IQ6A+7UXjtywhXTLdgcwgVYX7y6A399L0jwUR0zZ/EHgAuKoXwo8Gf0
         Avc3l8y+lfvjTQJ9OmT6O2hNlYOEtAT2Aj2YExBS+L+8JckC8X/mdVG5vECNDV23vdtm
         6gUdAfMK3z7V5/0XfAzodWtOFybqwojFHf8TblBUw+DAF1W7St4/YacfQBdszkgwC/no
         XoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668060; x=1710272860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+jLbloPmA1d7rToWEcXNLpZJbf5444V4845ndoBQ0=;
        b=iXVtL/ERswF/9oqxxzHxy2l6otAuQ6lHgSXAKgSAEErdAKmXfQSpXbOTzJCfwYowyf
         zKpBE5mhOzYgCHxgZiTGze6keYsNIvDgZScbRRtG9t3TD9nwXjpzb7RBoDNjcQWxr7Re
         GTOEf55piuDlF2BlmGKEGQ78EafCTG6PEBA7sp6DKRK6BqI8lPAFyDJsxSUIAMLZ7W3Y
         c7WuUdFet+29fAzJQIpTu/qIoZVLxWpd9PqhpRwD3BC4byrX3XbjgTFjwPz/SoVsLWQF
         5I879r1EaFSbRCMtjFmno4XjOAn7hRMhH+g5Rv0l6X+IaIj/RlI0Lzx4AjY9J6xlHdnO
         0Lxw==
X-Gm-Message-State: AOJu0Ywli304VEy5v/ugKOt71s2vPLSeYRtb0aggAxHFjqjQrGXT14l0
	4k70j837Z95UswVxCeX/j1UwcBXle7xrmDg5fUgmlDjqsQZl2Ya28WIkp94nQSx65s52zlvDDWZ
	HuqbDaQfcdIrMrszN1qVsrj3qJUE=
X-Google-Smtp-Source: AGHT+IERyEYIdnf936mEdgIA7avjBYushD2JV/ENC6U623HSOo4n1mjx5+EjmUtNCfUWN+1nJ0zW5CKk64ZOyqNmyRQ=
X-Received: by 2002:a05:6870:92c5:b0:21f:2f23:3e4a with SMTP id
 g5-20020a05687092c500b0021f2f233e4amr3288825oak.0.1709668059714; Tue, 05 Mar
 2024 11:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20240305194552.1098165-1-festevam@gmail.com> <CAMKF1soFD-PfPupV5_WEmxWKSpOYFit97zvoCACYf-80X-PN6A@mail.gmail.com>
In-Reply-To: <CAMKF1soFD-PfPupV5_WEmxWKSpOYFit97zvoCACYf-80X-PN6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 11:47:14 -0800
Message-ID: <CAMKF1srn0qnk7d_83bvTeb8Z8fL_EWj7AYPcZd3NF6vBfo9d8g@mail.gmail.com>
Subject: Re: [PATCH] dev-manual: Convert to 'bmaptool-native'
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196648

I wonder if  it should go to docs ml too

On Tue, Mar 5, 2024 at 11:46=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Thanks for doing this quickly.
>
> On Tue, Mar 5, 2024 at 11:46=E2=80=AFAM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
> > 'bmap-tools-native' has been renamed as 'bmaptool-native'.
> >
> > Adjust the references in the documentation accordingly.
> >
> > Suggested-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  documentation/dev-manual/bmaptool.rst | 6 +++---
> >  documentation/dev-manual/wic.rst      | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-=
manual/bmaptool.rst
> > index 9add72cf3b80..3a2a61d8cdfe 100644
> > --- a/documentation/dev-manual/bmaptool.rst
> > +++ b/documentation/dev-manual/bmaptool.rst
> > @@ -22,7 +22,7 @@ system image files much faster.
> >     -  If you are unable to install the ``bmap-tools`` package, you wil=
l
> >        need to build Bmaptool before using it. Use the following comman=
d::
> >
> > -         $ bitbake bmap-tools-native
> > +         $ bitbake bmaptool-native
> >
> >  Following, is an example that shows how to flash a Wic image. Realize
> >  that while this example uses a Wic image, you can use Bmaptool to flas=
h
> > @@ -45,13 +45,13 @@ any type of image. Use these steps to flash an imag=
e using Bmaptool:
> >
> >     -  If you have write access to the media, use this command form::
> >
> > -         $ oe-run-native bmap-tools-native bmaptool copy build-directo=
ry/tmp/deploy/images/machine/image.wic /dev/sdX
> > +         $ oe-run-native bmaptool-native bmaptool copy build-directory=
/tmp/deploy/images/machine/image.wic /dev/sdX
> >
> >     -  If you do not have write access to the media, set your permissio=
ns
> >        first and then use the same command form::
> >
> >           $ sudo chmod 666 /dev/sdX
> > -         $ oe-run-native bmap-tools-native bmaptool copy build-directo=
ry/tmp/deploy/images/machine/image.wic /dev/sdX
> > +         $ oe-run-native bmaptool-native bmaptool copy build-directory=
/tmp/deploy/images/machine/image.wic /dev/sdX
> >
> >  For help on the ``bmaptool`` command, use the following command::
> >
> > diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manua=
l/wic.rst
> > index 312f78c403a2..05e9cb381b31 100644
> > --- a/documentation/dev-manual/wic.rst
> > +++ b/documentation/dev-manual/wic.rst
> > @@ -503,7 +503,7 @@ Continuing with the example, you can now write the =
image from the
> >  built your image, and boot from the media. You can write the image by =
using
> >  ``bmaptool`` or ``dd``::
> >
> > -   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191=
017-sda.direct /dev/sdX
> > +   $ oe-run-native bmaptool-native bmaptool copy mkefidisk-20180419101=
7-sda.direct /dev/sdX
> >
> >  or ::
> >
> > --
> > 2.34.1
> >

