Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1FDEE6433
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 08:00:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.15932.1694764810261858941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 01:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bgqxmfpx;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso29097101fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694764808; x=1695369608; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGlPNhGKhaAkO+JjXGU4PbmjEtN3536Ffb43dgBTSqI=;
        b=BgqxmfpxkvrdP9m/kW4py79D/2kA26Ii4vgI9OkwuVcJUJ3z5mgNo5AcIMyO9qpkNZ
         59ZUKgP1BpJeJOt1PV1d8nEiouQ3OX2G2STFcUBtnkrVbSma88Um/8/x1Fp+rSWw82b7
         JZE9U9o8RFb9+EYXkWVBmKrvrBiXw5kxghGGWL75HIhwKG83bA7YifnI84P8Y9rCaVaL
         fAqRaPadHlfiq5j0oM2wL51PViPabbjI0JZAOkImSCbXOfW/cU7jFaKi2S2dhHWBbpk8
         o4XmRlMwtoyC0JVWjXnmv4k5Z6+0qUS00gbjfZF9HEK2rmKtFAuxIbCcP0gtEPS2Xbr0
         12gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694764808; x=1695369608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGlPNhGKhaAkO+JjXGU4PbmjEtN3536Ffb43dgBTSqI=;
        b=OLo09JyA4gPrW+AS9EAbTRMUIVRKJiNkV8/srugqja0Iqp0HhQkr1M/NODf6hyz9wg
         Lzf6YcqSTDyVbDmFOc+/TQMnehFYj+OUcRv+rzQ1RLIZekoM9sl8NTZ/MYH8yAmyrCT7
         MSBhDgAkWH3dE1E3jSIWLXxeHJNN4BjaMGYyPjw0YsLvWGvgWOLgnL0E9OCvdvIRrdMa
         v63vwH2A2ctvNmLeBA0VJHaLsYoIEv1QvR7PXmMhM5y7/sSZO2eZ8eFN7brFW0Hfr1Op
         uoZGUlbh7Wa0GipfJObaFQ+s6SzmsmSmaiAwpdI0TulNJ1q2PquisODjAiWV2vIAUNl5
         wCWQ==
X-Gm-Message-State: AOJu0YyB9jwpyWvcmlVMtbTnHJcRDXv4C7OEdA6gEJey9Bb43Oursbdk
	RJljPrOPse5ttRisgdzb9MOtf3tTaZUYZtVwcNw=
X-Google-Smtp-Source: AGHT+IHQowl/ht9SjVEGsuYy4PFI70gqGz1ELKFq4aH7fdf3KHXgL3c+JE9POacpWf6VSl4N2/xo5wmaJc654Eq7RYc=
X-Received: by 2002:a2e:9d42:0:b0:2b9:e53f:e1fd with SMTP id
 y2-20020a2e9d42000000b002b9e53fe1fdmr869609ljj.34.1694764808135; Fri, 15 Sep
 2023 01:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
 <a7bd9391-7800-4de8-82c7-62ae708a5f0c@ni.com> <17f052c2-5604-4df5-bb95-bf18a34ea871@kernel.crashing.org>
In-Reply-To: <17f052c2-5604-4df5-bb95-bf18a34ea871@kernel.crashing.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 15 Sep 2023 09:59:55 +0200
Message-ID: <CAApg2=RXOFJPOm+UZfB=XSiK=fYeBt6nLb4Lb5gSTuWUuD4Kvg@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] Security processes: YP needs
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187660

On Wed, Sep 13, 2023 at 6:28=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
> >> * Visibility of the security work of the YP
> >>
> >> There is much work on security in the YP, but it lacks visibility.
> >
> > Is there a common nexus for this work? eg. do most of the folks who are
> > doing security work tend to congregate on the security sublist?
>
> Security means different things to different people.  I.e.
>
> 1) Secure design
>     - Is the system designed to have security services, if so are the def=
aults
> setup to both be appropriate and also functional?
>
> 2) Additional security software
>     - i.e. meta-security, what additional software can be available to en=
hance
> security design/implementation of the system
>
> 3) Security (bug) response
>     - This is where I see a lack of common nexus for work.  We don't have=
 a good
> place to discuss CVE specific information.  Now the question really is, s=
hould
> we have a separate space.  CVEs are just bugs.  Bugs are usually worked o=
n via
> the main mailing list.  So that argument says no, we shouldn't have a spe=
cial
> list.  BUT the perception is CVEs are "special", so maybe a list specific=
ally to
> discuss the ramifications of a CVE, fix/mitigation strategy or similar wo=
uld
> make sense -- keeping actual bug fixes to the main mailing list?
>

It might e interesting to have opinion on people who are submitting CVE fix=
es...
Would keeping that discussion in a separate place be helpful?

> >>
> >> * SRTool
> >>
> >> We might decide to use it again. It allows one to do much but requires
> >> constant commitment.
> >
> > I think I passed over the wiki pages and presentations for SRTool once,
> > a while ago. But I didn't pay much attention at the time because it
> > wasn't clear *what it did*.
> >
> > After reviewing it again, I think it might be the kind of tooling I've
> > been searching for to help my team coordinate our CVE response work.
> > I'll test it out and see if it is something I can use/contribute toward=
s.
>
> SR Tool requires constant feeding and maintenance from staff, at a minimu=
m to do
> initial triage work.  This means we need a small group of individuals who=
 can
> take the new items (and changes to existing) and comment on a regular (da=
ily)
> basis.  This is the part we've not been terribly successful in the past. =
 People
> are great at delivering patches, but trying to do the proactive (before
> cve-checker) evaluation of CVEs is an activity that often feels like busy=
 work,
> so it's easy to get behind on and never catch up.
>
> I would love to see the project use SR Tool to manage CVE information, (b=
ugzilla
> is where the bugs need to be managed and processed), as well as cve-check=
er to
> be able to continue to feed information or what we believe the current st=
ate of
> things are.  This combination would give us per-emptive notification of n=
ew
> items (SR-Tool), and late validation of items (cve-checker) on the percei=
ved
> state of things.

SRTools code base (https://git.yoctoproject.org/srtool) has seen no changes=
 for
4 years. If we decide to use, we'll also need to maintain the tool. Is Wind=
river
going to update the fork? David (adding in copy), do you have any informati=
on?

Otherwise we would need to maintain our version, and update to the code
to take into account how the world have changed. For example, with the
 CVE v5 JSON, using the CVE database directly for the feed of new CVE list
makes more sense than using NVD, for example. For the reason of performance
and delay. When SRTool was developed, that data wasn't available.

Cheers,
Marta

