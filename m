Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9433.1794571381547139451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 04:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=xQE4ezGl;
 spf=pass (domain: geanix.com, ip: 79.135.106.116, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794571378; x=1794830578;
	bh=ONL8IuDUpaUqFdk6E51ibfq+11FINcNLqPmTwxVSgBM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xQE4ezGluTc2PRiFDhOC1B+2/kycabKtjJ1Wg+O3SirDRqfTQTSTmTRCVT+YjG113
	 QsYpuggaiHCvkWDTyJzU9SQI7gChCO3a2LW3gJ2hZfI1Eo3JuFRrDNL3MrhDBc6w0s
	 TpNorJz4BkfSN1s7awZypFMLsBInTzYmkVQTlHWaCjLmRTuihWcFJeALX1QeJ16YxI
	 G4X7BCAv872ARSDAihq7u7BUWfkOHTaGR6AtEAKasqR5obXO9LsngOT1Xt2VFoPLF6
	 Ud3TKqOb5TggQvLDypv1WjKvgOlkMXarZjEH5y7dkwHxkpBPK3mn7kIzJMUtgwzuuv
	 /lGrErUT/h7Sw==
Date: Fri, 13 Nov 2026 12:02:55 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/incompatible_lic: test INCOMPATIBLE_LICENSE in populate_sdk
Message-ID: <7B8E3511-F97E-4B4C-A33B-33A04ABE85A3@geanix.com>
In-Reply-To: <CANNYZj-stM_rpnBi9FRhBvgu+seUOyMY4iYB4qenQX9kSMrZoQ@mail.gmail.com>
References: <20261113101537.3586467-1-sean@geanix.com> <20261113101537.3586467-2-sean@geanix.com> <CANNYZj-stM_rpnBi9FRhBvgu+seUOyMY4iYB4qenQX9kSMrZoQ@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: f735891c83692a8a8778e7050c2e10e5c9208122
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 12:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250165



> On 13 Nov 2026, at 12.41, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> Typical claude, sorry. It's far too eager to mass-produce new test cases =
via copy-paste instead of figuring out how to tweak existing cases. Please =
instruct it to do that.
>=20

Ok, I=E2=80=99m a little lost. It=E2=80=99s first time touching this. :)

Would you like the tests to be reduced to:
NoGPL3InImagesTests()
...
- bitbake('core-image-minimal')
+ bitbake('core-image-minimal core-image-minimal:do_populate_sdk=E2=80=
=99)

That would check if we allow nativesdk-* packages in the sdk.

/Sean


> Alex
>=20
> On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer via openembedded-core <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
> Check that do_populate_sdk ignores the image's INCOMPATIBLE_LICENSE for
> SDK host tools (nativesdk-bash) and still applies it to packages in the
> SDK target sysroot (which).
>=20
> bash can't be used for the target check, as target-sdk-provides-dummy
> RPROVIDES bash, so it is never installed into the SDK target sysroot.
>=20
> Autoconf-exception-macro is added to the exceptions, as the SDK's
> complementary packages include xz-src.
>=20
> AI-Generated: Claude Opus 5.5 (Claude Code)
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> It seems weird to add the AI-Generated tag here.
> It took quite a lot of effort to get the tests to fail before 1/2 and
> pass after 1/2.
>=20
>  .../oeqa/selftest/cases/incompatible_lic.py   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/=
oeqa/selftest/cases/incompatible_lic.py
> index 406f92e37b..e05e2ee31c 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -155,6 +155,34 @@ NO_GENERIC_LICENSE[SomeLicense] =3D "COPYING"
>              """))
>          bitbake('core-image-minimal')
>=20
> +class IncompatibleLicensePerImageSDKTests(OESelftestTestCase):
> +    def default_config(self):
> +        return """
> +INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D "GPL-3.0* LGPL-3.0*"
> +INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal =3D "GCC-exception=
-3.1 Autoconf-exception-macro"
> +ERROR_QA:remove:pn-core-image-minimal =3D "license-exception"
> +
> +require conf/distro/include/no-gplv3.inc
> +"""
> +
> +    # Verify that host tools in the SDK (nativesdk, cross-canadian) are =
not
> +    # checked against the image's INCOMPATIBLE_LICENSE, the same as at p=
arse
> +    # time
> +    def test_sdk_host_gpl3(self):
> +        self.write_config(self.default_config() + '\nTOOLCHAIN_HOST_TASK=
:append:pn-core-image-minimal =3D " nativesdk-bash"')
> +
> +        bitbake('core-image-minimal -c populate_sdk')
> +
> +    # Verify that target packages in the SDK sysroot are still checked
> +    # against the image's INCOMPATIBLE_LICENSE
> +    def test_sdk_target_gpl3(self):
> +        self.write_config(self.default_config() + '\nTOOLCHAIN_TARGET_TA=
SK:append:pn-core-image-minimal =3D " which"')
> +        error_msg =3D "ERROR: core-image-minimal-1.0-r0 do_populate_sdk:=
 Some packages cannot be installed into the image because they have incompa=
tible licenses:\n\twhich (GPL-3.0-or-later)"
> +
> +        result =3D bitbake('core-image-minimal -c populate_sdk', ignore_=
status=3DTrue)
> +        if error_msg not in result.output:
> +            raise AssertionError(result.output)
> +
>  class NoGPL3InImagesTests(OESelftestTestCase):
>      def test_core_image_minimal(self):
>          self.write_config("""
> --=20
> 2.56.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250156): https://lists.openembedded.org/g/openembedde=
d-core/message/250156
> Mute This Topic: https://lists.openembedded.org/mt/122244713/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



