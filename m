Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.22086.1596971095923908855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 04:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kcItAYGI;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id g19so6144696ioh.8
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUDPqDhL2TI5RSB83q5EGpl3Ww9P0Y+Q906RxfZHvEI=;
        b=kcItAYGICw7UeS86RtgUk+32rZE9g7mwhKyMqFj+SFMTlFkP8aHFPIHtIGE29AbP2G
         GZ511RIF+D1m7jXM3Xx6cNygQV1vJeoWpMSyYlr0+tMeipgEO77SqBNYa01dtcUQxZRT
         7OpTPwLmuCONtcW3nVzWvDeWtVgNsFHN5lvZhwRrAv0kiepKb9JQ3NRe/iT6EKLeHrIp
         GHXlx4NEPMdDTENDBdeoeXsmjmszoDsuZrELW7gKx8FvWRezHIWo6gfMgYyGzKrCFP3i
         N0KHwc7raynrHQa/YHEKmdxP2KpvLFa9l4QcYEZyf690dbDl+rKI/2vabcnZyKc8Cb6M
         zjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUDPqDhL2TI5RSB83q5EGpl3Ww9P0Y+Q906RxfZHvEI=;
        b=LjCJVL907S+eUa01ltj3n58PRNk4WcSsg+USdml3oo99KdoCxhLyh2bmtmJ9oVq6Ct
         GLlEvAEBjPuPxqgpAtr1VUtDmz0yo5Kds1mCxZlw7Ir2yXPfr7VxUnabH+QAMjVl8CQF
         buZnqD2Ld7HL+TT4E29vtlfdljNzerw9Eeq02CyGs064wDuFVse57WXvidBFsjksPS3f
         dRgEyDniw7f+uXcvx2/yIEBqZ9H6oJ4PaNynunAN/SsEROplkHiyAM3hGf82SmIaoJwj
         zKQ0wRkEFZchg6ynPRH9Tv1H/byJrRE8HfnO3GQhBH7QXPI/eqEWG/5BaTpqLs7BC0iJ
         wyiA==
X-Gm-Message-State: AOAM532hzHKOOC7vQVi+q84NEv/zw647bk7LJnogAaABwb4/hcSWNRag
	nEgGR8xEsdfWKobMDRJH315w7tfprIucaEgXSPA=
X-Google-Smtp-Source: ABdhPJzRY6h7lmGYTzULBmuh/zz+EBE7h2i1IqRUA3WLKqtkvtiHzXLYZcusvJZ3pKGOLuNRRK836OusW+JT84ILHF0=
X-Received: by 2002:a6b:185:: with SMTP id 127mr13085921iob.153.1596971095135;
 Sun, 09 Aug 2020 04:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200807164249.32605-1-alex.kiernan@gmail.com>
 <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com> <16299320E916D773.23035@lists.openembedded.org>
In-Reply-To: <16299320E916D773.23035@lists.openembedded.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Sun, 9 Aug 2020 12:04:43 +0100
Message-ID: <CAO5Uq5Qc+rVRjAiK6vTiZzG8Ayd3RU0Pko==FXB-OF=krXkLqQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 9, 2020 at 11:35 AM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> On Sun, Aug 9, 2020 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Alex
> >
> > I am seeing a packaging failure for iwd
> >
> > http://errors.yoctoproject.org/Errors/Details/459665/
> >
> >  which seems to originate from this patch
> > iwd configure detects path to systemd modules load directory if
> > --with-systemd-modloaddir is not specified using pkgconfing to enquire
> > modulesloaddir variable from systemd.pc
> > and the value for this has changed in latest systemd via this patch
> >
> > https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b
> >
> > as a result now
> >
> > modules_load_dir=${rootprefix}/lib/modules-load.d
> > modulesloaddir=${modules_load_dir}
> >
> > but rootprefix is empty in OE version of systemd.pc i systemd < 246  had
> >
> > modulesloaddir=${prefix}/lib/modules-load.d
> >
> > and prefix=/usr
> >
> > I could have easily fixed it in iwd by adding the additional configure
> > option but it seems that systemd recipe should rather be fixed to use
> > proper value for ROOTPREFIX
> >
>
> Presumably this is building with usrmerge?
>

Having dug a bit more, I suspect this is without usrmerge?

It looks to me like that upstream change is just wrong for the !usrmerge case.

-- 
Alex Kiernan
