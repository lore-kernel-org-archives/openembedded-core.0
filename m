Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FDDC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 12:57:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.7534.1667912266443773570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 04:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=houTjSl8;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id j16so21066763lfe.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeBaHXf2awpDVr8a404w0qAEsR93ckbw8qQWMpuPR7U=;
        b=houTjSl82ERYbU8qrERLaqG4Dk+HCIe7m2bdBffOTLUrR6lvM118x2MhrlDM84FAgD
         ic1jpGtLnOnhkQg4pUnkxxX0vx0L//LpbQMxDvgXv7oJr1E+Bm3X0ZG83Z4NriBK1+J/
         BWxwVmrYaU3Vlv3xwOkzBmPzFq25S1uCkvc7sgIJyEkToJbwWHKp6LV9Ft8tDNxswAWz
         18jy8epNabVpyuoTYQ2HcDEP2to+YHwRbvnhpht0vr9gL2PR1epoVfRGB+cGa8CG57b2
         UEoimAN7tNMAbDBEdPCS1z8aGoN5zz9wRIkeQVhylaElI00qtpwIhgw60lPARV16PyDt
         GgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeBaHXf2awpDVr8a404w0qAEsR93ckbw8qQWMpuPR7U=;
        b=EFrQuSt0PXLIT0Skuq+Ajn7j6etI8PGj5bAbz4JCK6SK8MDodXJqwV0ZxfgV/I2VLF
         FjdO6/Y+N9XB4LYVP71cnOC00GTp/osldGQziPzoMlM+hTAgkXPvAOrAhyCED5zo1MK3
         bdXoLFEfcFxGSObWPsTrwhywbsAa8VF5DVk1t7fVbST9GlOjfoUa2f9SLAMl1fE0n8Ge
         IWG0VgiM0hW71h2H8SrnlaX0uEPf73xH6BYZbPftH9q82W+gCBkleL0is5g8IOstC/i0
         CFB3fm4rcXHOc3mfoW2ocPdw2WKabXVFiK9CzcDuQmQlNbshThR/6TmIS5dLO6UfmiM/
         QF+g==
X-Gm-Message-State: ACrzQf1tDWUHemsJYltf72kwnEsrSn+PPhkPc7/CjoaPyy178FtK3s03
	hVb2gquYbZ73jX1Bg6rKVGaTeEFLr5fQIP2SnPo=
X-Google-Smtp-Source: AMsMyM7jS9XrRPOspTzzYP0ikE3chguG22nIb+12GUTGw827UWFTnqlK4GbIK+XmnF1rz9rlsYH7qwO0LQ3N9oB8nIo=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr21021580lfb.393.1667912264664; Tue, 08
 Nov 2022 04:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com> <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
 <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com> <17259B3874804FB3.24550@lists.openembedded.org>
In-Reply-To: <17259B3874804FB3.24550@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 13:57:32 +0100
Message-ID: <CANNYZj_CZaKxkhmHL3h7sW5i9QNZpAfwnc8ZbcX24oDw82=5dg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: alex.kanavin@gmail.com
Cc: Niko Mauno <niko.mauno@vaisala.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 12:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172966

I suppose what I want to say is - perhaps this should be discussed
with upstreams first? Things should 'just work' without having to set
some magic flags in an external configuration.

Alex

On Tue, 8 Nov 2022 at 13:18, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Is this a recommendation somewhere official?
>
> Alex
>
> On Tue 8. Nov 2022 at 13.04, Niko Mauno <niko.mauno@vaisala.com> wrote:
>>
>> My understanding wrt. Y2038 and 32-bit glibc hosts was such that it
>> makes sense to set said compiler flags globally to ensure user space
>> wide Y2038 compliance. So I encountered this compiler error while
>> building poky reference images with additional effective
>>
>>    TARGET_CPPFLAGS +=3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"
>>
>> declaration in meta/conf/distro/include/tclibc-glibc.inc.
>>
>> -Niko
>>
>> On 8.11.2022 13.50, Alexander Kanavin wrote:
>> > So you need to set -D_TIME_BITS=3D64
>> > -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, shouldn=
=E2=80=99t
>> > the defaults work?
>> >
>> > Alex
>> >
>> > On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com
>> > <mailto:niko.mauno@vaisala.com>> wrote:
>> >
>> >     I have not studied the issue, but in order to reproduce this error=
 I
>> >     add
>> >     'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kbd' aga=
inst
>> >     current master while TARGET_CPPFLAGS value is set to "-D_TIME_BITS=
=3D64
>> >     -D_FILE_OFFSET_BITS=3D64".
>> >
>> >     -Niko
>> >
>> >     On 8.11.2022 11.14, Alexander Kanavin wrote:
>> >      > We do build for 32 bit arm targets, so is this seen only in spe=
cific
>> >      > circumstances? What are they?
>> >      >
>> >      > Alex
>> >      >
>> >      > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via
>> >     lists.openembedded.org
>> >     <http://lists.openembedded.org/
>> >      > <niko.mauno=3Dvaisala.com@lists.openembedded.org
>> >     <mailto:vaisala.com@lists.openembedded.org>> wrote:
>> >      >>
>> >      >> For now add exemption in order to avoid following failure duri=
ng
>> >      >> do_compile()
>> >      >>
>> >      >>    |
>> >     .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1=
-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-=
poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver=
:2: syntax error in VERSION script
>> >      >>    | collect2: error: ld returned 1 exit status
>> >      >>
>> >      >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
>> >     <mailto:niko.mauno@vaisala.com>>
>> >      >> ---
>> >      >>   meta/recipes-core/kbd/kbd_2.5.1.bb
>> >     <http://kbd_2.5.1.bb/
>> >      >>   1 file changed, 3 insertions(+)
>> >      >>
>> >      >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >     <http://kbd_2.5.1.bb/
>> >      >> index aa3ab6e121..b623aecd36 100644
>> >      >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >     <http://kbd_2.5.1.bb/
>> >      >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >     <http://kbd_2.5.1.bb/
>> >      >> @@ -18,6 +18,9 @@ SRC_URI =3D
>> >     "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>> >      >>
>> >      >>   SRC_URI[sha256sum] =3D
>> >     "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>> >      >>
>> >      >> +# Compiling 64 bit time for 32 bit host is broken
>> >      >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
>> >      >> +
>> >      >>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'p=
am',
>> >     d)} \
>> >      >>                     "
>> >      >>
>> >      >> --
>> >      >> 2.36.1
>> >      >>
>> >      >>
>> >      >>
>> >      >>
>> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172964): https://lists.openembedded.org/g/openembedde=
d-core/message/172964
> Mute This Topic: https://lists.openembedded.org/mt/94880633/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

