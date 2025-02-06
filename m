Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3B9C02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 03:11:22 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.31662.1738811472623784934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 19:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egbns9ii;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a8690dcb35so134856fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 19:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738811472; x=1739416272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+DYOlRTSZEpNM9jVrZH4zfhbxDT82aa3kpnWPeapi8=;
        b=egbns9ii7itMFMZU24cUceTkqlMik4evW6NZFfdr1ytNyjzTc1/J6YbW8mVkV9OOzg
         bf0wGY3+WkNuEQXRv95goJBZ5LEhU7gH0yoml2gEd2XuEg8HZsEbYtKtrJJLiPEvYZRu
         GgwJWzaWV+UIX4ltNMfklrSURfwnuGHo9oeXEF+zAq0dJNCaYCJMTkEbgntopat+kE+A
         lDGwRhK2atmspplsOu2KRl4pP6AqHdvIBReFnySZwurbVMGOHcjDA3pIKKdJxPUeY+lK
         3iccRE2rx8DhbveqMP2XinUdVYz1OmS6D5as8v0bb4EcK1cNeN08ncMtCjycCtOselbK
         HDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811472; x=1739416272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+DYOlRTSZEpNM9jVrZH4zfhbxDT82aa3kpnWPeapi8=;
        b=WD6mWYNv8x48VuDWfw4whahrV//7Y5Z5PNNam3rASIbJ67Ios8HWmEP1FvQTh1JOLi
         hLwFVOsl1uSAe+FNPPArmcJHJ9r6ltRerK/i6v/ShZt+wNRCYCjZaiAfiGa99tE1sTVB
         XPZGlKGqEpLh5k2/2aXQo0Jx+/Imrq0HYneU6vElnkUs3GWIaAosza+X/tnp3Tny/+Pe
         83thP3xbJ53lGjt4wivCTtu2QulcnoGVLHfcvPuc2C9B45zW+eMmfga4t7qxqMl81lWV
         +mb2gCl6D9+Ahtdlcs5WuRgicu01rtn1KHHZsK548UBY4De80lAB1t2/iJxYsT0f2p73
         qU/g==
X-Gm-Message-State: AOJu0YyLZpOg+LSGMh85qb5AgyIxvBtTp2A89/UOio9A/YDqckq2GfGt
	PDf7oeeAakG3+o9r8mdAUU19zFBdVcQN+aIMsUAGBCnUrpo5Ot78eWCby6kjvuOb9J2CJGte8hm
	sYh9tOCISv1iLgTUh/PENhK2Q8mE=
X-Gm-Gg: ASbGncv1SdIgxfTsODjojg5K15Alo6Qu8rtJ7GVYh3bbAJFD0qBdS2kvsLg2dVAKAyx
	JhKhG/G7boLC0ldf4Ukl+Y4ojOTlc1XI1MGVeJK5b1P6rfclLCBK6JLOghCKA4vh5CDT+SKM=
X-Google-Smtp-Source: AGHT+IG1Jl5nSVlshJOiOwziU3DY47l2UOln5rU5/so2OuW1+RiZBVqGG9N5Gao6Cxl+s/QOt6WF8ibZGbb7eUesOfA=
X-Received: by 2002:a05:6871:4607:b0:2b7:f2dc:a4c2 with SMTP id
 586e51a60fabf-2b804fa3926mr3749039fac.18.1738811471659; Wed, 05 Feb 2025
 19:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org> <20250203164130.3403325-35-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250203164130.3403325-35-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Feb 2025 19:10:45 -0800
X-Gm-Features: AWEUYZlGeWgPiMSFY5VQmWnIbsNUfLCfQOWrmREO0LePs1mDhy2rVO4AV9r3Qcg
Message-ID: <CAMKF1sp6AVYNo+BuJAuaBQF28fp8EA3p2GSbeLW+cn66vvSZdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/46] python3-pyopenssl: upgrade 24.3.0 -> 25.0.0
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210887

On Mon, Feb 3, 2025 at 8:42=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...{python3-pyopenssl_24.3.0.bb =3D> python3-pyopenssl_25.0.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-pyopenssl_24.3.0.bb =3D> py=
thon3-pyopenssl_25.0.0.bb} (85%)

For anyone who might see failures in the python3-google-auth ptests

       AttributeError: module 'OpenSSL.crypto' has no attribute 'sign'
./../python3.13/site-packages/cryptography/utils.py:68: AttributeError
FAIL: tests/transport/test__mtls_helper.py:TestDecryptPrivateKey.test_succe=
ss

as it seems python3-google-auth not yet ported to work with 25.0.0 see
https://github.com/googleapis/google-api-python-client/issues/2554

>
> diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb b/m=
eta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
> similarity index 85%
> rename from meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
> rename to meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
> index b8a980be42b..6485f3e1ed6 100644
> --- a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
>
>  DEPENDS +=3D "openssl python3-cryptography"
>
> -SRC_URI[sha256sum] =3D "49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf4=
3a9a173b8138bb36"
> +SRC_URI[sha256sum] =3D "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1=
cabc4ae64e9dac16"
>
>  inherit pypi setuptools3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210708): https://lists.openembedded.org/g/openembedde=
d-core/message/210708
> Mute This Topic: https://lists.openembedded.org/mt/110974469/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

