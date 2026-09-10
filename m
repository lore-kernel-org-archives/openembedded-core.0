Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A22C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:13:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24197.1789071198932091093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ysfwu8du;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de0093c42so117095f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789071197; x=1789675997; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q2Kvap7tLz2ipoW5b5ns6cmG2f172DxuXAwFlJMHkC0=;
        b=Ysfwu8du303YrcWVbFou/sRd5Jtismyc/JsvQfYl/bMMX4+ZgWOnTtdzoDpjdQpJZI
         pKmGMDe/Iowig9a3IWSaBI5PElUG65wZssdlTOcxKUoUFv65+unNb7juLdjolSqPo6pg
         jH0qyi+w3TC18XRvbFkpXFKD/rbI1UdJOw0qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071197; x=1789675997;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2Kvap7tLz2ipoW5b5ns6cmG2f172DxuXAwFlJMHkC0=;
        b=Szox7DIhGYfUqS+iQ/PJ5Fp/UgdYGJXutrI+8FDYN9YqDo7dJgZQJsdLC1kWbucvj8
         fVys1OvgstPAkvs8PCjRS5Q3RIYICfsg/bx77CeHg7nqvE7gFJwTgh0qqTeeS5vGlzzc
         ySfZvqH0bcHSHz56tDBLAY7H0Oa2NwnUFsz3HYNmclLa5PwhLqGgVLxv6iZlgNZZ7RRP
         GDO2BcB2/a3M6x2C8tfZdDenZ+9OwQLaUKD5qFYCjtgMN9kz8MJR3o4fR/+tATOxK9ak
         6WD2tg6z2WpWz8M81JQWsu928xEkekOBVQzrpXAQuCO7z9dS8IcHWKCJUOQe3toIEfVz
         aBbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6NdzxTQ60x14Z5t+pfjaxvvBFo4wd7t99q8hB6ONwpIi4BflY6CHBnkvzIjFiKu/V90dfIGHUpnGDEZIBK4hVRw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mfWLCY1jzIQDYVtMSkr+YmobPF49CMsYa5A+KGxhZrSMFuH1GH
	FOsk9YbnJ8FTo9lFjnKtFE+g9BkUApNkGx5wu5Pa3I3omMlkcfBMAxGyeAAHaVKAo94=
X-Gm-Gg: AYBFou14gnMWau6lMh+ux8wNafcL+cEw41KnkbRfHAA951H52wY5xvbN4orrVDzGlyq
	eqq1H6Hf3DCtaUyu5cUMeUhkxt5iieXHNSva7b1WNqBUPtAmYsH6uD/YtVl17WEonOO8q28/732
	edqWvY51KzCxmVWXK6FNZsebUfWVbMFtQ9wjeC5to348CB3WKYxObksEJvwqme7wGsDxIlebGaw
	MX0VM9qMOMJbU0OBvu7+d4lLfI1Mymg5MZvGWdDJK14yh1lQhw8k0eeYRrfsDgpyOndYwjcG+De
	isjUrP+a9Qd3zbk9yGdtBA6KDLjzNQ4RgMMW5BXDsWjBHnRT/+o+NsdTV4RiEBN/TkKadWtt4H1
	934PV1I4DUbjCxAyRUdGsvm4BqaCD9S8+a2jgLufCGb1cKj2UsHbpApsWmL2C5O/mV6qqQWlkl2
	/R1ETkBb4i5bMkYd8lkQrGWOguAeRlgOr28CNGdXH+cVofdIAzwd8mghBSooAuBTld5K8Ua6l6P
	M7n3QsY31HgAAH/W34Na6xr4h4Bixd4TiawM5eciREbEV0RJ2gsEFJIbGpx72ir
X-Received: by 2002:a5d:5f44:0:b0:486:ed36:bb8 with SMTP id ffacd0b85a97d-486ed360ceemr212402f8f.29.1789071197055;
        Thu, 10 Sep 2026 13:13:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:788a:18da:6c2a:9f16? ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm804692f8f.19.2026.09.10.13.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:13:16 -0700 (PDT)
Message-ID: <a6a43d9d1dd7447a385be531886b7dc4c942186b.camel@linuxfoundation.org>
Subject: Re: [OE-core] Areas we could do with assistance
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Date: Thu, 10 Sep 2026 21:13:15 +0100
In-Reply-To: <2fcf2fd1-9daf-409b-9bd3-8b9168044a1a@windriver.com>
References: 
	<db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
	 <2fcf2fd1-9daf-409b-9bd3-8b9168044a1a@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245599

Hi Sunil,

On Thu, 2026-09-10 at 13:25 +0000, Dora, Sunil Kumar via lists.openembedded=
.org wrote:
> On 9/9/2026 4:02 PM, Richard Purdie via lists.openembedded.org wrote:
> > d) Reproducibility on x86 vs arm hosts. Alejandro has made good
> > progress with identifying many of the rust related issues but there
> > are
> > some non-rust issues remaining. One key set of diffs are these:
> >=20
> > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260908-sv8uw=
w77/packages/diff-html/
> >=20
> > Particularly the perl issue, the locale change and numpy config
> > issues.
> >=20
> > Any help on these welcome, just let us know if you're working on
> > anything to avoid duplication.
>=20
> On point (d), just to avoid duplicating work: I=E2=80=99ve been looking i=
nto
> the x86 vs. ARM host reproducibility failures for some time now,=C2=A0
> mainly around the Rust and Git issues.
> For rust/rust-dbg, the remaining diff after the SVH work appears to
> be caused by the build path leaking into object file names=C2=A0
> during the Rust build. I have a fairly good understanding of the
> issue now and am validating a fix locally.=C2=A0
> Once confirmed, I=E2=80=99ll post the analysis and patch.
> I=E2=80=99ve also been looking into the Rust test suite failures seen wit=
h
> Alejandro=E2=80=99s v5 series, and I believe I understand what=E2=80=99s =
happening
> there.=C2=A0
> I=E2=80=99ll follow up separately on that thread with more details and a
> suggested rework, so the SVH improvements aren=E2=80=99t lost.
> For git/git-dbg, this is theHOST_CPU issue I mentioned earlier in the
> thread. I=E2=80=99ve since confirmed the fix locally and will send the pa=
tch
> shortly.
> For git/git-dbg, this is theHOST_CPU issue I mentioned earlier in the
> thread. I=E2=80=99ve since confirmed the fix locally and will send the pa=
tch
> shortly.
> I=E2=80=99m not currently looking into the Perl, Locale, or NumPy diffs, =
so
> those are available for anyone else to pick up.

Thanks, this is good information to have and sounds like really good
progress. I'm looking forward to getting this resolved!

I had remembered about the git issue which is why I didn't call that
one out specifically. Ross has sent a patch for numpy too, so we are
moving forwards.

The other reproducibile tests did complete and the results there are
looking better too, the rust "noise" is reduced showing the other
issues more clearly:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/4
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260908-nxt738yt/=
packages/diff-html/

https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/4/steps=
/15/logs/stdio
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260908-xz_trxrt
/packages/diff-html/

There are kernel, gcc, go, mesa, pseudo, erofs and ruby issues there so
plenty for people to help with if anyone has time!

Cheers,

Richard

