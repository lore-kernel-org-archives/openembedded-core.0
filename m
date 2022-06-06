Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05021C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 19:07:06 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.2391.1654542417917788068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 12:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KIlUe2V7;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id b12so5797973ljq.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m4l32eEesE2+HSNZgaHAINVaO7k/bpqcY1mKe8cDnlg=;
        b=KIlUe2V76GuPoVDuZzKdtbS10qplrPOuEjkPzeOPq0yJ+tXYcKLRowlzzUGpqfCtem
         tOcj/pF7i+ds77AZxnv3W9YuSgfudoS/faQo7KY62bugM5gcKdHjJ8B1vRNIICo8Sh0J
         T/6tYCqb5zZ7Cz5AYH7NKyMvyzqw0n59yLtjyCa+egwno87ET0BL45jK2V9ga4YT4fLO
         Qg+4rqH8Lmj/3+u04muMKZJvyNG8XmaN4kIvvR5Uh6r31+sIOycDa8HZiEbjIQb0lmGy
         3E97y73BTrvEO5CiOOF7I9kumGne+daAOdIMIF/8g7n/rBBoZ128+954tFf2kZl643xO
         laOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m4l32eEesE2+HSNZgaHAINVaO7k/bpqcY1mKe8cDnlg=;
        b=AVtrr9UlO3YEmdrrzf4ZbYdppvU3HCOXIFzHRUIGXH5hAV2wwOAikAl6J5mGqN6d/4
         yznIR2bZcFapUaUmWyk/JeB3Hh09VroFxOxBuOM9Fyer43vsw1uOz94/XXvsynLcZXc2
         ejVfLdrfJpd1JKSLt6r2F8nXXuz2JWRztUlEB262vLEDWQzuz4SIfWiLlKJKip7XXfsH
         6Jeezb9ymSYol9/BscTvgMWBd3PoW8UkbvP28didKmzYtsmFF3TT/xJmlmltUccrkncG
         gnSaWQMV/yoOBUQn3RVWQnCi7+m70tEfd3viCkvx7x5FkwVVBMJBvx7uvhVF7jM88uT5
         H0Nw==
X-Gm-Message-State: AOAM533CoOM6C2RRn7VFtmraGopOAWPG5fgfFq6SsPkdYc8ovjk7OLMh
	/09DKHUTX32ZEDNdbQiHjogRZWiPTSljMg9G5pY=
X-Google-Smtp-Source: 
 ABdhPJyAsOcNFUo3vSerw2lEPa7QJps4Rutahjvkt0RTKiUFzz81XlPPrGedtu35Cjggx2qCnrh6drxgDRyWbZnsvOc=
X-Received: by 2002:a2e:2ac1:0:b0:255:6d35:6726 with SMTP id
 q184-20020a2e2ac1000000b002556d356726mr14811691ljq.41.1654542415557; Mon, 06
 Jun 2022 12:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220606141056.2054477-1-jan.vermaete@gmail.com>
 <CANNYZj8FfTTwMqh8Ct59pUT=RkXNnmKPH_0hwQCw-DL-V_JnXw@mail.gmail.com>
 <CABF_=yhapjOuwHqaYeVQG8cpDbWXs-vMXBudV61x3Xu5Qi0PNg@mail.gmail.com>
In-Reply-To: 
 <CABF_=yhapjOuwHqaYeVQG8cpDbWXs-vMXBudV61x3Xu5Qi0PNg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jun 2022 21:06:44 +0200
Message-ID: 
 <CANNYZj_2yBr=pHHHOy3SfVZ=5_YX+QEU9OmdNCknFXmWu0xssg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: added compression and decompression as
 packageconfig
To: jan vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 19:07:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166655

I don't mind the option itself, the problem is that it needs to be in
its own commit and not squashed with compression/decompression options
into a single change. Or you need to say 'added
compression/decompression/pzstd as PACKAGECONFIG options' and add to
the commit message too.

Alex

On Mon, 6 Jun 2022 at 20:38, jan vermaete <jan.vermaete@gmail.com> wrote:
>
> Hi Alexander,
>
> As far as I know, pzstd is used in the scripting of Yocto/OE.  Or at leas=
t it's useful to have it there.
> So having it at native it a kind of must.
>
> But for target, it's best to have it as an option for those who have to h=
ave it tiny.
>
> Is this info added to the commit message enough?
> Or is PACKAGECONFIG not the correct way to create this option.  After all=
, it's not an option for the configure stage but for the compile stage.
>
> br
>
> On Mon, Jun 6, 2022 at 5:25 PM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> pzstd changes need to be either explained or split into a separate patch=
.
>>
>> Alex
>>
>> On Mon, 6 Jun 2022 at 16:11, Jan Vermaete <jan.vermaete@gmail.com> wrote=
:
>> >
>> > The default is the same as before.
>> > So both target and native can do compression and decompression.
>> >
>> > Native will probably always needed both.  E.g. to create rpm packages.
>> > Target could have enough with decompression only.  E.g. for OTA system=
s.
>> >
>> > The difference between default and decompression only:
>> >   packages/cortexa72-poky-linux/zstd/libzstd: PKGSIZE changed from 661=
912 to 210776 (-68%)
>> >   packages/cortexa72-poky-linux/zstd/zstd: PKGSIZE changed from 143083=
9 to 785007 (-45%)
>> >
>> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>> > ---
>> >  meta/recipes-extended/zstd/zstd_1.5.2.bb | 15 ++++++++++++---
>> >  1 file changed, 12 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-e=
xtended/zstd/zstd_1.5.2.bb
>> > index 3887f31ecf..924e7db7f7 100644
>> > --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> > +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> > @@ -18,22 +18,31 @@ CVE_PRODUCT =3D "zstandard"
>> >
>> >  S =3D "${WORKDIR}/git"
>> >
>> > -PACKAGECONFIG ??=3D ""
>> > +PACKAGECONFIG:class-native ??=3D "compression decompression pzstd"
>> > +PACKAGECONFIG:class-target ??=3D "compression decompression pzstd"
>> > +PACKAGECONFIG[compression] =3D "ZSTD_LIB_COMPRESSION=3D1,ZSTD_LIB_COM=
PRESSION=3D0"
>> > +PACKAGECONFIG[decompression] =3D "ZSTD_LIB_DECOMPRESSION=3D1,ZSTD_LIB=
_DECOMPRESSION=3D0"
>> >  PACKAGECONFIG[lz4] =3D "HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4"
>> >  PACKAGECONFIG[lzma] =3D "HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz"
>> > +PACKAGECONFIG[pzstd] =3D ""
>> >  PACKAGECONFIG[zlib] =3D "HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zlib"
>> >
>> > +
>> >  # See programs/README.md for how to use this
>> >  ZSTD_LEGACY_SUPPORT ??=3D "4"
>> >
>> >  do_compile () {
>> >      oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=3D${ZSTD=
_LEGACY_SUPPORT}
>> > -    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=3D${ZSTD=
_LEGACY_SUPPORT} -C contrib/pzstd
>> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false'=
, d)}; then
>> > +        oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=3D${=
ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
>> > +    fi
>> >  }
>> >
>> >  do_install () {
>> >      oe_runmake install 'DESTDIR=3D${D}'
>> > -    oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C contrib=
/pzstd
>> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false'=
, d)}; then
>> > +        oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C con=
trib/pzstd
>> > +    fi
>> >  }
>> >
>> >  PACKAGE_BEFORE_PN =3D "libzstd"
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#166632): https://lists.openembedded.org/g/openembe=
dded-core/message/166632
>> > Mute This Topic: https://lists.openembedded.org/mt/91577767/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

