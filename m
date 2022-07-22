Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B822FC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:35:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.8367.1658500513963027776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ms/PdL+r;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id l3so3727978qkl.3;
        Fri, 22 Jul 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=miM9NPj2Gj/IpPGnZqTPuWTh7N3387eyfXjoqpwpbck=;
        b=Ms/PdL+rINCwRlh51VtxqmhI/q8GCyUb1MZ07KxlmfxMSJcQeLNbJAdIcqN7ftHr/4
         qWeQv9gHdJ2T5ZC8UbGY5AkgqmkiIM4PFPGlwZWGB3U2DcCdGMjpUZ/xUnxedlCm7RUr
         KK84R3yA44Xvx8v50C9rZlVdJuiKi/qbZEDp23MPuWbZOmPYWXuAmc9U0o5g34C4+QEx
         ycO8byXst+O4S23uMfzg1zbiJ5DwF0tax0rmg3IbAXn93ZQBzPHLsPxOTB0D+AFQ3jN+
         tgoeizhyos2AVRgi0rZeyIsdPlV2cCXNklqygJz2/b9GJ+pn/u7qk7eQacgVO9BqzZTr
         mFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=miM9NPj2Gj/IpPGnZqTPuWTh7N3387eyfXjoqpwpbck=;
        b=0aCSSG81U+VVmTuMvXaELf0d1H8nrDk0lc4cmL0/A4g0LyWdvJIvg4dTBQikC4uj0G
         tunmZX9Nsz2ipB6Uop77eJ2qXrhqnQMjf8q3mV2smGfOip8mdiI4XNY6GcOX3M6tAS8f
         mNhOMwxZUwA7SRYm1s+IPX5Sr+F68lOHcasoF3hqY7/Oq3i4gERiML4ta3vvUwa0XsdQ
         z9tvwEyDRCqWSlNONc6bXcu5o80lhyebxuvPS68KT6PLDz2L2ghsLSg3a20xVHs0dfjq
         d+9QSmwXJgEEB4Jg+vsgv2IzNtymVVMRfvG9xPfqRcGeVAgknEejuq8T3J5bP6/x2Nmi
         doJw==
X-Gm-Message-State: AJIora9YiQDgMWjIGbHjzt12uRY4UzHOpsMj4VzfsOTido6D23uqrt4b
	ddmQfy5hS0jn7tdLOdhcsu0aoIEbkRiQy6FlCHM=
X-Google-Smtp-Source: 
 AGRyM1vtO/mVvmKT6n41fkg3oJRc8m1cHhR45FoIiLa8gKgsfnpuN1KgKVzUz7lz99Q++IZTVLr+4qD44qfqqo+K2Cs=
X-Received: by 2002:a05:620a:f85:b0:6b5:e2be:1d04 with SMTP id
 b5-20020a05620a0f8500b006b5e2be1d04mr176903qkn.72.1658500512981; Fri, 22 Jul
 2022 07:35:12 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
 <CAMKF1sq4ZT91i881_tVXddV1axi+-NCJBkKizxpBUPLMuEVt8w@mail.gmail.com>
 <CAMRc=McFVfxjG6U7ectAfHaWEBe9wyb4erd+Khjug1YyWXKLyw@mail.gmail.com>
 <CAMKF1srvQZDtjtQnQPTaT2PNYZCaChCY9S9pBNVQV5ybqAjVkw@mail.gmail.com>
 <CB11164A-DF98-44E2-B0BF-265797DB930A@arm.com>
 <CAMKF1sqwUGGROP+BO=b77Peo_c0-DCAQODZ2ixW0rBMt39+Akw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqwUGGROP+BO=b77Peo_c0-DCAQODZ2ixW0rBMt39+Akw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 10:34:46 -0400
Message-ID: 
 <CAMKF1sr1E079Bj8DMJXdNq1BurGtj8_KV_SoZyhX-rhVM8n2SA@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Ross Burton <Ross.Burton@arm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <Jon.Mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 14:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168412

On Fri, Jul 22, 2022 at 10:31 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jul 22, 2022 at 10:30 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 22 Jul 2022, at 15:28, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, Jul 22, 2022 at 6:36 AM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > >>
> > >> On Thu, Jul 21, 2022 at 3:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>>
> > >>> I don=E2=80=99t see config.log for Libstdc++ folder in there
> > >>> Can you see why that=E2=80=99s missing ?
> > >>>
> > >>
> > >> I was missing because I misunderstood you - you were probably asking
> > >> for the config.log *with* Jon's patch applied.
> > >>
> > >> Here's the log: https://controlc.com/4544edd8
> > >
> > > right, so I can see that its checking for fcnt function on system
> > > where it should not, your toolchain
> > > is using newlib and I am not sure what Jon's build is using for
> > > zephyr, I guess it could be pure baremetal
> > > if so, then perhaps we have a place to look into.
> > >
> > > Jon, whats TCLIBC set to in zephyr's case.
> >
> > Our CI has the following workaround for a problem that we=E2=80=99ve no=
t managed to root-cause so far:
> >
> >     EXTRA_OECONF:append:pn-gcc-runtime =3D " ac_cv_func_fcntl=3Dno  ac_=
cv_func_getexecname=3Dno=E2=80=9D
>
> ah, that speaks for the difference then. Is this workaround introduced
> after Richard's change ?

perhaps came along with gcc 12 upgrade [1]

[1] https://lists.yoctoproject.org/g/meta-arm/message/3469

>
> >
> > Ross
> >

