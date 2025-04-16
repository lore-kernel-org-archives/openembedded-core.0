Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD247C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:15:26 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.29982.1744834525555643285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ik21y4va;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-601a891ab8fso52179eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744834525; x=1745439325; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTY1fYkOtNrfbHNltwiHnh41WMinlfT85i3CAW+/5Eo=;
        b=ik21y4vaBYcQX/QUdqJIezv3a/FlUN+6sFwlTkO7kTGpJxjk+kf9vb+VL56+1dZqs/
         Lc+1b1I3jnSFTD3RD6k/iqINvKYXo37uTTQpChUaHKskn85ZlPcLFyzz5iU/b9hyBDLt
         dgtlxzF0WzZVdE/P6UNQfEqvTNfsxtle81DPSlroDcxnENsas8mAhigJtL2BEyK8byAc
         11GwxPpX9W6ta0ircio+3fl+F8zjjJer1xIMZy5RJ7rF9dPdMIZGoSvlB2EcOw2n/rto
         P7yc9BHKFImrDGFUZHS8xpxF3KJXXvbw3c7/Vjn+i3Gl637oxWrlxBWBkGiMb5wNrppm
         GTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834525; x=1745439325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTY1fYkOtNrfbHNltwiHnh41WMinlfT85i3CAW+/5Eo=;
        b=n1RcY8p2Rfp0HZouE5OlyeKpH1VYtls1OTbTy64QFNMakBu17com3T5ncHgnCQw3A3
         As2MZ+Qtm1dd3VqKuz44xd47s2QMK6DdlAxk3xXCiRr/fy/sRuGGh1PHnRNwM2hmPeav
         2xZYpCzZ3yVFkZVngnzVLINKBospgHxIvh8CNjKAXOkl1UZgcehfq1EDYFBMoEg114r7
         HubSWDOUAjt6V5VvUkpItG1PaKsJpAV8mNk5aTrLSSX2YjTuxZVr5fzWwwi3SthtbNXB
         RkVov0jyF/pBk6c6CcwIKj04LezIqicqEmL+k9LOQ1GucUHt7eJfSlpfhikXYoJzroax
         jKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq2HoS29myXRUQ9qpVnHalmCmkyzt8lG1b1uqiAgMXc/Ofhm2Nav5mMh3O7gnFXeUfSQ3Oe2RrKSMw0pHc0/8tmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzt34c4aJuBFADOISrUJAKLG+BwQsBV0PvxLkIsPhspLvtXgIJJ
	DhNsOMMUusMVQykGFYtb9fzfoH99uXqAabAuSyPYe423K0QOlIwSYzhf5jpTqLdnKpGdwPPgp1L
	ve3V54S1foxzuVq2dFX38NEt078ygSVMINu0=
X-Gm-Gg: ASbGncuIfsjoGw0pbJ6k68Qx8zCJ5nBRYiFJV0xjRR4KjlU8r9YoE3FuQ1FbrsiGPTy
	4ubHiGlM8TEo3kfPW3XQaZhRVdpuTWbrZy30KT4gNr116EjZegMFNj41kOJXYh+U7LZEjWlFK0e
	b/2bUvaDNzc63Q3A9KjCl0KKtdvY4bdbly5fhOISMYYr9vPXfE3C8=
X-Google-Smtp-Source: AGHT+IF90v4yKwU5qRfWhfDI1FxUzZARfhE+pB8K4QMS3FhGZRcN0s85oW6kjYjjiHEIVkoz0aNM72JHT1vldp3WAvA=
X-Received: by 2002:a05:6820:610:b0:5fe:b3c2:29e2 with SMTP id
 006d021491bc7-6057198a7a8mr155442eaf.2.1744834524735; Wed, 16 Apr 2025
 13:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250415102512.696-1-leimaohui@fujitsu.com>
In-Reply-To: <20250415102512.696-1-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 13:14:58 -0700
X-Gm-Features: ATxdqUGYeXUNkck6STbey1p-ga7xCXKXcmu8cwcinEaKkJHKK6mCiY7nJ4wOHSg
Message-ID: <CAMKF1srfFAtwN1UvXUkb7c-WgW5NbP0ssb+UXjx_LP05tSBH6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-hypothesis: upgrade 6.129.2 -> 6.131.0
To: leimaohui@fujitsu.com
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215014

On Tue, Apr 15, 2025 at 3:25=E2=80=AFAM leimaohui via lists.openembedded.or=
g
<leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> This package change to be built using python_setuptools_build_meta build =
class now
>
> Changelog:
> https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-pyth=
on/docs/changelog.rst
>
> ptest result:
> |Testsuite summary
> |# TOTAL: 5
> |# PASS: 5
> |# SKIP: 0
> |# XFAIL: 0
> |# FAIL: 0
> |# XPASS: 0
> |# ERROR: 0
> |DURATION: 23
> |END: /usr/lib/python3-hypothesis/ptest
> |2025-04-15T10:17
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  ...n3-hypothesis_6.129.2.bb =3D> python3-hypothesis_6.131.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-hypothesis_6.129.2.bb =3D> =
python3-hypothesis_6.131.0.bb} (87%)
>
> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb b=
/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
> rename to meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
> index df9bd6b7c7..0542a9d188 100644
> --- a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4ee62c16eb=
d0f4f99d906f36b7de8c3c"
>
>  PYPI_PACKAGE =3D "hypothesis"
>
> -inherit pypi setuptools3 ptest
> +inherit pypi python_setuptools_build_meta ptest

Can we switch to using ptest-python-pytest instead of ptest here while
you are touching it ?

>
>  SRC_URI +=3D " \
>      file://run-ptest \
> @@ -13,7 +13,7 @@ SRC_URI +=3D " \
>      file://test_rle.py \
>      "
>
> -SRC_URI[sha256sum] =3D "23f180782dbbbcb6e59051794295d75783ad59241e6629a5=
bf700936c28a995b"
> +SRC_URI[sha256sum] =3D "4b807daeeee47852edfd9818ba0e33df14902f1b78a5524f=
1a3fb71f80c7cec3"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-attrs \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214836): https://lists.openembedded.org/g/openembedde=
d-core/message/214836
> Mute This Topic: https://lists.openembedded.org/mt/112273734/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

