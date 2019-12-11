Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8454D7FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:51:25 +0000 (UTC)
IronPort-SDR: bx7c39oepqxekzBrwC4+3nnUc0PP3XoMZ06SxkiV/s8pF/BS3Xv7HWG4FfaGFK7mBFiBmQbDgu
	fxURJGksJEVTgcqEbwluaBOVTDqW3Utqt62MXa86yNdllUOGZhgDrn4l7sKKWtXvkWaqjnesq7
	hwYhKmb6XpRZwE3D/Z+r2kXMdIrNBP9/7brSe28U0nacZgssptgalg8KTUiGehX7qzxOvfUrzT
	1+93ulhBTM1uRLre5Wp3S+E3/aXPRVoix2/GDGYbxEVrdSTEj6kWuT1OUV+bPr9o5zI4T+efye
	iFw=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3358536"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Thread-Topic: [OE-core] [PATCH 1/7] license.bbclass: Introduce
	AVAILABLE_LICENSES that lists all licenses
Thread-Index: AQHVrnS3l56ux/xf7Ea1ZTnyAcoGHKe0G0tw
Date: Wed, 11 Dec 2019 00:51:25 +0000
Message-ID: <a9aa0682d4044e2fa2c55a9f4e1e3687@XBOX03.axis.com>
References: <20191207053815.1757-1-pkj@axis.com>
	<20191209094030.pvfalrwhipafpnp4@qschulz>
In-Reply-To: <20191209094030.pvfalrwhipafpnp4@qschulz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
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
X-List-Received-Date: Wed, 11 Dec 2019 00:51:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Quentin Schulz <quentin.schulz@streamunlimited.com>
> Sent: den 9 december 2019 10:41
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/7] license.bbclass: Introduce
> AVAILABLE_LICENSES that lists all licenses
>=20
> Hi Peter,
>=20
> On Sat, Dec 07, 2019 at 06:38:09AM +0100, Peter Kjellerstedt wrote:
> > Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
> > variable that contained a static list of licenses. It was used by
> > expand_wildcard_licenses() to expand any wildcards used in, e.g.,
> > INCOMPATIBLE_LICENSE. However, since this static list of licenses has
> > not been kept up-to-date, many licenses were missing, with the result
> > that if one tried to use any of those licenses with a wildcard, no
> > licenses would be found, effectively ignoring that they should be
> > marked as incompatible.
> >
> > This introduces a new (documented) variable, AVAILABLE_LICENSES, that
> > is automatically updated to contain all licenses found in any
> > directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
> > and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
> > wildcards.
> >
>=20
> Great addition, thanks!
>=20
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/license.bbclass                  | 27 ++++++++++++++++---
> >  meta/conf/documentation.conf                  |  1 +
> >  .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
> >  3 files changed, 27 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclas=
s
> > index 648a4d7892..20af6d34b6 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -252,7 +252,7 @@ def canonical_license(d, license):
> >      """
> >      Return the canonical (SPDX) form of the license if available (so G=
PLv3
> >      becomes GPL-3.0), for the license named 'X+', return canonical for=
m of
> > -    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
> > +    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
>=20
> Might not be fully awake yet but looks like it's a spurious change here.

There was a trailing space on that line that I removed.

> Though, there's actually a typo in availabel that could be fixed :)

Now that you mention it, there actually is. Might as well fix that=20
too now that it has been discovered.

> [...]
> >
> >      # Verify that a package with a non-SPDX license (neither in
> > -    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built w=
hen
> > +    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
> >      # INCOMPATIBLE_LICENSE contains this license
> >      def test_incompatible_nonspdx_license(self):
> >          self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'F=
ooLicense')
> > --
>=20
> I think it could be great to have a new test in that selftest file to
> check that INCOMPATIBLE_LICENSE works with wildcards for licenses not in
> SRC_DISTRIBUTE_LICENSES.

Well, I remove SRC_DISTRIBUTE_LICENSES in the next commit so I do not=20
see what that would add?

> Thanks,
> Quentin

//Peter


