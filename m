Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE6DCAC585
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 14:56:39 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.22770.1726584997983998233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 07:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrGapzl7;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5e1ba05bf73so2847233eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726584997; x=1727189797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5D6baQ1V6dUtXbEn2gB6m1qoLe2QUjKWxHkJXaz0/E=;
        b=FrGapzl7EY5wyMcz7nEeBYP+6lu3+7TXF+2FP3A+HabGUyqt8dmucB2t5MjvDQxB3B
         zT7sdny42Mba3fk1LK3PIAgE7scd1vXs9Onaw7wEf9ne+QUa0c2Ap0EKUresGly1Ci+5
         x45DRefQ3sjxoM1vIUrCFkQl7GPQ4VlTqlyHkEHLAOlp9z5octd8uUMCKsLZV2YeZgLN
         NMfgwMt3DIBBUYB2uIj7XGmPfWcd7s5gWe5CBwyCKRq59Fd7OYzt7zUXg6uWEj09I8Vs
         appM9DA7m8Hd0kppuK5y3+cqTaEaQfmRtfvLh8x6Vnr9WoU0XwLpF+9fTZBdY/QEoG/G
         lzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726584997; x=1727189797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5D6baQ1V6dUtXbEn2gB6m1qoLe2QUjKWxHkJXaz0/E=;
        b=R4djpktTYQK0cQsRi2JjUEvhDi4sT9pwYpSopoLT+I/uabwX3HAWrWh1tZSZFv47xC
         p28F+fjbHraw/EotTAv7tAIFyMA1Rv2R0aY4M19BQmNTmws6gEzuxT/FWtEFBHH9iJBi
         2zXsR8TWMpzCAa/zm9JJWg0sg0FxDS9z7xqZWZRCYcbJLSkPFjgDCCJKwZDYUK6/I9lV
         eUXevHceDXoP8ASMX+GTnRMm8dxD7HCbj9CoNYmDVxS5IA9ipk7hwqgNO7JEZLXdgTwX
         fJdG1i42R0RJgFI0qp8HCSeZEetIE9uj8fpRxF9mzXwU0Nhp9L3bwsVJAWzNU5DE/60l
         Q8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8I7sIdPSxMbVEXOJ7VC+4++GnuwqxX526hcFq9XcKbMj5Co6OiZv4Tc2VSBI/YL3M+o2RWBfhtbiAPYWTRqrwXA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEmIJuB50LY7bU7OEpWHUYodskA6gkV4BpLn9csD75xu9pLOyH
	45h62FeBIMVw1OwnDoPDB0xEwCamzwwuavFYqtfnzDady+BrO0yZGiKzyW6NUpLbKrba+/yewWo
	Hw/xLzkc9MJ+eejLHpKZSNVuS0EM=
X-Google-Smtp-Source: AGHT+IFgcZpfHFNKyKLpXe6s9ej+MDDiOjuQENruELJ/NLeyse5iAnGXjqqababWwEHV4ldVWl68gwQgZvETfVJMn0s=
X-Received: by 2002:a05:6820:1caa:b0:5e1:ebf1:816d with SMTP id
 006d021491bc7-5e20142007fmr10145510eaf.4.1726584997079; Tue, 17 Sep 2024
 07:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <1726222641-9830-1-git-send-email-pdoshi@mvista.com>
 <17F5F7B181D2BB8F.13829@lists.openembedded.org> <c6e2f9d76bbf41452ef49fdba9f4ea633a369c4b.camel@linuxfoundation.org>
In-Reply-To: <c6e2f9d76bbf41452ef49fdba9f4ea633a369c4b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Sep 2024 07:56:11 -0700
Message-ID: <CAMKF1sopBsUfd+FuySgHR_R1Xgw7cByqcHyMqgw8FkPEEhrOBw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] tzdata : Upgrade to 2024b
To: richard.purdie@linuxfoundation.org
Cc: pdoshi@mvista.com, openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 14:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204625

On Tue, Sep 17, 2024 at 12:35=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Tue, 2024-09-17 at 08:32 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2024-09-13 at 15:47 +0530, Priyal Doshi via
> > lists.openembedded.org wrote:
> > > From: Priyal Doshi <pdoshi@mvista.com>
> > >
> > > Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> > > ---
> > >  meta/recipes-extended/timezone/timezone.inc | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-extended/timezone/timezone.inc
> > > b/meta/recipes-extended/timezone/timezone.inc
> > > index 4734adc..adf0952 100644
> > > --- a/meta/recipes-extended/timezone/timezone.inc
> > > +++ b/meta/recipes-extended/timezone/timezone.inc
> > > @@ -6,7 +6,7 @@ SECTION =3D "base"
> > >  LICENSE =3D "PD & BSD-3-Clause"
> > >  LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43fba"
> > >
> > > -PV =3D "2024a"
> > > +PV =3D "2024b"
> > >
> > >  SRC_URI =3D"
> > > http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz=
;name=3Dtzcode;subdir=3Dtz
> > >  \
> > >
> > > http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz=
;name=3Dtzdata;subdir=3Dtz
> > >  \
> > > @@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
> > >
> > >  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> > >
> > > -SRC_URI[tzcode.sha256sum] =3D
> > > "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
> > > -SRC_URI[tzdata.sha256sum] =3D
> > > "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
> > > +SRC_URI[tzcode.sha256sum] =3D
> > > "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
> > > +SRC_URI[tzdata.sha256sum] =3D
> > > "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
> >
> > I think this breaks a test in the glib-2.0 test suite:
> >
> > https://valkyrie.yoctoproject.org/#/builders/73/builds/126/steps/12/log=
s/stdio
> >
> > WARNING: core-image-ptest-glib-2.0-1.0-r0 do_testimage: There were
> > failing ptests.
> > Failed ptests:
> > {'glib-2.0': ['glib/gdatetime.test']}
> >
>
>
> I managed to find ptest logs for this:
>
>
>
> ok 62 /GTimeZone/no-header-identifier
> **
> GLib:ERROR:/usr/src/debug/glib-2.0/2.80.4/glib/tests/gdatetime.c:2960:tes=
t_posix_parse: assertion failed (g_time_zone_get_abbreviation (tz, 0) =3D=
=3D "PST"): ("LMT" =3D=3D "PST")
> not ok /GTimeZone/posix-parse - GLib:ERROR:/usr/src/debug/glib-2.0/2.80.4=
/glib/tests/gdatetime.c:2960:test_posix_parse: assertion failed (g_time_zon=
e_get_abbreviation (tz, 0) =3D=3D "PST"): ("LMT" =3D=3D "PST")
> Bail out!
> FAIL: glib/gdatetime.test (Child process killed by signal 6)
> Running test: glib/bitlock.test
>

Seems to be running out of memory. Maybe allocate more RAM to qemu ?

> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204618): https://lists.openembedded.org/g/openembedde=
d-core/message/204618
> Mute This Topic: https://lists.openembedded.org/mt/108429297/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

