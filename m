Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6448C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 11:36:56 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.6355.1675856210874496885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 03:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IOW9Yil4;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675856211;
  x=1707392211;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HjvK5/kKHJA2hDc4klGjRWGn/FcZt6S9dkaYykeUpjg=;
  b=IOW9Yil4AmXXbw7l+Kkk2syLM5H8A6aJpTpc4MGGsACalwUpDwOwZ9Yf
   o8SkkVwu+c4J5kYGDA8mCZeL5R+9VV/l0aIT1OqLga9fP4mhoNBMw/taB
   jV5zOO3VC2kna4wjhit+oN5B6clQHT0T4+MVgTT0MWK3R8073fIG31+ki
   tW3NFG1TbLuV3PkynVVntDtaxyN9bIYo6pfZRu1/L8ulo13kQCWYQhOht
   eppsrpmGuAQeYG5kVVd7SnuX+Zr0FZRX5RToK0r+s/TG8xGbIDUe6LX/2
   F9kL3uRw64M1vHlE8AuXtwRYPDgtBNfsRQ5sBxHSeR77DcmV6sAVJVrY2
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Marko <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/3] systemd.bbclass: add non-recursive service
 packaging
Thread-Topic: [OE-core][PATCH 2/3] systemd.bbclass: add non-recursive service
 packaging
Thread-Index: AQHZO4z2JY4LASCd90OxvswE3LN9Sa7E5mHg
Date: Wed, 8 Feb 2023 11:36:48 +0000
Message-ID: <d25f1d09141d45378810e428c836106c@axis.com>
References: <20230208071251.5412-1-peter.marko@siemens.com>
 <20230208071251.5412-3-peter.marko@siemens.com>
In-Reply-To: <20230208071251.5412-3-peter.marko@siemens.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 11:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176901

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Marko
> Sent: den 8 februari 2023 08:13
> To: openembedded-core@lists.openembedded.org
> Cc: Peter Marko <peter.marko@siemens.com>
> Subject: [OE-core][PATCH 2/3] systemd.bbclass: add non-recursive service =
packaging
>=20
> When service is split to separate package, it will take
> all services it depends on. It does not matter is the dependency

Change "is" to "if".

> is strong or week or if there is rdepends/rrecommends which would

Change "week" to "weak".

> be the proper way to pull it.
>=20
> New variable SYSTEMD_PACKAGES_DONT_RECURSE allows to
> skip this recursion for packages which are extracted to a package.
> It is mostly useful for catch-all main package and splitting

Change "catch-all main package" to either "a catch-all main package"=20
or "catch-all main packages".

> additional packages with PACKAGE_BEFORE_PN.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 10 ++++++++++
>  meta/classes-recipe/systemd.bbclass    | 15 ++++++++-------
>  2 files changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 725f5c54cc..910b99aed2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8271,6 +8271,16 @@ system and gives an overview of their function and=
 contents.
>        :term:`SYSTEMD_PACKAGES`. Overrides not included in :term:`SYSTEMD=
_PACKAGES`
>        will be silently ignored.
>=20
> +   :term:`SYSTEMD_PACKAGES_DONT_RECURSE`

Negative variable names should be avoided when possible. I suggest=20
changing this to "SYSTEMD_PACKAGES_RECURSE". See below for how the=20
implementation should be changed.

> +      By default service files declared in :term:`SYSTEMD_SERVICE` are s=
canned
> +      and all related service files are added to parsed package recursiv=
ely.

Change "parsed" to "the parsed".

> +
> +      It allows more readable and future-proof recipes, however it does =
not work well
> +      when services are split to separate packages. This variable preven=
ts this behavior.

Change "prevents" to "can be used to prevent".

> +      Here is an example from systemd recipe::
> +
> +         SYSTEMD_PACKAGES_DONT_RECURSE:${PN}-networkd =3D "1"
> +
>     :term:`SYSVINIT_ENABLED_GETTYS`
>        When using
>        :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/sy=
stemd.bbclass
> index f9c92e6c2a..c8cee482fe 100644
> --- a/meta/classes-recipe/systemd.bbclass
> +++ b/meta/classes-recipe/systemd.bbclass
> @@ -124,19 +124,19 @@ python systemd_populate_packages() {
>          return appended
>=20
>      # Add systemd files to FILES:*-systemd, parse for Also=3D and follow=
 recursive
> -    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
> +    def systemd_add_files_and_parse(pkg_systemd, path, service, keys, re=
curse):
>          # avoid infinite recursion
> -        if systemd_append_file(pkg_systemd, oe.path.join(path, service))=
:
> +        if systemd_append_file(pkg_systemd, oe.path.join(path, service))=
 and recurse:
>              fullpath =3D oe.path.join(d.getVar("D"), path, service)
>              if service.find('.service') !=3D -1:
>                  # for *.service add *@.service
>                  service_base =3D service.replace('.service', '')
> -                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '@.service', keys)
> +                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '@.service', keys, recurse)
>              if service.find('.socket') !=3D -1:
>                  # for *.socket add *.service and *@.service
>                  service_base =3D service.replace('.socket', '')
> -                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '.service', keys)
> -                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '@.service', keys)
> +                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '.service', keys, recurse)
> +                systemd_add_files_and_parse(pkg_systemd, path, service_b=
ase + '@.service', keys, recurse)
>              for key in keys.split():
>                  # recurse all dependencies found in keys ('Also';'Confli=
cts';..) and add to files
>                  cmd =3D "grep %s %s | sed 's,%s=3D,,g' | tr ',' '\\n'" %=
 (key, shlex.quote(fullpath), key)
> @@ -144,7 +144,7 @@ python systemd_populate_packages() {
>                  line =3D pipe.readline()
>                  while line:
>                      line =3D line.replace('\n', '')
> -                    systemd_add_files_and_parse(pkg_systemd, path, line,=
 keys)
> +                    systemd_add_files_and_parse(pkg_systemd, path, line,=
 keys, recurse)
>                      line =3D pipe.readline()
>                  pipe.close()
>=20
> @@ -157,6 +157,7 @@ python systemd_populate_packages() {
>          keys =3D 'Also'
>          # scan for all in SYSTEMD_SERVICE[]
>          for pkg_systemd in systemd_packages.split():
> +            recurse =3D False if d.getVar('SYSTEMD_PACKAGES_DONT_RECURSE=
:' + pkg_systemd) else True

Change to:

            recurse =3D not bb.utils.to_boolean(d.getVar('SYSTEMD_PACKAGES_=
DONT_RECURSE:' + pkg_systemd))

Or preferably, to avoid the negative variable name, change to:

            recurse =3D bb.utils.to_boolean(d.getVar('SYSTEMD_PACKAGES_RECU=
RSE:' + pkg_systemd), True)

You should probably also change "d.getVar('SYSTEMD_PACKAGES_RECURSE:' + pkg=
_systemd)"=20
to "get_package_var(d, 'SYSTEMD_PACKAGES_RECURSE', pkg_systemd)", which=20
would allow setting SYSTEMD_PACKAGES_RECURSE =3D "0" in the recipe to disab=
le=20
recursing for all packages. In that case, also adapt the documentation=20
accordingly.

>              for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_sys=
temd).split():
>                  path_found =3D ''
>=20
> @@ -178,7 +179,7 @@ python systemd_populate_packages() {
>                              break
>=20
>                  if path_found !=3D '':
> -                    systemd_add_files_and_parse(pkg_systemd, path_found,=
 service, keys)
> +                    systemd_add_files_and_parse(pkg_systemd, path_found,=
 service, keys, recurse)
>                  else:
>                      bb.fatal("Didn't find service unit '{0}', specified =
in SYSTEMD_SERVICE:{1}. {2}".format(
>                          service, pkg_systemd, "Also looked for service u=
nit '{0}'.".format(base) if base is not None else ""))
> --
> 2.30.2

//Peter


