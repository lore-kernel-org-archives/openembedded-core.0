Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B69E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:43:49 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.25385.1736268228399424938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGUvmvUM;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54026562221so16808101e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268226; x=1736873026; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wizLXA+6ME0qg/aMNKMMXYjrgUWv7n+3qOcjUBszMhM=;
        b=ZGUvmvUMoF3+SwfE98n+z7Prfm4iZDVc96aelXomzaTib/Ge6Suh7vghoIFltegknB
         pwRwMICQnGoqnqOuixFQ0ux0lfIcEKCkdye1x/X2yNGmMHo775P2kZ8/xbynxXFiojgG
         vPTFAZMsky0eccdNZ/LI8k7pQbP5PXYyct1EBjBcH4nXskpJW/EtaNRETxildgnowDk9
         jxFajJh1ttygbC9rFF5yHK8Fn/AUZ1RPKhr/gvYtCcMtXe6Y41+6XWKrJzJq3MCDQsWY
         +SwbVRzTsSEZIY/ntygy3qrWxQ+qrDfbJMqg/T6PFhEQxLgi7NWZSqZ2jn3po3FJEKFf
         sX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268226; x=1736873026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wizLXA+6ME0qg/aMNKMMXYjrgUWv7n+3qOcjUBszMhM=;
        b=KmmFtN0WGxXkmmY347WHZ6uqyw6R4c/D3354vxykivSi7P70LIyJaeBs0JolgKNqR0
         jqB9oD1Maf0q2thU9QDg7qDve8dlsJyuRo3KJWxI0UbE6+skW3c0pYTgaWyHmhiitWCP
         H3V1IhRhzbwLbzxPl/93k6b+RX24eq8rsad+7d8TSk2AasVVM/En8XGBmZuy1sf8ywnW
         5tJm4inEaTRa9PUhjPp7YRhQHGUtbL5sUzzXgJN/IZw0w8quUKINlJIHVprS/U/sa1Kn
         adwaq99K90BFeh4xROP1KhIer7Ir5586/ow1uyn0ysJOhob+FEfcRbsb+Z1PMrGU9EGu
         aA5w==
X-Gm-Message-State: AOJu0YxRKNfZd4FFjTA/4pl0yle/px7ZjuFI5J9yDXrt00FT5ZJmK+ts
	Tkz1R81XC2OlmDdo/v4brIxLpHPmmG9T9s61COJkcfxti9thdU9TRrG03TnwXTyFjEqbgr7LsS2
	fmeFNyslrYdVjw3FN0tYMVbOc4ao2XA==
X-Gm-Gg: ASbGncsirJmu1skw71ndwBfXgkK8N/FTio8Z+fKe+hU0hWLxhBaykQbhKOE7uz1lRpa
	nutXxocKZ8GTipPeFKaVMJ3m1T9YjlPtbjm0gf2A7VcI6s0TpLYrr
X-Google-Smtp-Source: AGHT+IGA/lMgnuxFfVQaqmaCcGU8yBbikwnC0PIw2i9tNZ21gDDVWUPdKGuwUK/8Zma33/eOfWUVZgvD2TNXSz2f7ZY=
X-Received: by 2002:a05:6512:3b99:b0:542:2a20:e699 with SMTP id
 2adb3069b0e04-5422a20e732mr14938933e87.9.1736268226083; Tue, 07 Jan 2025
 08:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20241226054321.143382-1-hongxu.jia@windriver.com> <20241226054321.143382-2-hongxu.jia@windriver.com>
In-Reply-To: <20241226054321.143382-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 09:43:33 -0700
X-Gm-Features: AbW1kvZdaVx1Yl8ZT3q_ytJrdzyYI8YXpPfiHsp71Mo9H4Hz7RiVZmLiLUx15Ew
Message-ID: <CAJdd5Gb4w7zN+VQ=PsqPRQUKsaE1fX70gLw_kqLhoU-V7WrLfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] meta/lib/oe/sbom30.py: set alias for scan declared licenses
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209477

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Wed, Dec 25, 2024 at 10:43=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> when using SPDX_INCLUDE_SOURCES, it calls scan_declared_licenses
> to scan licenses from source file, set alias for the newly added
> license and and license alias to hasDeclaredLicense relationship
>
> $ echo 'MACHINE =3D "qemux86-64"' >> conf/local.conf
> $ echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> conf/local.conf
> $ bitbake shadow
> $ vim tmp/deploy/spdx/3.0.1/corei7-64/recipes/recipe-shadow.spdx.json
> Before this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf=
/sourcefile/11048",
>       "relationshipType": "hasDeclaredLicense",
>       "to": [
>         "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a40=
5441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf/licen=
se/3_24_0/BSD-3-Clause",
>       ]
>     },
> ...
>
> After this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf=
/sourcefile/11048",
>       "relationshipType": "hasDeclaredLicense",
>       "to": [
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/cc72db638e3f8=
e283e722af0ecc77d19f93cc6736700ee76477e3773b6b07b05/shadow/UNIHASH/license/=
3_24_0/BSD-3-Clause"
>       ]
>     },
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 0004447066..7993e1fbef 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -589,12 +589,14 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>
>          file_licenses =3D set()
>          for extracted_lic in oe.spdx_common.extract_licenses(filepath):
> -            file_licenses.add(self.new_license_expression(extracted_lic,=
 license_data))
> +            lic =3D self.new_license_expression(extracted_lic, license_d=
ata)
> +            self.set_element_alias(lic)
> +            file_licenses.add(lic)
>
>          self.new_relationship(
>              [spdx_file],
>              oe.spdx30.RelationshipType.hasDeclaredLicense,
> -            file_licenses,
> +            [oe.sbom30.get_element_link_id(lic_alias) for lic_alias in f=
ile_licenses],
>          )
>          spdx_file.extension.append(OELicenseScannedExtension())
>
> --
> 2.34.1
>

