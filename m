Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF963C8303F
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 19:58:50 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.48518.1756151928285733023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 12:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J+7xkQQG;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e951dfcbc5bso3140896276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756151927; x=1756756727; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lmBmGFhSW+gGf9t5sr3uL/Tq4bay7GEL/4bt17tji0=;
        b=J+7xkQQG820SRLjbK2iRb25yxC9cYWlfRFG/N2D2FgYlIP8DQCHQLiSL2RoyJqM0on
         v1RLRtP0VJc79zsqkU5H4LAAe/aGhPMYscF2LHUe2bttej2Qa6SiEId09mZPgeXJ5wdm
         ++K9nI16XIL0ge3LegSym+BWthdspCH9aHfHzCKA3RO/fIX/eebTZbctjH5N4zQRnI6w
         KOKYn2FB+viuG6VNOKVr5qXRJhzAgaaq37JvdhdCX/d0a5203c26w+LmdjeDEOLXnQk8
         tRfji8PAL1JNhE/qwPsIHj5D+UftkuA6ur8m+FBih2WgMVJz29G1vTFkJKKXb6gc8Z1g
         aAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756151927; x=1756756727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lmBmGFhSW+gGf9t5sr3uL/Tq4bay7GEL/4bt17tji0=;
        b=SucPUgqeP7G5oVjuvOgUZfGTdfAgheR69+LjN+mhM5+0q/NFs0Y42NKf9ZFu/MGKMk
         kj7MCaVw0R+Z+hIt8TCY25oibXsycNlzGVfUDxaYMLBY6ttrh0wHiEsq39rwIR3H8Ay5
         WbiRrVJHjyHT4yvRe0+BR83drt8iGT8vsmqU3T2vfb6fhcg7hYLPyYlKiYAci1WXc1jh
         +32uOxhotAb1f/Qv61PQncRtghyBHz0WG98FKPDHI4tqqnHd4G8hB9Z9Tn4zxc5w1AYT
         TiJBFVYd14KB0jZw7RxN65+xPOishlcPMgBm7VMorUrLPMNMhG7whVXUcS6atPgZ90/e
         miLQ==
X-Gm-Message-State: AOJu0Yw9qWg1mtTrfKFeL2JLLCZbALw34TdEPiiXEzoA/hp2fOfnavpi
	JpqdGE/QmzCAoueuv/8yeWUUdb8VwkkP+YD3yQ4xWN8GHqooHcVffy7GYgLLJvrMgM+pDNJa7OS
	yLz2PZJNB3uaXPsNYqkdaOnFsOdJ/SAyMfBwjwAyBnw==
X-Gm-Gg: ASbGnctYwdNh080MaF6X0rbmTdP2VNOmJ6qtKHSdXayPhA/CnvGhxgs7OqMQ+oOyJ7x
	cL8okmEw0eHFhCAdJ7CkBNF5P27btESa0uZHFQ1UG3UD4vJ8yQkZD2QYH9Odl3oYLaK+YuDx4g/
	DcZZ48AsZXpxVm7mp8K6Fap6HhfxIOmogx58ZKZtR8rmOq0fpIGpr/l/zZ8wu5R0vGqGdyNWsSo
	HsBej9Bolb5aeOFR1YKKn39c+w6fUp68TIRW2M=
X-Google-Smtp-Source: AGHT+IGc1BNgCsjuesVqdixTKOu1/61YsLZo0zaySBtCzSa694rE4VT3LWem6Zqk0MI1p8uzQ+6MLHwWL0LAm/ZcMgg=
X-Received: by 2002:a05:690c:c8f:b0:71f:edb7:b465 with SMTP id
 00721157ae682-7212b51a4dfmr1324367b3.32.1756151927256; Mon, 25 Aug 2025
 12:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250824124248.1093100-1-peter.marko@siemens.com> <20250824124248.1093100-2-peter.marko@siemens.com>
In-Reply-To: <20250824124248.1093100-2-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Aug 2025 12:58:36 -0700
X-Gm-Features: Ac12FXyDxLTX5rQe6dChCk8XML_rbSvjY9TcAP7gr7g1XuvXKrTvBHNMPQ8rytU
Message-ID: <CAOSpxdacNuW3wbrXDtWE7xDVyb1gpU+3mw3=f8zKdW4jUFY6-A@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 2/2] binutils: patch CVE-2025-8225
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 19:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222423

The first patch in this series applies without issue, but this one fails wi=
th:

Applying: binutils: patch CVE-2025-8225
error: sha1 information is lacking or useless
(meta/recipes-devtools/binutils/binutils-2.44.inc).
error: could not build fake ancestor
Patch failed at 0001 binutils: patch CVE-2025-8225
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch

Steve

On Sun, Aug 24, 2025 at 5:43=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit [1] mentioned in [2].
>
> [1] https://gitlab.com/gnutools/binutils-gdb/-/commit/e51fdff7d2e538c0e5a=
ccdd65649ac68e6e0ddd4
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-8225
>
> Testsuite did not show any changes in results:
>
>  =3D=3D=3D binutils Summary =3D=3D=3D
>
>  # of expected passes           310
>  # of unexpected failures       1
>  # of untested testcases        1
>  # of unsupported tests         9
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../binutils/binutils-2.44.inc                |  1 +
>  .../binutils/0019-CVE-2025-8225.patch         | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025=
-8225.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index 67ced2863b..20d9c2a6f2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -46,5 +46,6 @@ SRC_URI =3D "\
>       file://0018-CVE-2025-5245.patch \
>       file://0019-CVE-2025-7545.patch \
>       file://0018-CVE-2025-7546.patch \
> +     file://0019-CVE-2025-8225.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.p=
atch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch
> new file mode 100644
> index 0000000000..43bc4c56d8
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch
> @@ -0,0 +1,41 @@
> +From e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 19 Feb 2025 22:45:29 +1030
> +Subject: [PATCH] binutils/dwarf.c debug_information leak
> +
> +It is possible with fuzzed files to have num_debug_info_entries zero
> +after allocating space for debug_information, leading to multiple
> +allocations.
> +
> +       * dwarf.c (process_debug_info): Don't test num_debug_info_entries
> +       to determine whether debug_information has been allocated,
> +       test alloc_num_debug_info_entries.
> +
> +CVE: CVE-2025-8225
> +Upstream-Status: Backport [https://gitlab.com/gnutools/binutils-gdb/-/co=
mmit/e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + binutils/dwarf.c | 8 +++-----
> + 1 file changed, 3 insertions(+), 5 deletions(-)
> +
> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> +index 8e004cea839..bfbf83ec9f4 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -3807,13 +3807,11 @@ process_debug_info (struct dwarf_section * secti=
on,
> +     }
> +
> +   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
> +-      && num_debug_info_entries =3D=3D 0
> +-      && ! do_types)
> ++      && alloc_num_debug_info_entries =3D=3D 0
> ++      && !do_types)
> +     {
> +-
> +       /* Then allocate an array to hold the information.  */
> +-      debug_information =3D (debug_info *) cmalloc (num_units,
> +-                                                sizeof (* debug_informa=
tion));
> ++      debug_information =3D cmalloc (num_units, sizeof (*debug_informat=
ion));
> +       if (debug_information =3D=3D NULL)
> +       {
> +         error (_("Not enough memory for a debug info array of %u entrie=
s\n"),
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222371): https://lists.openembedded.org/g/openembedde=
d-core/message/222371
> Mute This Topic: https://lists.openembedded.org/mt/114864423/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

