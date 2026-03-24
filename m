Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A72EF54AC5
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:24:18 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20956.1774362255550696855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 07:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OUBwwMNx;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79800183233so66680197b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 07:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774362255; cv=none;
        d=google.com; s=arc-20240605;
        b=RHOfKFYJPW2w4eAzVOPNU9SNrBY2GUzS7B1iJ8yM+X4mexsqLgDutU8dRDfLx/lHhV
         YGX9KjCXMO3Ud6MhORV9LxsUL0f4Uf/fbO6RFE0GsGYf/+A4Yn2CVSKL1kwPCuXJSL7S
         hGPmVX9za/bznOgFzGxhuwiop2Nw2iP/ZA6HsYsxZd2N7D/tmo46FSCzs/TvcmkNfRNu
         1vilvucTXrnWcYWT+TF9yeTmml29XnddMQietqrZbOvEx0F2Y367JLesrx27RKdMgrwC
         5SA8LMx9HWT9/IEc9DP51/V2+dn+HUE3EJ4MXLeRmeuDnlsJ3b0EDmYzzQZYOLvmm5T9
         3/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nULNPip3Xy3Oc1XK8QyCHlpIZGkRf86e9kHL3RFAX5U=;
        fh=DXi/jZN+Y0f6AuF67U0rstiU79zA7VkJWDisO6OBcA4=;
        b=D9bCY1+ciojGmlDn7zIZf8hFQQIfRgeA8ZNkE7dp9msOjzbxs7zws8lpY2c6rgL+xF
         lLKHYEyANSSfcjark/Pq5cVnKRv9WS3ZpQAqM6kJlRXok0HAoP+Bsf5S49DUISBuLI1l
         n+HnUdazFeKSVnZes4Kwjndn3GyISZXJ/D27Qv7FBMoyIOdXo+Z8A8vSIcpEUrzssBtT
         623ps01Tpo91Bprl22fr3du0nkUjmM6bYxcC8CIFizQl6hWHEQQx76GC/ykJ9nXJPQIY
         j75kPv/LSOwEFmm9zCxQ5v0pxiLTZNTraFJqs1WJqXHLMhuXSObmxcZcE7JTJwNpDncm
         Z2iw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774362255; x=1774967055; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nULNPip3Xy3Oc1XK8QyCHlpIZGkRf86e9kHL3RFAX5U=;
        b=OUBwwMNx5GpLOXlauskLKAbos9Wsdnc3xeT8h/glY+2Tjf9Ejc2/kCwKS0W7RvWD1N
         urFTmfawFqhGaRvHmjNQuxQlD+WylTn4Zg3BP2DC3fOaGLUwq7+o/7H7XFxRLKf/ad2g
         iLJQxdkH+UEri41GEevAnk6E6JvhsxtdV7R8RDKQtdDGgPSD10eiJ3SzeaF9SSZqCJT7
         tzBCiNVJ7xgYOfAUHsJUykwcHnNk4M+RpeYdCkOOsahAMqy0Bv6SfjGROxS1i6YKhBzP
         6I4dAD5YyL70HbGOdt38LOtdGTY7oS7bhL8U+Z1vsuVhtPNP+1DEeX8xx/0/z6D+nd5m
         WTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362255; x=1774967055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nULNPip3Xy3Oc1XK8QyCHlpIZGkRf86e9kHL3RFAX5U=;
        b=DbxhC5rATDfDW3HXiboh95yXke0fO+m25o1J3pDniHBKNxUD/WuAHTM8pP45fmYylx
         zhpVOPYp4RuumXiTBabsKYhyzeo+w5IlzmUBFwy1jC/t7umgXxVVAE3ocqf4VRHPCJ9a
         oMhKu72aXPWyoQFWSlaG+TGVh5i7VWgAWdx/1UK8v5uF1tbRvGH7K1wmHbaZBP+l0KC6
         UAsi0RAapr1igKnfHFP90Jpws4+B+opmKY+PTVn22GBaglqLB84x4ACF8fXUnpamyFUR
         4wsqX8BGthHYZNb3faTOr8x9uNnBoZ+rDPZUjwB6OZU1jIQByrCWLcLWwnv0+qYyCW6n
         0fIA==
X-Gm-Message-State: AOJu0YwxJsMtBhjo9WuI7bcUsK++apDnCwCztQDwM7LAeshKddZTxEJO
	WbIe28AgBk7hjXx1k0ghZJpZYCdftQ+R9UsSOTDSqVEJz/KTGCmxMSSD8WjBHJV5C0tc/VDJAIS
	+7DcoBd9BIWUIBgzBXIuucWcA/9Rv7Mw=
X-Gm-Gg: ATEYQzx2iXK5pclHky6RAajDfie67+3RU/PtvCTw4RoqEC99I/Sa1mc7ScsuG6bOaOs
	/mBDrpk+el3uZDi+wLksFtABj/+G7qy/YGKbLRdW3Z7RkcxFzh3TvRDrixtYHBd76QpIN9BNTzR
	UoeTb0jsnk2dd5W1xdgVfSR8i/QbDi+XJIa3dE/PkgvmzTgS8hpplNucHhDQ3saNn5NBjvpZS3P
	YLXetlPKGjSRNBhGROcIAPfMG7CH4/qXJp7N0Kaw9iSLnzVsJVqGuelhV3Rvu4vPGr0FPcn48H4
	7HelJQiqpqNObrp5nKfnkA==
X-Received: by 2002:a05:690c:388:b0:796:2f6c:70b7 with SMTP id
 00721157ae682-79ac2f69fbdmr34255157b3.27.1774362254537; Tue, 24 Mar 2026
 07:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
 <20260324132958.2316491-1-stondo@gmail.com> <20260324132958.2316491-3-stondo@gmail.com>
In-Reply-To: <20260324132958.2316491-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Mar 2026 08:24:03 -0600
X-Gm-Features: AQROBzBMrDUBTBk4MWhMEqp-HgdTCuVh0K7l7G7MlR3rnUdr4c5Oq4qcu-YSZIA
Message-ID: <CAJdd5GZHep1efF6cn+nczsxQfCL+JgeLUDQ0mGt7CqkSStx3bQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v14 2/4] spdx30: Add supplier support for image
 and SDK SBOMs
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 14:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233803

On Tue, Mar 24, 2026 at 7:30=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
> setting a supplier agent on image and SDK SBOM root elements using
> the suppliedBy property.
>
> These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
> standard agent variable system to define supplier information.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

If you push a new patch please don't copy the review tag.

> ---
>  meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 23 ++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 7515f460c3..9a6606dce6 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -124,6 +124,16 @@ SPDX_ON_BEHALF_OF[doc] =3D "The base variable name t=
o describe the Agent on who's
>  SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the A=
gent who \
>      is supplying artifacts produced by the build"
>
> +SPDX_IMAGE_SUPPLIER[doc] =3D "The base variable name to describe the Age=
nt who \
> +    is supplying the image SBOM. The supplier will be set on all root el=
ements \
> +    of the image SBOM using the suppliedBy property. If not set, no supp=
lier \
> +    information will be added to the image SBOM."
> +
> +SPDX_SDK_SUPPLIER[doc] =3D "The base variable name to describe the Agent=
 who \
> +    is supplying the SDK SBOM. The supplier will be set on all root elem=
ents \
> +    of the SDK SBOM using the suppliedBy property. If not set, no suppli=
er \
> +    information will be added to the SDK SBOM."
> +
>  SPDX_PACKAGE_VERSION ??=3D "${PV}"
>  SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
>      in software_Package"
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 68ed821a8c..62a00069df 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1449,6 +1449,16 @@ def create_image_sbom_spdx(d):
>
>      objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
>
> +    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
> +    supplier =3D objset.new_agent("SPDX_IMAGE_SUPPLIER", add=3DFalse)
> +    if supplier is not None:
> +        supplier_id =3D supplier if isinstance(supplier, str) else suppl=
ier._id
> +        if not isinstance(supplier, str):
> +            objset.add(supplier)
> +        for elem in sbom.rootElement:
> +            if hasattr(elem, "suppliedBy"):
> +                elem.suppliedBy =3D supplier_id
> +
>      oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
>
>      def make_image_link(target_path, suffix):
> @@ -1560,12 +1570,19 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_d=
ir, toolchain_outputname):
>          d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
>      )
>
> +    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
> +    supplier =3D objset.new_agent("SPDX_SDK_SUPPLIER", add=3DFalse)
> +    if supplier is not None:
> +        supplier_id =3D supplier if isinstance(supplier, str) else suppl=
ier._id
> +        if not isinstance(supplier, str):
> +            objset.add(supplier)
> +        for elem in sbom.rootElement:
> +            if hasattr(elem, "suppliedBy"):
> +                elem.suppliedBy =3D supplier_id
> +
>      oe.sbom30.write_jsonld_doc(
>          d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
>      )
> -
> -
> -def create_recipe_sbom(d, deploydir):

This is removed in error. Please add it back

>      sbom_name =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
>
>      recipe, recipe_objset =3D load_recipe_spdx(d)
> --
> 2.53.0
>

