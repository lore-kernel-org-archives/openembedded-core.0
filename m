Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87F7C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 12:05:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6778.1675857916582785218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 04:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ia0qUsJA;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dr8so50579539ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FnhmCOyvCDpiTZGN8i90Jj2YxFXO2LtY8Fr4Fw8Y28=;
        b=ia0qUsJAqulB23xjkMOcCMoJN9QpprpX/V9EmetWe9zYTAbDIEKHk1MGk/JnE/OkI2
         m/lBp5teZWQKMzrElRwIqxDPIv+V61K7xKiAtDpoHXY6fUG48TiY9d893NU0rrSHucBH
         M+U5RQkBW54Vj7NyWqMf3udjQ1DlVAr2FXRasu1tD71DdxwJzgBxYtwCGidgpNDGXDQN
         7T+ACWdkXDHdyIfbUuL2wLFMgd/KEtgjydsEjuDviPGKZx1zQDimzjc7LxGz0p9WTLnD
         Y+Vl2vhLah9rCm+mHJMBOvXFPW53NamLG3hLq2zmoCGdW9iG5waAUzGAF3Cz1q/5GIXL
         zZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1FnhmCOyvCDpiTZGN8i90Jj2YxFXO2LtY8Fr4Fw8Y28=;
        b=T/Tp9ooWSuUNJ/5+PP4L7MwA5f84OfydJ/dBPlpnXTwJpM+FjUWsvTbYUsS4oZXJ2O
         gIyC8TnnWVTBd/OOwOAnwMaw4BOJicWb0TLxvXC9YQmelzGSdGUAv/c1Sbr/SFuIgyqN
         fac2spp29k8IojbN4ljCyVAFVtrsfAtSi63mBpSm0ArzLnvQghCh177btPvbyrDkVs6M
         8pdfi9tzsmY+vBgj1EHsWMUmSflkwqwqSszL9lzBeXZel055hU3qpMwUtzAxQpLiym9T
         w6u3xWO6eZhysypME81g51JkVx5rVw8wjBHOGcPjTNsjRkwc2tlL/8FA1BVjtHdOv9ev
         8QQg==
X-Gm-Message-State: AO0yUKVOcCOxMhNM9AZga4RN5nqmRBy1T4uVB7rhMqQGq+VdZvJq4K0A
	q9DUEtl2M1wTAShhsGShdz0=
X-Google-Smtp-Source: AK7set+RyZC6GjINTPE1OuJ0ZZIDnC1QA5bpzziyYZSjJKr6jAWHd/ZQHujXz5FJTMuz6t69va0WEg==
X-Received: by 2002:a17:907:3f8d:b0:8ae:d3c9:1db7 with SMTP id hr13-20020a1709073f8d00b008aed3c91db7mr1374262ejc.73.1675857914946;
        Wed, 08 Feb 2023 04:05:14 -0800 (PST)
Received: from af-t14s.fritz.box ([2a02:169:59a6:0:7a64:6468:db40:2e95])
        by smtp.gmail.com with ESMTPSA id m17-20020a1709062ad100b0084d4733c428sm8118593eje.88.2023.02.08.04.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 04:05:14 -0800 (PST)
Message-ID: <1a578f1a72b9c957d8bf980218d6b9a150612690.camel@gmail.com>
Subject: Re: [OE-core][PATCH 2/3] systemd.bbclass: add non-recursive service
 packaging
From: adrian.freihofer@gmail.com
To: Peter Marko <peter.marko@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Feb 2023 13:05:13 +0100
In-Reply-To: <20230208071251.5412-3-peter.marko@siemens.com>
References: <20230208071251.5412-1-peter.marko@siemens.com>
	 <20230208071251.5412-3-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 12:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176903

On Wed, 2023-02-08 at 08:12 +0100, Peter Marko wrote:
> When service is split to separate package, it will take
> all services it depends on. It does not matter is the dependency
> is strong or week or if there is rdepends/rrecommends which would
> be the proper way to pull it.
>=20
> New variable SYSTEMD_PACKAGES_DONT_RECURSE allows to
> skip this recursion for packages which are extracted to a package.
> It is mostly useful for catch-all main package and splitting
> additional packages with PACKAGE_BEFORE_PN.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0documentation/ref-manual/variables.rst | 10 ++++++++++
> =C2=A0meta/classes-recipe/systemd.bbclass=C2=A0=C2=A0=C2=A0 | 15 ++++++++=
-------
> =C2=A02 files changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 725f5c54cc..910b99aed2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8271,6 +8271,16 @@ system and gives an overview of their function
> and contents.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`SYSTEMD_PACKAGES`. Overrides =
not included in
> :term:`SYSTEMD_PACKAGES`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be silently ignored.
> =C2=A0
> +=C2=A0=C2=A0 :term:`SYSTEMD_PACKAGES_DONT_RECURSE`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 By default service files declared in :ter=
m:`SYSTEMD_SERVICE`
> are scanned
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and all related service files are added t=
o parsed package
> recursively.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It allows more readable and future-proof =
recipes, however it
> does not work well
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when services are split to separate packa=
ges. This variable
> prevents this behavior.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Here is an example from systemd recipe::
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYSTEMD_PACKAGES_DONT_R=
ECURSE:${PN}-networkd =3D "1"
> +
> =C2=A0=C2=A0=C2=A0 :term:`SYSVINIT_ENABLED_GETTYS`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When using
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :ref:`SysVinit <dev-manual/new-recip=
e:enabling system
> services>`,
> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-
> recipe/systemd.bbclass
> index f9c92e6c2a..c8cee482fe 100644
> --- a/meta/classes-recipe/systemd.bbclass
> +++ b/meta/classes-recipe/systemd.bbclass
> @@ -124,19 +124,19 @@ python systemd_populate_packages() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return appended
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Add systemd files to FILES:*-systemd, parse fo=
r Also=3D and
> follow recursive
> -=C2=A0=C2=A0=C2=A0 def systemd_add_files_and_parse(pkg_systemd, path, se=
rvice,
> keys):
> +=C2=A0=C2=A0=C2=A0 def systemd_add_files_and_parse(pkg_systemd, path, se=
rvice,
> keys, recurse):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # avoid infinite recursi=
on
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if systemd_append_file(pkg_sy=
stemd, oe.path.join(path,
> service)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if systemd_append_file(pkg_sy=
stemd, oe.path.join(path,
> service)) and recurse:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
fullpath =3D oe.path.join(d.getVar("D"), path, service)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if service.find('.service') !=3D -1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # for *.service add *@.service
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 service_base =3D service.replace('.service', '')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '@.service', keys)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '@.service', keys, recurse)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if service.find('.socket') !=3D -1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # for *.socket add *.service and *@.service
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 service_base =3D service.replace('.socket', '')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '.service', keys)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '@.service', keys)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '.service', keys, recurse)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_systemd, path,
> service_base + '@.service', keys, recurse)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for key in keys.split():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # recurse all dependencies found in keys
> ('Also';'Conflicts';..) and add to files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "grep %s %s | sed 's,%s=3D,,g' | tr ',' '\=
\n'" %
> (key, shlex.quote(fullpath), key)
> @@ -144,7 +144,7 @@ python systemd_populate_packages() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 line =3D pipe.readline()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 while line:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D line.replace('\n'=
, '')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_=
systemd, path,
> line, keys)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_=
systemd, path,
> line, keys, recurse)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D pipe.readline()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pipe.close()
> =C2=A0
> @@ -157,6 +157,7 @@ python systemd_populate_packages() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keys =3D 'Also'

There would probably be another solution without introducing a new
SYSTEMD_PACKAGES_DONT_RECURSE variable. But that would require a fix
for the systemd.bbclass, which is a bit hard to test.

To me, it looks like the issue is that systemd.bbclass looks for
service files with "Also" in them. Depending on that, it changes the
FILES variable of packages. However, according to
https://www.freedesktop.org/software/systemd/man/systemd.unit.html#Also=3D
"Also" means that a package with such a service file depends on another
package. This means that systemd.bbclass should change the RDEPENDS
variable but not the FILES variable. This bug potentially causes
service files to end up in the wrong package and that should be fixed.

My first thought was to fix the class as it was probably originally
intended. Instead of altering the FILES variable it should
automatically add packages to the RDEPENDS variable which are referred
by service files in this package with "Also".

However, since the "Also" could potentially also refer from a service
file provided by one recipe to a service file provided by another
recipe this saems not to be a complete solution.

Maybe the best would be:
1. Fix the invalid packaging by deleting the code from systemd.bbclass
which handles the "Also" service files:

            for key in keys.split():
                # recurse all dependencies found in keys
('Also';'Conflicts';..) and add to files
                cmd =3D "grep %s %s | sed 's,%s=3D,,g' | tr ',' '\\n'" %
(key, shlex.quote(fullpath), key)
                pipe =3D os.popen(cmd, 'r')
                line =3D pipe.readline()
                while line:
                    line =3D line.replace('\n', '')
                    systemd_add_files_and_parse(pkg_systemd, path,
line, keys)
                    bb.warn("After: %s : %s" % (pkg_systemd, path))
                    line =3D pipe.readline()
                pipe.close()

2. This might results in build failures because of not packaged service
files. That's not only bad because the automatic packaging was
potentially wrong anyway. The build failures need to be fixed manually
by adding the service files to the FILES variables of the broken
recipes.
3. To prevent the risk of building images with service files refering
to packages which are not in the image, a QA check on image level could
be added. I'm thinkg about grepping for "After" in all systemd units an
verify the referred file is in the image.

I'm going to analyze how many recipes in poky would be affected by such
a fix. Does that make sense?

Regards,
Adrian


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # scan for all in SYSTEM=
D_SERVICE[]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pkg_systemd in syste=
md_packages.split():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recur=
se =3D False if
> d.getVar('SYSTEMD_PACKAGES_DONT_RECURSE:' + pkg_systemd) else True
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for service in get_package_var(d, 'SYSTEMD_SERVICE',
> pkg_systemd).split():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 path_found =3D ''
> =C2=A0
> @@ -178,7 +179,7 @@ python systemd_populate_packages() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if path_found !=3D '':
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_=
systemd,
> path_found, service, keys)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd_add_files_and_parse(pkg_=
systemd,
> path_found, service, keys, recurse)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Didn't find serv=
ice unit '{0}',
> specified in SYSTEMD_SERVICE:{1}. {2}".format(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
rvice, pkg_systemd, "Also looked for
> service unit '{0}'.".format(base) if base is not None else ""))
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176838):
> https://lists.openembedded.org/g/openembedded-core/message/176838
> Mute This Topic: https://lists.openembedded.org/mt/96825675/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


