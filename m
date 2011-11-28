Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RV8v8-0000fd-8B
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 22:39:26 +0100
Received: from mail42-db3-R.bigfish.com (10.3.81.245) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 21:32:00 +0000
Received: from mail42-db3 (localhost [127.0.0.1])	by mail42-db3-R.bigfish.com
	(Postfix) with ESMTP id 366A44E02E0;
	Mon, 28 Nov 2011 21:32:00 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail42-db3 (localhost.localdomain [127.0.0.1]) by mail42-db3
	(MessageSwitch) id 1322515920133641_10637;
	Mon, 28 Nov 2011 21:32:00 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.245])	by
	mail42-db3.bigfish.com (Postfix) with ESMTP id 1BDA61C0047;
	Mon, 28 Nov 2011 21:32:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 21:31:56 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 15:32:41 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OJW+pGYAgASTS4A=
Date: Mon, 28 Nov 2011 21:32:41 +0000
Message-ID: <CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
In-Reply-To: <1322264404.25382.4.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2011 21:39:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ADA9CE9E4BBA8147B5C632E53225ED95@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2011 at 5:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This is firmly in multilib territory as its not just libgcc but libc as
> well and so it goes on.
>
> One of the reasons I'm nervous of the patch you're replying to is that
> people are now going to try and cross the two and we'll end up with a
> mess :(.
>
> Trying to build just libgcc from the gcc tree is a nightmare and when we
> last tried it, caused no end of problems.
>
> What specific problem are you trying to solve?

The specific issue I'm having is for our 64-bit part that still uses a
32-bit u-boot. Not sure the best approach really is...

I've tried utilizing multilib by adding the following to my u-boot
recipe, but it's just hacky...

DEPENDS_e5500-64b_append =3D " lib32-gcc"
CC_e5500-64b =3D "powerpc-poky-linux-gcc -m32"

I'd rather NOT recompile gcc/eglibc/etc just for this 32-bit build of
u-boot where we don't need libc. I'd rather just have a functional
32bit/64bit compiler for our 64-bit target.

Looking forward farther, I would like to have one toolchain
("meta-toolchain") that can produce target code for multiple targets
also.

-M=



