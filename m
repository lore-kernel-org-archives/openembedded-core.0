Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVVek-0006lf-BP
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:56:02 +0100
Received: from mail61-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 21:48:34 +0000
Received: from mail61-tx2 (localhost [127.0.0.1])	by mail61-tx2-R.bigfish.com
	(Postfix) with ESMTP id 4FFE85800D9	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 21:49:22 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K103dK1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail61-tx2 (localhost.localdomain [127.0.0.1]) by mail61-tx2
	(MessageSwitch) id 1322603362188616_30928;
	Tue, 29 Nov 2011 21:49:22 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.251])	by
	mail61-tx2.bigfish.com (Postfix) with ESMTP id 26C29640043	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 21:49:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 21:48:31 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 15:49:19 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Ignore MACHINE as dep for
	MACHINEOVERRIDES
Thread-Index: AQHMruC/bb5iwoPv0kGSZbZ2PZnrnw==
Date: Tue, 29 Nov 2011 21:49:19 +0000
Message-ID: <CAEsOVNdmqqLWO_p711MN3fTCJnZHoTpN0Wagx_M=8JrNnveLrg@mail.gmail.com>
References: <1322602415-24735-1-git-send-email-msm@freescale.com>
	<20111129214007.GK7441@jama.jama.net>
In-Reply-To: <20111129214007.GK7441@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] bitbake.conf: Ignore MACHINE as dep for MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 29 Nov 2011 21:56:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6B8A64C1804C674EB964611592ED1335@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 3:40 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Nov 29, 2011 at 03:33:35PM -0600, Matthew McClintock wrote:
>> This dependency causes binutils to get rebuilt for some of
>> our parts that are the same TARGET_ARCH but different
>> MACHINE.
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> Comments on this? It seems like it might be better to some do this
>> in the actual recipes (binutils, gcc-cross, etc) and not globally.
>> However, I'm not really sure what goes in MACHINEOVERIDES in
>> general and if it could be something that would cause sstate-cache
>> to be invalid althogh I could image some scenarios.
>>
>> =A0meta/conf/bitbake.conf | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index b4335c9..48ae458 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -659,6 +659,7 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
>> =A0OVERRIDES =3D "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}=
:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>> =A0DISTROOVERRIDES ?=3D "${DISTRO}"
>> =A0MACHINEOVERRIDES ?=3D "${MACHINE}"
>> +MACHINEOVERRIDES[vardepsexclude] +=3D "MACHINE"
>>
>> =A0CPU_FEATURES ?=3D ""
>> =A0CPU_FEATURES_arm ?=3D "vfp"
>> --
>> 1.7.6.1
>
> is this of oe-core/master?
>
> I see similar commit in 362512b83775ad7020e5870a594f0e7ca9ef83ba

It appears this has already been fixed. I was working on edison 1.1. Thanks=
!

-M=



