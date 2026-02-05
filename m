Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D415ECD993
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:29:52 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26439.1770312586685292662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4A+uZ9R;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649dbff9727so1268923d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 09:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770312586; cv=none;
        d=google.com; s=arc-20240605;
        b=dLN3PnxrE6EuOm+pxJfx0qznEq+R9ZMlJZ0ehXmiJTSH8MY96sMifD/ejaDEFYlDjX
         2Q4b8T/E4ql4WyaTFol856Vwp7InupyABtxDPQYrmi8MHUpfJs4OzxFY9l5GrxJE1ioO
         M7RfawpeZQc+gsiEyP0zkW8dYPF34vBzAZuB2OKlZRXTjepXU52IfMz87PyDzxk8S6Ye
         3ZSOCiEDf5BzRY2oBLkdB/KanDfpfc7qRbzDVeZ1IQuo5u+YclpR7nKZwsh4LT6GBOpT
         hqn2Z08zDYEZj+wf9RmQOt/vPhmkNC4h2DO0BydaAGGTEIBUTdGiD72Er2jyMvWLHLCV
         evfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JgfeY55Ru1IhDYMP0VT3umybAXNI4X9Hp3CscuXeHec=;
        fh=KzNUjYu9v3eFx5jKEPi9XtRZBJo4/j+XtyaGnI+F+Fk=;
        b=E6j8ZCoJOvX4QxO9sBXv18TxkbaQCcNcLc3r6sX9dlpVuElUq4SduGRLJBG5dmArHT
         ALSx0wO6KddF7dde1hqgbqak50Z6WExjOMOMERjWAGRtMAlCTFTBj26mFzkbcJMq/eOd
         eiiWBKs9c4aGmQXj9krb2/jIAH2UrdtBu9xi4Zuo3TEyOOSH8zxv2Hu7k2w8o+TOsoAr
         k27sXv1niW8a+wV2dqnvuAQHrZ8arLxemf5JbXrb2AY+L2kIHWWbDfZM5PzM/7Y+2Ic1
         SjUxqujlPGM/uHTVVg9+ax5JphURRfMf1v5Cgu31PjKDqmlEixP8npZ4XGjiURb9up7B
         zcJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770312586; x=1770917386; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgfeY55Ru1IhDYMP0VT3umybAXNI4X9Hp3CscuXeHec=;
        b=l4A+uZ9RNNi8GjouCneZL3jumNAoyEr6NA3h+RiMp+UZoyFR2xL2eUiTQI95IxugIq
         NVDUkn/j1mkO9g7v8yZHWWgZKj9QupAqzW42y0yV7xXsDQ8Yw56o1sZGn8P5n+ELNwSJ
         +wP4mEdJqvRlfKL14J6/fl5qsWNV4/KPtBQjselpTQV9O6emqQCCGDNYUVI1J4jvaWps
         CzgUcfDalGo3JkF6fk1+31wMJ/I8EOAsm6kFvfsrAgN6phGSg7oeo2n/YfRfm0ziDDZU
         GRi5p04fkDMEPvDl74FlEHc4a9uYbfkakbvb1hM3r9A/zCCd8t/+7J3WQQvnQBC2fWAw
         Jeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312586; x=1770917386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgfeY55Ru1IhDYMP0VT3umybAXNI4X9Hp3CscuXeHec=;
        b=YGktfaiA9esxc1qPlZbTQVa1zQKvQxEgKVEym0vGSk69wovlBZ1nsoXf5m60KJm73v
         9BhWLM3Wjl9c6vN7od6lnMulHylO19wsRbCzRbPhISpZcD8QpbiWUkgeXb9yTUVLqgzH
         EkvXYb5nrk477H8TLOVND1K+uZUjS7ApI+w7XpYmdCTjFvHlISarjnRyp7H2RNMLacHi
         Y8yV7/vttbfGW1+fkrqK44K652BFk/YTI99KMcWCzi+2hDldpxBzwMWVBTFIfBDjqzID
         DdE6oXl+wpS+T+ncvrEGOTss35SeVvaUagKFhXUyTGH4ZLI8OqDVUNHNsCuwkTwld8sR
         B1pw==
X-Forwarded-Encrypted: i=1; AJvYcCVMD7ywBWevxwXw2M/BKI/lfQGTAcVr0gng2U5GGuWid/FEuTyu4eXpCvM3jsfDsX9PCnTUJmnSNIN28ItCu2RAFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yya9SstvZ5N/tVdKXQRvKQpHa1ypdyNt1ZVKDwvN+zM/VwmngF/
	jSaqkUgRX7KjPB33Pz2W4V91Ejrl3KXBlBU8IxbhSPoPi3Ec5cL79tVp4BztOdpS66h/LFCYT0x
	twxym0NuTiZG5BIub2Wl9akqT3uUw8ec=
X-Gm-Gg: AZuq6aKcdU1ZgdoocLHtQrjRXDPM01gEQ/gXNLRQkDcUZjJ4WztZcKcXEqohI7oTvPT
	OvUrodor1jD2l/dDFf9d1/89E/xDlz15XOMHK9IhbA5cgFkp6zaVd1XsIqiC7ltOR9leSMmNDCv
	r7RbA+WFZr7F2ZiXWQKI1WbVtjc/1RodViV8i2ubXvk7epYOXDH7Obrxl/YQzVswnEI/FwRsm8z
	yQb1U2UYoY4X66fzcTQrhd/QYKyKtCX5WqbSJZl1HE7nquo/uFf9mhwcU3SNtiEx4T314tNlE9c
	sS/hEenGaw==
X-Received: by 2002:a53:ef88:0:b0:649:d604:fb66 with SMTP id
 956f58d0204a3-649f207bb2bmr98027d50.79.1770312585593; Thu, 05 Feb 2026
 09:29:45 -0800 (PST)
MIME-Version: 1.0
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com> <CAJdd5GbqsCVjVDkLFFbpzihurQxHxTrAGjA_K1OGNPTHj=gakw@mail.gmail.com>
 <2051957.usQuhbGJ8B@brobin-bootlin>
In-Reply-To: <2051957.usQuhbGJ8B@brobin-bootlin>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 5 Feb 2026 10:29:34 -0700
X-Gm-Features: AZwV_QjDi4RuKC_uQA3VnRm8UDx6WP2k8otU_SxaRLIbdTWHymTLjmTXMkA7588
Message-ID: <CAJdd5GZuXM06+x+OPnpi5jkv2Hc=rz-qVesPG+0YePeYFvaxCw@mail.gmail.com>
Subject: Re: Comparing cve-check with sbom-cve-check
To: Benjamin ROBIN <benjamin.robin@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 17:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230587

I think I have the SPDX changes that will be required _mostly_ ready
for you to look at:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djpew/recipe=
-sbom

Run the command:
```
bitbake -c create_recipe_sbom meta-world-recipe-sbom
```
Which will make a complete recipe-level SBoM (names may change, since
"recipe" is a little confusing in this context) in
${DEPLOY_DIR_IMAGE}/meta-world-recipe-sbom-recipe-sbom.spdx.json

This SBoM uses new "recipe" packages that _should_ be sufficient to do
CVE analysis, but let me know if anything is missing; it also is
pretty quick to generate since it doesn't require doing a build.

On Thu, Feb 5, 2026 at 1:50=E2=80=AFAM Benjamin ROBIN
<benjamin.robin@bootlin.com> wrote:
>
> Hello,
>
> On Thursday, February 5, 2026 at 12:54=E2=80=AFAM, Joshua Watt wrote:
> > Yes, I agree this should be the strategy for handling CVEs. It would
> > also be really good to get this in before the LTS
>
> Targeting Wrynose (around April 2026) is ambitious, but it might be feasi=
ble.
>
> > I'm working on some changes to SPDX that I think will help with this.
> > Specifically, I'm adding "Package" objects to describe recipes. This
> > allows the recipes to be linked as build time dependencies
> > independently of the build provenance (which does the same thing, but
> > for builds). The data in the recipe package will contain only data
> > that can be statically determined without actually building the
> > recipe, so it will give us the avenue to do CVE analysis without
> > actually building anything[1]. This should allow CVE analysis on the
> > native and static libraries since they will be included as build time
> > dependencies, even though they don't appear in the final image.
>
> Thank you for working on this. I have a couple of requests:
>  - It would be helpful to distinguish between native and target packages.
>    The goal is to support a flag in `sbom-cve-check` that limits analysis=
 to
>    packages deployed in the target (including static dependencies) or ext=
ends
>    it to all components.

We actually already track this for the SPDXDocument class as an
extension, since the native recipes need to handle a few things
differently. We could pretty easily add a similar extension to the new
recipe package that you could look at.

>  - If possible (though not a priority), including layer information
>    (URL, Git version, etc.) associated with a `build_Build` object would =
be
>    valuable.

We would like to do that and it's on the backlog. It's a little bit
tricky to get right, especially when dealing with multiple remotes in
the git repos, bbapends, etc. FWIW, our Yocto PURLs support this also,
we just don't have it implemented.

It also probably shouldn't be attached to the `build_Build`, but the
new "recipe" package (See below). I'm hoping you can now completely
ignore the build provenance information for CVE analysis now (unless
you want it to filter on source files or something). In fact, with the
new recipe packages, we could make the build provenance optional in
the SBoM output.

>
> > [1]: Sadly, it _can't_ include license information because
> > NO_GENERIC_LICENSE means you can have license text that you don't know
> > until after do_unpack; we should consider doing something about that.
> >
> > On Wed, Feb 4, 2026 at 10:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.co=
m> wrote:
>
> > > To summarise [5] the pros and cons:
> > > + sbom-cve-check can run at any point after the build
> > > + has better data sources which report more issues
>
> "Better" might be too strong, we support *more* data sources.
> Sometimes, version ranges in the CVE List are incorrect, while the NVD
> database may provide more accurate information. However, users can config=
ure
> their preferred data sources via a custom configuration file, so this isn=
=E2=80=99t a
> major concern from my perspective.

I think there is also a lot of value in a separate tool that can be
updated independently to deal with new sources using the same SPDX
data. For example, if we ever figure out a sane thing to do with PURLs
for vulnerability management, using e.g. OSV might be an option also
(esp. since the PURLs are already in the SPDX data).

>
> > > - only scans the literal packages that are in a final image, so we do=
n=E2=80=99t
> > > get coverage of native packages or static linkage
> > >
> > > I wonder if the easiest fix for this gap is to enhance the SPDX gener=
ation
> > > to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=
=80=9Cbuild SPDX=E2=80=9D, which is
> > > essentially an aggregation of every recipe=E2=80=99s SPDX that is pre=
sent. A
> > > recursive execution of the SPDX generation task will mean this covers
> > > both any native tools and static libraries that are in the dependency
> > > graph, for maximal coverage.
> > >
> > > This gives a solution without needing to be more clever in the image =
SPDX
> > > generation, for example including packages for all of the build
> > > dependencies (be them native or target).
>
> I agree with Joshua: improving the SPDX SBOM file is the right direction.
>
> > > If this is done then I think sbom-cve-check is at least at parity wit=
h
> > > cve-check, and in many ways far superior. This will allow us to merge=
 the
> > > few recipes and class from meta-sbom-cve-check into core, and delete
> > > cve-check.
>
> I concur, but we (Joshua?) need to tackle the SPDX generation improvement=
s,
> which is no small task. On my end, I=E2=80=99ll update `sbom-cve-check` t=
o handle
> these changes properly.
>
> --
> Benjamin Robin, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
>

