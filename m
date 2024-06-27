Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6265DC30658
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:55:41 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.3046.1719474939281532624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKGM3SRj;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2598001aae7so3713509fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474938; x=1720079738; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8txk6WfK2993ff/ncJf8z+/rbn17Fsjj2p+/Kvv4yg=;
        b=WKGM3SRjthwkwbf+VTJIOMB0/fE2TMREoyrh005/lAMuz9zn9Lp+Aa0jB5YN4SRjsm
         QZdxquHPdsgd2lDLKG+05/KEstnfbLNSVnq2EorV2VnETdrcvxH2/HZP+FDLgk9JPcp5
         ko/DsRJziIbMBKnPTdoiT42HYySKHcWeZ8DNtig8Vo74O76UgsOeKCksjPZkV1PfuSVg
         F0f9h8QlYqsDhj76+wtD/Y3YfaFCUB0xhFuwSYsEV3n+VnkBkN77EDDYSBOjyoMs9Uzr
         FyLih0UUKWxlMC42XZTO813i9IdFOgBp0OHQ6ASO1mi07OQSbpjOmsJQqQ8TfgQpHsTn
         NxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474938; x=1720079738;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8txk6WfK2993ff/ncJf8z+/rbn17Fsjj2p+/Kvv4yg=;
        b=PUtuXmVUJyEqjnmDEewJfiJq9xtZ7VfICVkaVo82+MZNau/Xt7FGsHyzLVqMDjrrpp
         QDpIR2tnf3wQ4zhMl66KCXEfLhfObcnDtEian26o5QHMZh4PPTuniFNeHfiliiumIQki
         lNyUq8wUocPnFM/dZXOYk8xVkf4vLSalWSubyZ+SdQuG6VLpXXXhoQ1qqov0y3iilCLM
         FTUg8XPtzCov2VWk8+bqFQYD3uP31NJyoJtjdA2giLkTpXlusHntYbidsFRlFrtHMX70
         sGFGmDPJojvhsAfeSYGwgu6gRpsTlcrWuPfJQ37Bjem69y0sJ0GlocvERUvlU0XqjmwX
         /Q9A==
X-Gm-Message-State: AOJu0Yw3wu3E9yGFxbk480vLRTL1S54kCHHYqfa9JxAXK8HC9g9LHGNA
	q4Ialy4v1c5WdFIDIm9kNlKvOj9BWJfAK98NmvwjycwdpVnmb+znpaC86jHRXArFmrafZNqRMsw
	S4wzMnswvVwn2eZscuoxCC7PNLh6dYw==
X-Google-Smtp-Source: AGHT+IHBzodmHHE6KIs17Lmntq9NlzhO3HIjWbz4wx6MyBXokmGAdDUEtSa/VneUTuyUpZTbQMZNzE8UO5bMVv7IJbs=
X-Received: by 2002:a05:6870:ecaa:b0:25c:ad1f:b334 with SMTP id
 586e51a60fabf-25d016f3502mr14166565fac.21.1719474938115; Thu, 27 Jun 2024
 00:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240627075059.1235703-1-raj.khem@gmail.com>
In-Reply-To: <20240627075059.1235703-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jun 2024 00:55:11 -0700
Message-ID: <CAMKF1sqz4QBXbCyzBvpq9jH69+yDAeK9rPkpMJJCOxfu-z5=6w@mail.gmail.com>
Subject: Re: [PATCH v2] gcc: Fix wrong order of gcc include paths on musl systems
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201190

ignore this one.

On Thu, Jun 27, 2024 at 12:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> musl does not use gcc private system headers, however, the path gets
> prepended since gcc driver passes -iprefix option to cc1 based on its
> installation location. This starts to prefer these headers instead of
> musl provided equivalent system headers which is not as per musl's
> design. This patch switches prepend to append for musl systems.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use a runtime check instead of build time check
>
>  meta/recipes-devtools/gcc/gcc-14.1.inc        |  1 +
>  ...te-include-paths-on-musl-instead-of-.patch | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private=
-include-paths-on-musl-instead-of-.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-14.1.inc
> index b057e570f3b..c4bc4c72664 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
> @@ -68,6 +68,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> +           file://0026-Append-GCC-private-include-paths-on-musl-instead-=
of-.patch \
>  "
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-includ=
e-paths-on-musl-instead-of-.patch b/meta/recipes-devtools/gcc/gcc/0026-Appe=
nd-GCC-private-include-paths-on-musl-instead-of-.patch
> new file mode 100644
> index 00000000000..cbf5083085a
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths=
-on-musl-instead-of-.patch
> @@ -0,0 +1,36 @@
> +From 636cb6e700856c3d0f8b86ab408032ceeb7e5d2a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 5 Jun 2024 22:56:12 -0700
> +Subject: [PATCH] Append GCC private include paths on musl instead of
> + prepending
> +
> +Musl does not need gcc private compiler headers, therefore use them
> +after standard system header search paths.
> +
> +This fixes packages like python builds to detect the musl systems
> +correclty, as it looks for musl specific stuff in stdarg.h system
> +header, which is wrongly picked from gcc private headers in OE
> +
> +Upstream-Status: Submitted [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D115368]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gcc/gcc.cc | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/gcc.cc b/gcc/gcc.cc
> +index 01968001c44..f0fcaebc3ae 100644
> +--- a/gcc/gcc.cc
> ++++ b/gcc/gcc.cc
> +@@ -6589,7 +6589,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
> +
> +             if (gcc_exec_prefix)
> +               {
> +-                do_spec_1 ("-iprefix", 1, NULL);
> ++      if (OPTION_MUSL)
> ++                  do_spec_1 ("-idirafter", 1, NULL);
> ++      else
> ++                  do_spec_1 ("-iprefix", 1, NULL);
> ++
> +                 /* Make this a separate argument.  */
> +                 do_spec_1 (" ", 0, NULL);
> +                 do_spec_1 (gcc_exec_prefix, 1, NULL);

