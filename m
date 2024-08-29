Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43445C83F26
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:41:15 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.15829.1724938865898692224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MPNXpvNf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.48, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2704b6a6fe6so370251fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724938865; x=1725543665; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rixkchsHQlIkG1V7o6zlImWGKNdzpfRptYurFYloLBc=;
        b=MPNXpvNfcwaRIo4h5ccRawN6Zp8RBlIH0vuB54ALbWvYl2B+C4AceQuuiSgI1VYw7U
         zcSGSCGQpFy6rjiiXMv2b4VaQehrOK3K5yoHiR6vdHelkMxvNs2LEYq6+ZM4c0dhMSNA
         8SGyGIybu9F3UhsBZn8zStstf3kHKzLyYu9fj75gXggKYDTV2LG/u4r4LDZDwOHCAUjU
         fhtf6bS2TAQzFpMKdsJt6fDQwcksDEGE2ZV/BWayDZ64TL7PkdbmtNyaU6L/z1SLti8o
         YggLtKPisFs0flkYeGKgmHT9OWE3WlczDburoV8fstGcbPAyXxPwTBT+4JLbTom1K6ux
         N2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938865; x=1725543665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rixkchsHQlIkG1V7o6zlImWGKNdzpfRptYurFYloLBc=;
        b=mApHRNADd/b/DTGy7VDTyZ0XAUSpgj6CJQFu4esjIEgvKZLS6Sh7wkJY+0toEOcFDB
         u5zt1zwmc9x+qQRdtWgh+/yJ96BNthwbfM+h3GW31AJjKX7NvPmoSfLb3NPBvZ+BHz8e
         8PFPyTGVO+pd/w3aD43ccPXN/Nm91Nf3rGwMIFzyMZNsHI2EM52+bN9GoPk5n8HMVGz3
         X1+j2O2BwPgNkKv+v+pakvq6jv7ceiswlZov+0cu6LWv/3crrm5DkqBj6Ct6EGbeIO3X
         7j7dPqdHrmEhnBpj+6YWHeVhF9+Blei+lY56P6gi0Fw/CYiY7G8NRIVs6KHlYMD9sSZP
         6WzA==
X-Gm-Message-State: AOJu0YzqgOOdCfN/Fh13g9+ZPmqgBH74KinhRdLDHtm/rxK63XGyydWH
	JWFEARjiAjjZ5cjqiM6ptK2ptM+2oavLn35EvBW0AkKYg/DM+u1YwqGHIO+BHkXqVGxI07DBRc0
	QpN/5L2hhBjvhlqlnMv0OMIQ9aKQ1Jr5q58LwSeplcAGzLeQ=
X-Google-Smtp-Source: AGHT+IE+0FfH3fBzSIVNn6QRypUYaKBxygwz/KrUSkAthX406lC7FGe3uyRcGpCgkDJSPAgW6NmWiGypjNXfBuCKG5Q=
X-Received: by 2002:a05:6870:2104:b0:260:f883:95f9 with SMTP id
 586e51a60fabf-2779035c400mr3439783fac.42.1724938864918; Thu, 29 Aug 2024
 06:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240814195919.1079481-1-jdmason@kudzu.us> <20240814195919.1079481-2-jdmason@kudzu.us>
 <25a6f53578b0c0000ef89a7bce383b71f1847e80.camel@linuxfoundation.org>
In-Reply-To: <25a6f53578b0c0000ef89a7bce383b71f1847e80.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 29 Aug 2024 09:40:53 -0400
Message-ID: <CAPoiz9zQCm_pwi7W1jK_7GUouuyL+HBrfdzXOMMzenYztF8iEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203933

On Thu, Aug 15, 2024 at 9:53=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-08-14 at 15:59 -0400, Jon Mason via lists.openembedded.org w=
rote:
> > Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> > machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0=
"
> > (or something else).  These are usually defined by the machine config
> > file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> > one of those instead of ttyS0, but default back to ttyS0 if nothing is
> > set.
> >
> > Also, use this variable in the efi wic file instead of "ttyS0".
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 3 ++-
> >  scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/con=
f/distro/include/default-distrovars.inc
> > index 7554081e8b1a..26fa26f80c31 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -1,7 +1,8 @@
> >  QA_LOGFILE =3D "${TMPDIR}/qa.log"
> >
> >  OEINCLUDELOGS ?=3D "yes"
> > -KERNEL_CONSOLE ?=3D "ttyS0"
> > +# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise u=
se ttyS0 as the default
> > +KERNEL_CONSOLE ?=3D "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].spli=
t(';')[1] or 'ttyS0'}"
> >  KEEPUIMAGE ??=3D "yes"
> >
> >  DEFAULT_IMAGE_LINGUAS =3D "en-us en-gb"
> > diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic=
/canned-wks/mkefidisk.wks
> > index 9f534fe18471..1ab870805ed1 100644
> > --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> > +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> > @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --l=
abel platform --align 1024
> >
> >  part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
> >
> > -bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 co=
nsole=3DttyS0,115200 console=3Dtty0"
> > +bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 co=
nsole=3D${KERNEL_CONSOLE}"
>
> This doesn't look the same and at least needs some explanation.
>
> a) Where did console=3Dtty0 go?

Oversight, adding it back

> b) KERNEL_CONSOLE doesn't have the speed in it (115200). Is that needed?

My logic was that this might make the line difficult to parse and that
these should probably be overridden (and currently my testing is only
on virtual machines), but I do think making this a more sane default
at the expense of being a little ugly is probably the right call.
I'll do a v2 with both of these changes.

Thanks,
Jon

> These changes might be intended but if so, the commit message should ment=
ion this.
>
> Cheers,
>
> Richard
>

