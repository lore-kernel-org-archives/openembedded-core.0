Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAk8g-0003pi-G7
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:41:22 +0100
Received: from mail22-am1-R.bigfish.com (10.3.201.232) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Mar 2012 15:32:19 +0000
Received: from mail22-am1 (localhost [127.0.0.1])	by mail22-am1-R.bigfish.com
	(Postfix) with ESMTP id 93BC9400212;
	Thu, 22 Mar 2012 15:32:19 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(zz9371I179dN1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail22-am1 (localhost.localdomain [127.0.0.1]) by mail22-am1
	(MessageSwitch) id 1332430338813331_7983;
	Thu, 22 Mar 2012 15:32:18 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.230])	by
	mail22-am1.bigfish.com (Postfix) with ESMTP id B8539A007A;
	Thu, 22 Mar 2012 15:32:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Mar 2012 15:32:17 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 22 Mar 2012 10:32:23 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] powerpc: fix overly aggressive TUNE_PKGARCH set
Thread-Index: AQHNCD9/C/jfKhUOTUmp3NNb81rx7JZ2xAmAgAABIYA=
Date: Thu, 22 Mar 2012 15:32:22 +0000
Message-ID: <CAEsOVNecKdJhVFN0SRuR+1-MyecD-1Uyk+zR+C855NEaPo2n4g@mail.gmail.com>
References: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
	<CABcZANmc2Apcv3WyyX-JN4JV10RLV3_ARCOLq5+x1KSMrJjxPQ@mail.gmail.com>
	<CAEsOVNcFM35wUOMz+mHnCbDnWe1VAoUA-G79Wvco8MYaa=XF3Q@mail.gmail.com>
	<CABcZANkM3zjp48pTU59QUmU2a40O_xnj-x6YMOtFmfSU-UOTbw@mail.gmail.com>
In-Reply-To: <CABcZANkM3zjp48pTU59QUmU2a40O_xnj-x6YMOtFmfSU-UOTbw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] powerpc: fix overly aggressive TUNE_PKGARCH set
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
X-List-Received-Date: Thu, 22 Mar 2012 15:41:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6BE3A3FE1F79AA46A661788747214D48@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 10:27 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Thu, Mar 22, 2012 at 8:21 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Thu, Mar 22, 2012 at 10:08 AM, Chris Larson <kergoth@gmail.com> wrote=
:
>>> On Thu, Mar 22, 2012 at 8:00 AM, Christopher Larson <kergoth@gmail.com>=
 wrote:
>>>> From: Christopher Larson <chris_larson@mentor.com>
>>>>
>>>> There's a problem in arch-powerpc.inc today, wherein it directly sets
>>>> TUNE_PKGARCH, rather than setting TUNE_PKGARCH_tune-<tuning>. As a res=
ult,
>>>> more specific tuning files (e.g. ppce500mc) then see their
>>>> TUNE_PKGARCH_tune-<tuning> variable definitions no longer obeyed. As
>>>> a consequence, the TUNE_PKGARCH ends up as 'powerpc' or 'powerpc-nf' r=
ather
>>>> than 'ppce500mc', which in turn causes a 'TUNE_PKGARCH not in PACKAGE_=
ARCHS'
>>>> failure in the build.
>>>>
>>>> To fix, the .inc now sets TUNE_PKGARCH_tune-powerpc and
>>>> TUNE_PKGARCH_tune-powerpc-nf rather than TUNE_PKGARCH.
>>>>
>>>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>>> ---
>>>> =A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =A0 =A05 +++--
>>>> =A01 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta=
/conf/machine/include/powerpc/arch-powerpc.inc
>>>> index c9b2829..f811a3e 100644
>>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>>> @@ -21,13 +21,14 @@ ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_F=
PU', True) in ['ppc-efd', 'ppc-e
>>>> =A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard"=
 , "", "-nf", d)}"
>>>>
>>>> =A0PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>>>> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>>>>
>>>> =A0# Basic tune definitions
>>>> -AVAILTUNES +=3D "powerpc powerpc-nf"
>>>> +AVAILTUNES +=3D "powerpc powerpc-nf"
>>>> =A0TUNE_FEATURES_tune-powerpc-nf ?=3D "m32 fpu-soft"
>>>> +TUNE_PKGARCH_tune-powerpc-nf =3D "${PPCPKGARCH}"
>>>> =A0BASE_LIB_tune-powerpc-nf =3D "lib"
>>>> =A0PACKAGE_EXTRA_ARCHS_tune-powerpc-nf =3D "powerpc-nf"
>>>> =A0TUNE_FEATURES_tune-powerpc ?=3D "m32 fpu-hard"
>>>> +TUNE_PKGARCH_tune-powerpc =3D "${PPCPKGARCH}"
>>>> =A0BASE_LIB_tune-powerpc =3D "lib"
>>>> =A0PACKAGE_EXTRA_ARCHS_tune-powerpc =3D "powerpc
>>>
>>> Hmm, actually, there's no reason these can't just set
>>> TUNE_PKGARCH_tune-powerpc =3D "powerpc", etc rather than using the
>>> PPCPKGARCH indirection. Anyone more familiar with the tuning code have
>>> an opinion here?
>>
>> I thought this was already fixed in my patch. Seems like it was not appl=
ied?
>>
>> -M
>>
>> commit 216b54e23a995aea79499b88a99f606bb65579af
>> Author: Matthew McClintock <msm@freescale.com>
>> Date: =A0 Mon Feb 27 10:58:45 2012 -0600
>>
>> =A0 =A0arch-powerpc.inc: use default value of TUNE_PKGARCH
>>
>> =A0 =A0We can use the default value for TUNE_PKGARCH, and now we just
>> =A0 =A0append "-nf" if TARGET_FPU is fpu-soft
>>
>> =A0 =A0Signed-off-by: Matthew McClintock <msm@freescale.com>
>
> Ah, indeed, apparently it was not. That said, it looks like your
> version will end up with TUNE_PKGARCH like ppce500mc-nf, is that
> correct? You know this stuff better than I do.

Ugh. I pasted an old version of my patch the correct version is here:

commit 216b54e23a995aea79499b88a99f606bb65579af
Author: Matthew McClintock <msm@freescale.com>
Date:   Mon Feb 27 10:58:45 2012 -0600

    arch-powerpc.inc: use default value of TUNE_PKGARCH

    We can use the default value for TUNE_PKGARCH, and now we just
    append "-nf" if TARGET_FPU is fpu-soft

    Signed-off-by: Matthew McClintock <msm@freescale.com>

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc
b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..9f588e8 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -18,10 +18,8 @@ TARGET_FPU .=3D
"${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}

 ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in
['ppc-efd', 'ppc-efs']]}"

-PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" ,
"", "-nf", d)}"
-
-PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
+PPCPKGSFX_FPU =3D "${@['', '-nf'][d.getVar('TARGET_FPU',d,1) in ['fpu-soft=
']]}"
+TUNE_PKGARCH_append =3D "${PPCPKGSFX_FPU}"

 # Basic tune definitions
 AVAILTUNES +=3D "powerpc powerpc-nf"=



