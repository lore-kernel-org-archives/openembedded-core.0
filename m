Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AA110AB820
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:13:00 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57317.1774555978998160639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zjy665yn;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a2ee65171so14731737b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774555978; cv=none;
        d=google.com; s=arc-20240605;
        b=Lz1K5u5GdbADVLfgTyyZkczJrtRZ8ehWe+BcfQMebgKymIhWCDbDFPV4ywLCEfN5m7
         ak3A6S2cg45Jz6Q+7Y0JgoxO14guSkfd5bVY7H9XtCR1s+KhqDvJUa82ZosSSmuHnfKM
         76tFpaBCcjnotA8mSrnM4zlgNJD+N46JC9ovsyNKGD1fChgi8ZZZw+XIWO1tflAOpU0x
         75G9NTXm5ZsRzsZZamVod4qWvk9jBVkq27/atgg0DsCDlO4VB7/FNVsuQqjaNQEkxZq7
         cKOQwdOMu7bBeP37zMceTAIsicAAlIerQLjnBR17HwZvqjipkgFwCpQBbGcDw0lTp14R
         wzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o7n2ZRuU+HQRBFvKfEd1nrHLvBDT7wLxQnLutqwQJDg=;
        fh=XL+ydw4zRzqZKs8yhWIx30/frJay1bXF2X1wuGsnf7M=;
        b=i4qlYRQhd3w1bgrJ5RlDf6yPY5z7aQ5V3XPTUQJxrwOMrhnTDbM6iGSRIr5TffquVJ
         6J7mkl+ZQ069FCSMD9KLw+OE72F7BkLysz5MtySOhb/uo4mUgkUPXY9y57PkDNyXwYeu
         zFkGgLdlbAQof9Rd+V4EeUdRnhd1rIV/L+LhkeD/zYuQE7G5wuG/80wXr0tUA4Hkl0Ra
         w8k89mZtblRP8SBebR3vZk8Ow/cicPtrJ6sITU6aFNCs+R30aXnU+fqf9o4BR0tdMe3b
         dCa4LCaIy1Xh0UksazsltANAjOCzlJ75w2Jcf65N4i762XvzKIjOv4mspt+wD4H9+VqA
         EMjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774555978; x=1775160778; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7n2ZRuU+HQRBFvKfEd1nrHLvBDT7wLxQnLutqwQJDg=;
        b=Zjy665ynN3J7i37KgtQfgejyWkAQpaZC09VrMG0boGRfiY6a5BqWtLq8oQTyHUyOdh
         uaH9kRJ986PJF05ewZEn81EXfIy6JHvVLLoY7V/7swTxtvSYDDEIuciM+vO7JQV9S45Y
         NszemQJfKkqqF8jqF6srlrXfObK75Ub0NOVl7QxDEx0z/uQwW7tMTNwaDQEEj2Nub4Q6
         QbFtvCV+kxVLmh2dj4p5Zytx8vOzzopu1MYA/A5irzT/2brFjmegmH4OPmfEhhOMVxIC
         SC4eBpCJBNaV7JLs9HZCU9Z0oproDKFEre6p4K0MHc4bC++LP5WiMR7R2zvcjUffhhzf
         px8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555978; x=1775160778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7n2ZRuU+HQRBFvKfEd1nrHLvBDT7wLxQnLutqwQJDg=;
        b=i2LGXeMEXykJeBICMfPXrkW9pdFfkSJVTh4kA4Lb6AL3ZhRppZlnsyD03lfKXf8fQi
         ++OvuQS0ICJp85ICjWC4nCbKTt1hKMm5FNM8/zjFRVnmdU6b9RXvylVuCWI38nMwSogE
         ak2vVN1CCSVJ6VDbJBZVAwuRJHjDDuIZxaDeBNyE4KUoFLm1h5qztRj94bATDLBflPqw
         M7+K9NIo5dvNqntl05ydd4eOhgrD/wEZzFkbnvkhOmn9NKiVmUW9hxdqjtYqROTdemCQ
         7A84sj8KAM3EsDRft9BwaHLR025UNhXNcT9HvDuQZ2aLuSLrySbZGqzC7qx8Ee4ZisN9
         wr4A==
X-Gm-Message-State: AOJu0YwrsD1QzO8VKU0/Khyn7sUE2VmB7ljrsyflGh7/W+bsz7NFtKvp
	0KPJxzYaaMCpqNp71IiC0Bxn/Iu5kX7RRnIf4N5rivT9p4xNCHlrlbNQ5VjOjHb0/nWwgtip7Qj
	xb5EsP6CexbdK02Ct3pO80oq1RQYLHz0=
X-Gm-Gg: ATEYQzzvHUavgvxcoPjTMPUSmj+e8dDcqLD//8LWGPSgic1LEzplgZiEUZ2MgSpXJI5
	SoCayaqfLqEgGyq9inOavG3tXVB06MRA3nIlZmwWRdxnCKKJuuYhy5GThMc48UzDxI3MODpuiFN
	bvX4zSMT2+A54gnFhcX0vGVeqbEmf7EcR958+ZVZDSrclUlRI7Z4aeFEOpBGUEHZ5I8W3s8isK5
	iAEtxc+zYeZfqOhsTL/JQinlfDy/FF679wyK6OH45WV+OXiDWMzkfuuQgw73BBZGlWKLXxZ2v6s
	gzXOy1uaTCtk3aU3WVt7fYE9BgUA7/Kq
X-Received: by 2002:a05:690c:c507:b0:79b:ccb6:a845 with SMTP id
 00721157ae682-79bccb6ae3bmr38891927b3.49.1774555977841; Thu, 26 Mar 2026
 13:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260324132958.2316491-1-stondo@gmail.com> <20260324171502.689012-3-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260324171502.689012-3-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Mar 2026 14:12:45 -0600
X-Gm-Features: AQROBzBTjeey4d4uDDFm9vkgCRov0uFBJAoWPP-lWaENEG8R3-CUnfxgRg1aavw
Message-ID: <CAJdd5GYd_uMEmkFAOyv+-Z8zYomMwhU9bXXT38BsEwEO1fJ49A@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] spdx30: Add supplier support for image and SDK SBOMs
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234048

On Tue, Mar 24, 2026 at 11:15=E2=80=AFAM Stefano Tondo <stondo@gmail.com> w=
rote:
>
> Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
> setting a supplier agent on image and SDK SBOM root elements using
> the suppliedBy property.
>
> These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
> standard agent variable system to define supplier information.
>

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
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
> index 68ed821a8c..51e10befba 100644
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
> @@ -1560,6 +1570,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
r, toolchain_outputname):
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
> --
> 2.53.0
>

