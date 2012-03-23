Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SB7pg-0008Mt-EX
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:59:20 +0100
Received: from mail18-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Mar 2012 16:35:09 +0000
Received: from mail18-db3 (localhost [127.0.0.1])	by mail18-db3-R.bigfish.com
	(Postfix) with ESMTP id A4F80420085	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 16:35:09 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail18-db3 (localhost.localdomain [127.0.0.1]) by mail18-db3
	(MessageSwitch) id 133252050866721_22519;
	Fri, 23 Mar 2012 16:35:08 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.241])	by
	mail18-db3.bigfish.com (Postfix) with ESMTP id 0C4C24C0056	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 16:35:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Mar 2012 16:35:05 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Fri, 23 Mar 2012 11:35:12 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate reuse for -native, -cross across different
	host glibc version, how to make it work?
Thread-Index: AQHNCRLrlIBR481Ab0uvyvKcXmFJVA==
Date: Fri, 23 Mar 2012 16:35:12 +0000
Message-ID: <CAEsOVNfaP_NzdnigOOfgOcdhkHgQfEYVoS-K0pPn1dH4PdZpEQ@mail.gmail.com>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
	<1332506475.9740.409.camel@ted>
In-Reply-To: <1332506475.9740.409.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
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
X-List-Received-Date: Fri, 23 Mar 2012 16:59:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A75CAE2F6F8D3C409F35EDF95FEC23A1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 7:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
>> I turned on sstate mirroring for angstrom recently and I'm getting
>> reports of build failures due to missing GLIBC_2.14 symbols:
>>
>> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
>> version `GLIBC_2.14' not found (required by
>> arm-angstrom-linux-gnueabi-gcc)
>>
>> The sstate tarballs are built on a Fedora16 VM and the breakage occurs
>> when it being used on systems with an older c library (e.g. debian).
>> To get rid of this problem there are multiple options, but I think the
>> 2 most obvious are:
>>
>> 1) inject host distroname and distroversion into the checksums
>> 2) build everything against a native libc
>>
> 3) Use an older version on the VM which is the oldest distro you plan to
> build against.
>
>> Would it be appropriate to get 1) into oe-core before the branchpoint?
>
> We've talked about this and its been on the "to fix" list but nobody has
> got around to it. Its hard as we need to come up with something that
> isn't going to kill performance of the checksum calculations. A cat
> operation on a few files for each checksum for example isn't
> appropriate. We may need to do something at the bitbake level as there
> is also the issue of checksuming local files such as those in file://
> urls and including that in the sstate checksums.
>
> So whilst I'd love to see fixes for these and they are bugfixes, they're
> going to have to be well written patches and its late in cycle for
> invasive changes :(.

Can't you just inject a variable into native.bbclass:

LIBC_DEP =3D `ldd /bin/sh | grep libc`

-M=



