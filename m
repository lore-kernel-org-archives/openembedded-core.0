Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 766167FAAE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:29:01 +0000 (UTC)
IronPort-SDR: tQnCP/29SgqbIXbZXFXxVZLhmjB56dS/kTMNhkK0z79otIRTu2qCBKo1Gaa2ygLiJD2xQIU8ay
	ACPrPxjLSxZXWvJGGWibZ+e9M1RTSniF2nzP3+ho1AnlA9sQYf7Twb7M76T+YCMZYv9QL0WFiW
	+MzKNeGe4t9TRRKPFrmloUfoFDw3Kz5i5a0ZwCo2OIZprbCkkJKu2oPHI0dHSyTsvagFeA4FlN
	HoO4usW0tnZxJ9zDAI8kIU8c7ih6oyZ0JYafgtpxEwP2bymFOM+EpmRC1X/RHXRu8GcS2lOqQu
	w6s=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3494284"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Thread-Topic: [OE-core] [PATCHv2 8/8] incompatible_lic.py: Add tests for
	incompatible licenses with wildcards
Thread-Index: AQHVsAgyXWd4wf6xREOZuLIqzJvG7Ke1H97A
Date: Wed, 11 Dec 2019 16:29:01 +0000
Message-ID: <d58b88b279904c2b86d0a6935e11c3e9@XBOX03.axis.com>
References: <20191211031126.22782-1-pkj@axis.com>
	<20191211031126.22782-8-pkj@axis.com>
	<20191211094847.psxarymfddjjto42@qschulz>
In-Reply-To: <20191211094847.psxarymfddjjto42@qschulz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 8/8] incompatible_lic.py: Add tests for incompatible licenses with wildcards
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
X-List-Received-Date: Wed, 11 Dec 2019 16:29:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Quentin Schulz <quentin.schulz@streamunlimited.com>
> Sent: den 11 december 2019 10:49
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 8/8] incompatible_lic.py: Add tests for
> incompatible licenses with wildcards
>=20
> Hi Peter,
>=20
> On Wed, Dec 11, 2019 at 04:11:26AM +0100, Peter Kjellerstedt wrote:
> > Suggested-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > PATCHv2: New in this patch set.
> >
> >  .../oeqa/selftest/cases/incompatible_lic.py   | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > index 458a940618..3eabd79097 100644
> > --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> > @@ -23,6 +23,18 @@ class IncompatibleLicenseTests(OESelftestTestCase):
> >      def test_incompatible_alias_spdx_license(self):
> >          self.lic_test('incompatible-license', 'GPL-3.0', 'GPLv3')
> >
> > +    # Verify that a package with an SPDX license (from
> AVAILABLE_LICENSES)
> > +    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
> license
> > +    # matching this SPDX license
> > +    def test_incompatible_spdx_license_wildcard(self):
> > +        self.lic_test('incompatible-license', 'GPL-3.0', '*GPL-3.0')
> > +
> > +    # Verify that a package with an SPDX license (from
> AVAILABLE_LICENSES)
> > +    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
> alias
> > +    # license matching this SPDX license
> > +    def test_incompatible_alias_spdx_license_wildcard(self):
> > +        self.lic_test('incompatible-license', 'GPL-3.0', '*GPLv3')
> > +
> >      # Verify that a package with an alias (from SPDXLICENSEMAP) to an
> SPDX
> >      # license cannot be built when INCOMPATIBLE_LICENSE contains this
> SPDX
> >      # license
> > @@ -34,6 +46,36 @@ class IncompatibleLicenseTests(OESelftestTestCase):
> >      def test_incompatible_alias_spdx_license_alias(self):
> >          self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3'=
)
> >
> > +    # Verify that a package with an alias (from SPDXLICENSEMAP) to an
> SPDX
> > +    # license cannot be built when INCOMPATIBLE_LICENSE contains a
> wildcarded
> > +    # license matching this SPDX license
> > +    def test_incompatible_spdx_license_alias_wildcard(self):
> > +        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPL-
> 3.0')
> > +
> > +    # Verify that a package with an alias (from SPDXLICENSEMAP) to an
> SPDX
> > +    # license cannot be built when INCOMPATIBLE_LICENSE contains a
> wildcarded
> > +    # alias license matching the SPDX license
> > +    def test_incompatible_alias_spdx_license_alias_wildcard(self):
> > +        self.lic_test('incompatible-license-alias', 'GPL-3.0',
> '*GPLv3')
> > +
> > +    # Verify that a package with multiple SPDX licenses (from
> > +    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE
> contains
> > +    # some of them
> > +    def test_incompatible_spdx_licenses(self):
> > +        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0',
> 'GPL-3.0 LGPL-3.0')
> > +
>=20
> I think you forgot to add
> meta-selftest/recipes-test/license/incompatible-licenses.bb in your
> patch :)

Bah, of course I did. v3 incoming...

> 2019-12-11 10:40:13,581 - oe-selftest - INFO -
> test_incompatible_all_licenses_wildcard
> (incompatible_lic.IncompatibleLicenseTests)
> 2019-12-11 10:40:18,658 - oe-selftest - INFO -  ... FAIL
> 2019-12-11 10:40:18,658 - oe-selftest - INFO - Traceback (most recent cal=
l
> last):
>   File "/tmp/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line
> 77, in test_incompatible_all_licenses_wildcard
>     self.lic_test('incompatible-licenses', 'GPL-2.0 GPL-3.0 LGPL-3.0',
> '*')
>   File "/tmp/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line
> 13, in lic_test
>     raise AssertionError(result.output)
> AssertionError: Parsing recipes...done.
> ERROR: Nothing PROVIDES 'incompatible-licenses'. Close matches:
>   incompatible-license
>   incompatible-license-alias
>   incompatible-nonspdx-license
> Parsing of 798 .bb files complete (0 cached, 798 parsed). 1332 targets,
> 763 skipped, 0 masked, 0 errors.
>=20
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>=20
> Thanks for the added tests.
>=20
> Looks good to me otherwise. I don't really know if YP cares about the
> Reviewed-by in patches (seems not by quickly looking in the git
> history), but for the whole path series:
>=20
> Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
>=20
> Thanks!
> Quentin

//Peter


