Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0B4CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:08:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.50384.1727687337263020649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VeejFf1I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cba8340beso30111515e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727687336; x=1728292136; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/SzQjGurENuiNd8ieTqnDtOiLtKT4sldTPPd3iVXryA=;
        b=VeejFf1IFeja4wFtBB2fjmeG+59dW2mx8oOXv0fIBKr5MfT1CaFamerP2xs9Q+6Ub7
         pBcfCxkMS38V5N36HUXB6VqKVZsd3xUgh8cg6q711z5Xvau5QuIpczEKrViOy7JwE1wB
         ubugMgy8BlyHfSpaSfleX5WbHDumQlFDSUV3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687336; x=1728292136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SzQjGurENuiNd8ieTqnDtOiLtKT4sldTPPd3iVXryA=;
        b=JFpfJOsGt2sG2cnHnKMcH7ZgzlVIwGE3cqr41fRRdOqCfOTcwh6y64aG6Ee0le+NAH
         mZBSq9bcmlm0ZXs0Zf130RquovB4nlf8P7gwDz1hNM10OpvXNqEQ5h3hjAKZFil1p8Xb
         Py0cGMcIujHvJq4TSKPbnJanQSZgqQCD/qum6YKD5KbCdQ/0XoWXFpL2XDVh2915X7l+
         HFt2i8aCeAnsiEcv9CrCAmGTi3oeIZbNAzMdr2mA/w1kD8ep4KxDF8zcwEGydR2bkyFL
         rft1ukdDV/iZjJs3ekHIWDfmqQD7WS260sDHgUzXtr673daDKnAGYldm28omz23vEDah
         sU8A==
X-Forwarded-Encrypted: i=1; AJvYcCWpRVNplASvCWc5nQ7QBc4Wei4LGLIAIwJ8Ugpn1sCuSQaP1hZ0gbSCmKqhvY+Oz2xXoiUiHTTTTfZkzwGNfTrzCQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtqLTmISMmNRJmLXCOQkVl0ElKTyDvAW4RQD9IU+6c3m5BgOEA
	yY61+JBOJOakMk4KI5FpMnfgyskdBmhJtcE9ksrp5l1jbPiMDZOMKqE0ZDgH93c=
X-Google-Smtp-Source: AGHT+IHKcHRYjms5iJYTPaJRPMOY8SyRUUDj86owJl8UMV7hmBDM7SNxe3PH15fEl7GU+VND13QTDQ==
X-Received: by 2002:adf:fc44:0:b0:374:cc89:174b with SMTP id ffacd0b85a97d-37ccdb05cccmr7768598f8f.4.1727687335564;
        Mon, 30 Sep 2024 02:08:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd1:92ec:a53b:af7d? ([2001:8b0:aba:5f3c:bbd1:92ec:a53b:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730eaasm8489449f8f.73.2024.09.30.02.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:08:54 -0700 (PDT)
Message-ID: <acd128f477d436c14839ca8ea06566a28abed7ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kmscube: Add patch to fix -int-conversion
 build error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 Sep 2024 10:08:53 +0100
In-Reply-To: <20240930072655.3156218-1-purushottam27.kumar@lge.com>
References: <20240930072655.3156218-1-purushottam27.kumar@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205100

On Mon, 2024-09-30 at 12:56 +0530, Purushottam Choudhary via lists.openembe=
dded.org wrote:
> On some platforms, `EGLNativeDisplayType` is an int instead of
> a pointer, in which case the void pointer will raise
> a `-Wint-conversion`.
>=20
> Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
> ---
> =C2=A0...001-common-fix-cast-type-in-init_egl.patch | 34 ++++++++++++++++=
+++
> =C2=A0meta/recipes-graphics/kmscube/kmscube_git.bb=C2=A0 |=C2=A0 6 ++--
> =C2=A02 files changed, 38 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-commo=
n-fix-cast-type-in-init_egl.patch
>=20
> diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-t=
ype-in-init_egl.patch b/meta/recipes-graphics/kmscube/kmscube/0001-common-f=
ix-cast-type-in-init_egl.patch
> new file mode 100644
> index 0000000000..50df211d60
> --- /dev/null
> +++ b/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-=
init_egl.patch
> @@ -0,0 +1,34 @@
> +From b2f97f53e01e07a920761e5d3e3ba22898b794a4 Mon Sep 17 00:00:00 2001
> +From: Eric Engestrom <eric@igalia.com>
> +Date: Tue, 24 Sep 2024 17:57:45 +0200
> +Subject: [PATCH] common: fix cast type in init_egl()
> +
> +On some platforms, `EGLNativeDisplayType` is an int instead of
> +a pointer, in which case the void pointer will raise
> +a `-Wint-conversion`.
> +
> +Let's cast it to the correct type directly.
> +
> +Closes: https://gitlab.freedesktop.org/mesa/kmscube/-/issues/16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://gitlab.freedesktop.or=
g/mesa/kmscube/-/merge_requests/57
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-=
/commit/b2f97f53e01e07a920761e5d3e3ba22898b794a4]
> +
> +Signed-off-by: Purushottam Choudhary <Purushottam27.kumar@lge.com>
> +---
> + common.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/common.c b/common.c
> +index e52d480..e1e2dcf 100644
> +--- a/common.c
> ++++ b/common.c
> +@@ -341,7 +341,7 @@ int init_egl(struct egl *egl, const struct gbm *gbm,=
 int samples)
> +=C2=A0		egl->display =3D egl->eglGetPlatformDisplayEXT(EGL_PLATFORM_GBM_=
KHR,
> +=C2=A0				gbm->dev, NULL);
> +=C2=A0	} else {
> +-		egl->display =3D eglGetDisplay((void *)gbm->dev);
> ++		egl->display =3D eglGetDisplay((EGLNativeDisplayType)gbm->dev);
> +=C2=A0	}
> +=20
> +=C2=A0	if (!eglInitialize(egl->display, &major, &minor)) {
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-=
graphics/kmscube/kmscube_git.bb
> index 98f110527e..40c5a14492 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -11,8 +11,10 @@ DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual=
/egl libdrm virtual/libgbm"
> =C2=A0LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;m=
d5=3D8b309d4ee67b7315ff7381270dd631fb"
> =C2=A0
> =C2=A0SRCREV =3D "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
> -SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;p=
rotocol=3Dhttps"
> -SRC_URI +=3D "file://0001-texturator-Use-correct-GL-extension-header.pat=
ch"
> +SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;p=
rotocol=3Dhttps \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-texturator-Use-correct-GL-extension-header.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-common-fix-cast-type-in-init_egl.patch=C2=A0\
> +"
> =C2=A0UPSTREAM_CHECK_COMMITS =3D "1"
> =C2=A0
> =C2=A0S =3D "${WORKDIR}/git"

Given the discussion on a different patch, I think this is for
kirkstone? You need to put that in the subject line else we stand
little chance of working it out.

Cheers,

Richard

