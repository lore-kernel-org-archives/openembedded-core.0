Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F463F5510F
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:03:46 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18236.1772921024709953018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bry+3QHP;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64937edbc9eso9704509d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772921024; cv=none;
        d=google.com; s=arc-20240605;
        b=IVXRq4u5T7vLt59pejD0zgnmw4i3ucixqtrlpv9inD2e0168KVL8/xUVh9a246xhHW
         H5nMO7MdBaXB+O8j9QGpy2B+iw7ZHeBDUZXSxpS2F3rv1jByWZjr+BdLpR/sqYKLmOje
         dKdtFUsrXOVi4o20D8S24areqNJEou5HCqMhGICrcBJZ2F3AOVJT4VORk0l//Z4FL0Wg
         ljG0UWj9cKYgb0aRaPTt/cSpWDFEzAJylbU7cNNsCj8kPUAlFoeY+F1ctCyEsXrmmfAr
         0MySUXkdtlALVz16VUYM9p+/VhjXgNmNkGFWpj7VUsP1TweEiexmnHntKEOxgNm1TlJs
         KWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VezaR9ORn2iAOuXvZTMQwulU5qWEWqzaI4LwJIuBmuc=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=E2wPd9bHjhkTB7Hv4x3Mxu7AD0v+CDKFgO3lR5KGsRZZvRnPVK96+rFil4OUVPHsYg
         sBvX42ouoeKcGHqztqshL5OqYwIR4EsqxpATWIwIMLu5Ppm4PI3uidjrCefx/k2dTsiN
         5JW2JHC0JkWr4VfGSnMWIPH9ltavlJMDTxmPXKgqVOf1VbHOlltv2uRKakRQq4ooTi6m
         izFyCl6J8Vc3vv6pdEbeoHytqVuJYeRoFYH4WqCUSJyqU4/L/hGWILJ5kaA+Vy8f9M3E
         XjTGKvC6IHo+VGkPliPR3tn1sM9XabL5YNI8HZ2T/KN8+6/cb4Nlt5wxJ9xsFFubpMgD
         qv7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772921024; x=1773525824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VezaR9ORn2iAOuXvZTMQwulU5qWEWqzaI4LwJIuBmuc=;
        b=Bry+3QHPtyROCQ6h3t1fGMnczQ6OeViNHGkwR8LFUEnL37x9Kc/My1OlpG9IXoTB0q
         A8qx2TTX2tRY/gIQgXwk+Xo2iXDfFIKCSFdNtQLKGbK7k5dSNEtNci5KzrhvnJNeitZ7
         R3oGKj3u/xD/naQ9OrWTHIZe9ETX/a7bsGPhTVtaNa3EgzNUE+95uNdU5409dhTVdmvd
         ET3m2c3RcdxJc2jx5hgSzPB3Wu9IRod9o/bwJlGOzOtMXMsbeCSnoIpyHXEZCeDuadaB
         s2zXH/fRtkhqAvVa0t+HWezw6YzgqYL7KG8nOaoIiADLSIsOxYrmMx9Pi7VSPtnYXhq0
         9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772921024; x=1773525824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VezaR9ORn2iAOuXvZTMQwulU5qWEWqzaI4LwJIuBmuc=;
        b=UAQZIR1sPX3FM164xKGQ4VZa2iCS1jXcWK19UgdaiBUyjD8IDmr4O9nsAB3ELbTIn9
         w3PPFHZK7IBX0veaX7XHEYTmwan6+vqxFFaXOE2hGpfsAbHsjBkmPTSL9SRTkn8oWK5q
         dtNgX6MWnpf43Qf3TZpqDo0uc4QETOaq4bZTnXXFDuErLfDhTeKHiSOaqLyb+Xpl9m2H
         0bRBvkCbzaynXdtFat6rOUlbywf0nF2OBtTnVjEei4znsHXpXG0I8cHBZZnlCbVclGHf
         s6j5axMIhh7swgwAKYSVcxXWYP3CcU9/XpmkUazuVkru1CNzdclDawArXQ/7UEvFwYix
         rcmg==
X-Gm-Message-State: AOJu0Yy6dnzXFCz5cunegK5XIXJDVThYwzbcG5H2e164mf6zE/XgcT/9
	vTvMJ/JBFD+YOu+DRFI8v+cTItJU/B5teKGmxm2ChNEf6lKNEh6PB6Sdly35C9nhTUiZHgU5zQX
	Q4pfBpbZ3JLHItsUrPvtALRZGYCdlmK4=
X-Gm-Gg: ATEYQzwtKQrulrH50h6sQE1bdr4BIGHSGbBMjbqkCgsXc3DD0NLrO6ZVnsyzi1cN4B6
	loEn558P89/RWi6ZTJgTrdj25ezQ90rNeILqMRE/nm+DxbKHebg/m6lS2wz31Ie0Bu/gYpNTABK
	OWbJew+8L1LhdTLAiFdNU1BxKBoUKH2y4E5Y4li79zuISjuYX+phM3MT24eIjdo74V5YNRyd/Wc
	dGT6JHREnRwolRVyD5qcHuarSlPWurVWuXk+yocVj9nwZT3pv6ps87Ij1CYHoEy98gGGND92d2E
	1U+FeiA4i2L2kuFmC3U33A==
X-Received: by 2002:a05:690c:398:b0:796:6d82:10a9 with SMTP id
 00721157ae682-798dd663172mr67783387b3.15.1772921023710; Sat, 07 Mar 2026
 14:03:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <8680e7608282fe04610400f0042c9cf747d350dc.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <8680e7608282fe04610400f0042c9cf747d350dc.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:03:33 -0700
X-Gm-Features: AaiRm50COta1asyJ2wb97bzmX3wsf0qbDc5rSuZksOo4D4WAYbz3WjMIZJpxSu4
Message-ID: <CAJdd5GaeB_CF3MO=8nj_V2PFL+SZLq-jzCSCDWVxt+-FtrETtw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 10/10] spdx-common: Add documentation for
 undocumented SPDX variables
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
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232619

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
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

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 81c61e10dc..d45c152ba8 100644
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
>  SPDX_FILES_INCLUDED ??=3D "all"
>  SPDX_FILES_INCLUDED[doc] =3D "Controls which files are included in SPDX =
output. \
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232576): https://lists.openembedded.org/g/openembedde=
d-core/message/232576
> Mute This Topic: https://lists.openembedded.org/mt/118170504/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

