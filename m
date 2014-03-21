Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 9972C6F9D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:10:31 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2LCANeE032012;
	Fri, 21 Mar 2014 13:10:28 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Fri, 21 Mar 2014 13:10:22 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc -- solved
Thread-Index: AQHPRPzljBrmwmdF90yNdigvY1/grw==
Date: Fri, 21 Mar 2014 12:10:22 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 21 Mar 2014 12:10:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
On: Thursday, March 13, 2014 11:36 AM, Mats K=E4rrman wrote:=0A=
> My "home made" hard float tune for PowerPC looks like this:=0A=
> =0A=
> ------------------------------------------------------------------=0A=
> # Tune for the e300c3 core=0A=
> require conf/machine/include/tune-ppce300c3.inc=0A=
> =0A=
> # Use hardware floating point=0A=
> AVAILTUNES +=3D "ppce300c3hf"=0A=
> TUNE_FEATURES_tune-ppce300c3hf =3D "m32 fpu-hard ppce300c3"=0A=
> TUNE_PKGARCH_tune-ppce300c3hf =3D "ppce300c3hf"=0A=
> PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D "${PACKAGE_EXTRA_ARCHS_tune-powe=
rpc} ppce300c3hf"=0A=
> DEFAULTTUNE =3D "ppce300c3hf"=0A=
> ------------------------------------------------------------------=0A=
> =0A=
=0A=
I found the reason for the error (deviance) in the sqrt function. glibc has=
=0A=
special code for PowerPC 603e core (e300 is an optimized variant of 603e).=
=0A=
By adding the following line to the tuning I now get the same result as=0A=
for all other environments that I've tried:=0A=
=0A=
GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3",=
 "-with-cpu=3D603e", "", d)}"=0A=
=0A=
Does anyone know about the reason for having soft-float as the default and=
=0A=
only available alternative for e300c2/3 tunings?=0A=
=0A=
Would it be worthwhile to send a patch to add the hf tuning to OE-core?=0A=
=0A=
In that case what tests should be performed before that and what (related)=
=0A=
tests are performed by the OE auto-builder?=0A=
=0A=
BR // Mats=0A=

