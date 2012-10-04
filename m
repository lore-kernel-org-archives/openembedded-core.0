Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJquA-000250-0G
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 21:16:18 +0200
Received: from mail218-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Thu, 4 Oct 2012 19:03:15 +0000
Received: from mail218-tx2 (localhost [127.0.0.1])	by
	mail218-tx2-R.bigfish.com (Postfix) with ESMTP id B54C94019D;
	Thu,  4 Oct 2012 19:03:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h946hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail218-tx2 (localhost.localdomain [127.0.0.1]) by mail218-tx2
	(MessageSwitch) id 1349377393705618_9167;
	Thu,  4 Oct 2012 19:03:13 +0000 (UTC)
Received: from TX2EHSMHS022.bigfish.com (unknown [10.9.14.239])	by
	mail218-tx2.bigfish.com (Postfix) with ESMTP id 9E3EA94004B;
	Thu,  4 Oct 2012 19:03:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS022.bigfish.com
	(10.9.99.122) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 4 Oct 2012 19:03:11 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Thu, 4 Oct 2012 14:03:10 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] RFC: Secondary Toolchain
Thread-Index: AQHNomLlVPbQVAWrkkOTzLv6UU28kQ==
Date: Thu, 4 Oct 2012 19:03:10 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6D910F@039-SN1MPN1-002.039d.mgd.msft.net>
References: <506DCF4A.5020101@windriver.com>
In-Reply-To: <506DCF4A.5020101@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Secondary Toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 19:16:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <1690DB64D670494CA01298F85A23DD6E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 1:02 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> We have an issue where we'd like to have an alternative toolchain
> (assembler, linker, compiler) available for our customers to selectively
> use.  However, before we just go off and implement something, I'd like at
> least some basic consensus on what the best practice is for doing this wo=
rk.
> Below is my attempt at an early proposal.
>
> Background
> ----------------
>
> Many companies have commercial / highly optimized toolchains for specific
> purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  For
> (potentially) better performance with some applications a mechanism to bo=
th
> provide the hooks for the alternative toolchain as well as a way to activ=
e
> it per-package is desired.
>
> This work assumes that the third party toolchain is generally compatible
> with the idea of sysroots, linking to the libc provided by OE, and genera=
lly
> compatible with GNU conventions.
>
> However, as part of the third party toolchain, it may not be GNU compatib=
le.
> This means many Open Source applications simply may not work with this
> toolchain.  That means that we need to have a way for a toolchain to
> blacklist (or whitelist) specific recipes.  This way only supported
> components can be built by the user, avoiding numerous complaints.
>
> Currently OE has a method to generate an SDK based on the GNU toolchain. =
 We
> would like to be able to also export the external toolchain along with th=
e
> SDK, effectively providing both the GNU toolchain and the third party
> toolchain using the common sysroot.
>
> We need a way to active the third party toolchain on a per-package basis.
> This activation will need to use the existing sysroot, but be able to pas=
s
> different C, C++, LD, AS and other flags as specified by the third party
> toolchain.
>
> Finally third party toolchains should be implemented as layers that can
> easily plug into OE.
>
> Implementation
> ---------------------
>
> Add an OVERRIDE to specify the alternative toolchain.  Can this be done
> within the layer by doing something like:
>
> OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"
>
> TOOLCHAIN =3D "gnu" (or "icc")
>
> To activate the toolchain you would use things like:
>
> TOOLCHAIN_pn-bash =3D 'icc'
>
> To define the correct behavior for the toolchain, the following would nee=
d
> to be defined (with _toolchain-<toolchain>):
>
> TARGET_CPPFLAGS
> TARGET_CFLAGS
> TARGET_CXXFLAGS
> TARGET_LDFLAGS
> CC
> CXX
> F77
> CPP
> LD
> CCLD
> AR
> AS
> RANLIB
> STRIP
> OBJCOPY
> OBJDUMP
> NM
> FULL_OPTIMIZATIONS
> DEBUG_OPTIMIZATION
>
> Is anyone aware of any other items that may require additional items?  Wi=
ll
> the above actually work?  Using the override of the TOOLCHAIN_=85 will th=
at
> actually change the override values or do we get stuck?

This seems orthogonal to actually implementing the recipe which would
procide 'icc'?

-M

>
> Comments/suggestions appreciated!
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



