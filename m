Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp23.services.sfr.fr [93.17.128.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2574678E3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:49:33 +0000 (UTC)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])
	by msfrf2628.sfr.fr (SMTP Server) with ESMTP id 3DC181C000C0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:49:34 +0200 (CEST)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2628.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 12 Jun 2018 17:49:31 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Mark Hatle' <mark.hatle@windriver.com>, 'Koen Kooi'
	<koen@dominion.thruhere.net>, 'Randy Li' <ayaka@soulik.info>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
	<002901d40230$0fa25690$2ee703b0$@neuf.fr>
	<ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
In-Reply-To: <ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
Date: Tue, 12 Jun 2018 17:49:27 +0200
Message-ID: <003401d40264$f548ef90$dfdaceb0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHJ6eWOd7VehRwCiawuKMWc2ULDKwJvgjnTAjB/uIgBLvh8KqRCdG+A
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
X-List-Received-Date: Tue, 12 Jun 2018 15:49:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi,

So I agree with you about restricting to what gcc can support, that's =
actually my proposal (actually, probably a subset of what gcc can =
support).
So for armv8, gcc supports, as architectures: armv8-a, armv8.1-a, =
armv8.2-a, armv8.3-a, armv8.4-a.
Then, you can add the supported options with a "+" after the =
architecture.
Options supported for armv8-a are: '+crc', '+simd', '+crypto', =
'+nocrypto', '+nofp'
Options supported for armv8.1-a are: '+simd', '+crypto', '+nocrypto', =
'+nofp'
Options supported for armv8.2-a and armv8.3-a are: '+fp16', '+fp16fml', =
'+simd', '+crypto', '+dotprod', '+nocrypto', '+nofp'
Options supported for armv8.4-a are: '+fp16', '+simd', '+crypto', =
'+dotprod', '+nocrypto', '+nofp'

As you can see, proposals for armv8-a, whether my previous one, the new =
one here, or even the one I have updated and used in production, just =
capture the existing complexity, and not add to it.
and support for armv8.1-a, armv8.2-a, armv8.3-a, armv8.4a will only add =
more options down the line.

Regarding fpu, gcc supports the following for armv8: fp-armv8, =
neon-fp-armv8, and crypto-neon-fp-armv8.

Regarding cpu, I believe that the armv8 supported ones are: =
=E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =
=E2=80=98cortex-a53=E2=80=99, =E2=80=98cortex-a55=E2=80=99, =
=E2=80=98cortex-a57=E2=80=99, =E2=80=98cortex-a72=E2=80=99, =
=E2=80=98cortex-a73=E2=80=99, =E2=80=98cortex-a75=E2=80=99.

I personally would like to keep tuning for a specific CPU as much as =
possible (again I'm working closely with various ARM-based SoCs, so my =
opinion might be tainted).

One thing that could be done to simplify things would be to just use the =
cpu, and add the options to it. Gcc supports adding options to the cpu.
'+nofp' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =
=E2=80=98cortex-a53=E2=80=99 and =E2=80=98cortex-a55=E2=80=99
'+crypto' for =E2=80=98cortex-a32=E2=80=99, =
=E2=80=98cortex-a35=E2=80=99, =E2=80=98cortex-a53=E2=80=99, =
=E2=80=98cortex-a55=E2=80=99, =E2=80=98cortex-a57=E2=80=99, =
=E2=80=98cortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =
=E2=80=98cortex-a75=E2=80=99

That could simplify the tune settings, but would give less control than =
what we currently have.
As you might have guessed, I do put a specific emphasis on the crypto =
option, and on the neon option, which are the most interesting for armv8 =
in my opinion.

Regarding thumb, always adding it to the tune without creating specific =
variants with or without thumb makes sense, since the tune is normally =
about the SoC capabilities, and arv7 and armv8 both support it.
You can always select whether you want thumb or not by setting =
ARM_INSTRUCTION_SET appropriately at the distro level.

Cheers,
Herve

-----Original Message-----
From: Mark Hatle [mailto:mark.hatle@windriver.com]=20
Sent: mardi 12 juin 2018 16:32
To: Herve Jourdain <herve.jourdain@neuf.fr>; 'Koen Kooi' =
<koen@dominion.thruhere.net>; 'Randy Li' <ayaka@soulik.info>
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/4] Add tune for ARMv8 and some cortex =
processors

On 6/12/18 4:30 AM, Herve Jourdain wrote:
> Hi,
>=20
> I believe I'm the "original author" of some patch attempt at tackling =
this problem, more than a year ago, as referenced in this series.
> And I understand why everyone, Khem being the first and not the only =
one, would like some "simpler" things for ARM.
> But the problem is that ARM-based SoCs are very diverse, and ARM does =
have a number of optional IP blocks (such as crypto, but neon is another =
one, and there are others), defined for each architecture. Then ARM =
defines some "standard" SoCs (like cortex-A53, cortex-A57, ...) which =
may set some of those optional IPs as required for that SoC, and the =
rest still as optional.
> And SoC vendors decide what optional IPs they will implement or not...

Simplification is a goal in this, but as you said, not always reasonable =
with a processor designed to be customized.

Typically true customization (vendor specific) doesn't belong in the =
oe-core tune files, but stuff that is architecturally defined may.

> So when we're talking "cortex-A53", it's not necessarily the same =
cortex-A53 for all SoC vendors.
>=20
> GCC does support all that complexity. So the main question is, do we =
want to be able to generate code that could take advantage of the =
optional IPs present on a SoC? Or do we prefer to settle for the least =
common denominator?

I think this is the key.  What combinations does GCC support (actually =
generate
code for?)   If GCC can't generate code for that combination, then I =
don't
believe it belongs as a tune in OE-Core, unless there is a compelling =
argument that assembly level functions will be common enough to justify =
it.

> As someone who is close to the SoC, I definitely would prefer to be =
able to take advantage of the optional IPs present on an ARM SoC, and =
I'd rather have a system that can at least support that even if it's =
slightly more complex. This said, once it's done, most people won't look =
under the hood but just use it, so the complexity would end up being =
hidden - much like now with armv7.

And this is why my GCC statement is being made.  Most developers will =
define a tune, but will never go into the assembly realm.  They simply =
don't have the knowledge or care to devote a bunch of time for a .5% =
performance improvement.
If GCC can add specific optimizations, then we've hit the 'trivial =
optimization'
phase, and a tune may be justified.  We just need to be careful of the =
variant names -- once set they will last a VERY long time.

> I've personally followed up on my patches from last year, and I now =
have a slightly modified/simplified version of them, which I've used to =
build some production-ready environments using cortex-a53/armv8 tunes, =
that trigger the optimization for cortex-a53 + neon. And if the SoC I'm =
working with had the crypto extension, I would be very happy to build =
for it, by just switching the tune I use for my cortex-a53 to the armv8 =
tune supporting crypto.
>=20
> So I believe now may be a good time to talk this over again, because =
we're basically building for cortex-a53 with cortexa7/armv7ve, and that =
is not the most optimal thing to do in my opinion (like, some =
instructions that were native in armv7ve are simulated in armv8).

I don't think anyone objects to armv8, but I was under the impression =
that things like neon were now 'required', (i.e. were not supposed to be =
removed from the instruction set.)  So for anything that is now =
standard, they would be the definition of armv8.. and if there are rare, =
but customized version w/o neon or something else -- then I think it's a =
silicon vendor specific tune that is needed.

In the end it comes down to what has ARM specified, what does GCC =
support, and what is ACTUALLY being broadly implemented.

> One thing that I did come up as a simplification was the handling of =
thumb, I don't think it needs to be an option anymore, since its support =
is mandatory in armv8 (but I think it was also the case in armv7). That =
simplifies things a bit, but nothing fundamental, you still need to =
carry the support for the optional IPs around...

The only reason to continue with the existing 32-bit naming conventions =
(t, neon, vfp, etc) is to show the compatibility matrix.  I don't know =
if this actually justifies the extensions though.  (I do know I have =
customers who never want to use thumb or always [as much as possible] =
want to use thumb based on their own performance requirements and =
designs.. so thumb being switchable is still a desired attribute -- at =
least in the armv7 designs I know of.)

> And in addition to what I proposed to support last year, we indeed now =
have to add armv8.1a, armv8.2a, armv8.3a, armv8.4a (so far...), which =
each have their own specificities/differences that make it unlikely to =
be supported within a single file.

IF the instruction scheduling, generated instructions, optimizations, =
etc are truely different.. then we should call them armv81a, etc..  (I =
don't believe we
can use a '.' for various reasons..)   But if there is no difference in =
the
compiler behavior, or the generated code.. and it's just assembly level =
instruction additions -- then I'm reluctant to add these tunes as they =
can give a false impression.

> Thoughts? Can we talk this over, so we can have a chance to have a =
good support for armv8-32 in oe, instead of everyone doing its own?
>=20
> Cheers,
> Herve
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of =

> Koen Kooi
> Sent: mardi 12 juin 2018 11:01
> To: Randy Li <ayaka@soulik.info>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v2 0/4] Add tune for ARMv8 and some=20
> cortex processors
>=20
>=20
>=20
>> Op 9 jun. 2018, om 08:26 heeft Randy Li <ayaka@soulik.info> het =
volgende geschreven:
>>
>> I read the ARMv8 manual again, it looks the hardware float is=20
>> mandatory in Linux Distributions and toolchain libraries. Even some=20
>> cortex processors can be configured without FPU/NEON hardware, but I=20
>> don't think they would be used in openembeded core.
>>
>> So I can assume the NEON(SIMD) would exist all the time. Leaving only =

>> the crc and crypto instructions are optional here.
>>
>>
>> Randy Li (4):
>>  arch-armv8a.inc: add tune include for armv8
>>  tune-cortexa35: add tunes for ARM Cortex-A35
>>  tune-cortexa32: add tunes for ARM Cortex-A32
>>  tune-cortexa72: add tunes for ARM Cortex-A72
>=20
> Having been forced to deal with the mess that=E2=80=99s 32-bit arm =
tunes: Let=E2=80=99s only add an implementation specific tunes *after* =
having seem conclusive, repeatable benchmark results. 90% of the 32 bit =
tune files are placebo effect and just explode number of package archs =
in your distro feed. The goal of aarch64 was to stop being different for =
the sake of being different, let=E2=80=99s not make a mess because we =
are used to messes.
>=20
> regards,
>=20
> Koen
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


