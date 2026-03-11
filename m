Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45549103E2E3
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:43:10 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6568.1773261789294148434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxKsX/7q;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7986d231b3cso22712607b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773261788; cv=none;
        d=google.com; s=arc-20240605;
        b=e7vLnzi2LgnYCo2xY6ppUtEpv54JzE1P28iZlQZbjIv1dKPQqrscwcGAw6/Q8WY6uu
         1u1ObZHYhdpHAlOE7hbm6cQUR2uPM2wcXv66lNtyVJcOerHh+mJDL2INCpk/4n0RO7Ke
         JYBspggJtWtSzoaXIx/lq7sLmFEwbd2oImnPTlxTyqqLlqL9Ad24PeJFzTS4HV2qdWUc
         VdC597UJgkgGNLodipL8qFUbIy3fotR9z4wH32IfqECZOXHIAW1y+CEOtTVjP7MRMesV
         FUMbIND3bQXT6gEkR9nTfEvzCeE0rkY/FGA910EFtvjlFV56ICqrdlOC8i1k5+v/ophP
         mjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6uwOjh8VpPBc4bNfI9zz2q8lR4qO/nS1wEPDbduYgE=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=WohRpou0e33cZx72nmFttPeUfcLGVU0hOfm7cPLvheW79Cra5Mrzqn5YNWm8tGF5px
         GarEhm34Cf8Df0i3Q+N5NSAGqbvqD4ht2SafNLveHN5DWJFvZJg3UWGKXHIbJhHYELcq
         hQruyEmhQ/6t/oUb1ioq5CRiooOl9u+T8bOJXr56Q1+3inrl1GGHAmG9RbdYrwCd7xzM
         +1WUc9f1OWHbTG2T35tsfJ1FkDvq/mUgdt2wBSePDOW3kvi3twb6UhMJ8RQ0cconkcI4
         eGg1M9zlEefyPyLeJbA4YaqBvUiNKUKhFQUCFoM1Sua5RgxttXnwFxRATR6E2BUcxWJS
         TJVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773261788; x=1773866588; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6uwOjh8VpPBc4bNfI9zz2q8lR4qO/nS1wEPDbduYgE=;
        b=GxKsX/7qRvw5KQc4iOlVw1AnV1zw1mVWSb8qjF9jhZfIlu5bzuJQIUljH/Ff/8kS5i
         j7ZsUeo0+oP8fmqw3N/euTLonAncDwPKaR8zYfWPIX8lRp00cgOOdfTkfbF1WuFXl4Ad
         ek2yrVGKuozPzvN3IVOrH4ryPZorfPogN6DHGJqfp1sewk3T1PuCruXn/+TXuB7QhJbu
         DpUi1KeFgzS41VU0oU+m4DK54QAN7UW470iKq1OOw27n9jB8mm0B8koco3KtgoNHiPn3
         m9z/YNtxhYaVC2mjgJCVjMujvy+VUclIgDbOAqQI555G9Q+L4cRWDi+XS7DlA154V1hQ
         SizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261788; x=1773866588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6uwOjh8VpPBc4bNfI9zz2q8lR4qO/nS1wEPDbduYgE=;
        b=vPlS+KOjpAzfIZj2ipuC4NOSbKbMVAGFAMxlTUo6TO5cVi3pqlr7taCm+lxGxHK/kZ
         OqFAhBuxPpF0pI/WxEC+D3VSzfwQPT8u/56J69IKFQS+fmQBm0MRQSuKEKe0hZy0kBeu
         srXPjklJaFqHdCWO7cAxT2levfIksNWnyNPMX02TqgpTLGIb/iEg0vKusAmRFIhmQtUk
         a4wwA7k3N9NYUeVaBYKyWS6a+S98QlLsqgfVSxNf/AlMc9JWi0g4DwLYmaVOm7dMTKZ3
         x1feOsCIhWyqJqXK3y+igNfYaVPfO/rP4HzX4XqetEj99HBrJrR4WT7wd72A7HbZr+a0
         J/fw==
X-Gm-Message-State: AOJu0YwGb+gm40VSHbtxxTlKo3tw5QOYvr/xisKgA46ym6GrlsDNmbr2
	kUxGz3nH7NeyCXIC6Bh/kwgOZm0KJ7NteKWpg6CRv7ZILpf1L+gfw+LeCvsZboXpWdpzZAf4vry
	GatpeokI9i/KRSxMpbXyYVyomGuK5qEQ=
X-Gm-Gg: ATEYQzwzfss5zj7rPpPTku92dkWAvd0ntrFed/m0vlSSOJ/U80B8Hdh0o0/341v+Frx
	ssBNoOlGXzs9Nk1glZ13NBFfVyLTM96+MhEWBBebDgCQ9lfiTVIotQNlwB6NIAKZzoXelhv3JWQ
	BbSLxX7ep0uyW4cBKvfMLl44bGL6wGE7PQ4V9G4YqRqEnubv5El+uPTAm5a8wx6GedTr+hCHZhW
	2txQYdeH67FkDsH6RgO88TRj2gdJd+NdUj6SVA4zoyQoNsh9M0l75E/hcmWEJBv6ntlXndbsAF2
	EG2vXC60Wn/21sX4PATJRA==
X-Received: by 2002:a05:690c:720a:b0:796:3d5f:a2a1 with SMTP id
 00721157ae682-799475b6031mr10384317b3.29.1773261788416; Wed, 11 Mar 2026
 13:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-8-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-8-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:42:57 -0600
X-Gm-Features: AaiRm53Thw4gyw5wp3pDUb2fz02r1ozebzy8Vc67t98m-rSTgfK1rI4Ug_FGsPc
Message-ID: <CAJdd5GYz1ObNy_6brYEuLOGU0ABvw1=PPYCH6bGB7h3+VwBnuQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 7/7] spdx-common: Add documentation for
 undocumented SPDX variables
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232911

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add [doc] strings for eight undocumented SPDX-related BitBake
> variables in spdx-common.bbclass.
>
> Variables documented:
> - SPDX_INCLUDE_SOURCES
> - SPDX_INCLUDE_COMPILED_SOURCES
> - SPDX_UUID_NAMESPACE
> - SPDX_NAMESPACE_PREFIX
> - SPDX_PRETTY
> - SPDX_LICENSES
> - SPDX_CUSTOM_ANNOTATION_VARS
> - SPDX_MULTILIB_SSTATE_ARCHS
>
> This makes variables discoverable via bitbake-getvar and IDE
> completion, improving usability for SBOM generation.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

Note: this can be merged without waiting for the other preceding
changes in this patchset first.

> ---
>  meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index f54459d3b4..be6e7b5bd6 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -26,15 +26,38 @@ SPDX_TOOL_VERSION ??=3D "1.0"
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
>  SPDX_CONCLUDED_LICENSE ??=3D ""
>  SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded by manual or exte=
rnal \
> @@ -53,6 +76,9 @@ SPDX_CONCLUDED_LICENSE[doc] =3D "The license concluded =
by manual or external \
>      SPDX_CONCLUDED_LICENSE:${PN} =3D 'MIT & Apache-2.0'"
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
> +SPDX_MULTILIB_SSTATE_ARCHS[doc] =3D "The list of sstate architectures to=
 consider \
> +    when collecting SPDX dependencies. This includes multilib architectu=
res when \
> +    multilib is enabled. Defaults to SSTATE_ARCHS."
>
>  SPDX_FILE_EXCLUDE_PATTERNS ??=3D ""
>  SPDX_FILE_EXCLUDE_PATTERNS[doc] =3D "Space-separated list of patterns to=
 exclude \
> --
> 2.53.0
>

