Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F06C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:33:34 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.12415.1719506006372349682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 09:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8x378sE;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso6441150e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719506004; x=1720110804; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yD7IbytUgBpbmWpuYIA9XH3LNjh5pQwMX6JDu1jLG0=;
        b=U8x378sE+P9G0rNPhQBap98F56+K8tMC3ocgiWTPOrjoQCYO9EOUCIGzCP0GlVTiX3
         TfwsnWB5RgYqjycHes9cAWu56s3cx5Ieqrh4I71SJpHceFq93wnq8PBrwkPKezXGKe/J
         a5TZH+uxKEET0B9lvp9Dy72IrvjtDaCgucRP1k7hJwd8q6X5k+05BPz2ZAaFek430138
         GQEjYo3yGMwBBOPWnNyExLYYtF7Cgbq2rw4sfRiXBApCP7MsxgSMbZ0N2kN06x8ulQ2m
         kGUB+od+UQ05ThvUv9pmeaHrFnWSO6UJk9Jihr6z/gwIQLmirRhCbnleQ8ZpaGY9OQkY
         +Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719506004; x=1720110804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yD7IbytUgBpbmWpuYIA9XH3LNjh5pQwMX6JDu1jLG0=;
        b=rbDL4UYJ8YMumy8N/aRdXVX7knVpo+qMfsHjc/29kUY07sPzN8RS4Yf02+SFnogCvP
         0aiT5qslppAbUYXKuUdGRMZgsNUOCbh/RL6Y+KLIn5icCiY/+weWPOwyMLkZ3IGWQQW3
         /GjqRS6UtRvWFjRGcX4RIVnQcJKjoKapXpJnPxa9DrgB2m5sL4laHl5ObBPfXCFqrDsk
         ULUj6ZNPFkWZ7LdJjspoAmROGNgHbWrGJx7H32HWX3U3TGXABWbg1AQ3EVPsBWeyURTB
         ySaPbfmQQP12gxMjNuRlvo/3+cZKGZdY0sbqozaPADvNVd7PN65nz9uGt0fp29I1ZJDQ
         HEww==
X-Gm-Message-State: AOJu0YxWekhcfs7XinD3vDNeC9+8QxQkxICJgooK3s8urqV5Xb+PTN0D
	x6jis66+4GN9HEBUJ+L2g94CciSlfayk9s1sGt6Ol6aEIK5UGl7z6ouO4PKIPyT2WDrcS5NlAIj
	HLAaK6ZblFHPBndgHBCn5JEJQf3fA5Vw0
X-Google-Smtp-Source: AGHT+IEGcR9faPFdCJMEN4ZrAk0kvllOuTodHYJGIWiwWyqcB68WDolfaeAcYXyBAFymQnmyDazsMNBQpr+4viNM0xI=
X-Received: by 2002:a05:6512:12d1:b0:52c:dcdc:f186 with SMTP id
 2adb3069b0e04-52ce1832c15mr14162906e87.27.1719506004092; Thu, 27 Jun 2024
 09:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com> <20240624193151.1645802-4-JPEWhacker@gmail.com>
 <ddd10fc9-dddd-4196-9cf9-6feae3524a24@kernel.crashing.org>
In-Reply-To: <ddd10fc9-dddd-4196-9cf9-6feae3524a24@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 27 Jun 2024 10:33:11 -0600
Message-ID: <CAJdd5GYRAGi0fX64P2FxBe3uQMHw=ex4UtptW9+f4fJtLbHpew@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 03/10] classes/create-spdx-3.0: Add classes
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201206

On Tue, Jun 25, 2024 at 12:41=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> Comments inline below
>
> On 6/24/24 2:10 PM, Joshua Watt wrote:
-- snip --
> > +
> > +SPDX_BUILD_HOST[doc] =3D "The base variable name to describe the build=
 host on \
> > +    which a build is running. Must be an SPDX_IMPORTS key"
>
> Is there any sort of documentation or external reference for the variable=
 above
> (as well as the SPDX_ below) that explains what the SPDX standard is expe=
cting
> to be put in there?

Not specifically for this, but for the SPDX 3.0 spec in general, the
web docs are pretty comprehensive:
https://spdx.github.io/spdx-spec/v3.0/ . Although, be aware the
navigation sidebar is really annoying ATM, but that's supposed to get
fixed soon.

For a starter on how SPDX documents are written, see:
https://github.com/spdx/spdx-spec/blob/development/v3.0.1/docs/annexes/gett=
ing-started.md

It's a little tricky to encode the SPDX 3 structured data in bitbake
variables; this is what I could come up with so far but if you have
suggestions on improvements, let me know.

Specifically for this variable, it's referencing a "key" in
SPDX_IMPORTS. SPDX_IMPORTS in turn is encoding entries in the
"imports" property of
https://spdx.github.io/spdx-spec/v3.0/model/Core/Classes/SpdxDocument/
. The indirection is necessary so that you can tell users where the
SPDX ID lives, since it's external to this document. It's pretty much
impossible for us to validate that the SPDX ID you put in is real,
short of downloading the referenced document, parsing it, and seeing
if the SPDX ID is present.

For a walk through of how to cross-link SPDX 3 documents, look at:
https://github.com/spdx/spdx-spec/blob/development/v3.0.1/docs/annexes/cros=
s-reference.md

>
> I.e. machine name, host type, an arbitrary string that means something to=
 the
> agent construction the SPDX, etc.  I.e. how would I know what is valid in=
 these
> various things?

There are pretty good tools to validate SPDX documents (offline
even!). https://github.com/spdx/spdx-3-model/blob/main/serialization/json_l=
d/validation.md
gives an overview on how to do this. It still won't do the validation
that the external SPDX ID is valid for the same reasons as above, but
it's pretty good otherwise.

>
> This then leads to a second question, deterministic behavior/reproducibil=
ity.  I
> believe the purpose of this is reproducible builds, but we should have a =
more
> deterministic approach in the Yocto Project where we provide (and/or chec=
k for
> host capabilities) to help allow this to be a more generic, many differen=
t host
> process.

I've attempted to make this process as deterministic as SPDX 3 allows.
As an example, SPDX IDs are generated by hashing deterministic data
(where as random SPDX IDs would be decidedly simpler!). However, there
are parts of SPDX 3 that are simply not deterministic for various
reasons (please read to the end of this section). They generally fall
under a few categories:

The first category is probably best classified as "not very useful if
deterministic" and omitted by default; SPDX_BUILD_HOST would be one
such examples, since if you are going to set this to the same value
all the time and not reference the _actual_ host, you may as well not
include it at all. For these, I've set no default value (there isn't
one that would make sense anyway), so their omission keeps things
deterministic. However users do actually want this, it will
necessarily result in non-deterministic builds unless you always do
your builds on the same host. I think it might be helpful to annotate
in the doc string which variables will introduce such non-determinism,
so I'll do that.

The second category is "not very useful if deterministic", but are
included in the output by this patch. Examples of this would be build
timestamps and the bitbake parent build tracking (which basically
tracks the invocation of bitbake itself as the "parent" build, so you
can tell which tasks ran in the same invocation). These are useful
pieces of information, and consumers do actually care about these
things, so if push comes to shove we could add a flag to enable them,
but I'm also leery of having too many configuration options for SPDX.

The last category are the require non-deterministic fields in SPDX 3.
The primary offender here is the SPDX creation info "created"
datestamp: https://spdx.github.io/spdx-spec/v3.0/model/Core/Classes/Creatio=
nInfo/
. This is a mandatory field that is the timestamp of when the SPDX
data itself was created, and every SPDX object you create links to
this so you can track exactly when each object in a merged document
was created. I did attempt to make the argument to SPDX that it was
mandatory non-determinism, but it is very important to the SPDX
community (for reasons I've not fully understood), and they _really_
want it to be the actual document creation date, not SOURCE_DATE_EPOCH
or similar, so I really am not sure what to do about that one. I was
more or less told to ignore these fields when calculating if output is
"deterministic", which is a little annoying, but not an argument I
could win.

I'm a little stuck between the SPDX side and the Yocto side on the
determinism front. It's easy to say "SPDX must be deterministic", and
"it's awful if non-deterministic" if your looking at it from just the
point of view of you want to spit out some data, but equally, it's
easy to say "determinism doesn't really matter" and "the
non-deterministic data is important information" when you are
consuming the data. This particular patch series errs on the side of
making the data the most useful to the end consumers, in part because
I really want Yocto to generate the most comprehensive and useful
output it can; we are a pretty early adopter of SPDX 3, so being able
to provide the most useful data we can early can means consumers
writing downstream tools can use us as a reference which drastically
improves their compatibility with our output. Yocto has a phenomenal
supply chain story to tell, and I really want to tell it to the
fullest extent that we can in our SPDX data. I can't reconcile that
with "everything must be deterministic" though, so..... ?

>
> Which leads to a third question, when a build uses sstate-cache, each hos=
t could
> be different then the build host that actually combines the builds into a=
n image
> (SBOM).  Is this a concern?

That is very much on purpose so you can track where your sstate came
from, who built it, etc, but also why we don't set any of these by
default (see above). This is pretty important from a supply chain
tracking perspective, and part of the comprehensive story we can tell
about the supply chain (IMHO anyway).

Currently, we are only tracking the actual do_create_spdx() task as
the "build" (which isn't clear in the generated SPDX, but I'll make
change to fix that), so you have to be a little bit careful about some
of the conclusions you draw from that. Once we get the base SPDX 3
support in place, I want to look at having other sstate tasks generate
SPDX fragements when they run which would allow us to trace those
tasks more precisely. I don't really want to solve that now though as
it is going to be quite a bit more complex to solve in a satisfactory
manner.


>
-- snip --

