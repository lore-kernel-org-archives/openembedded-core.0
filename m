Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186A8FCE087
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:58:21 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70303.1772114294099481319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VvTd7l7c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-899afcec41eso9243556d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 05:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772114293; x=1772719093; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c0aQTuijdN1DWIkD5/gtG6cUkGQK0pnU9iZJ5v56sPs=;
        b=VvTd7l7c/e3NaDamtsfzgAlHD0vWaD4M4Jl/2F5iUwSVHgrWAcylLbicgestJ3MVxC
         dBIFh5UwGN10FsRxZM1Sm70edWBhfM3P3x0W0jUCtDlnu2Vbg0WO5XhuO0f0PPIb1/Df
         QtqnKTNq07cHz2TaX7Fgqu8kM3Uz0fJPq2dH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114293; x=1772719093;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0aQTuijdN1DWIkD5/gtG6cUkGQK0pnU9iZJ5v56sPs=;
        b=PdgvS8r22A0dQNcPvN+yJZ8XYqNJWdGehviGeOr38mro30VNRyHwwCgNy13jPc/kNl
         zV+OnAsGrM5vmgVWdnFtvbdCNHMH9kCwRE1NbSctAlE+773heEY/ecv4Id6KX8rzCO8s
         CIoxmyR9bnbZ0L68mATFDdfKfWfbaKvDhbsbxegJQJosQAdN5Uxs1ucXYQVLRbReik3t
         QrqiYrJcsJ3SS8AEJQOch91WHenntZafI2RBlvAikn7piJiNSk6YzcNxlzb/4ENpXQLF
         2dUIbKo8zkR23rOL0ruzFEUunJT+RVHUXs8EsS8AcZ7hrnHs9/JbPf8ZmSAURRS++CX7
         B5yw==
X-Forwarded-Encrypted: i=1; AJvYcCWWFCJGDNsg8edicvkAjCNU8CFdZuYxNvJDxE4WMOWHbus4RgjJUIp+Hvcu7mbCMs5LFtR0EL/tU9vuRwVPRk60VQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwsVr4MO26U87yiwwZDZiTNv26e1rD4368I21LmCSet9QWl4Kv1
	EwTBnLpVxfxDGAaEW6RWycByDvyO5lc1c5U4CcwZcdyAHInsaCKg0E4sbSxnUENNaGQ=
X-Gm-Gg: ATEYQzxBQ+7k+twhQsmSjGPYj16uQo+XdpdTNmdJ+NLqxZI0B//Av5r4tyStqcH3LC9
	ng0ezR15n8YLkN0g3UciI10uWczrg2hwO8TdUCoaWL/2Aql3hPPYwOQDy2AIsXyJfppjC7KL8gT
	h9zYsEEfxNnLiQXZAT0zm56hDgNWcyLWm6MYx9UaTI19ObXoiBQC6jqnAyLRoEbLVYbZd8Ma/HW
	Qapw962X90IJnfka3JG7i+mdbH9wpRoDu3FerEHkHoM8/D6OFqA23OELQ+FSnbsl6PXtgV18uci
	F+/H0AH9y9/PJ5F9SRrgSuR6MPbNP3hboGgRSyI3RnbcQmTN56cGUEfCaLx0Wkt0/CelRmoWWj5
	cWkNnLg8mBtdKcgu86O2LORntjIcKU32d1EYlKxSun7gBlxB/UyLSewisc0II2IThWIo5UB3WLq
	Y6l/+UAW4tnTD2SNcDak/j1x7ycIfy5v1XPZHsocPO9S6vO7vfQ3ZJQvQoeNbIBcQqpjk26LCgz
	L/upIyfpjlzSJE=
X-Received: by 2002:ad4:5aa6:0:b0:895:4716:78e3 with SMTP id 6a1803df08f44-89979e1b385mr270852426d6.9.1772114293006;
        Thu, 26 Feb 2026 05:58:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6? ([2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7184253sm17598486d6.20.2026.02.26.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:58:12 -0800 (PST)
Message-ID: <c260940fde9975b059d0e56619b0c0d02939403f.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Cc: Paul Barker <paul@pbarker.dev>, Yoann Congal <yoann.congal@smile.fr>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>
Date: Thu, 26 Feb 2026 13:58:10 +0000
In-Reply-To: <CABWbsgBwu32+X4RYM5kzc747qAWs2WWbszo3enTJY=zkxqHpww@mail.gmail.com>
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
	 <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com>
	 <5b7f9fe72cb1863826c7a7757c90eab97853f134.camel@linuxfoundation.org>
	 <CABWbsgBwu32+X4RYM5kzc747qAWs2WWbszo3enTJY=zkxqHpww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232027

On Thu, 2026-02-26 at 14:10 +0100, Nicolas Dechesne wrote:
> On Thu, Feb 26, 2026 at 12:49=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2026-02-26 at 12:37 +0100, Nicolas Dechesne via lists.openembed=
ded.org wrote:
> > > On Wed, Feb 25, 2026 at 6:44=E2=80=AFPM Paul Barker <paul@pbarker.dev=
> wrote:
> > > > I've been briefly discussing stable branch update policy with Yoann=
.
> > > > There's a few recipes in openembedded-core which I would like to pr=
opose
> > > > that we always update to the latest version on LTS and stable branc=
hes.
> > > > These are recipes typically providing data that is expected to chan=
ge
> > > > over time, with little or no code.
> > > >=20
> > > > You could say ca-certificates is already covered by the fact that
> > > > security fixes are acceptable for example, but a clearer policy wou=
ld be
> > > > better.
> > > >=20
> > > > Any policy change will go to the TSC for approval, the goal here is=
 to
> > > > get some review and input so that a concrete proposal can be put
> > > > forward.
> > > >=20
> > > > The recipes that come to my mind are:
> > > >=20
> > > > - ca-certificates: To allow access to HTTPS resources we need to ke=
ep
> > > > =C2=A0 these up-to-date.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 - Keeping this up-to-date is common practice in =
other distros.
> > > >=20
> > > > - tzdata: To stay up to date with timezone or daylight savings chan=
ges.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 - Debian takes upgrades to this on stable branch=
es
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (see https://tracker.debian.org/pkg/=
tzdata).
> > > >=20
> > > > - mobile-broadband-provider-info: To stay up to date with provider
> > > > =C2=A0 changes.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 - The README file for this project says "The Pac=
kage contains only
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 informational files so it's safe for=
 distributions to grab updates
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 even during feature freeze and maint=
enance stages."
> > > >=20
> > > > What opinions do other folks have?
> > > >=20
> > > > Are there any other recipes we should include in this list?
> > >=20
> > > I know this is going to be controversial.. what can we do to keep
> > > linux-firmware a bit more up-to-date? the recipe in scarthgap has not
> > > been updated since it was released. Other distros deal with
> > > linux-firmware in various ways..
> >=20
> > The challenge is that linux-firmware is a totally different thing.
>=20
> Correct. And we already discussed that.

We did, and you're asking the question again, clearly not happy with
the answer. You could have at least pointed at the previous discussion
and made it clear you were looking for alternatives to updating
wholesale. I can't see updating it wholesale as being realistically
possible.

> I am hoping to get more feedback about the overall idea.

We already discussed that! ;-)

> Or feedback=C2=A0about how others typically use linux-firmware in LTS bra=
nches,=C2=A0

The question needs to be clear.

> since not=C2=A0updating it at all seems problematic to me.

I do agree, however the question did appear to be whether that was more
or less problematic than a complete upgrade.

> Other distros manage linux-firmware in different ways. Debian seems to
> either take full upgrade, or cherry picks specific firmware files
> upgrade. Ubuntu is stricter and only updates firmware files (or add
> new files) on-demand, as needed.

Would/could someone take on "stable" updates to linux-firmware?

This could be stable branch releases of firmware where the contributors
are attesting it is fixes only? I can see plenty of potential problems
but if someone did try and make a go of that it might be easier for us
and the other distros to get behind?

Alternatively, a mix in layer? That is one of our other options.

Cheers,

Richard



