Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675831075274
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 07:52:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5899.1773906737374365061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 00:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Csf8Vw7p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso16837195e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773906736; x=1774511536; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZ2ZnTygYbAkH27cFC6oDor9YRNc2Vq/R9/oegPLjPw=;
        b=Csf8Vw7pLr3pK4CFn/O/LIGkCrrU9HByAqCHdOhYbqTYwEH92aLZsx0zzLFEEax0mD
         V1TVE3i1A6XCCHzWElUOYgHuJMe9oUfAr4H36yOB0LlLm5H/gtDIBm9dSeNZXJ+nugu2
         Ih+CwbEkpFnWJuVztwUvsTdWB+vo8/XK4PwmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906736; x=1774511536;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZ2ZnTygYbAkH27cFC6oDor9YRNc2Vq/R9/oegPLjPw=;
        b=f9bLZxFBGbecSunT8hPH4xBe3/cyNrQo5R0/I1eYvkbrAjhM/Zk1D/HC1Im/nNzqFr
         R8FXU//r5JSnhlOzABvkh6Gq4yQ+FwW4+rNDeDtNsDWMaPYW+81pPtc8Z6jaPZq45wAd
         MA+nbeDHljjYAjB8dEkvWuOCZixMjYS6Kw8oHIPaMey0gC6b7S0HnH+XRteIhfl+RuGX
         9KDpguyru7ERo9nbpLLuE6G4wrY6zUh2sFVPq9DRxMb5XEVqBoaNJmngKPq0FtENLmMN
         EnFmZdxS7ql8xBBBX7U8fGKm2zjGntvaldRP5nEMJ/tIPpahiDfMEjYV/Npc32QIkm41
         2ELg==
X-Forwarded-Encrypted: i=1; AJvYcCXfazkwATwO7xFgQflySKJv9gGejU2oVX+L0wNqRqTk4pZhtL9uxspmMg04bRFqKvXOn+6rw2ONAcZu/gdJWy4puA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxge5N6rcmzJspFnubvA4rhe9jQvLg0vm76g7YZY4wt/8mfmRVR
	MNvtdSOYU4vVC6fBseMDCYOr8vSNgWoN5mucmLDu7dwmGydjMdfs6SGmLudgp+QUOo0=
X-Gm-Gg: ATEYQzxmB0OPdoeH2OUaZ3BSjf670URFcPJG0iMJqYigIooeR49VTwgDrrao+6GZgOk
	aT3lt10nvcpae9Fev8Wi0xS4xDBsQbEG4gwWrDgl5kGVwuy2lVunTgttGuogrFRDKeNOyMyTAUz
	I9XHp1cO03kXBWr5HFu2PQjruPtGzkEcAF2fSfy9IntaaRHh9lUR2YK0qytl6CRuktr0PiqXHJ4
	ohgsHnwQ+QAus/jEznNuAdt7S3kpDrcWA++kXNprV3n2OZI91FCfXcTQDjM6k4i8txP+y7dc4Ia
	rKMvo4fdt0fqNTGgbQwuQJhP7PCXTAeFu6akVXJGnKuV1sx0o7WrNzdVzYdhS4vQeC0hUOR/bHd
	wPjJwRtg46RXmur06jXDLqnoDfUjcmOUxwX4FuQXyn5P/wzd9tBWbrtSaPFZ+9PpXFE1T1hlLHd
	mEy81lYzHxDrC9TKYyK/lHryXbkWSbiqnWsaW91pTSOn2xqZI6HzN01pxI3JET2bHwhs0Lo/X85
	1lV0znx6XYpGUM=
X-Received: by 2002:a05:600c:8b10:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-486f8b46651mr36993295e9.10.1773906735629;
        Thu, 19 Mar 2026 00:52:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9? ([2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c40ccbsm80586375e9.9.2026.03.19.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:52:15 -0700 (PDT)
Message-ID: <793e23609ccbbd3e139136ee8243d6ed2d116a55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using
 BitBake fetcher
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org, 
	ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
	olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Date: Thu, 19 Mar 2026 07:52:13 +0000
In-Reply-To: <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
	 <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
	 <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 07:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233466

On Thu, 2026-03-19 at 08:29 +0100, Marta Rybczynska wrote:
>=20
>=20
> On Wed, Mar 18, 2026 at 6:45=E2=80=AFPM Richard Purdie via lists.openembe=
dded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrot=
e:
> > Hi,
> >=20
> > On Mon, 2026-03-09 at 12:57 +0100, Benjamin Robin via lists.openembedde=
d.org wrote:
> > > This series is an RFC and a follow-up to patch 6/6 ("Add class for
> > > post-build CVE analysis"), which was previously discussed [1].
> > > I have prepared two RFC series, this one and another, each exploring
> > > different approaches to handling the download of CVE databases.
> > >=20
> > > I explored using BitBake's internal fetcher instead of direct Git cal=
ls
> > > for fetching CVE databases. However, I encountered two major issues:
> > >=20
> > > - No proper shallow clone support: I wanted to clone the repository
> > > =C2=A0 without downloading the entire history (which is very large). =
While
> > > =C2=A0 `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the d=
ownload
> > > =C2=A0 directory, which is inefficient for updates.
> > >=20
> > > =C2=A0 In this series, we are going to do a full clone of the git rep=
ository,
> > > =C2=A0 so this point is not going to be fixed.
> > >=20
> > > - Performance overhead for CVE databases deployment: The recipes
> > > =C2=A0 downloading CVE databases must copy them to the sysroot or to =
the
> > > =C2=A0 deploy directory. This requires copying the extracted database=
s
> > > =C2=A0 multiple times, even with hard links, which is slow due to the
> > > =C2=A0 combined size (~6 GB, ~672,000 small files).
> > >=20
> > > =C2=A0 In this series, we are using a custom deploy task that is goin=
g to
> > > =C2=A0 copy the git repository using rsync directly in the final depl=
oy
> > > =C2=A0 directory, by-passing all the Bitbake logic.
> > >=20
> > > Additionally, there's no built-in way to control the interval between
> > > CVE database fetches: In this series, we are going to use AUTOREV,
> > > which imply to query the git repositories for each build, to check if
> > > there is a new git revision.
> > >=20
> > > Moreover, this series ensures that the CVE analysis runs only when
> > > the original SBOM changes or when the CVE databases are updated.
> > >=20
> > > Upon revisiting the class and its associated recipes, I identified
> > > several areas for improvement, which were fixed in the first commit.
> > > This series also includes a second commit making the VEX class option=
al
> > > rather than mandatory.
> > >=20
> > > [1] https://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60=
423f4d35@bootlin.com/
> >=20
> > I've just been trying to work out where we're at with this coming up to
> > release and we need to get this resolved.
> >=20
> > I feel quite strongly that we need to use the fetcher for obtaining
> > this data. "fetching" isn't trivial and is full of
> > license/auditing/sbom issues. Making any exception to that, even for
> > cve data tends to become problematic later.
> >=20
> > The existing approach was only done as it was a sqlite database and we
> > didn't have fetcher support for such a thing. If we need to improve the
> > git fetcher in some way to better support this use case (e.g. shallow
> > clone update efficiency), that is something we can work on.
> >=20
> > As such, I was wondering if you had never versions of these patches?
> >=20
> > I'd note that we can't set AUTOREV by default, we'll need to specify a
> > revision, and document how the user can enable AUTOREV in their config
> > (maybe even a config fragment?). Whilst it is annoying to do that, it
> > is a requirement that the system doesn't touch the network outside
> > mirrors unless configured to.
>=20
>=20
> Fetching the complete git repos has a number of problems. Why not use rel=
ease
> tarballs like those in=C2=A0=C2=A0https://github.com/CVEProject/cvelistV5=
/releases ?
> Fkie feeds also have them=C2=A0https://github.com/fkie-cad/nvd-json-data-=
feeds/releases

FWIW we can shallow clone git repos, it is just isn't optimal in how
updates are handled which was Benjamin's concern as the shallow clones
end up more like tarballs.

If we use the bitbake fetcher, it also makes it much easier to actually
use tarballs directly too, since the fetcher also supports those and it
just becomes a simple SRC_URI change.

Cheers,

Richard

