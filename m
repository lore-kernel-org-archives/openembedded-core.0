Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAQ3S-0006G1-Nl
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:14:38 +0100
Received: from mail33-am1-R.bigfish.com (10.3.201.253) by
	AM1EHSOBE006.bigfish.com (10.3.204.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Mar 2012 17:50:33 +0000
Received: from mail33-am1 (localhost [127.0.0.1])	by mail33-am1-R.bigfish.com
	(Postfix) with ESMTP id 3AD201A0178	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:50:33 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail33-am1 (localhost.localdomain [127.0.0.1]) by mail33-am1
	(MessageSwitch) id 1332352231455395_17653;
	Wed, 21 Mar 2012 17:50:31 +0000 (UTC)
Received: from AM1EHSMHS020.bigfish.com (unknown [10.3.201.243])	by
	mail33-am1.bigfish.com (Postfix) with ESMTP id 69A181200E9	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:50:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS020.bigfish.com
	(10.3.206.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Mar 2012 17:50:29 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 21 Mar 2012 12:50:34 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Build failures due zlib problem
Thread-Index: AQHNB4sda0KH34Cbw0W5Um2iTKus3w==
Date: Wed, 21 Mar 2012 17:50:34 +0000
Message-ID: <CAEsOVNeKC45x7FGivf6mw7B2a-ih-akLa4Tm_yFku+W8VEJ0_g@mail.gmail.com>
References: <CAP9ODKq3vD6u4TQnWw4Ux9c5L5fB3FVcstY_pCkmzp_HWddhRg@mail.gmail.com>
	<1332323639.9740.125.camel@ted>
In-Reply-To: <1332323639.9740.125.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Build failures due zlib problem
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
X-List-Received-Date: Wed, 21 Mar 2012 18:14:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0DCEA43F0BA5CA4C8774B5303E6C6934@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 4:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-03-20 at 22:40 -0300, Otavio Salvador wrote:
>> | NOTE: Unpacking
>> /home/ostt-devel/src/embedded-systems/downloads/gcc-4_6-branch_gcc.gnu.o=
rg_.svn.gcc.branches_184847_.tar.gz
>> to /home/ostt-devel/src/embedded-systems/tmp-eglibc-eglibc/work-shared/g=
cc-4.6.3+svnr184847-r28/
>> | gzip: /usr/lib/libz.so.1: version `ZLIB_1.2.5.1' not found (required b=
y gzip)
>> | tar: Child returned status 1
>>
>> Does anyone sees it? Our autobuilder is failing this way.
>
> Yes, its being seen. I think its appeared after the pigz-native change
> but it exposes an underlying problem.
>
> The issue is that we have a gzip binary in the sysroot linking against
> libz. We can get into a situation where we remove libz to rebuild but we
> don't remove the gzip binary yet.
>
> gzip-native is a tricky one since its one of those recipes we don't
> correctly have a dependency chain for and is also implied in
> ASSUME_PROVIDED (else how to we extract tarballs?).
>
> Whilst I've implicated pigz-native, we could potentially see this with
> gzip-native too, I'd guess its just more flexible about the libz symbols
> it uses.
>
> I'm trying to come up with a good way of handling this but at the moment
> I'm drawing a blank for a neat solution :(.
>
> Something along the lines of perl-native might be necessary. We could
> also decide its a special case and remove gzip whenever libz is
> removed...

I've seen your fix and it seems reasonable - but doesn't 'tar' have
the same issue?

-M=



