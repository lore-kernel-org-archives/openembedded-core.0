Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2481.1632433322656286971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 14:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MGqjB26C;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1632433323;
  x=1663969323;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+NVombtJVrcEy6w9yJHVJKi/4QwOINc++OTBI+ZSQjw=;
  b=MGqjB26Came5lcaZoxOpGbfEM07Gf02vAdQNKxg/TtZ5I2TCnIDl6gYa
   RtY2nVEwZtY4ud0u4w/6v1526uSPR+NuuquCavprKONYi9GzbremJXGeO
   tK6cVDRnSwo9gsSxpioC9HTQCd+1jK8oQ3PrUrTWFpE9sg2cRdQ397FD0
   YHpVg2SYtpLC6nZJzK4xTJwuPSGMcgXEbgD+jhWpOyztE6kIMaH2SdHpC
   KlNlZAQ/1pfLvF1khREWYfS+KzuxJgcRGglNWvujFPzCZi4Gn3zCQR0+3
   u2hB+3eH5X3ZEBDZHC+lngZe/D2aJK/JlNDsnezBkVpB6JL5cIP9rEGOP
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
Thread-Topic: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive
 do_build task dependencies
Thread-Index: AQHXrh29G9YzyjgDqUqpIbZuq8InFauyKHaw
Date: Thu, 23 Sep 2021 21:41:59 +0000
Message-ID: <c6c0603017b848fea5650c2a2273e66b@axis.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 20 september 2021 14:46
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive
> do_build task dependencies
>=20
> This is a controversial change which removes the recursive dependencies
> from the do_build target of packaging tasks of recipes.
>=20
> Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> the packaging tasks run for all packaging backends enabled for all recipe=
s
> in the dependency chain. The same therefore then applies to images.
>=20
> We don't actually need that, it is a convinience thing. Removing it
> massively simplifies the task graph and causes much fewer tasks to execut=
e
> in many common scenarios. It also means less sstate is fetched for
> example when building an image.
>=20
> This means when building a recipe all package formats would be built
> but when building an image, only the format used by the image would be
> generated. This should be an improvement in most cases but some CI system=
s
> may need to be explict about what they're building.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_deb.bbclass | 5 +----
>  meta/classes/package_ipk.bbclass | 4 +---
>  meta/classes/package_rpm.bbclass | 4 +---
>  3 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> index eca43e17876..77caaa55c8f 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -315,10 +315,7 @@ python do_package_write_deb () {
>  do_package_write_deb[dirs] =3D "${PKGWRITEDIRDEB}"
>  do_package_write_deb[cleandirs] =3D "${PKGWRITEDIRDEB}"
>  do_package_write_deb[depends] +=3D
> "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> 'do_populate_sysroot')}"
> -addtask package_write_deb after do_packagedata do_package
> -
> +addtask package_write_deb after do_packagedata do_package before do_buil=
d
>=20
>  PACKAGEINDEXDEPS +=3D "dpkg-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS +=3D "apt-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] +=3D "do_package_write_deb"
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index c3b53854e8b..998e18ba6c1 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -274,9 +274,7 @@ python do_package_write_ipk () {
>  do_package_write_ipk[dirs] =3D "${PKGWRITEDIRIPK}"
>  do_package_write_ipk[cleandirs] =3D "${PKGWRITEDIRIPK}"
>  do_package_write_ipk[depends] +=3D
> "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> 'do_populate_sysroot')}"
> -addtask package_write_ipk after do_packagedata do_package
> +addtask package_write_ipk after do_packagedata do_package before do_buil=
d
>=20
>  PACKAGEINDEXDEPS +=3D "opkg-utils-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS +=3D "opkg-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] +=3D "do_package_write_ipk"
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 88d861c0e75..60f8299d965 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -748,9 +748,7 @@ python do_package_write_rpm () {
>  do_package_write_rpm[dirs] =3D "${PKGWRITEDIRRPM}"
>  do_package_write_rpm[cleandirs] =3D "${PKGWRITEDIRRPM}"
>  do_package_write_rpm[depends] +=3D
> "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> 'do_populate_sysroot')}"
> -addtask package_write_rpm after do_packagedata do_package
> +addtask package_write_rpm after do_packagedata do_package before do_buil=
d
>=20
>  PACKAGEINDEXDEPS +=3D "rpm-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS +=3D "createrepo-c-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] +=3D "do_package_write_rpm"
> --
> 2.32.0

I just wanted to give some positive feedback now that this has been=20
integrated. This patch alone reduced the number of edges in the task=20
graph by 50% for one of our typical products (from 127721 to 64785).=20
That is pretty impressive!

And to add to this, the later patch that removes the use of the meta=20
class reduced the number of nodes in the task graph by 10% (from 17122=20
to 15313). Also pretty impressive for such a small change.

//Peter
