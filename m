Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF16C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:42:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.53056.1739803318781877343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 06:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y30B0oIo;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f88509dad2so38614137b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739803318; x=1740408118; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOQ7zbPirUKlN9lweD07i+kiSMDdWFLBFK8mDsgnUbQ=;
        b=y30B0oIoRH/Nu0cCRaB3fYzo9aIey+U9duyi6IUdpxw/dam1iIivfVsR/3pbn29xKz
         tc4Bg7OTphzgOfN39hEfUkteKFm2VzOymx9u2poghAS2pI2f/WKk7uaUHLyGXMBmZQhI
         LgH24+ejv15K7t5b+0UO9jDnGjPeH/LC8JLawSJsVasA2Ca2mf+CeQBzM3byB4bB2fj3
         LTuaUiUOjfjk2W//Eh1PRucv8FbUAuEOgUWMKq1+euJPagwLpny6ybaithuwDyyg4xzE
         avf6r1Qc2UClPmJu2B1hmVW+N+Q5yMC7lfKtxvmSyjchfsCbQLLvDZPwgUmLvYqhHddZ
         r+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803318; x=1740408118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOQ7zbPirUKlN9lweD07i+kiSMDdWFLBFK8mDsgnUbQ=;
        b=iZDtHUKCW2u+948rrQCCH0tmxneT9gCKN6Uk4r1TV/JxWcnEwpweICy52i1fwKPQ5X
         /n6DR5M9MiGMTDLBwEf0ZlbL7Ep4B/snGK0gegpnYWaJuGtndkyRxGGqfPMToW3mtZWG
         DIWyeuAYlObin3SRFKb3wvM4+cMCdo7Zw/13h/hemsKI8/nRF1/2PWB4P7HSUjC9m9jP
         851la6yboQcD7Uce/f6xAKMTNCDvJrJDB+4hJNlEtlLG4ZUjMqRqzy2xDyeTIbKaLqRi
         hnJajad1oW59yVgG7ZJCbOxcjt5R6qqh9APSoHJZdNV0uAUAEa7bj8XqMSFq7cxAt5d8
         bAaA==
X-Gm-Message-State: AOJu0YwPbiaediZUKyWixp03xgslU3nxBb3bLR7kI1qHHGu8XFNkE/83
	5lrEfP7KxPP6H6+qAL071AICzBdO8go9SBdssfguALmZYLFOgxNGcompBIumJLLkr9x3zZ+2vCI
	nAz8zgVlBZ7SOsPcWmiQdvfhbitYkhBoxej+5I8396tBj9hAb
X-Gm-Gg: ASbGncvUbfJWqjy4ncZKsY5MqJXWcjVjN1b3mfXBqk4D5zqrlWv+1ATuptKplnOOjvh
	MP1tD23z2sNYlEY2URc/0q4qLXbhLcN/N8Yp2gZWBaZiUvd4Aw7xeJRH25/tPykI06Oebd/9Nbn
	5YqcZKvGMkeZPCv+xOBMVwNqOvLkgU
X-Google-Smtp-Source: AGHT+IGhtEI1orlqsMAqu0+A0vsVHqocIV9TgtO58OWNr9f9C+csZxpuTL8y8JRuXhpGRcbW6g/HYWIMqRI91Rl4VYM=
X-Received: by 2002:a05:690c:d1f:b0:6f5:4304:fbd with SMTP id
 00721157ae682-6fb5829ba02mr89933337b3.11.1739803317638; Mon, 17 Feb 2025
 06:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20250217075609.255086-1-hongxu.jia@windriver.com>
In-Reply-To: <20250217075609.255086-1-hongxu.jia@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Feb 2025 06:41:47 -0800
X-Gm-Features: AWEUYZnzDwJBQtOxy_dV5mt9hxnVQaoNRatlyAmpdTxhhC3UPT5OgBPnA6wlU9Q
Message-ID: <CAOSpxdaAX0MX_Y1xm4eg4hvsyTWdDmJY_uPiQCoR2vw4QoeEPw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] python3-setuptools-scm: add
 subprocess timeout control env var
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 14:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211541

This patch does not apply to current scarthgap HEAD.

I believe you have other changes to this recipe in your working branch.

Steve

On Sun, Feb 16, 2025 at 11:56=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Backport patch from upstream to add subprocess timeout control env var
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-fix-957-add-subprocess-timeout.patch | 78 +++++++++++++++++++
>  .../python/python3-setuptools-scm_8.0.4.bb    |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0=
001-fix-957-add-subprocess-timeout.patch
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-fix=
-957-add-subprocess-timeout.patch b/meta/recipes-devtools/python/python3-se=
tuptools-scm/0001-fix-957-add-subprocess-timeout.patch
> new file mode 100644
> index 0000000000..1af1ea0334
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm/0001-fix-957-ad=
d-subprocess-timeout.patch
> @@ -0,0 +1,78 @@
> +From 2ac4f084def6db53b454b967b062bed2f945aa03 Mon Sep 17 00:00:00 2001
> +From: Ronny Pfannschmidt <opensource@ronnypfannschmidt.de>
> +Date: Fri, 5 Jan 2024 13:34:37 +0100
> +Subject: [PATCH] fix #957 - add subprocess timeout
> +
> +Upstream-Status: Backport [https://github.com/pypa/setuptools-scm/commit=
/2ac4f084def6db53b454b967b062bed2f945aa03]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + changelog.d/20240105_133254_subprocess_timeout_var.md |  4 ++++
> + docs/overrides.md                                     |  7 +++++++
> + src/setuptools_scm/_run_cmd.py                        | 11 +++++++++--
> + 3 files changed, 20 insertions(+), 2 deletions(-)
> + create mode 100644 changelog.d/20240105_133254_subprocess_timeout_var.m=
d
> +
> +diff --git a/changelog.d/20240105_133254_subprocess_timeout_var.md b/cha=
ngelog.d/20240105_133254_subprocess_timeout_var.md
> +new file mode 100644
> +index 0000000..78ecab2
> +--- /dev/null
> ++++ b/changelog.d/20240105_133254_subprocess_timeout_var.md
> +@@ -0,0 +1,4 @@
> ++
> ++### Changed
> ++
> ++- fix #957 - add subprocess timeout control env var
> +diff --git a/docs/overrides.md b/docs/overrides.md
> +index 5114a84..22d285e 100644
> +--- a/docs/overrides.md
> ++++ b/docs/overrides.md
> +@@ -14,3 +14,10 @@ where the dist name normalization follows adapted PEP=
 503 semantics.
> +
> + setuptools_scm parses the environment variable `SETUPTOOLS_SCM_OVERRIDE=
S_FOR_${NORMALIZED_DIST_NAME}`
> + as a toml inline map to override the configuration data from `pyproject=
.toml`.
> ++
> ++## subprocess timeouts
> ++
> ++The environment variable `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` allows to =
override the subprocess timeout.
> ++The default is 40 seconds and should work for most needs. However, user=
s with git lfs + windows reported
> ++situations where this was not enough.
> ++
> +diff --git a/src/setuptools_scm/_run_cmd.py b/src/setuptools_scm/_run_cm=
d.py
> +index 3dfbda5..a64f904 100644
> +--- a/src/setuptools_scm/_run_cmd.py
> ++++ b/src/setuptools_scm/_run_cmd.py
> +@@ -25,7 +25,12 @@ else:
> + # unfortunately github CI for windows sometimes needs
> + # up to 30 seconds to start a command
> +
> +-BROKEN_TIMEOUT: Final[int] =3D 40
> ++
> ++def _get_timeout(env: Mapping[str, str]) -> int:
> ++    return int(env.get("SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT") or 40)
> ++
> ++
> ++BROKEN_TIMEOUT: Final[int] =3D _get_timeout(os.environ)
> +
> + log =3D _log.log.getChild("run_cmd")
> +
> +@@ -132,7 +137,7 @@ def run(
> +     *,
> +     strip: bool =3D True,
> +     trace: bool =3D True,
> +-    timeout: int =3D BROKEN_TIMEOUT,
> ++    timeout: int | None =3D None,
> +     check: bool =3D False,
> + ) -> CompletedProcess:
> +     if isinstance(cmd, str):
> +@@ -141,6 +146,8 @@ def run(
> +         cmd =3D [os.fspath(x) for x in cmd]
> +     cmd_4_trace =3D " ".join(map(_unsafe_quote_for_display, cmd))
> +     log.debug("at %s\n    $ %s ", cwd, cmd_4_trace)
> ++    if timeout is None:
> ++        timeout =3D BROKEN_TIMEOUT
> +     res =3D subprocess.run(
> +         cmd,
> +         capture_output=3DTrue,
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
> index 67ac407c38..62a15f9d7f 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
> @@ -12,6 +12,7 @@ inherit pypi python_setuptools_build_meta
>
>  SRC_URI +=3D " \
>      file://0001-fix-timeout-while-using-big-git-repo.patch \
> +    file://0001-fix-957-add-subprocess-timeout.patch \
>  "
>
>  UPSTREAM_CHECK_REGEX =3D "scm-(?P<pver>.*)\.tar"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211525): https://lists.openembedded.org/g/openembedde=
d-core/message/211525
> Mute This Topic: https://lists.openembedded.org/mt/111228074/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

