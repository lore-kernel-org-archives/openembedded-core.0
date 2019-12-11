Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CBA277FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 01:01:01 +0000 (UTC)
IronPort-SDR: iA2eWndXpmdd4NgjMGEScfZgVwV8dVjWBFXgnC0XC+K34jf5OCw/RE1fuINQOX3qVOig0i4QN2
	STPun9MJTXBEnHnpvnCT5qOjluoxUa3m5HVYEG/lAnRsxiCboNLyCZo0X+ttR4sBAAeB44Sfum
	qqdRU2hrGM8TZ9qgOp2RIG1n6H76dEXikFbh/I7iayvLzKu0c4fTrIw/ZMn7J9xLyUvH9exJTg
	Kpl/YbhdgbGfwsVyTjsK4N1sPlPSSyGokKmA18Bda7D8T/xGMgF8RfVI4lOrwB2GSNEMzA+2Hx
	rOk=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3358696"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Thread-Topic: [OE-core] [PATCH 5/7] base.bbclass: Report only the licenses
	that are incompatible for a package
Thread-Index: AQHVrnpEWifGbgQQwU6OlnwTFKFhaqe0HXsA
Date: Wed, 11 Dec 2019 01:01:02 +0000
Message-ID: <6bb56b63b3564853979b92ff3ac9f68e@XBOX03.axis.com>
References: <20191207053815.1757-1-pkj@axis.com>
	<20191207053815.1757-5-pkj@axis.com>
	<20191209102019.cgtzabidya2omoy6@qschulz>
In-Reply-To: <20191209102019.cgtzabidya2omoy6@qschulz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] base.bbclass: Report only the licenses that are incompatible for a package
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
X-List-Received-Date: Wed, 11 Dec 2019 01:01:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Quentin Schulz <quentin.schulz@streamunlimited.com>
> Sent: den 9 december 2019 11:20
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/7] base.bbclass: Report only the licenses
> that are incompatible for a package
>=20
> Hi Peter,
>=20
> On Sat, Dec 07, 2019 at 06:38:13AM +0100, Peter Kjellerstedt wrote:
> > Instead of reporting ${LICENSE} when a package is identified as using
> > an incompatible license, report the license(s) that are actually
> > incompatible.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> [...]
> > diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > index ad878571b5..9d1e801117 100644
> > --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > @@ -4,7 +4,7 @@ from oeqa.utils.commands import bitbake
> >  class IncompatibleLicenseTests(OESelftestTestCase):
> >
> >      def lic_test(self, pn, pn_lic, lic):
> > -        error_msg =3D 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped:=
 it
> has an incompatible license: %s' % (pn, pn, pn_lic)
> > +        error_msg =3D 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped:=
 it
> has incompatible license(s): %s' % (pn, pn, pn_lic)
> >
> >          self.write_config("INCOMPATIBLE_LICENSE +=3D \"%s\"" % (lic))
> >
> > @@ -27,12 +27,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
> >      # license cannot be built when INCOMPATIBLE_LICENSE contains this
> SPDX
> >      # license
> >      def test_incompatible_spdx_license_alias(self):
> > -        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPL-3.0'=
)
> > +        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPL-
> 3.0')
> >
> >      # Verify that a package with an alias (from SPDXLICENSEMAP) to an
> SPDX
> >      # license cannot be built when INCOMPATIBLE_LICENSE contains this
> alias
> >      def test_incompatible_alias_spdx_license_alias(self):
> > -        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
> > +        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3'=
)
> >
>=20
> We currently have 4 tests:
>  - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
>  - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
>  - GPLv3 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
>  - GPLv3 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
>=20
> They test that the alias system (SPXLICENSEMAP) still works, which is
> rather important since we never enforced the use of licenses from
> SRC_DISTRIBUTE_LICENSES in LICENSE in recipes and allowed the use of
> aliases (hence SPXLICENSEMAP).
>=20
> If I'm not mistaken this change induces the following 4 tests:
>  - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
>  - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
>  - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
>  - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
>=20
> which duplicates two tests.

Actually not. Please note that different recipes are used for the=20
first two tests (incompatible-license.bb) and the last two tests=20
(incompatible-license-alias.bb).

> The questions are: which error warranted this code change?

Before, the LICENSE string was reported as is, whereas after my changes,=20
the canonical SPDX names are reported.

> Are SPDXLICENSEMAP aliases still working? Can it still be checked?

It is still working and checked.

> If the original tests are indeed not needed anymore, we need to explicit
> why (and we can actually just remove them).
>=20
> I'm still advocating for new tests with wildcards :)

Ah, now I think I get your comment from the previous mail. Yes, I=20
should probably add some tests that validate the wildcard support.

> Thanks,
> Quentin

//Peter


