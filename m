Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 4252F6C716
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:30:50 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2CFUjYg027538
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 16:30:50 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Wed, 12 Mar 2014 16:30:44 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: libm accuracy, eglibc compared to glibc
Thread-Index: Ac8+BQu6b+elda9pTAWbBsq3s0UQDQ==
Date: Wed, 12 Mar 2014 15:30:43 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Wed, 12 Mar 2014 15:30:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I face a problem with libm. With my Dora build the following assertion does=
n't hold:=0A=
=0A=
sqrt( pow( sqrt( 2.0 ), 4.0 ) ) =3D=3D 2.0=0A=
=0A=
1) With my old OE-classic / glibc-2.9 / PowerPC-hf it holds.=0A=
2) With my Debian desktop PC / glibc-2.17 / amd64 it holds.=0A=
3) With my new OE-core Dora / eglibc-2.18 / PowerPC-hf it doesn't hold.=0A=
=0A=
Close enough one can think but the standardized test case I run requires th=
e result to be 2.0.=0A=
A simple test program:=0A=
--------------------------------------------------------------------=0A=
#include <stdio.h>=0A=
#include <math.h>=0A=
=0A=
int main(){=0A=
=0A=
	double two =3D 2.0;=0A=
	double four =3D 4.0;=0A=
=0A=
	double s1 =3D sqrt(two);=0A=
	printf("sqrt(%.20f) =3D %.20f\n", two, s1);=0A=
	double p   =3D pow(s1, four);=0A=
	printf("pow(%.20f, %.20f) =3D %.20f\n", s1, four, p);=0A=
	double s2 =3D sqrt(p);=0A=
	printf("sqrt(%.20f) =3D %.20f\n", p, s2);=0A=
=0A=
}=0A=
--------------------------------------------------------------------=0A=
=0A=
results from 1 and 2 (identical):=0A=
sqrt(2.00000000000000000000) =3D 1.41421356237309514547=0A=
pow(1.41421356237309514547, 4.00000000000000000000) =3D 4.00000000000000088=
818=0A=
sqrt(4.00000000000000088818) =3D 2.00000000000000000000=0A=
=0A=
results from 3:=0A=
sqrt(2.00000000000000000000) =3D 1.41421356237309492343=0A=
pow(1.41421356237309492343, 4.00000000000000000000) =3D 3.99999999999999866=
773=0A=
sqrt(3.99999999999999866773) =3D 1.99999999999999955591=0A=
=0A=
Does anyone know if this is a known "feature" of eglibc or know any other r=
eason=0A=
for this difference?=0A=
=0A=
Best Regards,=0A=
Mats=0A=

