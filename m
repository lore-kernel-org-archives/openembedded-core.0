Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id BB1346F636
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:36:35 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2DAaVn4030354;
	Thu, 13 Mar 2014 11:36:36 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Thu, 13 Mar 2014 11:36:30 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc
Thread-Index: Ac8+BQu6b+elda9pTAWbBsq3s0UQDQADFJOAACUuFjg=
Date: Thu, 13 Mar 2014 10:36:30 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B181EC7@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>,
	<1394645853.6805.214.camel@phil-desktop.brightsign>
In-Reply-To: <1394645853.6805.214.camel@phil-desktop.brightsign>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Thu, 13 Mar 2014 10:36:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 12, 2014 6:37 PM, Phil Blundell wrote:=0A=
> On Wed, 2014-03-12 at 15:30 +0000, Mats K=E4rrman wrote:=0A=
>> Does anyone know if this is a known "feature" of eglibc or know any othe=
r reason=0A=
>> for this difference?=0A=
>=0A=
> Does eglibc's own libm testsuite pass on your platform?  I wonder if=0A=
> oe-core is accidentally building eglibc without "big" libm for you, or=0A=
> something like that.  Might be worth checking your option-groups.config=
=0A=
> to make sure.=0A=
=0A=
I have no NFS set up so I have not managed to run the eglibc target tests y=
et.=0A=
=0A=
I ran the test program I mentioned before on an i.MX6 (arm cortexa9-hf) sys=
tem=0A=
built on Poky/Dora (the PowerPC system is bare-bone OE-core/Dora) and got t=
he=0A=
correct results there (i.e identical to my PC et.c.).=0A=
=0A=
Comparing:=0A=
.../eglibc/2.18-r0/build-powerpc-oe-linux/option-groups.config (my failing =
system)=0A=
.../eglibc/2.18-r0/build-arm-poky-linux-gnueabi/option-groups.config (arm i=
.MX6)=0A=
=0A=
They are both identical and both have all options set "=3D Y".=0A=
=0A=
My "home made" hard float tune for PowerPC looks like this:=0A=
=0A=
------------------------------------------------------------------=0A=
# Tune for the e300c3 core=0A=
require conf/machine/include/tune-ppce300c3.inc=0A=
=0A=
# Use hardware floating point=0A=
AVAILTUNES +=3D "ppce300c3hf"=0A=
TUNE_FEATURES_tune-ppce300c3hf =3D "m32 fpu-hard ppce300c3"=0A=
TUNE_PKGARCH_tune-ppce300c3hf =3D "ppce300c3hf"=0A=
PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D "${PACKAGE_EXTRA_ARCHS_tune-powerp=
c} ppce300c3hf"=0A=
DEFAULTTUNE =3D "ppce300c3hf"=0A=
------------------------------------------------------------------=0A=
=0A=
Your comments are welcome.=0A=
=0A=
BR // Mats=0A=
=0A=

