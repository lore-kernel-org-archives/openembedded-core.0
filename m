Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B790CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 16:05:33 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.42146.1695571531070428726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 09:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAaV19jg;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57b6c7d0cabso2435877eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695571530; x=1696176330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbuKZtyyQdbcdGdl6eFq1kyYRn3EJ5H5aznC2Ads7jg=;
        b=GAaV19jgtHCyAnIb6D1jPbnK6vr1ybj0BULuLCqe1VtpJ5xxW3mVkEF9RTqrL+Ch6o
         rvHDhRIPedKq1/RszvaqkGZp6nz2yFjsjDwN20ZlpbmGY4QkpwfEKHYtg5nxL3QAd/RX
         1vDjUJg9JlN4CPTEOR4e6nH5jb9dFvevRDVv5kSpLY5NLlgh/ldTMV+yJHEww84Pfxql
         /gHvuj9MsnrYw6HBACbWIvb4YOBZ87/7Agu+565Byg+My7EzNK3IGuf5qZwHrh+5eFPP
         gmxOcoZ7U6LMC8gnaL08cggSTcbchJHyXCkoMK9Mm9ar0WU/AZFkJ2jZkMCYXJ36ZtW8
         CTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695571530; x=1696176330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbuKZtyyQdbcdGdl6eFq1kyYRn3EJ5H5aznC2Ads7jg=;
        b=iwE7FKyPy8RZal2zvzT9bGwcGSIIRBzkg4WWCwPsCBJ/qovL/TGWavVlFiH8CBw0YR
         4qXRRB0fiJt9g9/rbIcbkOWhe9FsObx2LL/3luIL9Mwg8VD94iiNFN51yXb3lrltBVuP
         T6AK2eZmAJPCwb7JH9N9Swb2AvZlVlrf6IGBIVkfofIJCdfbfGUkqUq6hCvm5yUdAlOt
         rBbsG6SZMHeDkpv6H0Q2CP19X58cS78HM6jDJBCbrV8FlbloRGQuNYjWm9ahi1xSImAs
         io7/HlvPD5Af2kDTHQYhmzh3lyOPBKjgtprnmSVbQJFYNsJ9j2oDDNCToLvvOIUgB5SM
         N2HQ==
X-Gm-Message-State: AOJu0YznlZHnYeoDbnSHvFL4lYfQ4l0s5zv0QhEGAa60w4S97rTqPcjh
	FAajQkKJkA+ZqrDikuBpHVtTsj86z0yIn5PcwAw=
X-Google-Smtp-Source: AGHT+IEeLRWWcNVnO/r0wb6CsvBIU+jJDhQIgbCyC7RX51ARVfl5CKSYqusccPKS2nJXYO9FjPg5aY5fZ9q62DZl+hQ=
X-Received: by 2002:a05:6870:a91a:b0:1d4:dce5:332e with SMTP id
 eq26-20020a056870a91a00b001d4dce5332emr6868205oab.51.1695571530073; Sun, 24
 Sep 2023 09:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230921150420.1317625-1-JPEWhacker@gmail.com>
In-Reply-To: <20230921150420.1317625-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Sep 2023 09:05:03 -0700
Message-ID: <CAMKF1sq+aZ4-_c4yWr0J_6=r5rKtr93yLz9C4hU=9B4ZAQvq=w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] create-spdx/sbom: Ensure files don't overlap
 between machines
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 16:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188165

Hi Joshua

On master-next poky, I am seeing a failure in usb-modeswitch
do_create_runtime_spdx from meta-oe (. musl/qemuarm64 )

https://errors.yoctoproject.org/Errors/Build/172015/

building individually works ok. So perhaps some sort of race ?

Another issue similar to this I see is in qtwayland-native from
meta-qt6 ( machine glibc/rpi4-64 )

  ERROR: qtwayland-native-6.5.3-r0 do_create_spdx: Cannot find any
SPDX file for recipe wayland-native, True
sstate:wayland-native:x86_64-linux:1.22.0:r0:x86_64:11:
sstate:wayland-native::1.22.0:r0::11:

detailed log

https://snips.sh/f/Kaupf_5AJU

Any ideas ?

On Thu, Sep 21, 2023 at 8:09=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Currently the by-id and by-namespace SPDX files are created without refer=
ence
> to PACKAGE_ARCH. This means that for two machines using a common package =
architecture
> (e.g. genericx86-64 and qqemux86-64), there would be overlapping files. T=
his means
> that the build of one can remove files from the other leading to build fa=
ilures. An
> example would be:
>
> MACHINE=3Dqemux86-64 bitbake core-image-minimal
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
>
> To fix this, add PACKAGE_ARCH to the path used for the files and use a se=
arch
> path based upon PACKAGE_ARCHS to access them.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 41 ++++++++++++++++++++--------
>  meta/lib/oe/sbom.py                  | 34 ++++++++++++++++++-----
>  2 files changed, 57 insertions(+), 18 deletions(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 9b28d124c78..a2b96da61a9 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -349,6 +349,8 @@ def collect_dep_recipes(d, doc, spdx_recipe):
>
>      deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
>      spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
> +    package_archs =3D d.getVar("SSTATE_ARCHS").split()
> +    package_archs.reverse()
>
>      dep_recipes =3D []
>
> @@ -356,7 +358,9 @@ def collect_dep_recipes(d, doc, spdx_recipe):
>          deps =3D json.load(f)
>
>      for dep_pn, dep_hashfn in deps:
> -        dep_recipe_path =3D oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, =
"recipe-" + dep_pn, dep_hashfn)
> +        dep_recipe_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, =
package_archs, "recipe-" + dep_pn, dep_hashfn)
> +        if not dep_recipe_path:
> +            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (de=
p_pn, dep_hashfn))
>
>          spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_path=
)
>
> @@ -385,6 +389,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
>
>      return dep_recipes
>
> +collect_dep_recipes[vardepsexclude] =3D "SSTATE_ARCHS"
>
>  def collect_dep_sources(d, dep_recipes):
>      import oe.sbom
> @@ -533,6 +538,7 @@ python do_create_spdx() {
>      include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
>      archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
>      archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
>
>      creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
>
> @@ -620,7 +626,7 @@ python do_create_spdx() {
>
>      dep_recipes =3D collect_dep_recipes(d, doc, recipe)
>
> -    doc_sha1 =3D oe.sbom.write_doc(d, doc, d.getVar("SSTATE_PKGARCH"), "=
recipes", indent=3Dget_json_indent(d))
> +    doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=
=3Dget_json_indent(d))
>      dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
>
>      recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> @@ -685,7 +691,7 @@ python do_create_spdx() {
>
>              add_package_sources_from_debug(d, package_doc, spdx_package,=
 package, package_files, sources)
>
> -            oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH")=
, "packages", indent=3Dget_json_indent(d))
> +            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", inde=
nt=3Dget_json_indent(d))
>  }
>  do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
>  # NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
> @@ -756,6 +762,9 @@ python do_create_runtime_spdx() {
>      creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
>
>      providers =3D collect_package_providers(d)
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    package_archs =3D d.getVar("SSTATE_ARCHS").split()
> +    package_archs.reverse()
>
>      if not is_native:
>          bb.build.exec_func("read_subpackage_metadata", d)
> @@ -772,7 +781,7 @@ python do_create_runtime_spdx() {
>              if not oe.packagedata.packaged(package, localdata):
>                  continue
>
> -            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, d.getVar("SSTATE_PKGARCH"), "packages")
> +            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, pkg_arch, "packages")
>
>              package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_=
path)
>
> @@ -827,7 +836,9 @@ python do_create_runtime_spdx() {
>                  if dep in dep_package_cache:
>                      (dep_spdx_package, dep_package_ref) =3D dep_package_=
cache[dep]
>                  else:
> -                    dep_path =3D oe.sbom.doc_path_by_hashfn(deploy_dir_s=
pdx, dep_pkg, dep_hashfn)
> +                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_s=
pdx, package_archs, dep_pkg, dep_hashfn)
> +                    if not dep_path:
> +                        bb.fatal("No SPDX file found for package %s, %s"=
 % (dep_pkg, dep_hashfn))
>
>                      spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep=
_path)
>
> @@ -855,10 +866,10 @@ python do_create_runtime_spdx() {
>                  )
>                  seen_deps.add(dep)
>
> -            oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH")=
, "runtime", spdx_deploy, indent=3Dget_json_indent(d))
> +            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_=
deploy, indent=3Dget_json_indent(d))
>  }
>
> -do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES"
> +do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SSTATE_ARCHS"
>
>  addtask do_create_runtime_spdx after do_create_spdx before do_build do_r=
m_work
>  SSTATETASKS +=3D "do_create_runtime_spdx"
> @@ -993,6 +1004,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, r=
ootfs_spdxid, packages, spdx
>      import bb.compress.zstd
>
>      providers =3D collect_package_providers(d)
> +    package_archs =3D d.getVar("SSTATE_ARCHS").split()
> +    package_archs.reverse()
>
>      creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
>      deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> @@ -1022,7 +1035,10 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir,=
 rootfs_spdxid, packages, spdx
>
>          pkg_name, pkg_hashfn =3D providers[name]
>
> -        pkg_spdx_path =3D oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, pk=
g_name, pkg_hashfn)
> +        pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, pa=
ckage_archs, pkg_name, pkg_hashfn)
> +        if not pkg_spdx_path:
> +            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name=
, pkg_hashfn))
> +
>          pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
>
>          for p in pkg_doc.packages:
> @@ -1039,7 +1055,10 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir,=
 rootfs_spdxid, packages, spdx
>          else:
>              bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
>
> -        runtime_spdx_path =3D oe.sbom.doc_path_by_hashfn(deploy_dir_spdx=
, "runtime-" + name, pkg_hashfn)
> +        runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, "runtime-" + name, pkg_hashfn)
> +        if not runtime_spdx_path:
> +            bb.fatal("No runtime SPDX document found for %s, %s" % (name=
, pkg_hashfn))
> +
>          runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spdx_=
path)
>
>          runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
> @@ -1111,7 +1130,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
>                      })
>
>                  for ref in doc.externalDocumentRefs:
> -                    ref_path =3D oe.sbom.doc_path_by_namespace(deploy_di=
r_spdx, ref.spdxDocument)
> +                    ref_path =3D oe.sbom.doc_find_by_namespace(deploy_di=
r_spdx, package_archs, ref.spdxDocument)
>                      collect_spdx_document(ref_path)
>
>              collect_spdx_document(image_spdx_path)
> @@ -1134,4 +1153,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
>
>              tar.addfile(info, fileobj=3Dindex_str)
>
> -combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
> +combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SSTATE_ARCHS"
> diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
> index 1130fa668bd..fd4b6895d8f 100644
> --- a/meta/lib/oe/sbom.py
> +++ b/meta/lib/oe/sbom.py
> @@ -38,16 +38,34 @@ def get_sdk_spdxid(sdk):
>      return "SPDXRef-SDK-%s" % sdk
>
>
> -def doc_path_by_namespace(spdx_deploy, doc_namespace):
> -    return spdx_deploy / "by-namespace" / doc_namespace.replace("/", "_"=
)
> +def _doc_path_by_namespace(spdx_deploy, arch, doc_namespace):
> +    return spdx_deploy / "by-namespace" / arch / doc_namespace.replace("=
/", "_")
>
>
> -def doc_path_by_hashfn(spdx_deploy, doc_name, hashfn):
> -    return spdx_deploy / "by-hash" / hashfn.split()[1] / (doc_name + ".s=
pdx.json")
> +def doc_find_by_namespace(spdx_deploy, search_arches, doc_namespace):
> +    for pkgarch in search_arches:
> +        p =3D _doc_path_by_namespace(spdx_deploy, pkgarch, doc_namespace=
)
> +        if os.path.exists(p):
> +            return p
> +    return None
> +
> +
> +def _doc_path_by_hashfn(spdx_deploy, arch, doc_name, hashfn):
> +    return (
> +        spdx_deploy / "by-hash" / arch / hashfn.split()[1] / (doc_name +=
 ".spdx.json")
> +    )
> +
> +
> +def doc_find_by_hashfn(spdx_deploy, search_arches, doc_name, hashfn):
> +    for pkgarch in search_arches:
> +        p =3D _doc_path_by_hashfn(spdx_deploy, pkgarch, doc_name, hashfn=
)
> +        if os.path.exists(p):
> +            return p
> +    return None
>
>
>  def doc_path(spdx_deploy, doc_name, arch, subdir):
> -    return spdx_deploy / arch/ subdir / (doc_name + ".spdx.json")
> +    return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
>
>
>  def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNo=
ne):
> @@ -61,11 +79,13 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=
=3DNone, indent=3DNone):
>      with dest.open("wb") as f:
>          doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DTrue, indent=3Dinde=
nt)
>
> -    l =3D doc_path_by_namespace(spdx_deploy, spdx_doc.documentNamespace)
> +    l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNam=
espace)
>      l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
>      l.symlink_to(os.path.relpath(dest, l.parent))
>
> -    l =3D doc_path_by_hashfn(spdx_deploy, spdx_doc.name, d.getVar("BB_HA=
SHFILENAME"))
> +    l =3D _doc_path_by_hashfn(
> +        spdx_deploy, arch, spdx_doc.name, d.getVar("BB_HASHFILENAME")
> +    )
>      l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
>      l.symlink_to(os.path.relpath(dest, l.parent))
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188013): https://lists.openembedded.org/g/openembedde=
d-core/message/188013
> Mute This Topic: https://lists.openembedded.org/mt/101502122/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

