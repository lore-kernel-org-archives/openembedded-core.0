Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 826296075E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:32:49 +0000 (UTC)
Received: from [192.168.1.101] (111-250-193-92.dynamic-ip.hinet.net
	[111.250.193.92])
	by msfrf2619.sfr.fr (SMTP Server) with ESMTP id 2A76D1C00042B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:32:50 +0200 (CEST)
Received: from [192.168.1.101] (111-250-193-92.dynamic-ip.hinet.net
	[111.250.193.92])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2619.sfr.fr (SMTP Server) with ESMTPSA;
	Wed, 13 Jun 2018 01:32:49 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
Mime-Version: 1.0 (1.0)
From: Herve Jourdain <herve.jourdain@neuf.fr>
X-Mailer: iPhone Mail (15B93)
In-Reply-To: <CAJ86T=XPaV78aURUKY8bywmvD57hQacAfQ+jJ8ryf2pAYABYhw@mail.gmail.com>
Date: Wed, 13 Jun 2018 07:32:42 +0800
Message-Id: <4A3CB614-C2DB-45B3-B28E-E91CAB654253@neuf.fr>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
	<002901d40230$0fa25690$2ee703b0$@neuf.fr>
	<ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
	<003401d40264$f548ef90$dfdaceb0$@neuf.fr>
	<16c1a187-66ef-dfb1-e8cc-4a63a75e947b@windriver.com>
	<CAJ86T=XPaV78aURUKY8bywmvD57hQacAfQ+jJ8ryf2pAYABYhw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-sfr-mailing: LEGIT
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Jun 2018 23:32:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

I believe I did say always present on armv8 and armv7, I did not mean before=
 that.
Having separate tunes for thumb support was necessary on previous architectu=
res where it was optional, but it persisted for architectures which made thu=
mb mandatory.
I=E2=80=99m not even advocating removing the tune option for previous archit=
ectures that would normally not require it, but I believe we should get rid o=
f it for new ARM architectures.

Cheers,
Herve

> On 13 Jun 2018, at 04:39, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
>> On Tue, Jun 12, 2018 at 1:00 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>>> On 6/12/18 10:49 AM, Herve Jourdain wrote:
>>> Hi,
>>>=20
>>> So I agree with you about restricting to what gcc can support, that's ac=
tually my proposal (actually, probably a subset of what gcc can support).
>>> So for armv8, gcc supports, as architectures: armv8-a, armv8.1-a, armv8.=
2-a, armv8.3-a, armv8.4-a.
>>> Then, you can add the supported options with a "+" after the architectur=
e.
>>> Options supported for armv8-a are: '+crc', '+simd', '+crypto', '+nocrypt=
o', '+nofp'
>>> Options supported for armv8.1-a are: '+simd', '+crypto', '+nocrypto', '+=
nofp'
>>> Options supported for armv8.2-a and armv8.3-a are: '+fp16', '+fp16fml', '=
+simd', '+crypto', '+dotprod', '+nocrypto', '+nofp'
>>> Options supported for armv8.4-a are: '+fp16', '+simd', '+crypto', '+dotp=
rod', '+nocrypto', '+nofp'
>>>=20
>>> As you can see, proposals for armv8-a, whether my previous one, the new o=
ne here, or even the one I have updated and used in production, just capture=
 the existing complexity, and not add to it.
>>> and support for armv8.1-a, armv8.2-a, armv8.3-a, armv8.4a will only add m=
ore options down the line.
>>=20
>> Sounds a lot like the above would be TUNE_FEATURES to me..  (even if we d=
on't
>> necessarily define a tune that uses them -- if it's standard another laye=
r
>> certainly could.)
>>=20
>>> Regarding fpu, gcc supports the following for armv8: fp-armv8, neon-fp-a=
rmv8, and crypto-neon-fp-armv8.
>>>=20
>>> Regarding cpu, I believe that the armv8 supported ones are: =E2=80=98cor=
tex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =E2=80=98cortex-a53=E2=80=99=
, =E2=80=98cortex-a55=E2=80=99, =E2=80=98cortex-a57=E2=80=99, =E2=80=98corte=
x-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =E2=80=98cortex-a75=E2=80=99.
>>>=20
>>> I personally would like to keep tuning for a specific CPU as much as pos=
sible (again I'm working closely with various ARM-based SoCs, so my opinion m=
ight be tainted).
>>=20
>> Thats a lot of options, but if we focus on TUNE_FEATURES, I think it's a b=
it
>> more reasonable to support all of this.. (maybe that is what needs to be d=
one in
>> the future as well for other architectures.. focus on the 'gcc' behavior a=
nd
>> generate TUNE_FEATURES matching the compiler.)
>>=20
>> I'd like Khem's opinion on how crazy of an idea that is.
>>=20
>>> One thing that could be done to simplify things would be to just use the=
 cpu, and add the options to it. Gcc supports adding options to the cpu.
>>> '+nofp' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =E2=
=80=98cortex-a53=E2=80=99 and =E2=80=98cortex-a55=E2=80=99
>>> '+crypto' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99=
, =E2=80=98cortex-a53=E2=80=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98corte=
x-a57=E2=80=99, =E2=80=98cortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =E2=
=80=98cortex-a75=E2=80=99
>>>=20
>>> That could simplify the tune settings, but would give less control than w=
hat we currently have.
>>> As you might have guessed, I do put a specific emphasis on the crypto op=
tion, and on the neon option, which are the most interesting for armv8 in my=
 opinion.
>>=20
>> In the past 'crypto' options have only been assembly.. if that's changed i=
t has
>> definitely opened up a new facet in all of this work.
>>=20
>>> Regarding thumb, always adding it to the tune without creating specific v=
ariants with or without thumb makes sense, since the tune is normally about t=
he SoC capabilities, and arv7 and armv8 both support it.
>>> You can always select whether you want thumb or not by setting ARM_INSTR=
UCTION_SET appropriately at the distro level.
>>=20
>> Yes, that might be needed now that thumb is theoretically always supposed=
 to be
>> present.
>=20
> It's not _always_ present - it's missing for armv4 CPUs such as StrongARM.=

>=20
> However the option has been unnecessarily propagated into tuning files
> for higher architecture levels where support for Thumb _is_ always
> present.


