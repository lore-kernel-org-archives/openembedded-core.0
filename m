Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.578.1622820348831028407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rfCWljUc;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ba2so9886950edb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YqD4mL+Q1EGlPpzl3TOlTiOeHaPGdO4ObES6RcdAxEM=;
        b=rfCWljUcYkaz/wyYwbut0hbRUalFycQmpAvQ8vAdAHHAm+5wVe/7m1/h7NVuX2XuSM
         IOQs6f3Y2kpFEH4pJkE2UonfoZp8ppcU3/4rH/EubRlCZ/XoBCVv8WxXQ1aJ0cGhZAiQ
         GBVThWiU1UMUfOiensQowcEUXejbmLZEkTRARjpmt/Cu7dEia0dcSoOIZaoG33SDCnxU
         vFSjAgCMAookfgW+V6uPkAfX6JLkph4h6/42HerAfYr/y9hdrOvYiq6ZsESLnROw5EnN
         TkCqUGXqoHiyqK7N1jviWRZGJfx3X/5eGV4XfzSrvkb4vi7tLp842QoH+o2LlfmczB7M
         2c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YqD4mL+Q1EGlPpzl3TOlTiOeHaPGdO4ObES6RcdAxEM=;
        b=WPqOlhjyuQTWGcXmguHYQ1Vus31hlnp113o6lLq2SwB8si5Wpdvmgb/I1EkNLaVsba
         I3TjHUTSDHGUXZgV9Fmuk9QCaP0duIeLbvhZ7wn9K62dXGpZt5eihO7hR2tRzHdc3i0o
         nBeGsN/ba2qtnzftfqicN6wJqDdc8JVdNAGOwMZ3gU/MHFyoofoLwBTfzLQUJcc9Ln5N
         YKh1wAwB989zsKdgsYy6c2gmGu/ugo/gHhzE+4MgInowX0/c9WdXXPwmgRfjxf3i0zAj
         Km6p6/mBdtdHRC2+vp3gSy9VAkekcOOT3awdG9HxRXnYoOYBl54MvihaYJY8N9dftu3Q
         3ikA==
X-Gm-Message-State: AOAM530dEpJT5zmgBMa78J7YBRZCli99aY2cSzB7ijQ4hUy4LOm3tnSp
	nOspTpvwp1Kq/zyRBbRZBK6RcaDXRAGWosVRJLc=
X-Google-Smtp-Source: ABdhPJzou3kwgZbdnBTw/LzCFVqQs9z3q7mY9NasHHwatfpY96T4gQOfK9ehQPOCiR+DVTi+9z5Anh7RZEmjjPgmM9E=
X-Received: by 2002:a05:6402:368:: with SMTP id s8mr5326926edw.129.1622820347378;
 Fri, 04 Jun 2021 08:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com> <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
In-Reply-To: <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 4 Jun 2021 11:25:36 -0400
Message-ID: <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com>
Subject: Re: Request to backport KERNEL_DTC_FLAGS to Dunfell
To: Steve Sakoman <steve@sakoman.com>
Cc: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ovidiu.panait@windriver.com" <ovidiu.panait@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"toertel@gmail.com" <toertel@gmail.com>, 
	"RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2021 at 11:09 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Fri, Jun 4, 2021 at 2:45 AM Jonas Mark (BT-FIR/ENG1-Grb)
> <Mark.Jonas@de.bosch.com> wrote:
> >
> > Hi,
> >
> > We are using DT overlays and have the need to pass the -@ parameter in =
DTC_FLAGS to Linux' make. The patch
> >
> > "kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags"
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dhardknott&id=
=3D063b5de86624a42b0aa784db6dddc7552a6dee7f
> >
> > makes that possible in a nice way. Would it be reasonable to request ba=
ckporting of this patch to Dunfell?
>
> This is sort of in the grey area between feature and bug fix.  It does
> seem relatively safe, so I would consider taking the patch if there
> are no objections from the community.
>
> Added Bruce to the cc list to get his opinion.

Good timing, I happened to notice this earlier and was thinking about it.

While I also wouldn't call it a bug, I agree it is a small/standalone
change that shouldn't break anything.

A quick scan of the dunfell tested kernels shows unchanged Makefile
handling of the option, so there's little risk there.

I'd say that it would be fine for backport.

Bruce

>
> > We were also wondering what could be an alternative approach for gettin=
g this or a similar functionality. Patching a bbclass using a bbappend is n=
ot possible, is it?
>
> No, there is no equivalent of bbappend for classes.
>
> Other solutions are possible, but taking this patch would be the
> cleanest solution to your problem.  Let's see what others think before
> we go there :-)
>
> Steve
>
>
> >
> > Cheers,
> > Mark
> >
> >  Mark Jonas
> >
> > Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> > Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERM=
ANY | www.boschsecurity.com
> > Tel. +49 89 6290-1105 | Telefax +49 89 6290-281105 | Mark.Jonas@de.bosc=
h.com
> >
> > Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> > Aufsichtsratsvorsitzender: Christian Fischer; Gesch=C3=A4ftsf=C3=BChrun=
g: Thomas Quante, Andreas Bartz
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
