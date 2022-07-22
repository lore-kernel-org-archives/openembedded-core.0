Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E1DC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:32:36 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.8329.1658500344780686928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I8nV4dZ8;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id e16so3713140qka.5;
        Fri, 22 Jul 2022 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZR3ZpffDnQdB2t0LjbnwWjKJhLcKme8bl7XvIAsyOSo=;
        b=I8nV4dZ8Vu+Q7gBbxhDdnsVoiqcMhEZOXATjbVb6ZzWlRRLXOrDyIlqRWa9aZEqQcR
         Wgb2cS607rnUCSjq44r272TXl8Lm6aiONNKkMsw2R+E1Vl77rcoUXWSwtAypqKzruPhU
         FV4V1crvcemQDMlp++u3EEoaOheNgBNaiD71PvoHGAM6fm1+6ABioC2hnOe5G+cTUCD1
         IJAfAOtddcqb9/0L10tsjAY6xS629EpNpJ3nIh9GpRg7Mhner3Vh9kEdbiuRkMhKnbyI
         EFYYm637iLDRtniwbta/lm/XLuvCIuYwX5r0VtvwwRxv+L7Y2B2IO8G+66ayId//gTxQ
         i0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZR3ZpffDnQdB2t0LjbnwWjKJhLcKme8bl7XvIAsyOSo=;
        b=J/MdQGRTuLctkVmcwk2u+A11ZeDLzp6/4fL4wcMplbojqibU4wbaVpOLSncdN3YgZl
         u1EaWNvtFDZDmnCcWGvIO/uhVvSlU1NhXhD9pcSzmj5y9b2ysCeepj5KoGbErShxbd5N
         IGtliGhRWLlwTEbY6QYQdk0ZTP2obvuo9QiRcKGbWsCIBxbgcf9dPPksroB1Qzg/g2OB
         qIYz2mfcWLS+3xS0MopvZUjheENIfSI/X4/GBMqpeKrwe4pl0p60lsL7s/rQNWw+nYrI
         HrpKQWxlQhGCr8P2uCarXxwY5en1uC+PONLrKAgF5ZPOdaZnLJhOR8f5sG/4WwEDE/+w
         0MBQ==
X-Gm-Message-State: AJIora9PYGZpBtlQgDKOqsbGR8gUyYPASkGuVfI778iExLvj+evDl7AJ
	olT4GKYs5A44UeLVa4T8AxMOos5NhwG9nnbeoto=
X-Google-Smtp-Source: 
 AGRyM1vMwb2tcHP8ishvXBQycHxj8blBPiLGhbunLwUtU7QdFCsis4VZKN4p47Rqib1Vg0J2gF2T0hFDIARPxnkDWFM=
X-Received: by 2002:a05:620a:2449:b0:6b5:f01e:d6cb with SMTP id
 h9-20020a05620a244900b006b5f01ed6cbmr99623qkn.463.1658500343721; Fri, 22 Jul
 2022 07:32:23 -0700 (PDT)
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
In-Reply-To: <CB11164A-DF98-44E2-B0BF-265797DB930A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 10:31:57 -0400
Message-ID: 
 <CAMKF1sqwUGGROP+BO=b77Peo_c0-DCAQODZ2ixW0rBMt39+Akw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 14:32:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168411

On Fri, Jul 22, 2022 at 10:30 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 22 Jul 2022, at 15:28, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Jul 22, 2022 at 6:36 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >>
> >> On Thu, Jul 21, 2022 at 3:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> I don=E2=80=99t see config.log for Libstdc++ folder in there
> >>> Can you see why that=E2=80=99s missing ?
> >>>
> >>
> >> I was missing because I misunderstood you - you were probably asking
> >> for the config.log *with* Jon's patch applied.
> >>
> >> Here's the log: https://controlc.com/4544edd8
> >
> > right, so I can see that its checking for fcnt function on system
> > where it should not, your toolchain
> > is using newlib and I am not sure what Jon's build is using for
> > zephyr, I guess it could be pure baremetal
> > if so, then perhaps we have a place to look into.
> >
> > Jon, whats TCLIBC set to in zephyr's case.
>
> Our CI has the following workaround for a problem that we=E2=80=99ve not =
managed to root-cause so far:
>
>     EXTRA_OECONF:append:pn-gcc-runtime =3D " ac_cv_func_fcntl=3Dno  ac_cv=
_func_getexecname=3Dno=E2=80=9D

ah, that speaks for the difference then. Is this workaround introduced
after Richard's change ?

>
> Ross
>

