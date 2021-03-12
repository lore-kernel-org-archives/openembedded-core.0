Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.714.1615567462326667903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nF86uM3C;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615567462;
  x=1647103462;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=n0Nyy30FJ98bVGEx4gKgsIB7QjGRmZDnUlNuom/WAcs=;
  b=nF86uM3CTjifrPglBL3L2B9VQkOktRiIR19i1EaFWMylC1IqBiHnxLsP
   ELzFwWkIuY15ueDp1Xi3dk5Zqf/FkE8/Tk11x4RO8BROQr0dsdaUWeBm1
   V+ZSxn7ntwsxAP5eu/mV581iEan25rEaWXDjzuu8RjsgdpvR5zdI+mfhW
   h1oVpNgX+k5yPtVJ+LOlW0RW1SBBpNK+85d7K+XIM98VkVt5jki7MB8E3
   q2WnKTvKNMg6dBZIPTgTqZsF0mdDutAkh1EPttygxzYxN9t8pG+pN0j9V
   mLmFLAtiKpaH4hFFGgmlL+zsss4ZcUwh9m11iVjXNSKfIxKRwb5V/fsu+
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add handle_qa_error check
Thread-Topic: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add
 handle_qa_error check
Thread-Index: AQHXFTxunOR/N1gAiUWR4EdH3XCwzqqAjmBA
Date: Fri, 12 Mar 2021 16:44:20 +0000
Message-ID: <0e7e667066734d1c9276c1730742c659@XBOX03.axis.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
 <20210309233130.104839-3-idadelm@gmail.com>
In-Reply-To: <20210309233130.104839-3-idadelm@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> Sent: den 10 mars 2021 00:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add
> handle_qa_error check
>=20
> package_qa_handle_error() from insane.bbclass handles display of warnings
> by allowing the user decide whether they want the issues treated as
> warnings, errors or hidden completely. This is done by setting a variable
> "license_source_spdx" in local.conf.
>=20
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/package.bbclass | 128 ++++++++++++++++++-----------------
>  1 file changed, 65 insertions(+), 63 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4e1be661b3..8c0a49ad76 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1552,6 +1552,7 @@ PKGDATA_VARS =3D "PN PE PV PR PKGE PKGV PKGR LICENS=
E
> DESCRIPTION SUMMARY RDEPENDS
>=20
>  python emit_pkgdata() {
>      import oe.license
> +    import bb.utils
>      from glob import glob
>      import json
>      import subprocess
> @@ -1712,70 +1713,71 @@ fi
>          write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
>=20
>      sourceresult =3D d.getVar('TEMPDBGSRCMAPPING', False)
> -    sources =3D {}
> -    if sourceresult:
> -        for r in sourceresult:
> -            sources[r[0]] =3D r[1]
> -        with open(data_file + ".srclist", 'w') as f:
> -            f.write(json.dumps(sources, sort_keys=3DTrue))
> -
> -        filelics =3D {}
> -        for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')]=
:
> -            p =3D subprocess.Popen(["grep", 'SPDX-License-Identifier:', =
'-R', '-I'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3Ddire=
nt)
> -            out, err =3D p.communicate()
> -            if p.returncode =3D=3D 0:
> -                for l in out.decode("utf-8").split("\n"):
> -                    l =3D l.strip()
> -                    if not l:
> -                        continue
> -                    l =3D l.split(":")
> -                    if len(l) < 3:
> -                        bb.warn(str(l))
> -                        continue
> -                    fn =3D "/" + l[0]
> -                    lic =3D l[2].strip()
> -                    if lic.endswith("*/"):
> -                        lic =3D lic[:-2]
> -                    lic =3D lic.strip()
> -                    filelics[fn] =3D lic
> -        with open(data_file + ".filelics", 'w') as f:
> -            f.write(json.dumps(filelics, sort_keys=3DTrue))
> -
> -        computedlics =3D {}
> -        computedpkglics =3D {}
> -        for r in sourceresult:
> -            for subf in r[1]:
> -                if subf in filelics:
> -                    if r[0] not in computedlics:
> -                        computedlics[r[0]] =3D set()
> -                    computedlics[r[0]].add(filelics[subf])
> -
> -
> -        dvar =3D d.getVar('PKGD')
> -        for f in computedlics:
> -            shortf =3D f.replace(dvar, "")
> -            found =3D False
> -            for pkg in filemap:
> -                if shortf in filemap[pkg]:
> -                    found =3D True
> -                    if pkg not in computedpkglics:
> -                        computedpkglics[pkg] =3D set()
> -                    computedpkglics[pkg].update(computedlics[f])
> -            if not found:
> -                bb.warn("%s not in %s" % (f, str(filemap)))
> -
> -        for pkg in computedpkglics:
> -            lic =3D d.getVar('LICENSE_%s' % (pkg))
> -            if not lic:
> -                lic =3D d.getVar('LICENSE')
> -
> -            # Splits the LICENSE values and canonicalise each license
> -            # in the set of split license(s)
> -            spdx_lic =3D oe.license.split_spdx_lic(lic, d)
> +    if bb.utils.contains("license_source_spdx", "1", True, False, d):

This kind of bitbake variable that controls functionality is typically in=20
upper case. It also needs to be documented in the manual, and it should hav=
e=20
a default value (??=3D). It would also make more sense to use=20
bb.utils.to_boolean() than bb.utils.contains(). You can also do:

    if not bb.utils.to_boolean(d.getVar("license_source_spdx")):
        return

thereby avoiding the reindentation, making code review easier.

> +        sources =3D {}
> +        if sourceresult:
> +            for r in sourceresult:
> +                sources[r[0]] =3D r[1]
> +            with open(data_file + ".srclist", 'w') as f:
> +                f.write(json.dumps(sources, sort_keys=3DTrue))
> +
> +            filelics =3D {}
> +            for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGE=
T')]:
> +                p =3D subprocess.Popen(["grep", 'SPDX-License-Identifier=
:', '-R', '-I'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3D=
dirent)
> +                out, err =3D p.communicate()
> +                if p.returncode =3D=3D 0:
> +                    for l in out.decode("utf-8").split("\n"):
> +                        l =3D l.strip()
> +                        if not l:
> +                            continue
> +                        l =3D l.split(":")
> +                        if len(l) < 3:
> +                            bb.warn(str(l))
> +                            continue
> +                        fn =3D "/" + l[0]
> +                        lic =3D l[2].strip()
> +                        if lic.endswith("*/"):
> +                            lic =3D lic[:-2]
> +                        lic =3D lic.strip()
> +                        filelics[fn] =3D lic
> +            with open(data_file + ".filelics", 'w') as f:
> +                f.write(json.dumps(filelics, sort_keys=3DTrue))
> +
> +            computedlics =3D {}
> +            computedpkglics =3D {}
> +            for r in sourceresult:
> +                for subf in r[1]:
> +                    if subf in filelics:
> +                        if r[0] not in computedlics:
> +                            computedlics[r[0]] =3D set()
> +                        computedlics[r[0]].add(filelics[subf])
> +
> +
> +            dvar =3D d.getVar('PKGD')
> +            for f in computedlics:
> +                shortf =3D f.replace(dvar, "")
> +                found =3D False
> +                for pkg in filemap:
> +                    if shortf in filemap[pkg]:
> +                        found =3D True
> +                        if pkg not in computedpkglics:
> +                            computedpkglics[pkg] =3D set()
> +                        computedpkglics[pkg].update(computedlics[f])
> +                if not found:
> +                    bb.warn("%s not in %s" % (f, str(filemap)))
>=20
> -            # Displays warnings for licenses found in the recipes and no=
t sources
> -            if spdx_lic - computedpkglics[pkg]:
> -                bb.warn("License for package %s is %s vs %s" % (pkg, com=
putedpkglics[pkg], spdx_lic))
> +            for pkg in computedpkglics:
> +                lic =3D d.getVar('LICENSE_%s' % (pkg))
> +                if not lic:
> +                    lic =3D d.getVar('LICENSE')
> +
> +                # Splits the LICENSE values and canonicalise each licens=
e
> +                # in the set of split license(s)
> +                spdx_lic =3D oe.license.split_spdx_lic(lic, d)
> +
> +                # Displays warnings for licenses found in the recipes an=
d not sources
> +                if spdx_lic - computedpkglics[pkg]:
> +                    package_qa_handle_error("license_source_spdx", f'Lic=
ense for package {pkg} is {computedpkglics[pkg]}(source SPDX headers) vs {s=
pdx_lic} (LICENSE)', d)

I'm all for using f'' strings, as I think it makes for a lot more readable=
=20
code. However, I am not sure it has been approved for use in the OE code=20
yet.

>  }
>  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-re=
verse ${PKGDESTWORK}/runtime-rprovides"
>=20
> --
> 2.25.1

