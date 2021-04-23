Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.5920.1619157667075167293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 23:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p40RR0hO;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id v7so20625860qkj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0S3IjOGiEslkxs2fAD11TV0rsfrU0EIU+Vb/kyE3PYY=;
        b=p40RR0hOMx8sBpuEZZRhB/n+k5ES70ie4SqdBRMNpgq1S10V6e6Ki8CG6MZLznNj67
         Wt+lsXQ8fkmLdtN3oTLDvURw9johHaOLOqL5fYHfCdsnp9LDbym9qpP2/GfBZS0057w8
         rpQHRbH8Yz7NF+7hIex2NzAxotLcrmVEukJLzH46VdTF8/hd/tvzoaxOatl5jeqWxBOQ
         mNpWw2vbBNeFmXAnyqfcQL1+UpVZMcNcXoGGnkZZ7IteYqlcN/p4TiBLp1QVH8vgz4EJ
         DQdS21emEJD1mdJBbv4kKeivvV/LVXX8CeoTdxY+7J5q8sTrNzIkDEt/87tALOqeEaLs
         n/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0S3IjOGiEslkxs2fAD11TV0rsfrU0EIU+Vb/kyE3PYY=;
        b=F0tYhq5d0KmjvQJZuflfuqVng5Ko6Sinu8Z5Ou3p60gfeRgS3v9OKcPP0+Cjucvcr7
         bY3cFVhe6YVeIqrabzLMzRX5Xw6ohNhzgNFrwbLBj6QFAiyEv0PQ1iUvy8eGCTolRGZ4
         OFg1ZeUjfM8ngriYIl5G5AInB/cuTRqsOwpi0/gdiWXkn/guXyXA2fiCZWsp1VuSy1FS
         ncF9nv5BY3vop0QHBWNZTL1bAYVtQN1QVHPLdXFX1j+IAtxfdCq2zUQkpq5HlKwzZ0Q0
         0sGGljdRPK37qfbW9G3v7LwsC+zOySpiY46ZTnKmZolZk9TB/l2Vpt+FnuiJF4W7bgvV
         mSsQ==
X-Gm-Message-State: AOAM530V5JBIXkpQoeDJVEq/ZTs7slhjI+UAdMVObpoeVeEaouiUA1j/
	XnQw00/ahytXnePBdAsEqlV3xlRAmBLa5cqJT4CvTiHnl/M=
X-Google-Smtp-Source: ABdhPJwZkecZC6O2uy80ohAMPH2qYmNSPdG04PU00p217RFz0603yy/4JTngcMeCmDQMGh2UlFt/pPSn8e7IIvaLJns=
X-Received: by 2002:a37:9607:: with SMTP id y7mr2506239qkd.25.1619157666140;
 Thu, 22 Apr 2021 23:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210422144152.29206-1-mikko.rapeli@bmw.de> <CAMKF1sq8YwMNdL7f-COjZLDxzNL=8CPrZmX-1WwDqYZc=aASOQ@mail.gmail.com>
 <YIJf0rTBgrKAtI3B@korppu>
In-Reply-To: <YIJf0rTBgrKAtI3B@korppu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Apr 2021 23:00:40 -0700
Message-ID: <CAMKF1spK-XtiyRnOvOp5DuwtVdx-ZYBjW1LBJJrb16Uk3xCBkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 10:49 PM <Mikko.Rapeli@bmw.de> wrote:
>
> On Thu, Apr 22, 2021 at 08:05:20AM -0700, Khem Raj wrote:
> > On Thu, Apr 22, 2021 at 7:42 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrot=
e:
> >
> > > Currently lz4 uses it's own defaults which include O3 optimization.
> > > Switch from O3 to bitbake default O2 reduces binary package size
> > > from 467056 to 331888 bytes. Enables also building with Os if needed.
> >
> >
> > These could impact runtime performance have you
> > Checked what the rough impact is ?
>
> Nope, have not checked this. I've build my targets with this patch
> and have not noticed any major performance regression. If there is
> a performance problem, then I'd rather see O3 explicitly set in the recip=
e,
> for example for native target.
>
> > Secondly we will be using non default set which could result in errors =
less
> > seen by others over time I have realized it=E2=80=99s also good to open=
 a dialog
> > upstream and get the reasoning behind not letting distro defaults apply
> > some packages do have valid reasons
>
> I've seen bugs with O3 optimziation level too on some target archs.
> I would not enable that by default. But I do understand your concern.
>
> In similar ways, I was checking ffmpeg, attr, acl etc which were defaulti=
ng
> to O3 in older versions but with new poky master versions now behave well
> and use bitbake default O2. I guess there too no major performance regres=
sions
> have been detected.
>

Thanks for checking this out. Perhaps it will be good to ping upstream
and raise this
that we are changing default opts,  are there any concerns we should know.

> Cheers,
>
> -Mikko
