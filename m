Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53291E69E86
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 19:31:08 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1710.1733167858145792030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 11:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtcuyY1p;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e0844ee50so1908668e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733167856; x=1733772656; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clmV9Yj6haMOy+0vN536EegwfeXMSrGm3vMlrnOo/AI=;
        b=dtcuyY1p1AO0Seonxq8ve2X9Wl6hN+12FpqdbCU3ILFthd7VKUWVrfF44Eqj2J3WcO
         IOgBe7eF9Bi8pn6L+Bot7+gCHu09ngD/wu6vbLmn+ZSUfmnpKzXOUul/6G13bESrxk4Y
         ECcWCuAOBBZmL+5cXY/9BVD5cU4Zl2YPiAKbo2I1sxviJP9eTlgzw3Van2TCnRBUuRdG
         yikcaG+EkgRlDbQ0PiCnNpM3wRk30wcrxo3/w7UMV2jluKIXjegYmZ8MOD9rO5brlD0S
         Vb7IQDFkLmbdsvqAa1GYFfg8zEj/IpGUYP0wt/qnUrVKKZBM/MPy9EZStntK+y870SV4
         MiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733167856; x=1733772656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clmV9Yj6haMOy+0vN536EegwfeXMSrGm3vMlrnOo/AI=;
        b=b9ubcT/6I7vc7/DZFhVWA/2xbzRgFVw1ZwsArhrlad/hgfl5eiQJi3Pb59+YengBvS
         6pY32hA5hgY+3NUfc1bT8w/dsZ9KZkBqRarke+SaR1VaAYPnNBOzHIVD7kl3GxJTMe/+
         5tne8EFk4B6RjZdwZRmoTUrtrWDL9rqzEbStJG83JxxOUKQt1eCGI09WKViES7feDPlw
         4+5DkBJu1RhpcPeYpS7N1lngyI2gmUwTH0+f228Y6KOLXYZzA1/CinZ9AKMTbZ6joetu
         3NBtIc5mDfmjFUWRU7x/t/gs+QwPYkBa/kWvem8yjAOT5MrhMcMrDi0XF1p/+1+PVmsV
         a20w==
X-Gm-Message-State: AOJu0YyteN8r7kGBc7+NvOIksYaTaJxKcpuIO9jD0lseDgUazcwafTLy
	3UmP9qAUGt6YeKhpy4iEnU+vCSJZElnECififn5lwN/pT4kbTM14I9tTEgv9qilhBrTPwUTOmp+
	CTAIXI7z+dKLBWFb31a/PxsHpBEM=
X-Gm-Gg: ASbGncs2hpAdj//Ou+2xZamLxpZ+ToYrP+gKDPP9FONlfpiN19QhQGQ3bEyq+rLOCvf
	tLtTZMFsgSjGXziJnDjWgPTsbKQAHDrSMZE/BgDjuiEDfAA==
X-Google-Smtp-Source: AGHT+IFilI1i4ABGa6GGws9YQtnzmmIbM2nA7xIdPgrgi3Q1/RUZZgoXU16BfEbios/vMXfZh7mFTQ8sMidMfBIUeZQ=
X-Received: by 2002:a05:6512:39d0:b0:53d:ec93:fbb7 with SMTP id
 2adb3069b0e04-53df00a9782mr14884645e87.9.1733167855745; Mon, 02 Dec 2024
 11:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20241125081500.4048680-1-hongxu.jia@windriver.com>
 <180B2809D3D6ACA7.7301@lists.openembedded.org> <35c36689-1007-412a-ab65-d2c2e4820885@windriver.com>
In-Reply-To: <35c36689-1007-412a-ab65-d2c2e4820885@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 2 Dec 2024 12:30:43 -0700
Message-ID: <CAJdd5GamC+uScOVCHDjQhMMetgGdCYjdYmQLtBciMfV0AY3Gwg@mail.gmail.com>
Subject: Re: [oe-core][PATCH V3 1/3] sbom30/spdx30: add link prefix to the
 namespace of spdxId and alias
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208155

OK, thanks. I did get some time to sit down, and read through this,
and I understand the problem that needs to be solved. I think you're
on the right track, but I think we can use the rework to remove some
code that is no longer necessary. My basic thought is now:

1. Set an OEIdAliasExtension on the SpdxDocument that is created with
an ObjectSet. It should have a prefix like:
"http://spdx.org/spdxdocs/openembedded-alias/document/..."
2. When an alias is set on another element, it should use a prefix of
"http://spdx.org/spdxdocs/openembedded-alias/by-doc-hash/HASH/...",
where HASH is the hash of the SpdxDocument alias set in #1
3. When a document is written out, a symbolic link is created using
the hash of SpdxDocument alias, in a similar manner to what the code
does today. Importantly, no links are made for any other elements.
4. When an alias needs to be resolved, the code checks for the prefix
"http://spdx.org/spdxdocs/openembedded-alias/by-doc-hash/", then
extracts the hash and opens the document with that hash by it's
symbolic link (created in #3), then finds the object with the exact
alias in that document.
5. Remove OELinkExtension since it is no longer necessary

I'm willing to work on this if you want, but with the YP summit this
week, it probably won't get done until next week.

On Fri, Nov 29, 2024 at 12:00=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Ping Joshua,
>
> Let me add some additional explanations,
>
> The spdxId was consisted by "namespace" + "user define suffix" [1],
> in each jsonld file, multiple elements have the same "namespace" and
> different  "user define suffix".
>
> This commit tries to make "namespace" differs between jsonld files, via a=
dding prefix
> and name to instead of ${PN}, then each jsonld file have unique "namespac=
e"
>
> After apply the commit, all elements in the same jsonld file will have th=
e same
> "namespace", and pick up the same link-name from "namespace"
>
> Take shadow for example,
>
> In tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json, link-name is =
"recipe-shadow"
> ...
>     {
>       "type": "simplelicensing_LicenseExpression",
>       "spdxId": "http://spdx.org/spdxdocs/recipe-shadow-6845d95c-0853-56d=
d-b976-caae5a99461e/bdf9bac970ab5868fda8a811581a46956790f1744837b22af972617=
3428059b7/license/3_24_0/Unlicense",
>       "creationInfo": "_:CreationInfo1",
>       "extension": [
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdx.org=
/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/license/3_24_0/Unlicense=
",
>           "https://rdf.openembedded.org/spdx/3.0/link-name": "recipe-shad=
ow"
>         },
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/link-extension",
>           "https://rdf.openembedded.org/spdx/3.0/link-spdx-id": true,
>           "https://rdf.openembedded.org/spdx/3.0/link-name": "recipe-shad=
ow"
>         }
>       ],
>       "simplelicensing_licenseExpression": "Unlicense",
>       "simplelicensing_licenseListVersion": "3.24.0"
>     },
> ...
>
> In tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json, link-nam=
e is "package-shadow-src"
> ...
>     {
>       "type": "software_Package",
>       "spdxId": "http://spdx.org/spdxdocs/package-shadow-src-ccffa1b0-695=
2-53bb-bc7f-0631476873ed/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9=
726173428059b7/package/shadow-src",
>       "creationInfo": "_:CreationInfo1",
>       "description": "Tools to change and administer password and group d=
ata  This package contains sources for debugging purposes.",
>       "extension": [
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdx.org=
/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/package/shadow-src"=
,
>           "https://rdf.openembedded.org/spdx/3.0/link-name": "package-sha=
dow-src"
>         },
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/link-extension",
>           "https://rdf.openembedded.org/spdx/3.0/link-spdx-id": true,
>           "https://rdf.openembedded.org/spdx/3.0/link-name": "package-sha=
dow-src"
>         }
>       ],
> ...
>
> Then creating unique link recipe-shadow.spdx.json and package-shadow-src.=
spdx.json,
> one link for one jsonld file, all elements in one jsonld file share one s=
ymlink. Rather than each
> element have unique link hash path.
>
> tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shadow.spdx.json -> =
../recipes/shadow.spdx.json
> tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow-src.spdx.jso=
n -> ../packages/shadow-src.spdx.json
>
>
> [1] https://github.com/openembedded/openembedded-core/blob/master/meta/li=
b/oe/sbom30.py#L353
>
> //Hongxu
>
> On 11/25/24 16:14, hongxu via lists.openembedded.org wrote:
>
> In order to simple reference the SPDX ID to instead of making jsonld hash
> path for each element, only creating one symlink for one file and referen=
cing
> it multiple times, add link prefix and name to the namespace of spdxId an=
d alias
> to replace ${PN} to avoid namespace conflict between recipe, packages and=
 images.
>
> Take recipe shadow, package shadow and package shadow-src for example:
> Without this commit, spdxId and alias in recipe and package jsonld have t=
he same
> namespace
>
>     spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
>     alias: http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/...
>
> After apply this commit, the namespace of spdxId in recipe and package js=
onld differs:
> In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json
>
>     spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
>     alias: http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIH=
ASH/...
>
> In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.jso=
n
>
>     spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
>     alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNI=
HASH/...
>
> In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx=
.json
>
>     spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
>     alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src=
/UNIHASH/...
>
> Then will use namespace of spdxId and alias to create link for jsonld fil=
e,
> one symlink for one jsonld file, referenced by elements multiple times
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py       | 29 ++++++++++++++++++-----------
>  meta/lib/oe/spdx30_tasks.py | 13 +++++++------
>  2 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 0a7b4c05fb..28d251a7ac 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -217,9 +217,11 @@ def to_list(l):
>
>
>  class ObjectSet(oe.spdx30.SHACLObjectSet):
> -    def __init__(self, d):
> +    def __init__(self, d, name=3DNone, link_prefix=3DNone):
>          super().__init__()
>          self.d =3D d
> +        self.name =3D name
> +        self.link_prefix =3D link_prefix
>
>      def create_index(self):
>          self.by_sha256_hash =3D {}
> @@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>              uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
>          )
>          pn =3D self.d.getVar("PN")
> +        if self.link_prefix and self.name:
> +            pn =3D "%s-%s" % (self.link_prefix, self.name)
>          return "%s/%s-%s" % (
>              self.d.getVar("SPDX_NAMESPACE_PREFIX"),
>              pn,
> @@ -341,12 +345,15 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>              elif namespace not in e._id:
>                  bb.warn(f"Namespace {namespace} not found in {e._id}")
>              else:
> +                pn =3D self.d.getVar("PN")
> +                if self.link_prefix and self.name:
> +                    pn =3D "%s-%s" % (self.link_prefix, self.name)
>                  alias_ext =3D set_alias(
>                      e,
>                      e._id.replace(unihash, "UNIHASH").replace(
>                          namespace,
> -                        "http://spdx.org/spdxdocs/openembedded-alias/"
> -                        + self.d.getVar("PN"),
> +                        f"{self.d.getVar('SPDX_NAMESPACE_PREFIX')}/opene=
mbedded-alias/"
> +                        + pn,
>                      ),
>                  )
>
> @@ -805,8 +812,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          )
>
>      @classmethod
> -    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
> -        objset =3D cls(d)
> +    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue, link_pref=
ix=3DNone):
> +        objset =3D cls(d, name=3Dname, link_prefix=3Dlink_prefix)
>
>          document =3D oe.spdx30.SpdxDocument(
>              _id=3Dobjset.new_spdxid("document", name),
> @@ -887,9 +894,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          return missing_spdxids
>
>
> -def load_jsonld(d, path, required=3DFalse):
> +def load_jsonld(d, path, required=3DFalse, name=3DNone, link_prefix=3DNo=
ne):
>      deserializer =3D oe.spdx30.JSONLDDeserializer()
> -    objset =3D ObjectSet(d)
> +    objset =3D ObjectSet(d, name=3Dname, link_prefix=3Dlink_prefix)
>      try:
>          with path.open("rb") as f:
>              deserializer.read(f, objset)
> @@ -918,9 +925,9 @@ def jsonld_hash_path(_id):
>      return Path("by-spdxid-hash") / h[:2], h
>
>
> -def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):
> +def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse, link=
_prefix=3DNone):
>      path =3D jsonld_arch_path(d, arch, subdir, name)
> -    objset =3D load_jsonld(d, path, required=3Drequired)
> +    objset =3D load_jsonld(d, path, required=3Drequired, name=3Dname, li=
nk_prefix=3Dlink_prefix)
>      if objset is not None:
>          return (objset, path)
>      return (None, None)
> @@ -1049,8 +1056,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, obj=
_type, **attr_filter):
>      return spdx_obj, objset
>
>
> -def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter=
):
> -    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, require=
d=3DTrue)
> +def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=
=3DNone, **attr_filter):
> +    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, require=
d=3DTrue, link_prefix=3Dlink_prefix)
>
>      spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
>      if not spdx_obj:
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 5aeed5cd6f..ef829fbbf1 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -461,7 +461,7 @@ def create_spdx(d):
>      if not include_vex in ("none", "current", "all"):
>          bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'al=
l'")
>
> -    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
> +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"), l=
ink_prefix=3D"recipe")
>
>      build =3D build_objset.new_task_build("recipe", "recipe")
>      build_objset.set_element_alias(build)
> @@ -574,7 +574,7 @@ def create_spdx(d):
>
>              bb.debug(1, "Creating SPDX for package %s" % pkg_name)
>
> -            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name)
> +            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name, l=
ink_prefix=3D"package")
>
>              spdx_package =3D pkg_objset.add_root(
>                  oe.spdx30.software_Package(
> @@ -793,7 +793,7 @@ def create_package_spdx(d):
>      # Any element common to all packages that need to be referenced by I=
D
>      # should be written into this objset set
>      common_objset =3D oe.sbom30.ObjectSet.new_objset(
> -        d, "%s-package-common" % d.getVar("PN")
> +        d, "%s-package-common" % d.getVar("PN"), link_prefix=3D"package"
>      )
>
>      pkgdest =3D Path(d.getVar("PKGDEST"))
> @@ -812,6 +812,7 @@ def create_package_spdx(d):
>              "packages-staging",
>              pkg_name,
>              oe.spdx30.software_Package,
> +            link_prefix=3D"package",
>              software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.install,
>          )
>
> @@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):
>      with root_packages_file.open("r") as f:
>          packages =3D json.load(f)
>
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basena=
me, machine))
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basena=
me, machine), link_prefix=3D"rootfs")
>
>      rootfs =3D objset.add_root(
>          oe.spdx30.software_Package(
> @@ -1037,7 +1038,7 @@ def create_image_spdx(d):
>      image_basename =3D d.getVar("IMAGE_BASENAME")
>      machine =3D d.getVar("MACHINE")
>
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basena=
me, machine))
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basena=
me, machine), link_prefix=3D"image")
>
>      with manifest_path.open("r") as f:
>          manifest =3D json.load(f)
> @@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, too=
lchain_outputname):
>      sdk_name =3D toolchain_outputname + "-" + sdk_type
>      sdk_packages =3D oe.sdk.sdk_list_installed_packages(d, sdk_type =3D=
=3D "target")
>
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name, link_prefix=
=3D"sdk")
>
>      sdk_rootfs =3D objset.add_root(
>          oe.spdx30.software_Package(
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207723): https://lists.openembedded.org/g/openembedde=
d-core/message/207723
> Mute This Topic: https://lists.openembedded.org/mt/109768078/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ho=
ngxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

