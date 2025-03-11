Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A56FC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:46:41 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.9507.1741700793598867620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 06:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vssZAUOT;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so58565621fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741700791; x=1742305591; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zl1DK1MxPwvCexllAv20RWkJekD/sVWqWHSTCuCoWkg=;
        b=vssZAUOT7EchpuHq296zQsqE+E0XQHswYahV7oOVhA6uroZ0M7x2pyBBNCVbB4FhyH
         6azWT9/IYWNeZqYvgDlGOLOcpsdmARZIpn8OWJLWdIBHZBLoIamBctUYy6GaFkTt1T+q
         robjk8PdNqYtOtkMapgYdofEDY2WagjbTK7wijDebZ551emWW/TUYONZzAvyDfufpUKT
         TPKv2uVKihuxuV0U1B0b2m+iMG24fIxoXFw43s1sTXB6xh6mScBvFUSeudxlUaMrYr79
         LAYrafSwWCJUMX59Q1NtTKGKt/gY2DVdrmFAJkM7X6IlLe3ttZaMBEdAk46GS7slLxdL
         l8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741700791; x=1742305591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl1DK1MxPwvCexllAv20RWkJekD/sVWqWHSTCuCoWkg=;
        b=uSh5zeSsg6iNWUMOX11XwXxI7r3lA7PV3iTZayagA7IsWnWUEneFzFlsKJR8dEzvt8
         Yt5MRqHpxQvz2oMgmV+jdyWUlc+5bJRpH4LLwAWeDLO8W5QgISDo4Q4tBc8Au4w7vUuc
         bmwL0mGD5oiZEzAku8Eq2um/WWK7wU2/aX2m0qpe2qMXf8fKGI/35ZwjsB6vbP4yc4X5
         kA6l9jEAdFCwJQ5lotQgKA6/5yAb8Mm8LhLnaqoPY+HsFdTeOLNEbGPqrk4e5MfC/DRN
         Sbgssv7G7DutcCh4L3MtPca6WsrdgW7BR05kkdAm+dU49yU3MBt1kyvl+4AFpnbkBZaB
         Cw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxlT8FLj1xCg6rHE2NBG/i/UjsPw10xr7jWpzVpRQVmfkpmFRIMLkNfARBFx+hB2sIVhbUBh9cEcBFux+RH976/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy16Mefh/vfLGnMnIOJNTXUQAkPLrZJ9mJt6BJgXgigTV/pSj2S
	lnprDxv0uFgbtKGKaY7eZEtl+joEOIffIn3N1aaYHCGujErmFOpIJyPmSrQzI80=
X-Gm-Gg: ASbGncsFWhxLOJ9LYvgG6/TxKqVgMNx8HTdDX7pjjU+XvTI3+TIDtWp4ZqOofbCUHkx
	IzoeYNZnxrZDhI62ARgynx9EfuviC9ItEhZLkFtZFLrZ1nykXhcNn5K8XETW3UYvh9yoN4ug0tP
	Abu+TRnsnBrME9aNfCG0aWdQtLY5rtEGDcg64KTuM/MiBV4klV9J53Yh1CkuIY3d2rw5WP90693
	v3e36C0Cx2kqqQMcFbNf1m3TecsvekYnaz0x5FoVQQKmeFgP/qAwA7eJRstcB3E74iS+TvYalGQ
	y6oQbtNAgCzyjUj8H7ARRxUjM6eUsBDOJXjN0hT+bFwaZ0bbQiF0rZ1VV7kP8aNO5OJFZw==
X-Google-Smtp-Source: AGHT+IH8X2XOaNVNO6CwT7OrDp0m5fbWuYPZO9djeha5/ZM2ccWAuZ0BY8XwbkM0K10F+gVH/6YhuQ==
X-Received: by 2002:a05:651c:b2c:b0:30b:f138:1b9f with SMTP id 38308e7fff4ca-30bf452d3f3mr54066471fa.17.1741700791526;
        Tue, 11 Mar 2025 06:46:31 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c84fesm20660991fa.70.2025.03.11.06.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 06:46:29 -0700 (PDT)
Date: Tue, 11 Mar 2025 15:46:27 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: JPEWhacker@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core][PATCH] lib: spdx30_tasks: Handle patched CVEs
Message-ID: <Z9A-s_NNJl_Cw3sf@nuoska>
References: <20250306212007.44880-1-JPEWhacker@gmail.com>
 <76e6fb1b98cc7269d4290bb4e92d0adf2d3567d7.camel@linuxfoundation.org>
 <CAJdd5GY=pQ85g4M6gYHq2y7JKTT4BK+A2mi8dTJ6APnapvuozA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJdd5GY=pQ85g4M6gYHq2y7JKTT4BK+A2mi8dTJ6APnapvuozA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 13:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212569

Hi,

On Tue, Mar 11, 2025 at 07:17:33AM -0600, Joshua Watt via lists.openembedded.org wrote:
> On Tue, Mar 11, 2025, 7:01 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > On Thu, 2025-03-06 at 14:20 -0700, Joshua Watt via
> > lists.openembedded.org wrote:
> > > The code to iterate over patched CVEs (e.g. those patched by a .patch
> > > file in SRC_URI) was accidentally omitted when writing the SPDX 3
> > > handling. Add it in now
> > >
> > > [YOCTO #15789]
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/lib/oe/spdx30_tasks.py | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/meta/lib/oe/spdx30_tasks.py
> > > b/meta/lib/oe/spdx30_tasks.py
> > > index e3e5dbc7427..e20bb0c86f3 100644
> > > --- a/meta/lib/oe/spdx30_tasks.py
> > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > @@ -498,6 +498,16 @@ def create_spdx(d):
> > >      # Add CVEs
> > >      cve_by_status = {}
> > >      if include_vex != "none":
> > > +        for cve in oe.cve_check.get_patched_cves(d):
> > > +            spdx_cve = build_objset.new_cve_vuln(cve)
> > > +            build_objset.set_element_alias(spdx_cve)
> > > +
> > > +            cve_by_status.setdefault("Patched", {})[cve] = (
> > > +                spdx_cve,
> > > +                "patched",
> > > +                "",
> > > +            )
> > > +
> > >          for cve in d.getVarFlags("CVE_STATUS") or {}:
> > >              decoded_status = oe.cve_check.decode_cve_status(d, cve)
> > >
> >
> > I worry this has increased the build time by around 10 mins (~25%):
> >
> >
> > https://valkyrie.yocto.io/pub/non-release/20250311-54/testresults/buildperf-alma8/perf-alma8-vk_master_20250311090119_046a92d351.html
> 
> 
> Ok. Let me see what I can do about that

Yes please. I think the kernel build time increase from ~4 minutes to ~16 minutes is
what I saw in my local builds. Both kernel and image builds are affected by these
SDPX CVE data changes, as we discussed yesterday on #yocto irc.

Cheers,

-Mikko

