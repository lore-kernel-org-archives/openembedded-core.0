Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC58C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 15:54:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.9521.1658505271420482366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 08:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vnndo0rq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-lf1-f42.google.com with SMTP id d17so6188915lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CTWi0UcS22T21dAm/RTfpN/4x1OuzZ9n03332cjiaIY=;
        b=vnndo0rqBk5pci+kcjPLAaxDhI9BIpK+7SmZRraQu2WTklqXOvgSBWM9vbpYhM8gl2
         vhu7KOlr502onwvRAKyN8UZa3Bjx4NQT+viJXe+6bQt0dywbYbM4PK4IoaGyHCGl4Ndl
         SXNCQPQni2djPHnlbN+KVSQ6o5EQxHqHs9F5lJSH9wtPMcSz2I3NGyoKOL7u3QgCESNR
         ArzYMWfvSKvD/fMenwVdlfZjwOqTkKqCIpdoXTI1P2sl3xgVRToitLcNTJFw00EGgDvq
         hF62QRw7nH76LsFFDw1tHvAKWDFf+Mld16/9XgwsTsby/iVYtfN+teaCW3DqkMym2lPR
         1pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CTWi0UcS22T21dAm/RTfpN/4x1OuzZ9n03332cjiaIY=;
        b=BDdqEEGFD8Iv9ql0lar6gj4Lg8nDF6zhdkJ9Qy6B8vnzE4PkP+z9Q4/Ru26u/tJ8h0
         2GXV54xB1QgzZmUxK81BFAplG3luQDegePeOGbYzP+fQxzWkjLeWPX9t5rfiZ2Dk13+H
         qZvtkUI7Ty7kuKiBGNR9W3HmYeBKPmZDpjS64yeC2l4r6FHux3ajw8AS3izJNzk88VY7
         WRqj41yP9yjjwNpbVpLuBjK9amoAOH8Ql1peg+y2WDBUinkK9LUcMscrPCIJpk+/dRvj
         aXK0wpDEVm+dXswqPUEEAkA9U3QENd9sAiUUHRiyPC0VUY+GbLZb132InVBVOTci8QRy
         QzHA==
X-Gm-Message-State: AJIora/PC8Z7NsM27JZ+IYGR9uHP4KouXjRF815dETGUQaB51cVe3+XZ
	n8dndJzpnbdoVI2xXXKyV79BXVMWEFrMH5njj0X4Fg==
X-Google-Smtp-Source: 
 AGRyM1sEeKpiIgu/DKqNOpe5Hcv878VJrf3P4BZ5f9FnS/J9iiyYwEjSmdBXZwOZkTEn262PEixQWs0H0NoL5cPIaqc=
X-Received: by 2002:ac2:5989:0:b0:48a:74a6:8658 with SMTP id
 w9-20020ac25989000000b0048a74a68658mr252167lfn.660.1658505269589; Fri, 22 Jul
 2022 08:54:29 -0700 (PDT)
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
 <CAMKF1sr1E079Bj8DMJXdNq1BurGtj8_KV_SoZyhX-rhVM8n2SA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr1E079Bj8DMJXdNq1BurGtj8_KV_SoZyhX-rhVM8n2SA@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 22 Jul 2022 11:54:17 -0400
Message-ID: 
 <CAPoiz9zcNeYB8Rvw-NVTwaRXx4F8jARZuTcDzbQf6+GAJ6sS=Q@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Jon Mason <Jon.Mason@arm.com>, Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 15:54:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168414

On Fri, Jul 22, 2022 at 10:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jul 22, 2022 at 10:31 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Jul 22, 2022 at 10:30 AM Ross Burton <Ross.Burton@arm.com> wrot=
e:
> > >
> > > On 22 Jul 2022, at 15:28, Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, Jul 22, 2022 at 6:36 AM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> > > >>
> > > >> On Thu, Jul 21, 2022 at 3:52 PM Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > >>>
> > > >>> I don=E2=80=99t see config.log for Libstdc++ folder in there
> > > >>> Can you see why that=E2=80=99s missing ?
> > > >>>
> > > >>
> > > >> I was missing because I misunderstood you - you were probably aski=
ng
> > > >> for the config.log *with* Jon's patch applied.
> > > >>
> > > >> Here's the log: https://controlc.com/4544edd8
> > > >
> > > > right, so I can see that its checking for fcnt function on system
> > > > where it should not, your toolchain
> > > > is using newlib and I am not sure what Jon's build is using for
> > > > zephyr, I guess it could be pure baremetal
> > > > if so, then perhaps we have a place to look into.
> > > >
> > > > Jon, whats TCLIBC set to in zephyr's case.
> > >
> > > Our CI has the following workaround for a problem that we=E2=80=99ve =
not managed to root-cause so far:
> > >
> > >     EXTRA_OECONF:append:pn-gcc-runtime =3D " ac_cv_func_fcntl=3Dno  a=
c_cv_func_getexecname=3Dno=E2=80=9D
> >
> > ah, that speaks for the difference then. Is this workaround introduced
> > after Richard's change ?
>
> perhaps came along with gcc 12 upgrade [1]
>
> [1] https://lists.yoctoproject.org/g/meta-arm/message/3469

Yes.  It is being tracked by
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14803

>
> >
> > >
> > > Ross
> > >

