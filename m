Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.60506.1629318746579906286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rLfGTRba;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i6so5146494edu.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=heMErrhDI6bZSK3h2tTQuJN3t8whA9Au26SltMqkqQ0=;
        b=rLfGTRba8XxS+xpgbEuWudwGUgDcqlIrurTs6qhhjbh9H+UF1I1+k2c/TK3lmELDgI
         XWS0gGA+i+UWamXOj0hZ2DgXY9o63DxO6aDykEMnEvBeiDuoOcMm/X42kZsW+XTuBsw9
         mUE6f/XHqf4eV6QXbaIyq+rXLSXQNuiQB3XpTn3ATelhyMrj7iPfL9kzM6M1WtA2zppO
         XHCuLH+Es8QLmsUuIHfM9qhehpHD+EfJIuuY2mI0RbhwR7IcdwFBt9hmAwI//WckpNpV
         t/FaAz2MvWbmq63QIOge+61eQ1Dzzx/OBCKfVRiYA04WPTo8U0j2SBXuOiaC+/UGsc0h
         ORLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=heMErrhDI6bZSK3h2tTQuJN3t8whA9Au26SltMqkqQ0=;
        b=poUAWKuwNarNHlj/2zlrC4D+67YjRRTgDG7hVTsCL2dDJU5WB3tQAcuedvGA/Af/wZ
         aM96O/FrSc9p+/7oosVjwTii8eea+l2lBSHP4CNxKgoIR0KQsVU/+7bQhODZuJ4Z56da
         GaAz2GfJjpa0g1nEAch0BLaoBNSwBQSNhIOLX92nxxTfW9fUYVgDPuccjMzUTf6ibD/F
         06Olry0+WkG4TVEPEWey/ksUDcXmveNeAKLYqnyg4CEe3wAdndESOFkIgIPUvc7+gMDz
         ECPH34CImJ39nZNxwIM1hlXypoNmtbEggH4s0BvnXsOc6qkIiCfpNOvtmVv1aO5Jo3zj
         SzBw==
X-Gm-Message-State: AOAM5301BU8b+fh11ZxWrivqEMqnl7KB2aBwcWuByhjKOa6uoggwvCEs
	pson1y79ZhLiaon/773rQjMl2xhshnxWi/ibYCo=
X-Google-Smtp-Source: ABdhPJym7DORr3S3rkSPmZD911AAFnXzxhzSdDGDd6+FK7XT8OBLG1ET9Qii1w7w2wpEBuPUsYaMa+96Yoos3PS0rv8=
X-Received: by 2002:a05:6402:22aa:: with SMTP id cx10mr12036254edb.59.1629318745227;
 Wed, 18 Aug 2021 13:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210818162404.130067-1-quaresma.jose@gmail.com>
 <20210818162404.130067-3-quaresma.jose@gmail.com> <20aae4083e94dc9706e83c5ecdd95348c710b4bb.camel@linuxfoundation.org>
In-Reply-To: <20aae4083e94dc9706e83c5ecdd95348c710b4bb.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 18 Aug 2021 21:32:15 +0100
Message-ID: <CANPvuR=oOYfmFonKPH2vazPxbNOU09OPf9yYYM2p=c_vqSOMrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/4] sstate.bbclass: get the number of threads from BB_NUMBER_THREADS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

d.getVar("BB_NUMBER_THREADS") returns a string and it needs to be
converted to int.

-nproc =3D min(d.getVar("BB_NUMBER_THREADS"), len(tasklist))
+nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))

fixed in V4

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quarta, 18/08/2021 =C3=A0(s) 20:34:
>
> On Wed, 2021-08-18 at 17:24 +0100, Jose Quaresma wrote:
> > - bitbake BB_NUMBER_THREADS uses cpu_count from oe utils that uses
> > the python os.sched_getaffinity and it is more acurrate.
> >
> >  grep -nH ^BB_NUMBER_THREADS meta/conf/bitbake.conf
> >  meta/conf/bitbake.conf:806:BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_cou=
nt()}"
> >
> > - multiprocessing.cpu_count() returns the number of CPUs on the host,
> > not the number of usable CPUs on the host. If the user is using
> > scheduler affinity then the number of usable CPUs may be less,
> > so when determining how many cores we can use check the affinity instea=
d.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index c3c145e7f3..bc14b5e264 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -964,13 +964,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e, currentcount=3D0, summary=3DTrue,
> >              tasklist.append((tid, sstatefile))
> >
> >
> >
> >
> >          if tasklist:
> > +            nproc =3D min(d.getVar("BB_NUMBER_THREADS"), len(tasklist)=
)
> > +
> >              if len(tasklist) >=3D min_tasks:
> >                  msg =3D "Checking sstate mirror object availability"
> >                  bb.event.fire(bb.event.ProcessStarted(msg, len(tasklis=
t)), d)
> >
> >
> >
> >
> > -            import multiprocessing
> > -            nproc =3D min(multiprocessing.cpu_count(), len(tasklist))
> > -
> >              bb.event.enable_threadlock()
> >              pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
> >                      worker_init=3Dcheckstatus_init, worker_end=3Dcheck=
status_end)
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/3825/st=
eps/17/logs/stdio
>
> Cheers,
>
> Richard
>
>


--=20
Best regards,

Jos=C3=A9 Quaresma
