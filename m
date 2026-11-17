Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17931.1794922018405612884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=nNW1JJcl;
 spf=pass (domain: geanix.com, ip: 79.135.106.26, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794922015; x=1795181215;
	bh=6ViwgXiOLl9u9zfwxwygvBBlZOQZ/ysFYpVfTkLUOss=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nNW1JJcl5I64014z4dUiD62z9/AdAO8h7P1wPPkggc8uQbTGIDQQmeas3bbxuXSAi
	 2TlIz6I1Oty73F6BUU/t+ahPtn/l81nNr65U7vvAal1b/thVjjOxd62/HymNYfvknN
	 gVbMHlATYeM5ooWEHr2rGiYYLH2d/HdJuAk8avhavzmWM0tcRerBhsZrVrzC3yl+lF
	 pu56Xn0juXB4+tI+RumbTrRQAxFwNtC6nOmdOD1/sLfKneH7c6ACQuEfgQ1Z8zLEBN
	 gQGBAaT7QLjDEy3KY+Pskti9/nVNwBBg3LChRjf/RSOXsekN0CXs1sDRiP07HeAf3K
	 FDOWPCk21amIQ==
Date: Tue, 17 Nov 2026 13:26:52 +0000
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Message-ID: <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com>
In-Reply-To: <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-3-sean@geanix.com> <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: bd6245970f8de929640ba011185b7dc19a06dd53
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250450



> On 17 Nov 2026, at 14.04, Peter Kjellerstedt <peter.kjellerstedt@axis.com=
> wrote:
>=20
>> -----Original Message-----
>> From: Sean Nyekjaer via openembedded-core <sean=3Dgeanix.com@lists.opene=
mbedded.org>
>> Sent: den 17 november 2026 13:02
>> To: openembedded-core@lists.openembedded.org
>> Cc: Sean Nyekjaer <sean@geanix.com>
>> Subject: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATIBL=
E_LICENSE to SDK host tools
>>=20
>> Since the SDK host and target sysroots are passed through
>> write_license_files(), do_populate_sdk checks every nativesdk and
>> cross-canadian package against the image's INCOMPATIBLE_LICENSE and
>> fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":
>>=20
>>  Some packages cannot be installed into the image because they have
>>  incompatible licenses:
>>        nativesdk-autoconf (GPL-3.0-or-later)
>>=20
>> At parse time skip_incompatible_package_licenses() exempts these
>> recipes, so they are built and packaged, and only the SDK manifest
>> step rejects them. Use incompatible_license_check_needed() in
>> write_license_files() too, so host tools in the SDK are treated the
>> same way. Target packages in the image and in the SDK target sysroot
>> are still checked.
>>=20
>> Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
>> AI-Generated: Claude Opus 5.5 (Claude Code)
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>> meta/classes-recipe/license_image.bbclass | 13 ++++++++++---
>> 1 file changed, 10 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-re=
cipe/license_image.bbclass
>> index 7d00b1ae53..728db8ae3a 100644
>> --- a/meta/classes-recipe/license_image.bbclass
>> +++ b/meta/classes-recipe/license_image.bbclass
>> @@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_d=
ic, rootfs):
>>=20
>>             pkg_allow_licenses =3D oe.license.filter_pkg_license_list(pk=
g, allow_licenses)
>>=20
>> +            # Host tools in the SDK (nativesdk, cross-canadian) are not
>> +            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
>> +            if oe.license.incompatible_license_check_needed(d, pkg_dic[=
pkg]["PN"]):
>> +                pkg_bad_licenses =3D bad_licenses
>> +            else:
>> +                pkg_bad_licenses =3D []
>> +
>>             if node:
>> -                if incompatible_licenses :=3D oe.license.license_allowe=
d(node, bad_licenses, pkg_allow_licenses):
>> +                if incompatible_licenses :=3D oe.license.license_allowe=
d(node, pkg_bad_licenses, pkg_allow_licenses):
>>                     incompatible_packages.append("%s (%s)" % (pkg, ' '.j=
oin(n.to_string() for n in incompatible_licenses)))
>> -                elif incompatible_licenses :=3D oe.license.license_allo=
wed(node, bad_licenses, []):
>> +                elif incompatible_licenses :=3D oe.license.license_allo=
wed(node, pkg_bad_licenses, []):
>>                     oe.qa.handle_error('license-exception', "Including %=
s with incompatible license(s) %s into the image, because it has been allow=
ed by exception list." %
>>                                        (pkg, ' '.join(n.to_string() for =
n in incompatible_licenses)), d)
>>=20
>>             (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
>>                 oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
>> -                                             bad_licenses, pkg_allow_li=
censes)
>> +                                             pkg_bad_licenses, pkg_allo=
w_licenses)
>>=20
>>             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
>>                 # Rootfs manifest
>> --
>> 2.56.0
>=20
> IANAL, but for the record, I believe you risk violating the (L)GPL-3 lice=
nse
> if you distribute an SDK after applying the above, and then do not comply
> with the license requirements of the (L)GPL-3 license. And the whole poin=
t of
> using INCOMPATIBLE_LICENSE =3D "*GPL-3.0*" in your configuration is to av=
oid this
> risk.
>=20
> Since the GPL license is all about what you distribute, it does not matte=
r if it
> is target or native tools, you are *distributing* them all as part of the=
 SDK.
>=20
> Thus I believe it is wrong to apply this, but if it is applied, it should=
 be
> opt-in, and come with a massive warning.
>=20
> //Peter
>=20

Thanks for the review.

The problem is that until recently INCOMPATIBLE_LICENSE never covered the
SDK. My build broke after commit f757ae4dadab ("license_image: extend to
SDK coverage"), which started checking the SDK host and target sysroots
in do_populate_sdk.

So "GPL-3.0*" has never given a GPLv3-free SDK.=20

The documentation also describes INCOMPATIBLE_LICENSE in terms of the
build and images: it excludes licenses "from the build (if set
globally), or from an image (if set locally in an image recipe)", and
recommends setting it "in specific image recipes". I read "image" as the
target image you deploy, not the SDK built from it. My customer has to
keep GPLv3 out of the target image but is fine with GPLv3 in the SDK,
which is exactly what worked before.

That said, I see the value of being able to check the SDK too. How about
a separate variable, e.g. INCOMPATIBLE_LICENSE_SDK, that do_populate_sdk
checks the SDK host packages against? Target packages in the SDK target
sysroot would still be checked against INCOMPATIBLE_LICENSE, as with this
series.

The open question is the default:
- INCOMPATIBLE_LICENSE_SDK ?=3D "${INCOMPATIBLE_LICENSE}" keeps the
  current master behaviour, and the rest of us have to opt out.

/Sean



