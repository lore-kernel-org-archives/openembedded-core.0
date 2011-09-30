Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9hIk-0008B5-Jz
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:55:10 +0200
Received: from mail68-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 17:49:41 +0000
Received: from mail68-db3 (localhost.localdomain [127.0.0.1])	by
	mail68-db3-R.bigfish.com (Postfix) with ESMTP id 6BA4DB805DE	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 17:49:41 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zzbb2dK9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h63h)
X-Spam-TCS-SCL: 2:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail68-db3 (localhost.localdomain [127.0.0.1]) by mail68-db3
	(MessageSwitch) id 1317404981315654_13192;
	Fri, 30 Sep 2011 17:49:41 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.253])	by
	mail68-db3.bigfish.com (Postfix) with ESMTP id 441E9258050	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 17:49:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 17:49:39 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 12:49:37 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Adding TARGET_VECTOR
Thread-Index: AQHMf5lRsd9KAmOeJE2Xczt0K8X7Dw==
Date: Fri, 30 Sep 2011 17:49:36 +0000
Message-ID: <CAEsOVNcC79qr6+zp6ify_vViu-+FsiYq=XvUCyWFc924RPyqjg@mail.gmail.com>
References: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
	<4E85FCF7.6030208@gmail.com>
In-Reply-To: <4E85FCF7.6030208@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Adding TARGET_VECTOR
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
X-List-Received-Date: Fri, 30 Sep 2011 17:55:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E317EC92B786BE42B781ACF494C5596F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 8/25/2011 7:35 AM, Kumar Gala wrote:
>>
>> We have some packages like flac that are aware of vectorization that may
>> or may not exist on a given processor. =A0I was wondering if adding some=
thing
>> like TARGET_VECTOR similar to TARGET_FPU made sense as a way for recipes=
 to
>> decide on how to set various vectorization flags if needed.
>>
>> I was looking at this mostly from the PPC side in which we have:
>>
>> TARGET_VECTOR =3D "" /* processor has no vector hw */
>> TARGET_VECTOR =3D "altivec" /* processor has AltiVec support */
>> TARGET_VECTOR =3D "spe" /* processor has signal processing engine suppor=
t */
>> TARGET_VECTOR =3D "vsx" /* processor has Vector-Scalar Extension */
>>
>
> is target vector a property of FPU itself or is it a separate processing
> unit in hardware.?

We have several powerpc cores each containing a different vector
features. We need a way to differentiate in the recipes between
different cores and decide to enable SPE, Altivec, etc to build the
package properly.

I've sort of gone the route of adding:

OVERRIDES :=3D ":core_type"

And using that in recipes. But, I think we need a consensus on how we
want to handle this.

-M=



