Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLdxW-0003QF-4i
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 17:46:38 +0100
Received: from mail2-db3-R.bigfish.com (10.3.81.245) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Nov 2011 16:39:58 +0000
Received: from mail2-db3 (localhost.localdomain [127.0.0.1])	by
	mail2-db3-R.bigfish.com (Postfix) with ESMTP id 8AD1210D84B3	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 16:40:06 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zzbb2dK9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail2-db3 (localhost.localdomain [127.0.0.1]) by mail2-db3
	(MessageSwitch) id 1320252006377857_12068;
	Wed,  2 Nov 2011 16:40:06 +0000 (UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.243])	by
	mail2-db3.bigfish.com (Postfix) with ESMTP id 52029192004C	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 16:40:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS006.bigfish.com
	(10.3.87.106) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 2 Nov 2011 16:39:54 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Wed, 2 Nov 2011 11:40:08 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMiFcrsVKWork4+060O+9mkAZ8mpV38+MAgCHPWgCAAHv0gA==
Date: Wed, 2 Nov 2011 16:40:08 +0000
Message-ID: <CAEsOVNfDcr2egKbUJGiU5vPaGhv+5weEjX7mwKmSNGYrXTcexg@mail.gmail.com>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<4E94AB7A.6050603@intel.com>
	<CAEsOVNfOgHFMzMcvXt+DhBY0xtwNWhi--vNNDeKXC=aRsLKtdw@mail.gmail.com>
	<20111102091605.GD9949@jama.jama.net>
In-Reply-To: <20111102091605.GD9949@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Wed, 02 Nov 2011 16:46:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AB85D3CE0DE4B64E92AB32D0D88FA5D9@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2011 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Oct 11, 2011 at 08:57:47PM +0000, McClintock Matthew-B29882 wrote=
:
>> On Tue, Oct 11, 2011 at 3:47 PM, Saul Wold <saul.wold@intel.com> wrote:
>> > On 09/30/2011 10:21 AM, Matthew McClintock wrote:
>> >>
>> >> From: Tom Rini<tom_rini@mentor.com>
>> >>
>> >> At issue is that route/pktloc.c (not generated) depends on
>> >> route/pktloc_syntax.h (generated).
>> >>
>> >> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>> >> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> >> ---
>> >> =A0.../libnl/fix-pktloc_syntax_h-race.patch =A0 =A0 =A0 =A0 =A0 | =A0=
 26
>> >> ++++++++++++++++++++
>> >
>> > I just noticed that this patch get put in the libnl directory, not the
>> > libnl-2.0 directory.
>> >
>> > Can you pull all the libnl changes together and resbumit this, also is=
 there
>> > a reason you can not just update this to the latest libnl 3.2.1?
>>
>> Are you referring to this: http://patches.openembedded.org/patch/12749/
>
> This pach is moving fix-makefile.patch from libnl-2.0 to libnl dir as Sau=
l mentioned
> and patch wasn't even formated with -M to make it easier to review such m=
ove, please
> move it back to libnl-2.0 and send it again.
>
> .../libnl/libnl-2.0/fix-makefile.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 32 -=
-------------------
> =A0.../recipes-support/libnl/libnl/fix-makefile.patch | =A0 32 ++++++++++=
++++++++++
>
> Cheers,

I really need to defer on any changes to libnl - I have no way to test
any of this. I was just trying to fix a parallel build issues for the
lsb image. Otherwise I'm blindly making changes and more changes that
people request with no actual testing being done.

-M=



