Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id A24276BE7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 15:16:09 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2RFG4UH027690;
	Thu, 27 Mar 2014 16:16:09 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Thu, 27 Mar 2014 16:16:04 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc -- solved
Thread-Index: AQHPRPzljBrmwmdF90yNdigvY1/gr5rrrxoAgAAF4QCACVpkmA==
Date: Thu, 27 Mar 2014 15:16:03 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7257@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
	<532C6C96.7020901@windriver.com>,
	<CAMKF1sopEU3L-ELyNw9FFMstLtayenJnq-f7W02j1LTX=1A_pA@mail.gmail.com>
In-Reply-To: <CAMKF1sopEU3L-ELyNw9FFMstLtayenJnq-f7W02j1LTX=1A_pA@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc -- solved
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
X-List-Received-Date: Thu, 27 Mar 2014 15:16:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,=0A=
=0A=
On Friday, March 21, 2014 6:06 PM, Khem Raj wrote:=0A=
> On Fri, Mar 21, 2014 at 9:45 AM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:=0A=
>> On 3/21/14, 7:10 AM, Mats K=E4rrman wrote:=0A=
>>>=0A=
>>> Hi,=0A=
>>>=0A=
>>> On: Thursday, March 13, 2014 11:36 AM, Mats K=E4rrman wrote:=0A=
>>>>=0A=
>>>> My "home made" hard float tune for PowerPC looks like this:=0A=
>>>>=0A=
>>>> ------------------------------------------------------------------=0A=
>>>> # Tune for the e300c3 core=0A=
>>>> require conf/machine/include/tune-ppce300c3.inc=0A=
>>>>=0A=
>>>> # Use hardware floating point=0A=
>>>> AVAILTUNES +=3D "ppce300c3hf"=0A=
>>>> TUNE_FEATURES_tune-ppce300c3hf =3D "m32 fpu-hard ppce300c3"=0A=
>>>> TUNE_PKGARCH_tune-ppce300c3hf =3D "ppce300c3hf"=0A=
>>>> PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D=0A=
>>>> "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3hf"=0A=
>>>> DEFAULTTUNE =3D "ppce300c3hf"=0A=
>>>> ------------------------------------------------------------------=0A=
>>>>=0A=
>>>=0A=
>>> I found the reason for the error (deviance) in the sqrt function. glibc=
=0A=
>>> has=0A=
>>> special code for PowerPC 603e core (e300 is an optimized variant of 603=
e).=0A=
>>> By adding the following line to the tuning I now get the same result as=
=0A=
>>> for all other environments that I've tried:=0A=
>>>=0A=
>>> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300=
c3",=0A=
>>> "-with-cpu=3D603e", "", d)}"=0A=
>>>=0A=
>>> Does anyone know about the reason for having soft-float as the default =
and=0A=
>>> only available alternative for e300c2/3 tunings?=0A=
>>=0A=
>>=0A=
>> My guess is because e300 e300c2 were both soft-float designs.  And e300c=
3 is=0A=
>> the first hard float design.=0A=
>>=0A=
>> The e300c3 should inherit and use the 603e directly.  This includes=0A=
>> definiting the TUNE_FEATURES that the 603e does.  If it doesn't do that,=
 I'd=0A=
>> suggest it's a mistake.=0A=
>>=0A=
>> The default 603e tune should include:=0A=
>>=0A=
>> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e"=
,=0A=
>> "-with-cpu=3D603e", "", d)}"=0A=
>>=0A=
>> or similar already -- and should already be hard float enabled.  (ppc603=
e=0A=
>> soft-float should be the alternative -- as it is significantly rarer and=
 the=0A=
>> deviation.)=0A=
>=0A=
>=0A=
> alternatively we should define fpu Iplies in glibc for e300c3,=0A=
>=0A=
>>=0A=
>>=0A=
>>> Would it be worthwhile to send a patch to add the hf tuning to OE-core?=
=0A=
>>=0A=
>>=0A=
>> As the e300c3 should be hard float, we shouldn't have the 'hf' designati=
on.=0A=
>> Otherwise, we should ensure the e300c3 tune is correctly configured.=0A=
>=0A=
> may be for now controlling it in tune file is a quicker fix.=0A=
>=0A=
=0A=
Adding "-with-cpu=3D603e" to GLIBC_EXTRA_OECONF proved to be problematic=0A=
as it leads to contradictive --mcpu=3D args to gcc, both "e300c3" and "603e=
".=0A=
=0A=
I solved that by using "-with-cpu=3De300c3" and by adding a patch to eglibc=
:=0A=
---------------------------------------------------------------------------=
---=0A=
--- libc.orig/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies=0A=
+++ libc/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies=0A=
@@ -0,0 +1,2 @@=0A=
+# e300c3 is a variant of 603e so use the same optimizations for sqrt=0A=
+powerpc/powerpc32/603e/fpu=0A=
---------------------------------------------------------------------------=
---=0A=
Does this seem correct to you?=0A=
=0A=
Initial tests shows that at least the sqrt test now works. The reason=0A=
I'm holding back on patches to the tune file is that I still have trouble=
=0A=
with time related syscalls, see [1].=0A=
=0A=
>>=0A=
>>> In that case what tests should be performed before that and what (relat=
ed)=0A=
>>> tests are performed by the OE auto-builder?=0A=
=0A=
BR // Mats=0A=
=0A=
[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-March/09=
1011.html=0A=
=0A=

