Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6072C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 23:26:58 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10371.1787614015775623189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 16:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l3oVPsLw;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836d2861a39so57589317b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787614015; cv=none;
        d=google.com; s=arc-20260327;
        b=qzw2YXRPeDONufK6OFeOH8sm4X+s8kRiRMUgld/ZITBrRcEOshxBHP/7T/YGNL2FxY
         UbJGRueMfmr87GYCJb182WFnzHVB+VumL3e4vDoZN8LwCmZUMJdvNPjTzpb0IgJhOXgu
         Iye+sKtHIeKhir3Zit30HifKDG8rxMTMNrEuMuNacZKKFszIL5Wrui6DYJJ5BRpe8XMc
         jlsnLR2NgRaQl0YwZKlxPCTHrIYmDBpqhmfD05F0nx80tvs0M1O70Fu2hjQG8orvO9Cm
         I+2iihx4zsufoaEtVg82i1o6sZ1zZdLJyDNuI28DHToleyGg4Py8S64DLWAzru7hUsXg
         UxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O0WDOFPxSdEqLRHlAtuA6m4cfkX16AcqlSto07v/B64=;
        fh=YDZJ5eRpkC3LJuuqMoDf93uY4AGEMDutL/ADkubPCf8=;
        b=Bm6x59vtCkQ+astbvby1zSYtjVlwQij6cAgjnKNtcsN/Tw8ATi6oXwnkv/n5iUvyzR
         vzLJRdrSbPOgOPvVFFVZpjgnmpT7SWWggMwYHCc/4C8LNLmamrYBSl50ZsOWXnV/OEDL
         jJpQ7yQ2T16Bz4Dtq+IkzKvAZvyC02G4zX8/ST/lLyVhOY6JfRIoDqrIlLlr8iFQ9VD5
         XhliTKD/g/qg/alzEKdfghBw4hsZMKmtZJ8jo0ES71pSp0jft9LcGDhsZSQQd9ca7OPW
         +tx2kESYvGis/VDA//sEQjRzqwKPM8rjas//52BEUBszfd5YdTCBO4lhEyWulwJ0ujhL
         zRdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787614015; x=1788218815; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0WDOFPxSdEqLRHlAtuA6m4cfkX16AcqlSto07v/B64=;
        b=l3oVPsLwL5tIhzTUFj/Udy+JbK+qJjW5M3uvfURC5fb83Xa5EzU+g8Bt9cx7LTZ9FS
         MYjUVFh7fIHklK27OCsBxkhqQcwWLZ9lKUyip/cQobGVlPbNoS5sUzeKj6uQTEUDXmZK
         FbOdH/kJBERGgaXeudZxR5yb3B3QQNJFL+WYKno/ZhOw7ubr9Apsx1QdL+VGgD2CTLXI
         Dqnimgw6yHSc/eVX050VjaQeTlYb8kl11BIIbjm6fmnCE9r4eq+rpKoRDD8+7Q3bYuZt
         6ZA/9JcBZrqGidz9BBBcSKIrs3Mlqeyp/cXAZDOxV9W1Nc6RQYMxdJHB04B6OvYjQzax
         ifmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787614015; x=1788218815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O0WDOFPxSdEqLRHlAtuA6m4cfkX16AcqlSto07v/B64=;
        b=WCHPL7jov6hBlvDofIP65icgvip8auNJUlyMnUCM3XW9acND0O+4GtOrNZZjbgkl0e
         4XIyO8llpWGL/kEzU3Fh3du3OvNw4ppcfjDT6DT6qrSBadaWM6bPUrtcu3Qvf2GjKluL
         pqOLEeprJRu6bvjMDVMbvEjcS/PXYwB/KWaZPYiGTrsrcnmnIzhMSxkAHPoqIdi+9C6B
         GMMoQSZbVoDMapU5Fv9tquBG0OC9l7HBq6AyXjq5kYwraNRU9OQYeYDP1xdL+XWzDCBx
         EKjtso3v287TX7h+qeROTUbmb1y46ipHCHD7Ic/jpUWJ6KS9HDHgR3HGzn45cKqrY0KM
         tQKQ==
X-Gm-Message-State: AFuF++mgABpHvs9oko4/LxH9TzsXxHSzxbJz3w4bDsxD8Ejj+xgSE3Vp
	7rHo1x6bNxf5wMP9Y1/w30zr0cgFPTXwEgMoDYTslYeolZSAxddPkGS37DTusuwMb5tvfgCDqqI
	3zfK81GyoUuk1KCWd1m4ZOR6+bpFQNWE=
X-Gm-Gg: AR+sD109gyNUOgTBWK8ZohNyubwVa0B3CvzLTUrW8GJyrjdbeiA90ENwOViiEtGnwZG
	72+zibljeMQD9R3fK+RKBAzAmK0Ikx2QoiN9Pcra1J20hwd2ibSMo+le6JDMNwE2QqoAIK2P8a9
	Oq78lkbShTF9q1PfL/L52+PGWFcnGk+qtCWG1ffJulvb7PxDSpkr5WhAQcjbapnBmHBmBCvNwWB
	MJj/U57JFQ8kSZziM9yHdhOa5DStzTc31r/VfapdumW/TbWak3Qn5IT4kMFAdDf4ziOBAthjSXc
	5vH/UBQUeYyF9i/SHFUzZP8ZPi228CkYeQWu3kpppxoGHYTHfF3xyBDmsy3lqgk5Ul0W2A==
X-Received: by 2002:a05:690c:e3e4:b0:80c:5ce9:8f29 with SMTP id
 00721157ae682-84c998b231amr87702487b3.22.1787614014682; Mon, 24 Aug 2026
 16:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260824201017.3914783-2-iwanicki92@gmail.com>
In-Reply-To: <20260824201017.3914783-2-iwanicki92@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 24 Aug 2026 17:26:41 -0600
X-Gm-Features: AcwNN1Wtzs42lE44QBMseJPjzUhUuBoKc7lIRw-6xID3C0moNdjPbdJvcAj8lqc
Message-ID: <CAJdd5GZsDEKtHL3pNjuqg6xEOWLFMDbGUibbobjus3XJR-8BLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
To: iwanicki92@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000573a8a0659d3526f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244155

--000000000000573a8a0659d3526f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM iwanicki92 via lists.openembedded.o=
rg
<iwanicki92=3Dgmail.com@lists.openembedded.org> wrote:

> Sub-variables (_name, _type, _comment, _id_email) were being looked
> up using the literal string "SPDX_IMAGE_SUPPLIER", "SPDX_SDK_SUPPLIER"
> "SPDX_PACKAGE_SUPPLIER", "SPDX_INVOKED_BY", "SPDX_ON_BEHALF_OF",
> instead of the value of those variables, breaking the documented
> ability to use a custom prefix (e.g. MY_COMPANY).
>
> Tested by setting in local.conf:
>
> ```
> MY_COMPANY_name =3D "CCCC"
> MY_COMPANY_type =3D "organization"
> SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
> SPDX_IMAGE_SUPPLIER_name =3D "AAAA"
> SPDX_IMAGE_SUPPLIER_type =3D "organization"
> SPDX_PACKAGE_SUPPLIER =3D "MY_COMPANY"
> SPDX_PACKAGE_SUPPLIER_name =3D "BBBB"
> SPDX_PACKAGE_SUPPLIER_type =3D "organization"
> ```
>
> And then comparing `core-image-minimal-qemux86-64.rootfs.spdx.json`
> SBOMs. Before this change SBOM contained only AAAA and BBBB but no CCCC,
> after there was only CCCC.
>

This isn't how these variables are intended to work; I'm not sure where the
documentation you found suggests this, but the values for any base variable
are suffixes always appended to that base variable. For example:

SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
SPDX_IMAGE_SUPPLIER_MY_COMPANY_name =3D "CCCC"
SPDX_IMAGE_SUPPLIER_MY_COMPANY_type =3D "organization"




> Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
> ---
> Changes in v2:
>
> Change the expand path to fallback to `varname` itself when lookup
> doesn't find anything. This change allows for both old, undocumented `_re=
f`
> indirection and documented indirection (`SPDX_* =3D "<PREFIX>"`)
> ---
>  meta/lib/oe/sbom30.py       |  6 +++++-
>  meta/lib/oe/spdx30_tasks.py | 10 +++++-----
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index e02382c3cc78..becf9e30d392 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -397,7 +397,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          self.doc.import_.append(m)
>          return spdxid
>
> -    def new_agent(self, varname, *, creation_info=3DNone, add=3DTrue):
> +    def new_agent(self, varname, *, creation_info=3DNone, add=3DTrue,
> expand=3DFalse):
> +        if expand:
> +            varname =3D self.d.getVar(varname) or varname
> +        if not varname:
> +            return None
>          ref_varname =3D self.d.getVar(f"{varname}_ref")
>          if ref_varname:
>              if ref_varname =3D=3D varname:
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index dac02e378429..88c707476a65 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -905,7 +905,7 @@ def create_spdx(d):
>                  force_purposes=3D["install"],
>              )
>
> -            supplier =3D build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
> +            supplier =3D build_objset.new_agent("SPDX_PACKAGE_SUPPLIER",
> expand=3DTrue)
>              if supplier is not None:
>                  spdx_package.suppliedBy =3D (
>                      supplier if isinstance(supplier, str) else
> supplier._id
> @@ -1213,8 +1213,8 @@ def write_bitbake_spdx(d):
>      objset =3D oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
>
>      host_import_key =3D d.getVar("SPDX_BUILD_HOST")
> -    invoked_by =3D objset.new_agent("SPDX_INVOKED_BY", add=3DFalse)
> -    on_behalf_of =3D objset.new_agent("SPDX_ON_BEHALF_OF", add=3DFalse)
> +    invoked_by =3D objset.new_agent("SPDX_INVOKED_BY", add=3DFalse,
> expand=3DTrue)
> +    on_behalf_of =3D objset.new_agent("SPDX_ON_BEHALF_OF", add=3DFalse,
> expand=3DTrue)
>
>      if d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") =3D=3D "1":
>          # Since the Build objects are unique, we may as well set the
> creation
> @@ -1536,7 +1536,7 @@ def create_image_sbom_spdx(d):
>      objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
>
>      # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
> -    supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)
> +    supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse,
> expand=3DTrue)
>      if supplier is not None:
>          supplier_id =3D supplier if isinstance(supplier, str) else
> supplier._id
>          if not isinstance(supplier, str):
> @@ -1657,7 +1657,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir=
,
> toolchain_outputname):
>      )
>
>      # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
> -    supplier =3D objset.new_agent("SPDX_SDK_SUPPLIER", add=3DFalse)
> +    supplier =3D objset.new_agent("SPDX_SDK_SUPPLIER", add=3DFalse,
> expand=3DTrue)
>      if supplier is not None:
>          supplier_id =3D supplier if isinstance(supplier, str) else
> supplier._id
>          if not isinstance(supplier, str):
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244150):
> https://lists.openembedded.org/g/openembedded-core/message/244150
> Mute This Topic: https://lists.openembedded.org/mt/120910416/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000573a8a0659d3526f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24,=
 2026 at 2:14=E2=80=AFPM iwanicki92 via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;iwanicki92=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sub-variables (=
_name, _type, _comment, _id_email) were being looked<br>
up using the literal string &quot;SPDX_IMAGE_SUPPLIER&quot;, &quot;SPDX_SDK=
_SUPPLIER&quot;<br>
&quot;SPDX_PACKAGE_SUPPLIER&quot;, &quot;SPDX_INVOKED_BY&quot;, &quot;SPDX_=
ON_BEHALF_OF&quot;,<br>
instead of the value of those variables, breaking the documented<br>
ability to use a custom prefix (e.g. MY_COMPANY).<br>
<br>
Tested by setting in local.conf:<br>
<br>
```<br>
MY_COMPANY_name =3D &quot;CCCC&quot;<br>
MY_COMPANY_type =3D &quot;organization&quot;<br>
SPDX_IMAGE_SUPPLIER =3D &quot;MY_COMPANY&quot;<br>
SPDX_IMAGE_SUPPLIER_name =3D &quot;AAAA&quot;<br>
SPDX_IMAGE_SUPPLIER_type =3D &quot;organization&quot;<br>
SPDX_PACKAGE_SUPPLIER =3D &quot;MY_COMPANY&quot;<br>
SPDX_PACKAGE_SUPPLIER_name =3D &quot;BBBB&quot;<br>
SPDX_PACKAGE_SUPPLIER_type =3D &quot;organization&quot;<br>
```<br>
<br>
And then comparing `core-image-minimal-qemux86-64.rootfs.spdx.json`<br>
SBOMs. Before this change SBOM contained only AAAA and BBBB but no CCCC,<br=
>
after there was only CCCC.<br></blockquote><div><br></div><div>This isn&#39=
;t how these=C2=A0variables are intended to work; I&#39;m not sure where th=
e documentation you found suggests this, but the values for any base variab=
le are suffixes always appended to that base variable. For example:</div><d=
iv><br></div><div>
SPDX_IMAGE_SUPPLIER =3D &quot;MY_COMPANY&quot;</div><div>SPDX_IMAGE_SUPPLIE=
R_MY_COMPANY_name =3D &quot;CCCC&quot;</div><div>SPDX_IMAGE_SUPPLIER_MY_COM=
PANY_type =3D &quot;organization&quot;</div><div>=C2=A0</div><div><br></div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: iwanicki92 &lt;<a href=3D"mailto:iwanicki92@gmail.com" targe=
t=3D"_blank">iwanicki92@gmail.com</a>&gt;<br>
---<br>
Changes in v2:<br>
<br>
Change the expand path to fallback to `varname` itself when lookup<br>
doesn&#39;t find anything. This change allows for both old, undocumented `_=
ref`<br>
indirection and documented indirection (`SPDX_* =3D &quot;&lt;PREFIX&gt;&qu=
ot;`)<br>
---<br>
=C2=A0meta/lib/oe/sbom30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 10 +++++-----<br>
=C2=A02 files changed, 10 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py<br>
index e02382c3cc78..becf9e30d392 100644<br>
--- a/meta/lib/oe/sbom30.py<br>
+++ b/meta/lib/oe/sbom30.py<br>
@@ -397,7 +397,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.doc.import_.append(m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return spdxid<br>
<br>
-=C2=A0 =C2=A0 def new_agent(self, varname, *, creation_info=3DNone, add=3D=
True):<br>
+=C2=A0 =C2=A0 def new_agent(self, varname, *, creation_info=3DNone, add=3D=
True, expand=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if expand:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 varname =3D self.d.getVar(varnam=
e) or varname<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not varname:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ref_varname =3D self.d.getVar(f&quot;{var=
name}_ref&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ref_varname:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ref_varname =3D=3D varna=
me:<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index dac02e378429..88c707476a65 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -905,7 +905,7 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_purpose=
s=3D[&quot;install&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supplier =3D build_objset.new_ag=
ent(&quot;SPDX_PACKAGE_SUPPLIER&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supplier =3D build_objset.new_ag=
ent(&quot;SPDX_PACKAGE_SUPPLIER&quot;, expand=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if supplier is not None:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spdx_package.=
suppliedBy =3D (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0supplier if isinstance(supplier, str) else supplier._id<br>
@@ -1213,8 +1213,8 @@ def write_bitbake_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0objset =3D oe.sbom30.ObjectSet.new_objset(d, &quot;bitb=
ake&quot;, False)<br>
<br>
=C2=A0 =C2=A0 =C2=A0host_import_key =3D d.getVar(&quot;SPDX_BUILD_HOST&quot=
;)<br>
-=C2=A0 =C2=A0 invoked_by =3D objset.new_agent(&quot;SPDX_INVOKED_BY&quot;,=
 add=3DFalse)<br>
-=C2=A0 =C2=A0 on_behalf_of =3D objset.new_agent(&quot;SPDX_ON_BEHALF_OF&qu=
ot;, add=3DFalse)<br>
+=C2=A0 =C2=A0 invoked_by =3D objset.new_agent(&quot;SPDX_INVOKED_BY&quot;,=
 add=3DFalse, expand=3DTrue)<br>
+=C2=A0 =C2=A0 on_behalf_of =3D objset.new_agent(&quot;SPDX_ON_BEHALF_OF&qu=
ot;, add=3DFalse, expand=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;SPDX_INCLUDE_BITBAKE_PARENT_BUILD&quo=
t;) =3D=3D &quot;1&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Since the Build objects are unique, we =
may as well set the creation<br>
@@ -1536,7 +1536,7 @@ def create_image_sbom_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0objset, sbom =3D oe.sbom30.create_sbom(d, image_name, r=
oot_elements)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Set supplier on root elements if SPDX_IMAGE_SUPPLIER =
is defined<br>
-=C2=A0 =C2=A0 supplier =3D objset.new_agent(&quot;SPDX_IMAGE_SUPPLIER&quot=
;, add=3DFalse)<br>
+=C2=A0 =C2=A0 supplier =3D objset.new_agent(&quot;SPDX_IMAGE_SUPPLIER&quot=
;, add=3DFalse, expand=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0if supplier is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0supplier_id =3D supplier if isinstance(su=
pplier, str) else supplier._id<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(supplier, str):<br>
@@ -1657,7 +1657,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, =
toolchain_outputname):<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Set supplier on root elements if SPDX_SDK_SUPPLIER is=
 defined<br>
-=C2=A0 =C2=A0 supplier =3D objset.new_agent(&quot;SPDX_SDK_SUPPLIER&quot;,=
 add=3DFalse)<br>
+=C2=A0 =C2=A0 supplier =3D objset.new_agent(&quot;SPDX_SDK_SUPPLIER&quot;,=
 add=3DFalse, expand=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0if supplier is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0supplier_id =3D supplier if isinstance(su=
pplier, str) else supplier._id<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(supplier, str):<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#244150): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244150" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/244150</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120910416/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120910416/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000573a8a0659d3526f--

