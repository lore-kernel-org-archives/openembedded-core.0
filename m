Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E1C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 00:35:46 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.7794.1683074144241926287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 17:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XoAQE1uF;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-54a009bf95bso1336022eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683074143; x=1685666143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OY4zeL6wZzcRCqN7gVtY9b2+uefUh9RrWO9oD3HScs=;
        b=XoAQE1uFiNRsmVY+HNYjujcPq+ykw3Z5OJ1sW4FNTuAs87vSkh2LKdyPxyxRh2dOcY
         ZiC7QVaFbuJ3rgG74oh44FPFiVQh4b9GSSWpTtsIhakkR+BMwLuHQA8iU3a2vu90djmt
         Eht0AgDpeqbTolOcd8Fu9NiLnlUOFqZRXcP/F0iR1ZzoUWmiyxVN7Ww+NZYQWRdyUdyP
         KLUljoh4k4AuQbyAFEbY0JH7xkZB9/WjKFUZRjwdTbvpql9PONT252Z2ZnMpAbiMUGW9
         WQnHgCFiIIe9N/kI0tqDN3pTDmlRHM4OVQtsv6yfmnBIqGCQxn7swB3RERDEyGFXgG+A
         NXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683074143; x=1685666143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OY4zeL6wZzcRCqN7gVtY9b2+uefUh9RrWO9oD3HScs=;
        b=Ji4dRJrJ7hII/aGzxk91kzM8RCGmn8gpDqpA9SQNP3nzpgZgTJBu+2Z3BBjJwNXVV+
         +muS47r7oawYLDBxfnRKGR5U0k1b38vxft9TKYmtAs6y8DGpTp6vZQHsInBm3be9Z65q
         9KyFe2ltTDD7+KgUXAZUgu+QiUipFM9ba5R5+MdVnEF2IEyHVLBIvZjfYHM+pqgb3Fap
         sVaLOJvKwGozd+uwweoRUPpcqRwKxEkkyLjr/W4664V98mWCIu1S1D8u9PKN29pa3mj/
         amT3dQ6PrLzhfrmr7jom7pTFLjPVqolWyzFHtAxet9VwE2OW8yaTydIH50ujLl0bt5mZ
         eU+Q==
X-Gm-Message-State: AC+VfDwp2IsVVZ1QlyB9AyLGFUABA8WVhNFTqWZa3LtrCtOcWKu9O3+E
	nACnUW0a1TRJ6uLvPBAyk8chZKVP8QT3aJcPfAo=
X-Google-Smtp-Source: ACHHUZ4QUS2AHZHHceY6eEmH7V+7KxOjgJoUQbfhjOMw/gsW0ncsmpRTGJqVLz7nguQrTWXF5+7/CZGluUgK4t6wcgw=
X-Received: by 2002:a54:4103:0:b0:38c:17a7:5b7b with SMTP id
 l3-20020a544103000000b0038c17a75b7bmr9147289oic.19.1683074143280; Tue, 02 May
 2023 17:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230502123053.604642-1-tgamblin@baylibre.com> <20230502123053.604642-2-tgamblin@baylibre.com>
In-Reply-To: <20230502123053.604642-2-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 17:35:16 -0700
Message-ID: <CAMKF1soKLvKnWOygoYd_5LzAi1N97aRpQt+3e1-NAZQ38RtMRw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] python3-trove-classifiers: Add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180780

it needs maintainer entry as well.

On Tue, May 2, 2023 at 5:31=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.co=
m> wrote:
>
> python3-trove-classifiers is "Canonical source for classifiers on
> PyPI.". It is required to update python3-hatchling from the current
> version (1.13.0) in oe-core, and depends on python3-calver (another new
> recipe). Also add ptests.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../python3-trove-classifiers/run-ptest       |  3 +++
>  .../python3-trove-classifiers_2023.4.29.bb    | 26 +++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-trove-classifier=
s/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-trove-classifier=
s_2023.4.29.bb
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 78750a0d98..cbbf84f2d4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -64,6 +64,7 @@ PTESTS_FAST =3D "\
>      python3-pluggy \
>      python3-pyasn1 \
>      python3-pytz \
> +    python3-trove-classifiers \
>      python3-wcwidth \
>      python3-webcolors \
>      qemu \
> diff --git a/meta/recipes-devtools/python/python3-trove-classifiers/run-p=
test b/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
> new file mode 100644
> index 0000000000..8d2017d39c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.=
4.29.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.=
bb
> new file mode 100644
> index 0000000000..4bbcea5489
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Canonical source for classifiers on PyPI (pypi.org)."
> +HOMEPAGE =3D "https://github.com/pypa/trove-classifiers"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
> +
> +SRC_URI[sha256sum] =3D "8adcc06f1eb7c495f0bdceb698bd9c044b3e57b0d5767d99=
ec4b6b17c9bbe957"
> +
> +inherit pypi python_setuptools_build_meta ptest
> +
> +DEPENDS +=3D " python3-calver-native"
> +
> +SRC_URI +=3D " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       ${PYTHON_PN}-pytest \
> +       ${PYTHON_PN}-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180725): https://lists.openembedded.org/g/openembedde=
d-core/message/180725
> Mute This Topic: https://lists.openembedded.org/mt/98637420/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

