Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBUpG-0003Sy-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:00:11 +0200
Received: from mail67-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 16:54:35 +0000
Received: from mail67-ch1 (localhost.localdomain [127.0.0.1])	by
	mail67-ch1-R.bigfish.com (Postfix) with ESMTP id 73F4115F0411	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 16:54:35 +0000 (UTC)
X-SpamScore: -14
X-BigFish: VS-14(zz9371K168aJ1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail67-ch1 (localhost.localdomain [127.0.0.1]) by mail67-ch1
	(MessageSwitch) id 1317833621428683_24277;
	Wed,  5 Oct 2011 16:53:41 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail67-ch1.bigfish.com (Postfix) with ESMTP id
	43F478A006C for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 16:53:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 16:53:38 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 11:53:38 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 10/16] Fix mdadm for powerpc64
Thread-Index: AQHMggIJ6+1og7PNnEGyLP1+hESaEJVrcnwAgAABBYCAAZwagIAA5biAgABZB4A=
Date: Wed, 5 Oct 2011 16:53:37 +0000
Message-ID: <CAEsOVNeR+DL15jM9TBc9mZkBe4uhD3xJvt=5jrqss+t+k9R-Bg@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
	<CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
	<4E8A2667.4090700@gmail.com>
	<CAEsOVNdahRcHTCfVhaqFZiVaKhAtM2a6L6GTm61RtsGoJxjB6A@mail.gmail.com>
	<1317814486.14671.136.camel@ted>
In-Reply-To: <1317814486.14671.136.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 17:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C4D8975238AD8C47AFF24965E569194C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 6:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I dug into this a bit. To quote asm/types.h:
>
> /*
> =A0* This is here because we used to use l64 for 64bit powerpc
> =A0* and we don't want to impact user mode with our change to ll64
> =A0* in the kernel.
> =A0*/
> #if defined(__powerpc64__) && !defined(__KERNEL__)
> # include <asm-generic/int-l64.h>
> #else
> # include <asm-generic/int-ll64.h>
> #endif
>
> So ppc64 kernel space uses ll64 and userspace uses l64.
>
> This means __u64 is a long for ppc64 but a long long for x86_64. The
> format errors occurs rightly because a ull is being printed from a ul
> variable. This will happen to work but its messy.

Sorry, I'm missing if you are suggesting a solution here... do I need
to take an alternate approach? The alternative is to patch the
printfs?

-M=



