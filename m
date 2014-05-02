Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3098A60199
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 19:16:15 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id l18so4058391wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 12:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=dp5ln1GjkOWj7UpoG1EeYeUc5BNhtv5hkNZpNS8yBgE=;
	b=Os1AS56yK2TSmlEKSMgyqq7t9nDTOSzXhMEtNN41XDlPEKhR4PtkZhEDTh1AaKIlKC
	AlX2rValyi9p3yl8CIu9ceD1jZ9FYldDGwYchTAnMUatDmY8Pjtzz0/ji0zCHoIUPhbZ
	K+P51cf8gOpXGkn9aF0Jq1oltbJKS3IJLyHWp999QxdrNzPm1pXsdCE+6Wd5s9xukAeF
	pJ0960OeGaE3O4/B9Q7LtTt1DGU3d/EotE1W1p/5aahlKhbAbdQCkupv+fQf0Yrz6PCk
	pn+O+RVBC7Kk+qWdlhfWbg4EVN3PXYf01TsycgwzOpbGQlYcuG2cnSULXaMsyNoNwSFV
	5lDg==
X-Gm-Message-State: ALoCoQnChkN5tplpfNWaaauM0aio91hsnaKpvHpSbGtGG3gJ7rm8og4eTcI2muva4OI1k2TlxNJf
X-Received: by 10.180.212.48 with SMTP id nh16mr4273981wic.49.1399058175836;
	Fri, 02 May 2014 12:16:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6963:a234:88d3:1631?
	([2001:610:612:0:6963:a234:88d3:1631])
	by mx.google.com with ESMTPSA id go1sm1354832wib.7.2014.05.02.12.16.14
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 May 2014 12:16:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1398963761.12731.1.camel@ted>
Date: Fri, 2 May 2014 21:16:13 +0200
Message-Id: <9A664150-4DD2-4197-A3D6-49C96EF5A6BC@dominion.thruhere.net>
References: <1398963761.12731.1.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: My thoughts on the future of OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 19:16:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mei 2014, om 19:02 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> I was asked what I thought were things that needed discussion at =
OEDAM.
> Sadly I won't be there but I thought it might help to write down my
> thoughts in a few areas.
>=20
> Developer Workflow
> ------------------
>=20
> Firstly, I think the big piece we need to address as a project is
> "developer workflow" as this is where people are struggling using it.
>=20
> Unfortunately "developer workflow" means different things to different
> people? Which one do I mean then? I actually mean all of them. As some
> examples:

[snip use cases]

I notice none of the use case mention distro developers, but the =
paragraph above is vague enough to be interpreted as "we rock at distro =
stuff, we suck at app/product development". To clear up my confusion, =
could you say something about distro development? Something like =
"bitbake-prserv-tool import won't be glacially slow in the future" :)

After 5 OE-core based angstrom releases I can say that the 'Core OS' =
quality has improved a lot and I've made peace with the version update =
policy, but the overall experience for a downstream distro is painful. A =
lot of small, stupid and preventable mistakes combined are tedious to =
deal with. The most recent example I hit was xinput-calibrator losing =
XDG autolaunch support in the move to OE-core without mentioning it in =
the commit log. It took me a week (admittingly a spare time week, so =
maybe a single workday) to track it down and come up with a patch.

And there's a *big* stupid and preventable issue that is not really =
OE-cores fault, but more the yocto-projects fault: BSPs using =
linux-yocto.bbappend and doing:

	SRCREV =3D "githash"
	LINUX_VERSION =3D "3.12"

BSP maintainers assume only their BSP will be affected, but it affects =
*all* BSPs using linux-yocto.bbappends. This applied to all bbappends, =
but I've seen all meta-handheld machines jump up and down in PV due to =
other BSPs setting global vars. Ross deserves a big thank you for =
obsoleting mesa bbappends, that issues prevented angstrom from having a =
working GL version for >1 ARM silicon vendor.


> So my first ask is that we actually try and write down all these
> different cases which is no small task in itself. I've a start of a =
list
> above, we should probably put this into the wiki and have people add
> their own use cases (or use cases of those around them in their =
company
> etc.). The trouble is there are some many different variants!
>=20
> Once we have some idea of the cases, we can start to put together some
> kind of plan about how we intend to help the given use cases and to =
try
> and prioritise them. Perhaps we should put some kind of weighting
> against them in the wiki and people can increase the numbers of say
> their top three desires.
>=20
> Whilst this looks like an impossible problem, the good news is that I
> believe we can solve it and we actually already have a rather powerful
> toolbox to help work on it. I have a rough idea of a roadmap that can
> move us forward:
>=20
> a) locked sstate - I know its not in master yet but I believe this is
> key to allowing some of the use cases where you want to change some
> number of things but keep the rest of the system the same.

This is something I would very much like to see happening. I've noticed =
at least 3 patches in the 'dora' stable branch that triggered pretty =
much a complete rebuild due to sstate+prserv. And when I apply a =
buildfix for recent host distros to e.g. gcc to meta-linaro-toolchain I =
trigger a complete rebuild as well. It would be a lot less churn in the =
package feeds if I could lock down everything in console-image. That way =
the 'core OS' packages won't have as much spurious updates as they have =
now.

regards,

Koen=

