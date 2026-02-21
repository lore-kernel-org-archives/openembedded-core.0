Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79118C61DF1
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 16:47:47 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23057.1771692464318287146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 08:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fwGtVwSC;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64adabaafd6so2648594d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771692463; cv=none;
        d=google.com; s=arc-20240605;
        b=Xc0g1H+ojhnPWTniKRjzS7LoI4s3qER1qzs+VyCuUuAhMftjiXMj3oJDjLJYWEnfyz
         3dfv48/XF4PZ9tp7NQOJ8VNz+kqgNf40stYtco33GqWNTj8Z3BVtA7AGrsc7QnHNq7Mw
         tFjvJftJIU29qgH0d9/gEU8Y5dsVTG+7fvnGHK7662k6kbzL/MdslY+Wncn64nmxsACb
         pZbyzlGgrVwXuMX6iCIQY0lPnTs44JaxNNNh0xj+h18yjCR/dyaRmuUvNiW5UV9nubLP
         py9PW+fIzjGgO513TSf/Tt1Ca8Na/0aw9ggfRSidTbSZ90t1grFRtGOATMVSmnlp+Htw
         nnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YHreURJnCLzX8C2P07DmtRaGrw+jXqH05Goac8Z2MXE=;
        fh=bNoVUmK9O0vE3kX3q1TCx065x9AJf7wShrYaRToWCWk=;
        b=JGp3/nawzU8D6bouajxMR5dp5Yaj1jU7qbdVtDtWxuuI/RdqUG9jLZRPEaDgrfRNNG
         v6vzMcnUhY+9/S47kxX9fQImr9ju9HSs5qwV5m85jww7W2c7SbU73EtihD6yoiMFde2U
         zGJn5tOX32isTAYW6smcosAPNlm/UfLl0D0wiYqAS/f59W8Lb55S/cYDzVjnHC8RzMVI
         ZaZxvan98Tx4mIlpJbaH1UMDGtkPGy6KlroWHx75xeHOuVAssFfkbhUl8FA6F52C3hf/
         Z5rYQum5Tn4D2Ow50LdQ+IIKccvgYZDpUZmJB1r4yYst4I2Q4roy3zoZY1S2HlPMLfm6
         mj6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771692463; x=1772297263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHreURJnCLzX8C2P07DmtRaGrw+jXqH05Goac8Z2MXE=;
        b=fwGtVwSCeE1XN+CAG6UbY1Vqg504FT3xSkdHgYv7nUKLQGBJTjgpk/uWI100eorjfK
         t5adSFsHdGmM3mtC3qTyfwmCGrnb+KTIy6ViUSr5b6/EwP131DntIyFAsrKJ74brPmRq
         5Pm8fXB09l19Nsy1ZWAvK/A2wFbQsIbyp1GC/XkQi6ccO/rP/SjKpmjF+1JTxmp3PVsY
         FZXHuRCIwxMqyw3pVS4Kss6vWh7hChVXRQu+rfvSaDJ+nXjmB1OY+Ajxfe3O7o8vMt2/
         pZdFOuNMvL7kVpUQlWehvFSR/yMbVJeY8RnaQ1zI0nw2h0uO8iIN59C0lsqFITmKfsc9
         gucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692463; x=1772297263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHreURJnCLzX8C2P07DmtRaGrw+jXqH05Goac8Z2MXE=;
        b=ZwOJSfz7PGCr+XnMCvV+90OFjFhLVaUYwua7WEgL4Wc1maGqUowXt77N5NQQ6VEcmf
         af33m/awu5pHsxQzWjyUJWuG1joulgzRQrU5PU8rVKUGlEeiKeI/kTohNDR7j7ZWJSgJ
         KW0T6W0Y95oPbMCrhHadX7kbUhteP7yPq/lBMPqTAR9oChb0SnEeQVbdSHdVdxG428Rh
         YPWuB94qIZs/dzVp/uWujZ1S77xjoenH70ObC7rdIzRydZ5EpIPclsDdnnVDk9cFYbfV
         JwLBuYvhof3Dnu5leNvf5HAxIsVbAZlwYhacQfrg1sZlYEODvbpbgSuidfW+f8lspUmD
         79vQ==
X-Gm-Message-State: AOJu0YxiI8gRT6vBHITNG8T8/v9HI/dkdQkNfFV8VKOCWvwA+rWzl/vm
	k62z+ugXGsteq9XO3yVAhrjugnTDmkgIqHvPGXG8eXX+m8C5mzl+pHCVQLhbRcE9EGaNPTYyuFF
	HH9UoO/YM880RlFHKxIh3oJKbpozkDivB6Q==
X-Gm-Gg: AZuq6aJ6dv6wPskzOvS8EwEQoBWbSAb7/0x4jWmvf7cGHYQW6QLBLSo6aD9TVL2XaiK
	qG53mcU22BuMi1OISKhPgxQ+UNhTnC0E06rlCWDU4BkOBn/4gwr3WySzGOGiDUNCCvT39fHH0bk
	+82TuhOgBgqY4YXslEX43gR5/faA0cwVy6ATz/qoLDFd6WXJD6BW8Ks9i1MV0+Vc+dGRA+9WYGX
	/yRUIfcKCuWJtbgUBc8ARGeNjbqjMzmhCbmAFWx1O7KiRMqQnwhrWj9OzGTqaWlccYSGwpW4m+y
	REoALQ==
X-Received: by 2002:a53:d5cb:0:b0:649:d68c:1f60 with SMTP id
 956f58d0204a3-64c78adfc84mr2101937d50.33.1771692463445; Sat, 21 Feb 2026
 08:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20260221051006.335141-1-stondo@gmail.com> <20260221051006.335141-10-stondo@gmail.com>
In-Reply-To: <20260221051006.335141-10-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 21 Feb 2026 09:47:32 -0700
X-Gm-Features: AaiRm52Z7r4xIbwm5yM0Owc3CHdLC0Vo7tcwKa4xK2hTtrV6PNyWF3Xo6eEvGPw
Message-ID: <CAJdd5GZi+m9H2znKQru=qCrf178a+UpDoAeDOh76uPrpciCr_A@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] spdx30: Add image root metadata package with
 describes relationship
To: Stefano Tondo <stondo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000ef5991064b584bc7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 16:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231620

--000000000000ef5991064b584bc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026, 10:10=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wro=
te:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Create a root metadata software_Package for the image that describes
> what the SBOM represents:


I think my recipe spdx changes that I sent to the list will eliminate the
need for this, since there will be a package that represents the "recipe"
you can use instead.


> - Package name: {image_basename}-{machine}
> - Version from BUILDNAME (with '1.0' fallback)
> - Primary purpose: container
>

This is wrong regardless

- Description from IMAGE_DESCRIPTION (with generated fallback)
> - Supplier from SPDX_SUPPLIER if available
>
> Add structural relationships:
> - Document 'describes' the image package
> - Image package 'contains' each recipe's artifacts
>
> This fixes sbom-lint warnings about missing root elements and
> provides proper SBOM structure for compliance tools.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ef47bd4205..0d62de61a3 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1498,6 +1498,31 @@ def create_image_spdx(d):
>          d, "%s-%s-image" % (image_basename, machine)
>      )
>
> +    # Create root metadata package for the image
> +    # This describes what the SBOM represents and fixes sbom-lint warnin=
g
> +    image_package =3D objset.add_root(
> +        oe.spdx30.software_Package(
> +            _id=3Dobjset.new_spdxid("image", "root"),
> +            creationInfo=3Dobjset.doc.creationInfo,
> +            name=3Df"{image_basename}-{machine}",
> +            software_packageVersion=3Dd.getVar("BUILDNAME") or "1.0",
> +
> software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.container,
> +            description=3Dd.getVar("IMAGE_DESCRIPTION") or
> f"{image_basename} image for {machine}",
> +        )
> +    )
> +
> +    # Set supplier if available
> +    supplier =3D d.getVar("SPDX_SUPPLIER")
> +    if supplier:
> +        image_package.suppliedBy =3D supplier
> +
> +    # Create describes relationship from document to image
> +    objset.new_relationship(
> +        [objset.doc],
> +        oe.spdx30.RelationshipType.describes,
> +        [image_package],
> +    )
> +
>      with manifest_path.open("r") as f:
>          manifest =3D json.load(f)
>
> @@ -1565,6 +1590,13 @@ def create_image_spdx(d):
>                  artifacts,
>              )
>
> +            # Link artifacts to the image package
> +            objset.new_relationship(
> +                [image_package],
> +                oe.spdx30.RelationshipType.contains,
> +                artifacts,
> +            )
> +
>      if builds:
>          rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
>              d,
> --
> 2.53.0
>
>

--000000000000ef5991064b584bc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 20, 2026, 10:10=E2=
=80=AFPM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.com">stondo@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Stefano T=
ondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemens.com" target=3D"_blank"=
 rel=3D"noreferrer">stefano.tondo.ext@siemens.com</a>&gt;<br>
<br>
Create a root metadata software_Package for the image that describes<br>
what the SBOM represents:</blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I think my recipe spdx changes that I sent to the list=
 will eliminate the need for this, since there will be a package that repre=
sents the &quot;recipe&quot; you can use instead.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote=
 gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
- Package name: {image_basename}-{machine}<br>
- Version from BUILDNAME (with &#39;1.0&#39; fallback)<br>
- Primary purpose: container<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">This is wrong regardless=C2=A0</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
- Description from IMAGE_DESCRIPTION (with generated fallback)<br>
- Supplier from SPDX_SUPPLIER if available<br>
<br>
Add structural relationships:<br>
- Document &#39;describes&#39; the image package<br>
- Image package &#39;contains&#39; each recipe&#39;s artifacts<br>
<br>
This fixes sbom-lint warnings about missing root elements and<br>
provides proper SBOM structure for compliance tools.<br>
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank" rel=3D"noreferrer">stefano.tondo.ext@siemens.com</=
a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 32 ++++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 32 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index ef47bd4205..0d62de61a3 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -1498,6 +1498,31 @@ def create_image_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d, &quot;%s-%s-image&quot; % (image_basen=
ame, machine)<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
+=C2=A0 =C2=A0 # Create root metadata package for the image<br>
+=C2=A0 =C2=A0 # This describes what the SBOM represents and fixes sbom-lin=
t warning<br>
+=C2=A0 =C2=A0 image_package =3D objset.add_root(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.software_Package(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _id=3Dobjset.new_spdxid(&quot;im=
age&quot;, &quot;root&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 creationInfo=3Dobjset.doc.creati=
onInfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3Df&quot;{image_basename}-{=
machine}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 software_packageVersion=3Dd.getV=
ar(&quot;BUILDNAME&quot;) or &quot;1.0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 software_primaryPurpose=3Doe.spd=
x30.software_SoftwarePurpose.container,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3Dd.getVar(&quot;IMA=
GE_DESCRIPTION&quot;) or f&quot;{image_basename} image for {machine}&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # Set supplier if available<br>
+=C2=A0 =C2=A0 supplier =3D d.getVar(&quot;SPDX_SUPPLIER&quot;)<br>
+=C2=A0 =C2=A0 if supplier:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_package.suppliedBy =3D supplier<br>
+<br>
+=C2=A0 =C2=A0 # Create describes relationship from document to image<br>
+=C2=A0 =C2=A0 objset.new_relationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [objset.doc],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.RelationshipType.describes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [image_package],<br>
+=C2=A0 =C2=A0 )<br>
+<br>
=C2=A0 =C2=A0 =C2=A0with manifest_path.open(&quot;r&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest =3D json.load(f)<br>
<br>
@@ -1565,6 +1590,13 @@ def create_image_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Link artifacts to the image pa=
ckage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objset.new_relationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [image_package],<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.Relation=
shipType.contains,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 artifacts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if builds:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_image, _ =3D oe.sbom30.find_root_o=
bj_in_jsonld(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d,<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div></div>

--000000000000ef5991064b584bc7--

