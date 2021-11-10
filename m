Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3E4C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 21:06:51 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1446.1636578410521100702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 13:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Fhuwl1iL;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636578410;
  x=1668114410;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=r3KQVJDrAcukGOMGQZCSrK9WA8zBmj5XeGY7DrSsR98=;
  b=Fhuwl1iLtQAjiX2w7EXAgQ1HjQB78o28PkZ/NlFha/WWksbnIB+TrwBJ
   NYrhYnlTMCIL3qI0RUvIlBz5RYL9tz0xbYl++yG6iq4LHeC873Kym+JW3
   1ecjpZ9CKTn3HpUEB5aTlkEaTKFvw++cH+b058zpZS8YC4lZnbezpwIOZ
   X3wPYeNrbxZ2636h3+uor8UWpIzItAIq74dBPlULdtP13zLyuRWJxjRu6
   62qWaJ8BHwyEb+DY7uKYYZh3nWJPjDkFo5o8y4t/pdJygH8YXXH1Cxstz
   z/9oCibq3khvBdTPJLypk8DsSaHmCVm5GH6D4b7pikNUm2R0gv1fjOKaL
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] meta: use ln -rs instead of lnr
Thread-Topic: [OE-core] [PATCH] meta: use ln -rs instead of lnr
Thread-Index: AQHX1iPk1zxMSKwyDE2lIg387sE4Xqv9Ps8g
Date: Wed, 10 Nov 2021 21:06:47 +0000
Message-ID: <e04e01a9a97a4479a1b65c42fe9f464b@axis.com>
References: <20211110111234.2187460-1-ross.burton@arm.com>
In-Reply-To: <20211110111234.2187460-1-ross.burton@arm.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 21:06:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158111

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 10 november 2021 12:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] meta: use ln -rs instead of lnr
>=20
> lnr is a script in oe-core that creates relative symlinks, with the same
> behaviour as `ln --relative --symlink`.  It was added back in 2014[1] as
> not all of the supported host distributions at the time shipped
> coreutils 8.16, the first release with --relative.
>=20
> However the oldest coreutils release in the supported distributions is
> now 8.22 in CentOS 7, so lnr can be deprecated and users switched to ln.
>=20
> [1] 6ae3b85eaffd1b0b6914422e8de7c1230723157d
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/image.bbclass                             | 10 +++++-----
>  meta/classes/populate_sdk_ext.bbclass                  |  4 ++--
>  meta/recipes-core/glibc/glibc-package.inc              |  4 ++--
>  .../images/build-appliance-image_15.0.0.bb             |  2 +-
>  meta/recipes-core/musl/gcompat_git.bb                  |  2 +-
>  meta/recipes-core/musl/musl_git.bb                     |  2 +-
>  meta/recipes-core/ncurses/ncurses.inc                  |  4 ++--
>  meta/recipes-core/os-release/os-release.bb             |  2 +-
>  meta/recipes-devtools/dnf/dnf_4.10.0.bb                |  4 ++--
>  meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb         |  2 +-
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb       |  2 +-
>  meta/recipes-kernel/kmod/kmod_git.bb                   |  4 ++--
>  meta/recipes-kernel/linux/kernel-devsrc.bb             |  2 +-
>  13 files changed, 22 insertions(+), 22 deletions(-)
>=20

[cut]

> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 64cce329aa..3f04545465 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -242,10 +242,10 @@ do_install() {
>              mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
>              rm ${D}${libdir}/libtinfo.so
>=20
> -            # Use lnr to ensure this is a relative link despite absolute=
 paths
> +            # Use ln -rs to ensure this is a relative link despite absol=
ute paths
>              # (as we can't know the relationship between base_libdir and=
 libdir).
>              # At some point we can rely on coreutils 8.16 which has ln -=
r.

The last line of the comment can be removed.

> -            lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.=
so
> +            ln -rs ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtin=
fo.so
>          fi
>          if [ -d "${D}${includedir}/ncurses" ]; then
>              for f in `find ${D}${includedir}/ncurses -name "*.h"`

[cut]

//Peter

