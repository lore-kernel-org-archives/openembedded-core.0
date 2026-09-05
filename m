Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212AEC624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:40:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2499.1788640806495169607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UM6Kk8lm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4274915e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788640805; x=1789245605; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=05XqTIQzvC+nOMrPrHCau7hjIvmelDZgLMOlWAnbK5Y=;
        b=UM6Kk8lmQaax4B7as3jdkQ73CFIapv6M8cOLgJQ3SWA0h2d0DHTOHtb+6qWLxMO6p+
         MQXrZrcrmJDpp19pWEFxVuUkgEr/PPg39PQ0UeaAQhk+e3DZyoOBglho3MxobRNsdxnc
         N2O2zFKlY1qmElg8RgRsHePGnhOUCSZhRpBcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788640805; x=1789245605;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05XqTIQzvC+nOMrPrHCau7hjIvmelDZgLMOlWAnbK5Y=;
        b=UyEVkz3z+kOIJ7RKkHZgojILAtOlPaW5mR1joZh9jZTzd/wV4wK55M6L8YSNwk+9zZ
         TH9m5rwW8ac3hzWMpPK8Q5yhRb3wNwYeiHtM9sYCcKWqG+USj6ePz4nWc5niwXV1FKps
         yXpU800fV0+2U6JJOJLczzgXR9yv5lSRMw8MaInCb8TJF4arS5LUuUDjcMaBiRWs9JGP
         WT2wv4IXGbhkOjlgE5V71qZQ8lmcwlI74EdjLxWlc8PqiHmR0E0xIBmXMwVjuPWvUEbz
         JtMe3hGM2JsQy26UBMPNwBqlFdoSx/jvJfcAZenG6dMQYUG/tXPGPY5b0cMZMdt9wvQ4
         kDPA==
X-Forwarded-Encrypted: i=1; AKwUvByS0jroTJAvGu6bE+y5bW9xRnpoJ7HcGxGvcOOrxvKxPBoC7/45sNTuQUe6DJSWhGPYUiQbr48b6C8g1L1Pf8rsDQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++k1B4hTqtbMZXgudVXOunFQRUfOw+FVpZtcRDfuTyaGpxO5R5gt
	lqKirKME/+XGIlSuPrawqQbG/ZvwdoE8YHPXN979yvgQ3njV7j1ClJ8Wh3KagKeV0Fs=
X-Gm-Gg: AYBFou2q+sLsigcvZ0W65ho213nKgLBp0WDZLRy+kJ424r95ouRd6OCz61kqLvp/nVH
	q/zHvr7cgeUGyXCCA0yUdZ18F7ZBpyfdCHIVYMl6be9XJWZRVYWgpQsrINDdCBxrno37qnkToHV
	6neHJrDHLnfTfoFH/nuCQCmf6Kjd5jWkqDPYsEea8fxNssRrIsqnd2QXku94F3avRbRd7DY4KWF
	ZQbw7KuyZ4Q5SxX/3lGbqiFHCUYZdEnGEd8Yb92SXopSr615g1JRhsHuMlIFNu2j42It0BXkqeY
	IEUKkSyKF8dozYMI9SsxfqkJIKtrcSfLD1kP5DWCDDv2ks1U/U3y6qSeTQSa1nLfeF44kGneEOe
	0hkHoa99NlJpQz2Pa0e5tueuDKUWt4lzgjzdl8seT/FV111U2l4ljDuuJcufIvUyMKzRrCXKW8d
	ZqEzCKlfU1H7638TVLvx1PjhZomggGiJWe7lKugPDGghpBs4hdOgcVtfVGIxc+q3Qff8szrcr+5
	ripysnxDGYG9gCfRIAUeRFeq2VDMKSxofqJw/JlPQ3wnap9qjc=
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49cfff39708mr78706065e9.17.1788640804690;
        Sat, 05 Sep 2026 13:40:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:98f:90b6:41a8:38d5? ([2001:8b0:aba:5f3c:98f:90b6:41a8:38d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm301888955e9.1.2026.09.05.13.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:40:03 -0700 (PDT)
Message-ID: <55ecd56beb4e2daa5fa321c47dbf0459e357851e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-typing-extensions: Fix build with
 flit-core 4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 21:40:03 +0100
In-Reply-To: <20260905184328.3263998-1-khem.raj@oss.qualcomm.com>
References: <20260905184328.3263998-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245151

On Sat, 2026-09-05 at 11:43 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Fixes
> =C2=A0ERROR Unmet dependencies
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flit_core<4,>=3D3.11
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 wanted: <4,>=3D3.11
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 found: 4.0.2
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> =C2=A0...4d71b18eee56c53dde6a609dea188bb26a96.patch | 21 ++++++++++++++++=
+++
> =C2=A0.../python3-typing-extensions_4.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 23 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-typing-exte=
nsions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch
>=20
> diff --git a/meta/recipes-devtools/python/python3-typing-extensions/996d4=
d71b18eee56c53dde6a609dea188bb26a96.patch b/meta/recipes-devtools/python/py=
thon3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch
> new file mode 100644
> index 0000000000..226c65c13c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18e=
ee56c53dde6a609dea188bb26a96.patch
> @@ -0,0 +1,21 @@
> +From 996d4d71b18eee56c53dde6a609dea188bb26a96 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> +Date: Mon, 24 Aug 2026 18:40:42 +0200
> +Subject: [PATCH] Allow building this package with flit-core 4 (#787)
> +
> +Upstream-Status: Backport [https://github.com/python/typing_extensions/p=
ull/787]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,6 +1,6 @@
> + # Build system requirements.
> + [build-system]
> +-requires =3D ["flit_core >=3D3.11,<4"]
> ++requires =3D ["flit_core >=3D3.11,<5"]
> + build-backend =3D "flit_core.buildapi"
> +
> + # Project metadata
> diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.16.=
0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
> index cede81e128..484f0164bc 100644
> --- a/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
> +++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
> @@ -15,6 +15,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf6b249c264=
1540219a727f35d8d2c2"
> =C2=A0# The name on PyPi is slightly different.
> =C2=A0PYPI_PACKAGE =3D "typing_extensions"
> =C2=A0
> +SRC_URI +=3D "file://996d4d71b18eee56c53dde6a609dea188bb26a96.patch"
> +
> =C2=A0SRC_URI[sha256sum] =3D "dc983d19a509c94dba722ee6abd33940f7c05a89e24=
3c47e907eb4db6f1a43e5"
> =C2=A0
> =C2=A0inherit pypi python_flit_core
>=20

Thanks, I'm guessing this was in response to one of the patches in master-n=
ext?

I ran that flit upgrade through testing just to see where things stood,
it looks like there are 5 or so recipces which need this kind of tweak
so I've backed that out again.

Cheers,

Richard

