Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch [79.135.106.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7521.1794985511618561547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 23:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=aett+1rF;
 spf=pass (domain: geanix.com, ip: 79.135.106.100, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794985507; x=1795244707;
	bh=3pJRPcD9M14IN2Q8sO+D/pgNevpGsFHcs6R4mULACDg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aett+1rFW0uLnfqHceusGGrvPsIZrNp9Q6rkpzwQZcyLindn0UBMpTVFjwxuOBpFi
	 eKYRyHYq9I1iujzuvUxBJmAsSdp1RW9lLejRRpoL6Z1NWEoFNgkVuJ9awOmt+IGxni
	 PUYqHPuWiYH1WJTkFF/1Wac6gmNHNxJOGw1dBYKSSA6vaFLKue6RqcxaqFYSZF4Nv3
	 Y1Rz0Ul32m+bg2LKKgDoRjBCi3bD81IPj/wbTOHP2USrxtwpftmJR0W8pT5LC0YyUr
	 iAhZws5g8Lqj+YlLQCjbRsUlK2kaZRVudqLS51SYjFvk3N0sqFbJkFG59Oq2Uvp1L7
	 NZDCoOltsRclA==
Date: Wed, 18 Nov 2026 07:05:01 +0000
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Message-ID: <46D00DCD-2239-4A77-B776-EC59838FD31E@geanix.com>
In-Reply-To: <DB5PR02MB10213B63F5917CAD5A8070AB4EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-3-sean@geanix.com> <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com> <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com> <DB5PR02MB10213B63F5917CAD5A8070AB4EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: db6047d46d646ff0fb32db2b247938b56a8257b2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 07:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250519



> On 17 Nov 2026, at 16.09, Peter Kjellerstedt <peter.kjellerstedt@axis.com=
> wrote:
>=20
>> -----Original Message-----
>> From: Sean Nyekjaer <sean@geanix.com>
>> Sent: den 17 november 2026 14:27
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPA=
TIBLE_LICENSE to SDK host tools
>>=20
>>> On 17 Nov 2026, at 14.04, Peter Kjellerstedt <peter.kjellerstedt@axis.c=
om> wrote:
>>>=20
>>>> -----Original Message-----
>>>> From: Sean Nyekjaer via openembedded-core <sean=3Dgeanix.com@lists.ope=
nembedded.org>
>>>> Sent: den 17 november 2026 13:02
>>>> To: openembedded-core@lists.openembedded.org
>>>> Cc: Sean Nyekjaer <sean@geanix.com>
>>>> Subject: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATI=
BLE_LICENSE to SDK host tools
>>>>=20
>>>> Since the SDK host and target sysroots are passed through
>>>> write_license_files(), do_populate_sdk checks every nativesdk and
>>>> cross-canadian package against the image's INCOMPATIBLE_LICENSE and
>>>> fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":
>>>>=20
>>>> Some packages cannot be installed into the image because they have
>>>> incompatible licenses:
>>>>       nativesdk-autoconf (GPL-3.0-or-later)
>>>>=20
>>>> At parse time skip_incompatible_package_licenses() exempts these
>>>> recipes, so they are built and packaged, and only the SDK manifest
>>>> step rejects them. Use incompatible_license_check_needed() in
>>>> write_license_files() too, so host tools in the SDK are treated the
>>>> same way. Target packages in the image and in the SDK target sysroot
>>>> are still checked.
>>>>=20
>>>> Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
>>>> AI-Generated: Claude Opus 5.5 (Claude Code)
>>>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>>>> ---
>>>> meta/classes-recipe/license_image.bbclass | 13 ++++++++++---
>>>> 1 file changed, 10 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-=
recipe/license_image.bbclass
>>>> index 7d00b1ae53..728db8ae3a 100644
>>>> --- a/meta/classes-recipe/license_image.bbclass
>>>> +++ b/meta/classes-recipe/license_image.bbclass
>>>> @@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg=
_dic, rootfs):
>>>>=20
>>>>            pkg_allow_licenses =3D oe.license.filter_pkg_license_list(p=
kg, allow_licenses)
>>>>=20
>>>> +            # Host tools in the SDK (nativesdk, cross-canadian) are n=
ot
>>>> +            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
>>>> +            if oe.license.incompatible_license_check_needed(d, pkg_di=
c[pkg]["PN"]):
>>>> +                pkg_bad_licenses =3D bad_licenses
>>>> +            else:
>>>> +                pkg_bad_licenses =3D []
>>>> +
>>>>            if node:
>>>> -                if incompatible_licenses :=3D oe.license.license_allo=
wed(node, bad_licenses, pkg_allow_licenses):
>>>> +                if incompatible_licenses :=3D oe.license.license_allo=
wed(node, pkg_bad_licenses, pkg_allow_licenses):
>>>>                    incompatible_packages.append("%s (%s)" % (pkg, ' '.=
join(n.to_string() for n in incompatible_licenses)))
>>>> -                elif incompatible_licenses :=3D oe.license.license_al=
lowed(node, bad_licenses, []):
>>>> +                elif incompatible_licenses :=3D oe.license.license_al=
lowed(node, pkg_bad_licenses, []):
>>>>                    oe.qa.handle_error('license-exception', "Including =
%s with incompatible license(s) %s into the image, because it has been allo=
wed by exception list." %
>>>>                                       (pkg, ' '.join(n.to_string() for=
 n in incompatible_licenses)), d)
>>>>=20
>>>>            (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
>>>>                oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"]=
,
>>>> -                                             bad_licenses, pkg_allow_=
licenses)
>>>> +                                             pkg_bad_licenses, pkg_al=
low_licenses)
>>>>=20
>>>>            if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
>>>>                # Rootfs manifest
>>>> --
>>>> 2.56.0
>>>=20
>>> IANAL, but for the record, I believe you risk violating the (L)GPL-3 li=
cense
>>> if you distribute an SDK after applying the above, and then do not comp=
ly
>>> with the license requirements of the (L)GPL-3 license. And the whole po=
int of
>>> using INCOMPATIBLE_LICENSE =3D "*GPL-3.0*" in your configuration is to =
avoid this
>>> risk.
>>>=20
>>> Since the GPL license is all about what you distribute, it does not mat=
ter if it
>>> is target or native tools, you are *distributing* them all as part of t=
he SDK.
>>>=20
>>> Thus I believe it is wrong to apply this, but if it is applied, it shou=
ld be
>>> opt-in, and come with a massive warning.
>>>=20
>>> //Peter
>>>=20
>>=20
>> Thanks for the review.
>>=20
>> The problem is that until recently INCOMPATIBLE_LICENSE never covered th=
e
>> SDK. My build broke after commit f757ae4dadab ("license_image: extend to
>> SDK coverage"), which started checking the SDK host and target sysroots
>> in do_populate_sdk.
>>=20
>> So "GPL-3.0*" has never given a GPLv3-free SDK.
>>=20
>> The documentation also describes INCOMPATIBLE_LICENSE in terms of the
>> build and images: it excludes licenses "from the build (if set
>> globally), or from an image (if set locally in an image recipe)", and
>> recommends setting it "in specific image recipes". I read "image" as the
>> target image you deploy, not the SDK built from it. My customer has to
>> keep GPLv3 out of the target image but is fine with GPLv3 in the SDK,
>> which is exactly what worked before.
>>=20
>> That said, I see the value of being able to check the SDK too. How about
>> a separate variable, e.g. INCOMPATIBLE_LICENSE_SDK, that do_populate_sdk
>> checks the SDK host packages against? Target packages in the SDK target
>> sysroot would still be checked against INCOMPATIBLE_LICENSE, as with thi=
s
>> series.
>>=20
>> The open question is the default:
>> - INCOMPATIBLE_LICENSE_SDK ?=3D "${INCOMPATIBLE_LICENSE}" keeps the
>>  current master behaviour, and the rest of us have to opt out.
>>=20
>> /Sean
>=20
> The way we solved the above when the license check for the SDK was introd=
uced
> was to add explicit exceptions for the nativesdk packages, e.g.:
>=20
> AXIS_SDK_LICENSE_EXCEPTIONS +=3D " \
>    binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>    elfutils-dev:GPL-3.0-or-later \
>    gawk:GPL-3.0-or-later \
>    gawk-dev:AGPL-3.0-or-later \
>    gawk-dev:GPL-3.0-or-later \
>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-or-later \
>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-or-later \
>    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-only \
>    ...
> "
>=20
> We put them in a separate variable, which we only add to
> INCOMPATIBLE_LICENSE_EXCEPTIONS in the image recipe we use to build our S=
DK.
> That way the exceptions do not affect our normal images, but at the same
> time we have documented every tool and exception so that we can be sure t=
o
> comply with their licenses.

Thanks, that answers my question from [0] :)

Seems very cumbersome when we don=E2=80=99t really care about licenses in t=
he SDK.

/Sean


[0]: https://lore.kernel.org/openembedded-core/F1E91B20-6F2B-413B-B4B2-3EF9=
769D0E6B@geanix.com/



