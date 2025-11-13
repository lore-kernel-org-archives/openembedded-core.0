Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B616CD98D4
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 19:34:13 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1284.1763062450978551982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 11:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBF+7KJx;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-640f88b873bso1138889d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763062450; x=1763667250; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbCQ0Y3jS2LjRwJQ0pIOKRrdIUogX0Nc/H1zYS9+YcA=;
        b=OBF+7KJxYTBceBJRGOCL1qFlLV5Wk3nyUBBf3VHy3PJSb3ZNiTym0gkb90VSQXsnUm
         Z6mx7AHlIanqT7EBB5PkIHPYsiUd7YAhUPgVfirSgnGElSAbfeJSaRdoNtzcSofhWwaH
         4IPryEb/QZvXtry6EjQp0jARRiBtev+m7n4a3VG3TPNo1w18ajJBbVAUPv1aD68XPonO
         p5gkhYWrHES5LXAO9qyVfclqFKY1YOYDKbZAMwLEawtu/aiV1dZLwNFSJBxPMDUz3aI3
         Diz44BAJ+boHKCno9P7wluL3sXV2+hc9pQpMz9b0ktJinqRDAhi5DqS6iZCR6ItFQrwC
         m2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062450; x=1763667250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbCQ0Y3jS2LjRwJQ0pIOKRrdIUogX0Nc/H1zYS9+YcA=;
        b=emJp31/LSm3kJYvaosqetaxchXnBdh6LxIfT8qIqcmUCSYxRyN2k9boYrpGxEhOA2f
         TDD/wHprosDB8z14bLDHu3XOkY9gAtTw4GjEowWuE5MrQzN2+P03d4pf2gr5jLM28K4i
         b4YPyBJKnAet3ARL29TChlFEQ51n0c8DjgMf/495vlzCdgIBxdFTZ0CoTAoeedDtx5Pk
         g1JAaFwXNAwHskgRo0LLqhRPdKS4ml49wX1nHJ4Y3KzExNZtfW6gBuo7pvoRtWOW6YXA
         65uUUqGNwQuxALHpsZpJcY21B1nMNr/Ia+2B0DdSIkfvIiE70KDdEh644LI/tyjI+xKB
         ybdw==
X-Gm-Message-State: AOJu0YzpKVYcTVsAA2ePHQnMCzxYvCtnVw4pAzrlNuACkiURFhBA6Azc
	w+fg4r3gTAkDnwI5ntc0Ppdx/7ZRi+rwf8LbvgXZExWAEwdc1Pd9P3DGIPfq1uScc7FMlEY0EDC
	RPJQwA3w4yoGPTTVoBGcakUrnuJGVhyY=
X-Gm-Gg: ASbGncv0R/Su1WywK4FvlsKkPETlb2VLh0YD2+N+RhV1HftVYsQ8rP9tBOPUBRrm8UR
	/jFgspoOL5KCQ6a9QcAphR/DnFmReXjcE6Z9hpJJh7xnT4bYjZFTwV7wccVoQpc1kL/CKgBlLEP
	hNMHm+IiD7jm8pr8GMSYDSKBN88kCDLIU2CUd5ZtWmXTL3Yhv7XHTMTDgefcl/gOK2PjUmxemMT
	VxQUgUSg1qDUX6ikMrw94HX64Tp/0l/2nDmZ5hHxMjqU0zqpZUK/J3z5gTKnfIwnfcLwZzJ/DM=
X-Google-Smtp-Source: AGHT+IEHhaVhYayEEPHSUyfChpUt9bZn/TXrO4IVdN/1T0uBcduxVfZ43iN/bNTm+qFpU66qRtDbsexAkbTEi+sB/a0=
X-Received: by 2002:a53:d058:0:10b0:63f:b983:5a51 with SMTP id
 956f58d0204a3-641e74dc2f4mr455765d50.11.1763062450082; Thu, 13 Nov 2025
 11:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20251113184151.511039-1-stondo@gmail.com> <20251113184151.511039-3-stondo@gmail.com>
In-Reply-To: <20251113184151.511039-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 13 Nov 2025 12:33:59 -0700
X-Gm-Features: AWmQ_bkm4W4fZrrtw6y0aDhlisr2CxBg_ufWjqbq1ZOVmduJbB7z7Als0C8zytU
Message-ID: <CAJdd5GbT=QQQizUAuQhYWMMAkSQ=N_fFj8RjcUjQ4grBEmJB+g@mail.gmail.com>
Subject: Re: [OE-core] [OE-core 2/2] spdx-common: Add documentation for
 undocumented SPDX variables
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 19:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226264

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Thu, Nov 13, 2025 at 11:42=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add missing [doc] strings for seven SPDX-related BitBake variables
> that were previously undocumented in the spdx-common bbclass.
>
> Variables documented:
> - SPDX_INCLUDE_SOURCES: Control source file inclusion in SBOM
> - SPDX_INCLUDE_COMPILED_SOURCES: Control compiled source inclusion
> - SPDX_UUID_NAMESPACE: Namespace for UUID generation
> - SPDX_NAMESPACE_PREFIX: URI prefix for SPDX documents
> - SPDX_PRETTY: JSON output formatting control
> - SPDX_LICENSES: Path to SPDX license mapping file
> - SPDX_CUSTOM_ANNOTATION_VARS: Custom annotation variables
> - SPDX_MULTILIB_SSTATE_ARCHS: Multilib sstate architecture list
>
> This improves discoverability of these configuration options and
> helps users understand how to customize SPDX/SBOM generation.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index ca0416d1c7..6bd1b56d96 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -26,17 +26,43 @@ SPDX_TOOL_VERSION ??=3D "1.0"
>  SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
>
>  SPDX_INCLUDE_SOURCES ??=3D "0"
> +SPDX_INCLUDE_SOURCES[doc] =3D "If set to '1', include source code files =
in the \
> +    SPDX output. This will create File objects for all source files used=
 during \
> +    the build. Note: This significantly increases SBOM size and generati=
on time."
> +
>  SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
> +SPDX_INCLUDE_COMPILED_SOURCES[doc] =3D "If set to '1', include compiled =
source \
> +    files (object files, etc.) in the SPDX output. This automatically en=
ables \
> +    SPDX_INCLUDE_SOURCES. Note: This significantly increases SBOM size."
>
>  SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
> +SPDX_UUID_NAMESPACE[doc] =3D "The namespace used for generating UUIDs in=
 SPDX \
> +    documents. This should be a domain name or unique identifier for you=
r \
> +    organization to ensure globally unique SPDX IDs."
> +
>  SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
> +SPDX_NAMESPACE_PREFIX[doc] =3D "The URI prefix used for SPDX document na=
mespaces. \
> +    Combined with other identifiers to create unique document URIs."
> +
>  SPDX_PRETTY ??=3D "0"
> +SPDX_PRETTY[doc] =3D "If set to '1', generate human-readable formatted J=
SON output \
> +    with indentation and line breaks. If '0', generate compact JSON outp=
ut. \
> +    Pretty formatting makes files larger but easier to read."
>
>  SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> +SPDX_LICENSES[doc] =3D "Path to the JSON file containing SPDX license id=
entifier \
> +    mappings. This file maps common license names to official SPDX licen=
se \
> +    identifiers."
>
>  SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
> +SPDX_CUSTOM_ANNOTATION_VARS[doc] =3D "Space-separated list of variable n=
ames whose \
> +    values will be added as custom annotations to SPDX documents. Each v=
ariable's \
> +    name and value will be recorded as an annotation for traceability."
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
> +SPDX_MULTILIB_SSTATE_ARCHS[doc] =3D "The list of sstate architectures to=
 consider \
> +    when collecting SPDX dependencies. This includes multilib architectu=
res when \
> +    multilib is enabled. Defaults to SSTATE_ARCHS."
>
>  python () {
>      from oe.cve_check import extend_cve_status
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226260): https://lists.openembedded.org/g/openembedde=
d-core/message/226260
> Mute This Topic: https://lists.openembedded.org/mt/116279441/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

