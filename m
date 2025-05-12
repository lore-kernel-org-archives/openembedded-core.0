Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A88C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 22:21:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.62674.1747088492120994840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 15:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HCkArv0D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso33558575e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747088490; x=1747693290; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du5V2WHe0EeJCqEc8e8ArTLMTnxJoFm0GVNJj2YvvtA=;
        b=HCkArv0D6+hhAjbPpyhe+irFbrw2Ws9vBh/q+2Nyqps61AKJVOIyIvyNw/US3uORZd
         onWUgfnUelSJRYtEvr+wyb0N/NvnvNuPdb+LGr3hKxU5jr3eSTtmJ0xizEKK6n7LP78+
         gQqTM0qiA9fs5nwmmzMQv5ACDv5WjrMDvjBG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747088490; x=1747693290;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=du5V2WHe0EeJCqEc8e8ArTLMTnxJoFm0GVNJj2YvvtA=;
        b=G2QFURI3Ty8JvLqfbR5gEVBIfdzE1nUja8M8zjC41cjh3uP74KcZ8B5bfvKlT4tIFC
         izZGfG2vOQWJ/BjO2wV024SSSdS1eKtZgyDoDdHE18bNNtcnaB7fXupO1TByU0HLiBey
         cSaZrgQXcnRCfnAthNfyAgRNelDwkdHJ+vfLlUBI162TUj9Itxq3EINa2ED2+RKxeF1h
         VTMc5mDvEPhtOn3ybFAEbfRfsph9IKuF2QRV/8nYwuMZao6gB0hNyMJqYTh8LoVIaucx
         6PpG0oSISomHJ5aosZ9RkEihr1UtR4/NehknsOek0O++sHNxlBDq7TS8lHOlkBShsths
         N1+w==
X-Forwarded-Encrypted: i=1; AJvYcCWzDcjVNp/QKTy/Uux84L555ekHzJXtXIM9MMsKqU0qXhZ9a/wrIxHAURXJsCMBlV1dmE9ecSkD5vlwEJV/QSDVeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYU/pU2KVoZySKHRycQGya0Aml+WML+j+cBuqwh6o5QhlytH5q
	ucgbgwrpGbq6pSDdvspYWqOFXbR1xTXgmJDPgpnvKOE653j7qSgnyYxyRBCXeP4=
X-Gm-Gg: ASbGnct3U1szxHoFdoOxlfl8kt38MwS4xwzpDN/C7/1cFDWmArsRvG7ymcmDhigPkR6
	m6HaBF5g/cq3j6GITBP40QCuEDnb5pCxhwohTy8yvq2NYCVHk/ZNh9wyX3lBRrJpxfsYSf3L9z+
	1OBO+SxgOgoW2YLA0+S5zUMTpNE9jNbER9pZaoDlCpwMe6eg+oa/7GB0pb8EjbbzLmxWytp3oJy
	1I5LmKDy/OhtbXZGxwoXIF9zFkksY90LGpKFDNGV4w8j7aQAh+bpJIEfV5oyQ6odrymfCm2GdbV
	OPvOgQt2EwMoMryCPqVKlRbIo5SW8TTkKylgLjAkwN6pAJ+4dMcXccQQRlf5CS2PFRxVSwukmjF
	2Q9Ewfy+fxHs1VltGD7xavFapoCtB5p3c4DG4sEY0
X-Google-Smtp-Source: AGHT+IGAfsATwKaFFGcLUiIcVa8t/DvQBKSBnf55T253goxsfKRjHDF5JJnMPrUibufEWo2195ok2w==
X-Received: by 2002:a05:600c:1ca0:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-442eb8855bcmr3112825e9.11.1747088490312;
        Mon, 12 May 2025 15:21:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:83f1:c407:5c8d:78ee? ([2001:8b0:aba:5f3c:83f1:c407:5c8d:78ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328f0fsm190750545e9.7.2025.05.12.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 15:21:29 -0700 (PDT)
Message-ID: <18b89e1c8bbd57336060148b6d96ce809295c98b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: get real os-release file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2025 23:21:28 +0100
In-Reply-To: <20250512155835.9159-1-peter.marko@siemens.com>
References: <20250512155835.9159-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 22:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216389

On Mon, 2025-05-12 at 17:58 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> /etc/os-release is a symlink to /usr/lib.
> Symlink is retrieved as a dead link which points to nowhere if also the
> original file is not accompanying it.
> Fetch the real file instead of this link.
>=20
> Alternative could be to use "tar -h" (supported also by busybox tar),
> however that could lose some important information if links are relevant
> for failure analysis.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index e090b1ef4b..862f3e53a3 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -26,7 +26,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedir}/log \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedir}/volatile/log \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${sysconfdir}/version \
> -=C2=A0=C2=A0=C2=A0 ${sysconfdir}/os-release"
> +=C2=A0=C2=A0=C2=A0 ${nonarch_libdir}/os-release"
> =C2=A0
> =C2=A0# If some ptests are run and fail, retrieve corresponding directori=
es
> =C2=A0TESTIMAGE_FAILED_QA_ARTIFACTS +=3D "${@bb.utils.contains('DISTRO_FE=
ATURES', 'ptest', '${libdir}/*/ptest', '', d)}"

The definitive location for this is ${sysconfdir} as far as I know and
I'm nervous about replacing that. We could list both? For this file,
resolving the symlink is the right thing to do but that might not be
the case for all files listed in the variable which does make this
trickier to solve...

Cheers,

RIchard

