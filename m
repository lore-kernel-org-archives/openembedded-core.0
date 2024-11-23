Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F869E66887
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 20:50:35 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.55458.1732395027529069141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 12:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+jPypKe;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7181a8af549so1819901a34.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732395027; x=1732999827; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT/16Emf+KMa+zbmWQHxBHeZIpFsFOh3l1S7GVgZ0eo=;
        b=D+jPypKe75SFlLGuTKL2SNT/LfHhih0hrPWZeBl/97/yq2WOM39r84rOy1fhlTMiE1
         7Ayqt8ASIjTBwJtvfm0LRcw6tev+jG/DU9FQl2PBzzfOzxGD/7bn+48+Mb1SslmbVNH3
         EZo4tnl4Ddair3Uy6uE5Hhf5VA1B6bX1HQ/Inec+lCdItagKAIMDVas4B+y9qiX5BPwH
         MEgxpl4s4OiCfMhOJCqhsWTPpD7/u4hYVGRxMGkZu5Fn3L8NsJ8Ugx2QK5YnsSten7UJ
         GMLtcR1p+FOJKRze6fnSta2OSt/qJvVlfNg9gM0hvSE+4ydHpGDo5No7o4DEuyx8t+tV
         ITRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732395027; x=1732999827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT/16Emf+KMa+zbmWQHxBHeZIpFsFOh3l1S7GVgZ0eo=;
        b=Cf3Y5sIY0XkNO3wkHYQo2fJcLlRCxDySKr3q92Vn0kxIn235kYpLygl4kjGdTQk6ny
         tFgIt61W9qY+c1VplsT+UtFYjwekOQc1DuBySOCOi9WhvaWTl8T/aAoRtRlKKo464+8N
         EaMxE1yoy/HcamDLoAQnaO+2wumbmuEs+Vo7NV6HGU6iWf6q/OAadtfhsAxmiB6tYarn
         DXD77J328Pbbsli6rQmfEUj2S3zQaRQpidzqmDFtXB1jtf/5ZQpwvpPZcvC3z7uKDX9m
         aajaDAiZ51lDsVS27iSW8Ia/OLxhJsY9wf+AbU/i6sMWIkz1av9jO+b8ZmU8vqjuaQA0
         xTFw==
X-Gm-Message-State: AOJu0YxNOrCH50jISabPPk73Ye7X5UbE6dE5Q7mkA8WX/9pBTFxLj12D
	y28WZ7xkqmzlj0e7z3XdGyVAppnTaeUnBNRSCpuSTOIdPw8cQF1BkkyX5SnZQMu1eriSqzp197e
	NAutWefmTugVlTjmKw2zkGJYbmzNGJJvR
X-Gm-Gg: ASbGncu2kBkuiLdrPvh2uIYvFnmhrYxpDANv+afD3AsRVDndqakEnZ2E4NL4MlruI14
	Yqi7mDLASmqaKodGr25Vf9w8HH8ht0Fo=
X-Google-Smtp-Source: AGHT+IGYLVNs3pXmBjoRVRyASLr4HN7BGOLa9AgF4Bu9RSiqijcUx0DW9ZjpIymSlU92nkwJwg/ohk8qkXkeIyIinXQ=
X-Received: by 2002:a05:6830:6f04:b0:718:1090:3d10 with SMTP id
 46e09a7af769-71c04cf0227mr7146189a34.26.1732395026753; Sat, 23 Nov 2024
 12:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20241121161620.2141006-1-tgamblin@baylibre.com>
In-Reply-To: <20241121161620.2141006-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Nov 2024 12:50:00 -0800
Message-ID: <CAMKF1sohjKLGfs_i7iimUx80SWzWs+eKOmkWA_4iPKaQ9bh96A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-setuptools: upgrade 72.1.0 -> 75.6.0
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 20:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207694

this regresses python3-zopeinterface build

https://0x0.st/X5Ls.do_compi

On Thu, Nov 21, 2024 at 8:16=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
> Changelog: https://github.com/pypa/setuptools/blob/main/NEWS.rst
>
> 0001-conditionally-do-not-fetch-code-by-easy_install.patch had to be
> adjusted to apply on top of 75.6.0.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...onally-do-not-fetch-code-by-easy_install.patch | 15 +++++++++++----
>  ...ols_72.1.0.bb =3D> python3-setuptools_75.6.0.bb} |  2 +-
>  2 files changed, 12 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb =3D> p=
ython3-setuptools_75.6.0.bb} (95%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditi=
onally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/pyth=
on/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.=
patch
> index 16b316e9cc2..527160735f0 100644
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-=
do-not-fetch-code-by-easy_install.patch
> +++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-=
do-not-fetch-code-by-easy_install.patch
> @@ -1,4 +1,4 @@
> -From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
> +From 00611eb8151825632bc36c189109626d9223037f Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 17 Jul 2018 10:13:38 +0800
>  Subject: [PATCH] conditionally do not fetch code by easy_install
> @@ -11,18 +11,22 @@ when that ever gets removed this patch can also be de=
leted.
>
>  Upstream-Status: Denied [https://github.com/pypa/setuptools/issues/4735]
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Update to apply against v75.6.0.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>  ---
>   setuptools/command/easy_install.py | 5 +++++
>   1 file changed, 5 insertions(+)
>
>  diff --git a/setuptools/command/easy_install.py b/setuptools/command/eas=
y_install.py
> -index 858fb20..62bd853 100644
> +index 66fe68f7a..8647c2082 100644
>  --- a/setuptools/command/easy_install.py
>  +++ b/setuptools/command/easy_install.py
> -@@ -672,6 +672,11 @@ class easy_install(Command):
> +@@ -673,6 +673,11 @@ class easy_install(Command):
>               os.path.exists(tmpdir) and _rmtree(tmpdir)
>
> -     def easy_install(self, spec, deps=3DFalse):
> +     def easy_install(self, spec, deps: bool =3D False) -> Distribution =
| None:
>  +        if os.environ.get('NO_FETCH_BUILD', None):
>  +            log.error("ERROR: Do not try to fetch `%s' for building. "
>  +                      "Please add its native recipe to DEPENDS." % spec=
)
> @@ -31,3 +35,6 @@ index 858fb20..62bd853 100644
>           with self._tmpdir() as tmpdir:
>               if not isinstance(spec, Requirement):
>                   if URL_SCHEME(spec):
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
> similarity index 95%
> rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
> index 5a01111934c..c0e4b7031d7 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
> @@ -13,7 +13,7 @@ SRC_URI:append:class-native =3D " file://0001-condition=
ally-do-not-fetch-code-by-e
>  SRC_URI +=3D " \
>              file://0001-_distutils-sysconfig.py-make-it-possible-to-subs=
tite.patch"
>
> -SRC_URI[sha256sum] =3D "8d243eff56d095e5817f796ede6ae32941278f542e0f9418=
67cc05ae52b162ec"
> +SRC_URI[sha256sum] =3D "8199222558df7c86216af4f84c30e9b34a61d8ba19366cc9=
14424cdbd28252f6"
>
>  DEPENDS +=3D "python3"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207545): https://lists.openembedded.org/g/openembedde=
d-core/message/207545
> Mute This Topic: https://lists.openembedded.org/mt/109706467/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

