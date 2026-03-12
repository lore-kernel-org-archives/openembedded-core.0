Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101DA106ACD6
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 17:50:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.716.1773337842289322780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 10:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Avqrb30z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48541edecf9so13656285e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773337840; x=1773942640; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9vvdbJ73p9FVDseUga/gxBWIYtclNC7jqzpUHzzxF4=;
        b=Avqrb30z7u6W+GX1jRSqKrjdnqFyVHHj3WJV3SAL0FDubO43mnefwGQLQBYsppbGCc
         5uKR3eF4pGdnAIe37sCPDLXDI6WiMid5snMLnOGWJHnW2bZRbgrI/zQoIGu6PFDxRXsa
         nCgUnbdn/d3Ep6tm5w5cMTEEoz/rid/lmc+qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773337840; x=1773942640;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9vvdbJ73p9FVDseUga/gxBWIYtclNC7jqzpUHzzxF4=;
        b=kRgqIyEgZtOXqqmiyiGj/z7odHbDbBRypP9wKOMrFA0+NwvdESaL8Lkes36eZaClKU
         y6QTbKR2dtVHdlSVZrltDzZVV/iFb+e3coYNDM+d9TUyluuMdYqEt+hw/bxypX6lWUxW
         Opmv2AIXIVR7zFeE4wRn7a1jc3Y8jpHIxcul75d16Xr+y1e0uICGxfE3d6QaD9yXfITT
         sonSTtUOKYzyt5s89PX23fAKk/jH+MjBQXbRguetdCGKaJi+tCxo9E2XevFx9v7krFEo
         pS8L918nVLpyVlzK16QOQXH7Ol+kYwCfpMnI6/1grH/Q/z1uqwlxJYtLZRkEI+yzq0qa
         wESw==
X-Gm-Message-State: AOJu0Yy38Nh9NJBDlKc0meJoPgXBCoi67ITezFWOyfud9fq7iVNc6H72
	3ARXBFyaLZWIDuPpJ2RAlK6BBd7OCXstwxTaX9bg+ooIX5c9kN7FgaR5GJDSzWhBc3Y=
X-Gm-Gg: ATEYQzxFHMrMPWrTRT4BAYqlRMSjSftJdC0jx0WxGXsB4fUF/S7TtacUFHLukOe8Et6
	iLNR4YUtSJit+w/DYNGchQtbYjpKGeVhRaDXzbj1+5fOH6IfI14aZUGtxJr7Uq7xi19ae5T2dnN
	bOiu2RjNJK5SMuS4iJJTB/YsGcNmBsL2jfRDlI3zgLoC917eioc3D/Sy3lg3VYVrFhTL0FdrYzT
	woXuZVHp5Nhr4x+4UNqWs4bMRHXq7KBtaHk1iAzPhlZQGwz0b4LD8UgGODDv3K50IEDxGzTBtyP
	jxayso6mqBHGAYYb+vwGSaVCDAEKeY+OogypKMhTzB1Ds7CjBoOp3MKrPrQK1v7RVPsATbv1zPp
	g7xpXS+G0YczjxtNh8kjKJ/gpPhkChMvEXR6hrVSHXjLA2r8QDIKzxhbnqU2a+J03LMh0KB2rPy
	KjWjH3UvVASSqc1NLinef33BxykODaTl6RIIvGtjUU2iw/m/NZLIKOGcNoozPKwx7aHh3empl7I
	BTqlzCQvLgj
X-Received: by 2002:a05:600c:83c4:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-485566c6a4emr3850765e9.4.1773337840390;
        Thu, 12 Mar 2026 10:50:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm9753020f8f.4.2026.03.12.10.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:50:39 -0700 (PDT)
Message-ID: <b2673fea76933ed50c4d7584fcf3a289a7a15ebd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 03/15] spdx3: Add recipe SPDX data
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 17:50:38 +0000
In-Reply-To: <CAJdd5Gbe4cKH3n7Fn3kEBnWwuqvS4wAUvpr=FbvH+ertLu_cQg@mail.gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-4-JPEWhacker@gmail.com>
	 <4e4dd4ef32301e4510d66b7504c2e207b3e883e7.camel@linuxfoundation.org>
	 <CAJdd5Gbe4cKH3n7Fn3kEBnWwuqvS4wAUvpr=FbvH+ertLu_cQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 17:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232998

On Thu, 2026-03-12 at 08:11 -0600, Joshua Watt wrote:
> On Thu, Mar 12, 2026 at 5:43=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.o=
rg wrote:
> > > Adds a new package to the SPDX output that represents the recipe data
> > > for a given recipe. Importantly, this data contains only things that =
can
> > > be determined statically from only the recipe, so it doesn't require
> > > fetching or building anything. This means that build time dependencie=
s
> > > and CVE information for recipes can be analyzed without needing to
> > > actually do any builds.
> > >=20
> > > Sadly, license data cannot be included because NO_GENERIC_LICENSE mea=
ns
> > > that actual license text might only be available after do_fetch
> >=20
> > We talked about these patches on the review call. I'm a bit worried
> > about the direction we're going from a few angles.
> >=20
> > The general theme is the complexity and increasingly seemingly tangled
> > web we seem to be weaving and whether we're going to end up in a good
> > place.
> >=20
> > Taking NO_GENERIC_LICENSE specifically, it may be we should mandate
> > that such licenses are copied into the metadata, then we solve the
> > license data problem that way? That would simplify some of the problems
> > we're facing and reduce some set of the corner cases.
> >=20
> > This patch adds a new task into the task graph and I'm getting a bit
> > worried about the number of them the SPDX class is adding. I appreciate
> > there is a later patch removing one, which is nice though :)
>=20
> With the removal of the vestigial task in this patch series, the task
> graph for SPDX is:
>=20
> do_create_recipe_spdx - > "static" information we can determine about
> the recipe just from the metadata (no fetching, compiling, etc.)
>=20
> do_create_spdx -> Information about what we built and how we built it.
> We obviously have to build to figure this part out (the definition of
> this didn't change in this patch series; it should really be called
> do_create_build_spdx, but it inherited the name from the SPDX 2 code,
> so I don't want to change it)
>=20
> do_create_runtime_spdx -> Information about runtime packages. This has
> to be a separate task because while the build graph is a DAG, the
> runtime graph is not. The definition of this didn't change in this
> patch series.

I'm not entirely sure why we couldn't collect both sets of information
in one go in the same task, maybe inspecting BB_TASKDEPS instead of the
tasks actual dependencies but that is getting distracted into other
issues I guess.

> Various SBoM assembly tasks: These are the tasks that take the
> individual SPDX files generated by the tasks above and link them into
> a complete document that ends up in DEPLOY_DIR. They are all
> identified by having "sbom" in the name (do_create_image_sbom_spdx)
>=20
>=20
> > So, for this patch, could we just drop NO_GENERIC_LICENSE and how much
> > code complexity improvement does that buy us?
>=20
> I'm not clear what you mean by this. I'm not including any additional
> License information, because we don't have it. I didn't change any
> license handling in the SPDX code, and I didn't add any more, so if
> you're talking about simplifying the SPDX code by dropping
> NO_GENERIC_LICENSE, it gains you nothing here specifically.
>=20
> It might be nice to improve NO_GENERIC_LICENSE in general, but I don't
> think we can do that for 6.0. If we do that later, we might be able to
> add license information to the "recipe" level SPDX data.
>=20
> The comment in the commit messages was probably more of a gripe than
> useful information (It feels like we _should_ be able to get license
> data statically, but we can't). I'll just remove it.

Ok, fair enough. I was more thinking that we could fix things so we
could get that information. I think I was getting confused and thinking
you were getting partial information.

We should perhaps separate out the NO_GENERIC_LICENSE issue into a
separate bug/issue to work on.

Cheers,

Richard


