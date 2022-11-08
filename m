Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C9DC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 18:38:23 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.923.1667932699761281086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 10:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XFtklbSX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id k19so22436626lji.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8zn0k67Jeg9PzuZbLgKFDfv6QcJHFNSaCnvei9p308=;
        b=XFtklbSX5fVcdjGrHvLU++vOvMgwlQPnAZmPATwqq6mg3h2q43Sd2zG4b0RKiafxms
         RDVbA6/aLFsKXtyZRI1yQEwIjHS3Tl3P1JDVj0Io08RfRj1DY9FOeh5lpZ+iGSxk+d2Z
         fiVn9s95yFNA06Jhbamj8aDKGOA3TnFevyvYQbPfLVEUrtvcU4a8C3//eeGfUtt7TYgO
         rd4Y+lWLZ181qEsUlZSirAw1HwMYJcrWDsZX1Fn4+NZ9WmtiSfU3rIoOJBCCpPLkwZA7
         RdX+TuIVlG8/HV1vGy+v+eLeOvwWFQEgglBUzaWMMKH3mr50mAF3/fWmz0xaeXYbkX7Z
         N3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8zn0k67Jeg9PzuZbLgKFDfv6QcJHFNSaCnvei9p308=;
        b=JU333kvWI2pe6/IuTs+yo6iQwDixc2i+jdDPNanptkPBdfzv0eu5j/MQb9IvqwKHJq
         kYzPym8BmqbanG1tahGXvXTswH/ef/Oc0k9hqoPWzPe7V3pZys4SxBCayiU8+S43h5fC
         +fcW6c90+qRacILBsiD10ROC7rCFX3J1126jNL1bP2yU+TbuI33QmbdYFzRP9N+qN1JB
         9MVE004Q56GDtPU6FqCB0zCHvzkTTNUO1ndE3yaL+xTlutC1gLcBRSfrEX6uL0k+vX+b
         ZNr3r/OSyToqYTiFvyRlH84C7AvfIB7cFqegtcit4obXIxPDWJ5qRV6qWZyz0u0b4L/h
         BMUw==
X-Gm-Message-State: ANoB5pmNWmTjqXt/ZVtfyDdTZv6fqaEIGK8oYqJLkayCHVXzH6+Ql5H3
	2jHdVHT0CJCXrVCFLgso81Ri9e8suA5G26S/YBA=
X-Google-Smtp-Source: AA0mqf7z3qxPrbsHyi8qvjojGxhMsbaKHV0Z6+GVfkSmbdFGmiufZK+TXGMIWpF020tzQkP3czMJGjVoFooXvPSjMwY=
X-Received: by 2002:a2e:7405:0:b0:278:a461:cb73 with SMTP id
 p5-20020a2e7405000000b00278a461cb73mr4951366ljc.31.1667932697598; Tue, 08 Nov
 2022 10:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com> <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
 <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com> <17259B3874804FB3.24550@lists.openembedded.org>
 <CANNYZj_CZaKxkhmHL3h7sW5i9QNZpAfwnc8ZbcX24oDw82=5dg@mail.gmail.com>
 <jwqcz9xsdah.fsf@axis.com> <1725A47F2FC9966F.2170@lists.openembedded.org> <jwq4jv9s4zi.fsf@axis.com>
In-Reply-To: <jwq4jv9s4zi.fsf@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 19:38:06 +0100
Message-ID: <CANNYZj8wUXkx2c9zvVEds+FvrA0hGvHyDACsjLRy4zzr28ne-g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: Niko Mauno <niko.mauno@vaisala.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 18:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172991

Thanks. But: face, meet palm.

"If _TIME_BITS is undefined, the bit size of time_t is architecture
dependent. Currently it defaults to 64 bits on most architectures.
Although it defaults to 32 bits on some traditional architectures
(i686, ARM), this is planned to change and applications should not
rely on this. "

No one needs to know or care about this, they should just set it to 64
for all targets, break all the badly written userspace and move on.

Anyway, rather than add exceptions all over the core layers, I'd
suggest that you set it to 64, 'bitbake world' with all of meta-oe,
then send fixes upstream for everything that breaks. Rinse, repeat.
Then when the 'planned to change' actually happens we should be ready
for it.

Alex




On Tue, 8 Nov 2022 at 18:58, Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>
>
> And here is a link to the documentation for the _TIME_BITS Feature Test
> Macro
> https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.ht=
ml#index-_005fTIME_005fBITS
>
> The docs for _FILE_OFFSET_BITS is just above.
>
> /Ola
>
> On Tue, Nov 08 2022, Ola x Nilsson wrote:
>
> > Sorry, that link did not explain the -D_USE_TIME_BITS=3D64 flag.
> >
> > I was sure I had read official docs of this somewhere but now I can onl=
y
> > find https://sourceware.org/glibc/wiki/Y2038ProofnessDesign#Detailed_im=
plementation
> >
> > /Ola
> >
> > On Tue, Nov 08 2022, Ola x Nilsson wrote:
> >
> >> As far as I can tell from glibc's documentation, this is how you are
> >> supposed to do it.  glibc chose to always support both 32 and 64 bit
> >> APIs for time and file offset and make the normal int size the default=
.
> >> musl chose to switch to 64bit altogether.
> >>
> >> https://www.gnu.org/software/libc/manual/html_node/64_002dbit-time-sym=
bol-handling.html
> >>
> >> /Ola
> >>
> >> On Tue, Nov 08 2022, Alexander Kanavin wrote:
> >>
> >>> I suppose what I want to say is - perhaps this should be discussed
> >>> with upstreams first? Things should 'just work' without having to set
> >>> some magic flags in an external configuration.
> >>>
> >>> Alex
> >>>
> >>> On Tue, 8 Nov 2022 at 13:18, Alexander Kanavin via
> >>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.o=
rg>
> >>> wrote:
> >>>>
> >>>> Is this a recommendation somewhere official?
> >>>>
> >>>> Alex
> >>>>
> >>>> On Tue 8. Nov 2022 at 13.04, Niko Mauno <niko.mauno@vaisala.com> wro=
te:
> >>>>>
> >>>>> My understanding wrt. Y2038 and 32-bit glibc hosts was such that it
> >>>>> makes sense to set said compiler flags globally to ensure user spac=
e
> >>>>> wide Y2038 compliance. So I encountered this compiler error while
> >>>>> building poky reference images with additional effective
> >>>>>
> >>>>>    TARGET_CPPFLAGS +=3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64=
"
> >>>>>
> >>>>> declaration in meta/conf/distro/include/tclibc-glibc.inc.
> >>>>>
> >>>>> -Niko
> >>>>>
> >>>>> On 8.11.2022 13.50, Alexander Kanavin wrote:
> >>>>> > So you need to set -D_TIME_BITS=3D64
> >>>>> > -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, sho=
uldn=E2=80=99t
> >>>>> > the defaults work?
> >>>>> >
> >>>>> > Alex
> >>>>> >
> >>>>> > On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com
> >>>>> > <mailto:niko.mauno@vaisala.com>> wrote:
> >>>>> >
> >>>>> >     I have not studied the issue, but in order to reproduce this =
error I
> >>>>> >     add
> >>>>> >     'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kbd=
' against
> >>>>> >     current master while TARGET_CPPFLAGS value is set to "-D_TIME=
_BITS=3D64
> >>>>> >     -D_FILE_OFFSET_BITS=3D64".
> >>>>> >
> >>>>> >     -Niko
> >>>>> >
> >>>>> >     On 8.11.2022 11.14, Alexander Kanavin wrote:
> >>>>> >      > We do build for 32 bit arm targets, so is this seen only i=
n specific
> >>>>> >      > circumstances? What are they?
> >>>>> >      >
> >>>>> >      > Alex
> >>>>> >      >
> >>>>> >      > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via
> >>>>> >     lists.openembedded.org
> >>>>> >     <http://lists.openembedded.org/
> >>>>> >      > <niko.mauno=3Dvaisala.com@lists.openembedded.org
> >>>>> >     <mailto:vaisala.com@lists.openembedded.org>> wrote:
> >>>>> >      >>
> >>>>> >      >> For now add exemption in order to avoid following failure=
 during
> >>>>> >      >> do_compile()
> >>>>> >      >>
> >>>>> >      >>    |
> >>>>> >     .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/=
2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec=
/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswra=
p.ver:2:
> >>>>> > syntax error in VERSION script
> >>>>> >      >>    | collect2: error: ld returned 1 exit status
> >>>>> >      >>
> >>>>> >      >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
> >>>>> >     <mailto:niko.mauno@vaisala.com>>
> >>>>> >      >> ---
> >>>>> >      >>   meta/recipes-core/kbd/kbd_2.5.1.bb
> >>>>> >     <http://kbd_2.5.1.bb/
> >>>>> >      >>   1 file changed, 3 insertions(+)
> >>>>> >      >>
> >>>>> >      >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
> >>>>> >     <http://kbd_2.5.1.bb/
> >>>>> >      >> index aa3ab6e121..b623aecd36 100644
> >>>>> >      >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> >>>>> >     <http://kbd_2.5.1.bb/
> >>>>> >      >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> >>>>> >     <http://kbd_2.5.1.bb/
> >>>>> >      >> @@ -18,6 +18,9 @@ SRC_URI =3D
> >>>>> >     "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> >>>>> >      >>
> >>>>> >      >>   SRC_URI[sha256sum] =3D
> >>>>> >     "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d2452202=
4683"
> >>>>> >      >>
> >>>>> >      >> +# Compiling 64 bit time for 32 bit host is broken
> >>>>> >      >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
> >>>>> >      >> +
> >>>>> >      >>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES=
', 'pam',
> >>>>> >     d)} \
> >>>>> >      >>                     "
> >>>>> >      >>
> >>>>> >      >> --
> >>>>> >      >> 2.36.1
> >>>>> >      >>
> >>>>> >      >>
> >>>>> >      >>
> >>>>> >      >>
> >>>>> >
> >>>>
> >>>>
> >>>>
> >>>>
> >>> [4. ATT00001.txt --- text/plain; ATT00001.txt]...
> >
> > [4. ATT00001.txt --- text/plain; ATT00001.txt]...
>

