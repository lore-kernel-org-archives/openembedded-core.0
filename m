Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 534 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Jun 2018 09:39:48 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.22])
	by mail.openembedded.org (Postfix) with ESMTP id 6556B78D21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:39:48 +0000 (UTC)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])
	by msfrf2632.sfr.fr (SMTP Server) with ESMTP id B7DF91C00200B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:30:54 +0200 (CEST)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2632.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 12 Jun 2018 11:30:52 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Koen Kooi' <koen@dominion.thruhere.net>, 'Randy Li'
	<ayaka@soulik.info>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
In-Reply-To: <F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
Date: Tue, 12 Jun 2018 11:30:48 +0200
Message-ID: <002901d40230$0fa25690$2ee703b0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHJ6eWOd7VehRwCiawuKMWc2ULDKwJvgjnTpF0I9OA=
X-sfr-mailing: LEGIT
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/4] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Tue, 12 Jun 2018 09:39:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi,

I believe I'm the "original author" of some patch attempt at tackling =
this problem, more than a year ago, as referenced in this series.
And I understand why everyone, Khem being the first and not the only =
one, would like some "simpler" things for ARM.
But the problem is that ARM-based SoCs are very diverse, and ARM does =
have a number of optional IP blocks (such as crypto, but neon is another =
one, and there are others), defined for each architecture. Then ARM =
defines some "standard" SoCs (like cortex-A53, cortex-A57, ...) which =
may set some of those optional IPs as required for that SoC, and the =
rest still as optional.
And SoC vendors decide what optional IPs they will implement or not...

So when we're talking "cortex-A53", it's not necessarily the same =
cortex-A53 for all SoC vendors.

GCC does support all that complexity. So the main question is, do we =
want to be able to generate code that could take advantage of the =
optional IPs present on a SoC? Or do we prefer to settle for the least =
common denominator?
As someone who is close to the SoC, I definitely would prefer to be able =
to take advantage of the optional IPs present on an ARM SoC, and I'd =
rather have a system that can at least support that even if it's =
slightly more complex. This said, once it's done, most people won't look =
under the hood but just use it, so the complexity would end up being =
hidden - much like now with armv7.

I've personally followed up on my patches from last year, and I now have =
a slightly modified/simplified version of them, which I've used to build =
some production-ready environments using cortex-a53/armv8 tunes, that =
trigger the optimization for cortex-a53 + neon. And if the SoC I'm =
working with had the crypto extension, I would be very happy to build =
for it, by just switching the tune I use for my cortex-a53 to the armv8 =
tune supporting crypto.

So I believe now may be a good time to talk this over again, because =
we're basically building for cortex-a53 with cortexa7/armv7ve, and that =
is not the most optimal thing to do in my opinion (like, some =
instructions that were native in armv7ve are simulated in armv8).

One thing that I did come up as a simplification was the handling of =
thumb, I don't think it needs to be an option anymore, since its support =
is mandatory in armv8 (but I think it was also the case in armv7). That =
simplifies things a bit, but nothing fundamental, you still need to =
carry the support for the optional IPs around...
And in addition to what I proposed to support last year, we indeed now =
have to add armv8.1a, armv8.2a, armv8.3a, armv8.4a (so far...), which =
each have their own specificities/differences that make it unlikely to =
be supported within a single file.

Thoughts? Can we talk this over, so we can have a chance to have a good =
support for armv8-32 in oe, instead of everyone doing its own?

Cheers,
Herve

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of =
Koen Kooi
Sent: mardi 12 juin 2018 11:01
To: Randy Li <ayaka@soulik.info>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/4] Add tune for ARMv8 and some cortex =
processors



> Op 9 jun. 2018, om 08:26 heeft Randy Li <ayaka@soulik.info> het =
volgende geschreven:
>=20
> I read the ARMv8 manual again, it looks the hardware float is=20
> mandatory in Linux Distributions and toolchain libraries. Even some=20
> cortex processors can be configured without FPU/NEON hardware, but I=20
> don't think they would be used in openembeded core.
>=20
> So I can assume the NEON(SIMD) would exist all the time. Leaving only=20
> the crc and crypto instructions are optional here.
>=20
>=20
> Randy Li (4):
>  arch-armv8a.inc: add tune include for armv8
>  tune-cortexa35: add tunes for ARM Cortex-A35
>  tune-cortexa32: add tunes for ARM Cortex-A32
>  tune-cortexa72: add tunes for ARM Cortex-A72

Having been forced to deal with the mess that=E2=80=99s 32-bit arm =
tunes: Let=E2=80=99s only add an implementation specific tunes *after* =
having seem conclusive, repeatable benchmark results. 90% of the 32 bit =
tune files are placebo effect and just explode number of package archs =
in your distro feed. The goal of aarch64 was to stop being different for =
the sake of being different, let=E2=80=99s not make a mess because we =
are used to messes.

regards,

Koen
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


