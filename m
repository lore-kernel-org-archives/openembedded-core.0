Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B664C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 21:55:52 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.843.1716328546376776904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 14:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0tVDNaa;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2450441dd16so2544772fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716328545; x=1716933345; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhpXPTc/D+yllA/kvnCPcfI+WNLR/1igRheqw1uCtRM=;
        b=M0tVDNaa19v6i1klatpuiFbNd4Odrkfk3a9DEAx5PPfSLsYLg94wFkYIpHc/nvy4Ok
         mcqu3hpLg79wjVUfgLciwilB0OmhRe1bTZTO8mK9JpObspq47WAunUSV3I1gfNQYHsYq
         t8qKnEG6QwEV3EjNQji4Eyk5yqjfyQnnujUr0KOBANy54pqFWR1F3sWZRzajmMS1g4nA
         EX3piGnuSGRqwOv4D2Wlq5pASFZOYzEjA/fn6wGOEzUETUV+cqG5P+6S+bfkx5hNAUVj
         BSQ9u81ocvPp993xjiuJ0QGZh4+VuIlYqUkDBo8UzTHm7UwxMROFRZbsoWrP8DoajlSD
         d7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716328545; x=1716933345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhpXPTc/D+yllA/kvnCPcfI+WNLR/1igRheqw1uCtRM=;
        b=lIw2rGZmkVxXooNZVaHWTi0JF/BJvBHYC1MUxw1I6XJ7sDnH2hObE8yhO2AHDbDgr3
         jgqls7l/7QC5rmpZk7C9004KHMqz8nr14iC6rFozxdey69zp6nqA4NNHg6nHEkfYxT89
         nBJC31vrtjQnXoGw7QevrsI0luU1VzDj2rF9XJQ5sWj8/xEeGSwzSkKAMEh19DcGqoHR
         kL+swG2kg1oZ33nLlp0qzBV8DLbqrSaFyeh9FnZYpnb7FwgvoS2X3J7k/4pdGxSMZByv
         j2Ma1mj+FkDMdSDz9olO8SoxOAy3ijCmNrbenl2Y/JYYrH22uFeGOsdZ+b2ChCdT9xgk
         sjtA==
X-Gm-Message-State: AOJu0YwVDpnOikGk7IjFN17eVdfw12+UzhLdR+gKUL59A4bhd++8eGqd
	oVRw8OMyCYCm5OA5+VcKi/M41y0/Gm3lI748fsshAP0a+tbiGULdvbQb5ZrtgbcIsZ12CnSAgX7
	nCCBRZJKDX5T262r9nNOgJs1h+tE=
X-Google-Smtp-Source: AGHT+IH5FY14Jo131jMpB2MjGntbhfLiM045juqyAApVANcbAsTNB8xG3+IIkhHaX1wRdjyzd46/M7ZkA3jgxHmXKp0=
X-Received: by 2002:a05:6870:7195:b0:245:2e83:91f2 with SMTP id
 586e51a60fabf-24c68e065demr374531fac.41.1716328545534; Tue, 21 May 2024
 14:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240521151739.591124-1-ross.burton@arm.com>
In-Reply-To: <20240521151739.591124-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2024 14:55:18 -0700
Message-ID: <CAMKF1sr+aDaN5FpbpUVeWa1pGmCKVb=7Yynd+S7iQu83dgoNrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gawk: fix readline detection
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 21:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199676

On Tue, May 21, 2024 at 8:17=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> The code fragment used to detect readline in cross builds doesn't compile
> cleanly with GCC 14.1, so readline is never enabled.
>
> Add missing includes so the test works, and readline can be enabled.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...001-m4-readline-add-missing-includes.patch | 38 +++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-=
missing-includes.patch
>
> diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing=
-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-miss=
ing-includes.patch
> new file mode 100644
> index 00000000000..97edf1ccf8c
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includ=
es.patch
> @@ -0,0 +1,38 @@
> +From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 21 May 2024 15:10:11 +0000
> +Subject: [PATCH] m4/readline: add missing includes
> +
> +The cross-specific code fragment only includes stdio.h, where the native
> +fragment also includes fcntl.h and unistd.h.  This is important because
> +GCC 14.1 has made the implicit definitions an error:
> +
> +conftest.c: In function 'main':
> +conftest.c:144:9: error: implicit declaration of function 'close'; did y=
ou mean 'pclose'? [-Wimplicit-function-declaration]
> +conftest.c:146:14: error: implicit declaration of function 'open'; did y=
ou mean 'popen'? [-Wimplicit-function-declaration]
> +

This kinds of errors are something I worry about, where configure may
silently decide to take another path for wrong or
insufficient tests. I wonder if we have a way to cache and compare
configure outcomes.

> +Add the missing includes so that the check doesn't always fail due to
> +these errors.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + m4/readline.m4 | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/m4/readline.m4 b/m4/readline.m4
> +index 38f96326..efd52d4e 100644
> +--- a/m4/readline.m4
> ++++ b/m4/readline.m4
> +@@ -66,6 +66,8 @@ dnl action if false:
> + dnl action if cross compiling:
> +               [AC_LINK_IFELSE(
> +                       [AC_LANG_PROGRAM([[#include <stdio.h>
> ++#include <fcntl.h>
> ++#include <unistd.h>
> + #include <readline/readline.h>
> + #include <readline/history.h>]],              dnl includes
> +                       dnl function body
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.0.bb
> index d7a0fc616d3..e94cf19db48 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -16,6 +16,7 @@ PACKAGECONFIG[readline] =3D "--with-readline,--without-=
readline,readline"
>  PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mpfr"
>
>  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> +           file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
>             "
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199648): https://lists.openembedded.org/g/openembedde=
d-core/message/199648
> Mute This Topic: https://lists.openembedded.org/mt/106225075/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

