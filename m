Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5622CF5510D
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 21:55:36 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18176.1772920531308092424
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 13:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h/XaQdF8;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79801df3e21so93808877b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 13:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772920530; cv=none;
        d=google.com; s=arc-20240605;
        b=baDOVBd0dVpgqtTiS+IC7Khg+L4GHq0rkVNQ+oP8rA1SJHUNNnF8s5VBMvH+YZmM2i
         bZz1xArgbEwJ3IKgocqMsLCqnFbBre7Mp6t5TMTKin93PBmfWVdAavCiBtWUB9RYzksi
         qDzTzIBpQBEDQfZVF3E1mW6j61tGi2g0BSVTzUN7YUrs146YKP1w3N/k59kqhNfvyYqB
         hhvlX7Kgc3BLW9nz+K88sKwn8x+rYdrjcVR6EsY3Q7lFn+PPUwref1aIKDhf7mUaTFhg
         s1BLFIhFIvHSmoEtyPjMZbBu8hbEh99ZzQ+sbJMnw0PrkyWLRlaIt2GPB6IRaXHyYVJ+
         XlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Re4kzSad5/qiw78txr6o+iC+b75ejT9bRfSGHqklImI=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=eaXJpMFatAGvXresJkeropgjPMaQCR9W948tN8u7p72YyvQsbUCAcqj7S8kvAsj6pT
         JOdZ2Xczhlv80rC2H4ec3BKxw7JIKzffUS18FvrZ6SZIyaOAir1hrk8DYHlgylAxPocV
         molyx1To2kWrsuiU861mhflW2WvUmWapXEpvxU30cV+KIa2HiRRnX5bUibX/xy8ziu6Y
         BYSCubkKr5SpqZ0fF05XBKElanmat8s+gCYR9AJgOIPdPVrv1MVYA2Qg0jyfmXcusXwH
         z4iZcb8y+T2XigBGX4zAT9vwn3pBtLlZXd/zmRSGsp+dwKy7k/RMgON0d7amA6ETOqQV
         pWYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772920530; x=1773525330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re4kzSad5/qiw78txr6o+iC+b75ejT9bRfSGHqklImI=;
        b=h/XaQdF8189qTL/WlV0Wx9lOIvTZ1w8Omig2RZFwSABHjtw92EPtxW3BagFzbN0GFO
         5Rx8h68C49JjL78SKBu9SQpEhDUw+2mFnXZXHq7ib29NsdEedU4ZO1szWLTOmuan4Rmv
         P4q6OzIrDU2K3vpdjqfFrq6CU4ZKe4BDUQ00isPcnwB4yL7zjobk/tOvEECUe7xgp24a
         i2hrFTLKvWVa3A3bZn3VOxnB7X71Sg08UefAbWAeNOZyqH+IEv+gT2T0cdKhOt2zam0o
         fGYVwHSpGduS6HosdPcBM0evJ27x5hTAlO8PF1ohjxl5PV7ypP5d5wgaY2FWLAKRFuzv
         wMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772920530; x=1773525330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Re4kzSad5/qiw78txr6o+iC+b75ejT9bRfSGHqklImI=;
        b=jX8FLdNt3pwROLQwGr/3XX9vFu5u2L4EPneM8mzO9O1+hlHl8W7aKgMNBmHpXvwqvr
         Z0vGT317Xng0LWSmgLvsgsQUiQU/hosz3uB4M/S9XBfsky00kOfp8okPCCfY6fKIlbJy
         7q7WWQSkQRIO7MUBscWjAzeotskjy4Gn2l6T05CrzsRZRGY5kduWTKgjCNlvEiNXjO2+
         ozgYv/YKImjWcGzNqg3VmYclBHaRQfmritQUiggbfxEjM9DqMudOriALtjIudHE7JB3z
         ovExo7SsV3gopE6yADvjrJCb6kG13vSkLUG205RCA81rzdHIKu65UM7WD/JFsGfrWNSk
         mfxQ==
X-Gm-Message-State: AOJu0YyNV7vJiS5CAGcZuabon76pTvQO+4HEQv4gTKJFG8nhB6VjhK3r
	zvTJnv9XW2w9b/JaEAgdEXf2JJAKqN36NrPtbdwm5FUtsqwHf9SmcdwTVNnTdO5LMX7GkuQF2Il
	DPXnsQ75K4vn+srMT/zgu7NKGg5ypKnE=
X-Gm-Gg: ATEYQzwf0hfZshJy8MD3QxcASMIJtK54o6X3nSPf3oeA3JDlCJGhPtYO2sNqPNrgvwt
	Ce4E/S/cfoDF8HLMTCLAsR2cZFw6oTo0c/8+0ukioJd/Pwini7+rvt3cu20DRs8W3DCNOW+olKV
	sY+6u7Cj2z/4KwUneMqE9SC2mX75CIlMhCjzXxSBA7Al9HURGvWQbWW/VQHhoNvDA/UxMVuGwFi
	BMvCrJD6TNRRskpJD1dVXKagJZmYpqyQxANN7UM85FlPdE+RU3r0JN+43eabj8aXhCHlV/ce9EW
	Mx327wGEd50b82s68q8FbA==
X-Received: by 2002:a05:690c:2603:b0:797:afb7:b1eb with SMTP id
 00721157ae682-798dd78918dmr58815707b3.49.1772920530371; Sat, 07 Mar 2026
 13:55:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <4a45ebaaa895fa7976d13572ed2b6f25a59592c3.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <4a45ebaaa895fa7976d13572ed2b6f25a59592c3.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 14:55:19 -0700
X-Gm-Features: AaiRm52ek377QXNa4-paSXxnxyp5cdv-HT4EPzuLeL9YguJQF313ZSZLxX79gtg
Message-ID: <CAJdd5Ga_E6ieb9OnZ51wmM4c8U0f2c6WHr-+BkHzJpJpQJPFDQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 02/10] spdx30: Add supplier support for image
 and SDK SBOMs
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joshua.watt@garmin.com, 
	ross.burton@arm.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 21:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232617

You have extraneous changes that don't belong in this patch set, but
otherwise I'm fine with the addition of SPDX_IMAGE_SUPPLIER and
SPDX_SDK_SUPPLIER

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This commit adds support for setting supplier information on image and SD=
K
> SBOMs using the suppliedBy property on root elements.
>
> New configuration variables:
>
>   SPDX_IMAGE_SUPPLIER (optional):
>     - Base variable name to describe the Agent supplying the image SBOM
>     - Follows the same Agent variable pattern as SPDX_PACKAGE_SUPPLIER
>     - Sets suppliedBy on all root elements of the image SBOM
>
>   SPDX_SDK_SUPPLIER (optional):
>     - Base variable name to describe the Agent supplying the SDK SBOM
>     - Follows the same Agent variable pattern as SPDX_PACKAGE_SUPPLIER
>     - Sets suppliedBy on all root elements of the SDK SBOM
>
> Implementation:
>
>   - create_image_sbom_spdx(): After create_sbom() returns, uses
>     objset.new_agent() to create supplier and sets suppliedBy on
>     sbom.rootElement
>
>   - create_sdk_sbom(): After create_sbom() returns, uses objset.new_agent=
()
>     to create supplier and sets suppliedBy on sbom.rootElement
>
>   - Uses existing agent infrastructure (objset.new_agent()) for proper
>     de-duplication and metadata handling
>
>   - No changes to generic create_sbom() function which is used for recipe=
s,
>     images, and SDKs
>
> Usage example in local.conf:
>
>   SPDX_IMAGE_SUPPLIER_name =3D "Acme Corporation"
>   SPDX_IMAGE_SUPPLIER_type =3D "organization"
>   SPDX_IMAGE_SUPPLIER_id_email =3D "sbom@acme.com"
>
> This enables compliance workflows that require supplier metadata on image
> and SDK SBOMs while following existing OpenEmbedded SPDX patterns.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 26 +++++++++++++++++++++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index d4575d61c4..def2dacbc3 100644
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
> index bd703b5bec..0888d9d7e4 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -162,7 +162,7 @@ def add_package_files(
>          bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>
>      # File filtering configuration
> -    spdx_file_filter =3D (d.getVar("SPDX_FILE_FILTER") or "all").lower()
> +    spdx_file_filter =3D (d.getVar("SPDX_FILES_INCLUDED") or "all").lowe=
r()
>      essential_patterns =3D (d.getVar("SPDX_FILE_ESSENTIAL_PATTERNS") or =
"").split()
>      exclude_patterns =3D (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").=
split()
>
> @@ -244,7 +244,7 @@ def add_package_files(
>  def get_package_sources_from_debug(
>      d, package, package_files, sources, source_hash_cache
>  ):
> -    spdx_file_filter =3D (d.getVar("SPDX_FILE_FILTER") or "all").lower()
> +    spdx_file_filter =3D (d.getVar("SPDX_FILES_INCLUDED") or "all").lowe=
r()
>
>      def file_path_match(file_path, pkg_file):
>          if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
> @@ -283,7 +283,7 @@ def get_package_sources_from_debug(
>              if spdx_file_filter in ("none", "essential"):
>                  bb.debug(
>                      1,
> -                    f"Skipping debug source lookup for {file_path} in {p=
ackage} (filtered by SPDX_FILE_FILTER=3D{spdx_file_filter})",
> +                    f"Skipping debug source lookup for {file_path} in {p=
ackage} (filtered by SPDX_FILES_INCLUDED=3D{spdx_file_filter})",
>                  )
>                  continue
>              else:
> @@ -1330,6 +1330,16 @@ def create_image_sbom_spdx(d):
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
> @@ -1441,6 +1451,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232568): https://lists.openembedded.org/g/openembedde=
d-core/message/232568
> Mute This Topic: https://lists.openembedded.org/mt/118170493/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

