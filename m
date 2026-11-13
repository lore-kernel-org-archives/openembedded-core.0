Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9174.1794570276323303024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=KNxGdTYv;
 spf=pass (domain: geanix.com, ip: 109.224.244.22, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794570272; x=1794829472;
	bh=rOGlsWzY6tlXHhTRgwCBUabC2iBAPma5TvFpiS6VWj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KNxGdTYvJcG8hKKO8jNm1vU5/U/lrNcD+Y6LyFA+U8iltNmCybxscmCqmYtAqIJaJ
	 gynDAnI3MjYRjyob6o1lAAtbzcRmp67H1YgqqPFQnmFvoussBEScD5uHvBalB9pFsc
	 54otUm/oGxZnPH0m0l2Ozxz9bAFYHUS4nVHQBtV7TKW7gDQ/ShAkg8yJyNdyVoUmp9
	 GJXjSxgt3SgR4DCDDz4xbbnvRbGW2/Y5GXa1osC0V+Q7oZcCsM0TjeDx9JcAwcfeve
	 cyxuLjvJrXC4V9XcWN3Zzf75MYLZ9SFbd9zinyvHKJoRpw2VLHYEiPHL0kDgGfAa46
	 sfAPjH0LteGMg==
Date: Fri, 13 Nov 2026 11:44:27 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Message-ID: <D66809CA-7F6F-4561-8AB4-638AEC6BE430@geanix.com>
In-Reply-To: <CANNYZj92MutkDoJrXb6Cb+0d4_MWjLhiKswCkJihHyqUSwTsJQ@mail.gmail.com>
References: <20261113101537.3586467-1-sean@geanix.com> <CANNYZj92MutkDoJrXb6Cb+0d4_MWjLhiKswCkJihHyqUSwTsJQ@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 19d20d51110f0457c002a1da55ba3ba845ab3bdc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250164



> On 13 Nov 2026, at 12.39, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> Can you please split this into two patches? One that factors out the chec=
k into its own function, the other would then introduce additional usage of=
 the function.
>=20

Sure.
I will wait with v2 till we have clarification, if we need the variable to =
opt out if the check for the SDK.

/Sean

> Alex
>=20
> On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer via openembedded-core <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
> Since the SDK host and target sysroots are passed through
> write_license_files(), do_populate_sdk checks every nativesdk and
> cross-canadian package against the image's INCOMPATIBLE_LICENSE and
> fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":
>=20
>   Some packages cannot be installed into the image because they have
>   incompatible licenses:
>         nativesdk-autoconf (GPL-3.0-or-later)
>=20
> At parse time skip_incompatible_package_licenses() exempts these
> recipes, so they are built and packaged, and only the SDK manifest
> step rejects them. Move that exemption into
> incompatible_license_check_needed() and use it in write_license_files()
> too, so host tools in the SDK are treated the same way. Target packages
> in the image and in the SDK target sysroot are still checked.
>=20
> Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
> AI-Generated: Claude Opus 5.5 (Claude Code)
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> Patches for the discussion here:
> https://lists.openembedded.org/g/openembedded-core/topic/122226717
>=20
> I would like for this to go into the wrynose branch, but it doesn't
> apply as is.
>=20
>  meta/classes-recipe/license_image.bbclass | 13 +++++++++---
>  meta/lib/oe/license.py                    | 25 ++++++++++++++---------
>  2 files changed, 25 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
> index 7d00b1ae53..728db8ae3a 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
>=20
>              pkg_allow_licenses =3D oe.license.filter_pkg_license_list(pk=
g, allow_licenses)
>=20
> +            # Host tools in the SDK (nativesdk, cross-canadian) are not
> +            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
> +            if oe.license.incompatible_license_check_needed(d, pkg_dic[p=
kg]["PN"]):
> +                pkg_bad_licenses =3D bad_licenses
> +            else:
> +                pkg_bad_licenses =3D []
> +
>              if node:
> -                if incompatible_licenses :=3D oe.license.license_allowed=
(node, bad_licenses, pkg_allow_licenses):
> +                if incompatible_licenses :=3D oe.license.license_allowed=
(node, pkg_bad_licenses, pkg_allow_licenses):
>                      incompatible_packages.append("%s (%s)" % (pkg, ' '.j=
oin(n.to_string() for n in incompatible_licenses)))
> -                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, bad_licenses, []):
> +                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, pkg_bad_licenses, []):
>                      oe.qa.handle_error('license-exception', "Including %=
s with incompatible license(s) %s into the image, because it has been allow=
ed by exception list." %
>                                         (pkg, ' '.join(n.to_string() for =
n in incompatible_licenses)), d)
>=20
>              (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
>                  oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
> -                                             bad_licenses, pkg_allow_lic=
enses)
> +                                             pkg_bad_licenses, pkg_allow=
_licenses)
>=20
>              if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
>                  # Rootfs manifest
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index e2a2bcc47d..035311d469 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -561,23 +561,28 @@ def filter_pkg_license_list(pkg, lst):
>=20
>      return pkg_lst
>=20
> +def incompatible_license_check_needed(d, pn):
> +    """
> +    Return False for recipes that INCOMPATIBLE_LICENSE does not apply to=
:
> +    native, nativesdk, cross and cross-canadian recipes, and gcc-source.
> +    """
> +    if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
> +        return False
> +    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
> +            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> +            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> +        if pn.endswith(d.expand(t)):
> +            return False
> +    return True
> +
>  def skip_incompatible_package_licenses(d, pkgs):
>      if not pkgs:
>          return {}
>=20
>      pn =3D d.getVar("PN")
>=20
> -    check_license =3D False if pn.startswith("nativesdk-") else True
> -    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
> -            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> -            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> -        if pn.endswith(d.expand(t)):
> -            check_license =3D False
> -    if pn.startswith("gcc-source-"):
> -        check_license =3D False
> -
>      bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
> -    if not check_license or not bad_licenses:
> +    if not incompatible_license_check_needed(d, pn) or not bad_licenses:
>          return {}
>=20
>      bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
> --=20
> 2.56.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250157): https://lists.openembedded.org/g/openembedde=
d-core/message/250157
> Mute This Topic: https://lists.openembedded.org/mt/122244714/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



