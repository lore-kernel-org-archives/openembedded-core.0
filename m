Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349F9C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:57:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17910.1785099420031320781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 13:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SIEva2eC;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1670432f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785099418; x=1785704218; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytlYF3asTX9A8NtI6pDUkdkPPGQZasHdOPx4rTGYxMk=;
        b=SIEva2eCfh4dKMO2Ra74k+n7MhKYTQSsUqzJutPCeOg3egejdMsOK/Gy/+zevY9R4b
         tTHogf9jWzS/dUkeNsWudvH9uy1uTA3vHBmraWV4m6CtiNUD9NNd6nkL0xErJc9Ycccg
         uimNzMFl22FrPe1usO47YBTakWoMdnPuIlKiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099418; x=1785704218;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytlYF3asTX9A8NtI6pDUkdkPPGQZasHdOPx4rTGYxMk=;
        b=kl0aDTHw94hCY2iLrA3IY8arGBmLT7UmuSoKgb2rcXcOnUKz7BRbFqqnFsMugWQa/8
         am1DPLtal6LOK28DP7xaQhg5gTEX7NnSXRyY/aV6YbyTgpcJ1WTv0K1xsPkA3yHXM2Sm
         xAo6uq956XHLDAjr8fMgP+ydWTm7NVKIkEJg70L4A1c2PMRCmVsfsJKhkZqXZCr72N+w
         vkDE5rUbrdM0UMOGLqcG0TsqwXaFPz94mxsEHK0d8wtzvsefaixAzIy9ZInlA0M97p0s
         nHXO0myptqgkr1ZR6u7GS7Ud4jwzs22zCHNGpPxqs/6G1U6H6npxbcoM7Akhc5So++Xu
         LTxg==
X-Forwarded-Encrypted: i=1; AHgh+RoDw1oBCIwPrq64y5jYiZ9P1yKh5Ldtpxoo2UVMB8FLsZ0fMxqF2choqPFDJY8IxhL7tNjNlELF9KVVnz/AijZCQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxi7LL54GHOWJvMKzAskde07diUqXCRCROVWx8e8Rn1FtmCjwFe
	JZmMu8bjSVPJ6fYys8/OtolMnzua5Yn1+Q0vuT5Fs1gl/1k+kcPRx9pZfuT3+nqHv95/Hpm9rXR
	Zs3YrKao=
X-Gm-Gg: AR+sD115m12JcMGMNbw/VlF4IcgjDTlJ3PJibDP5Ed+08yi+Q6mUAIIimmOAZDPy4EI
	H/8frMf2zgeMfQ8EfBkUHji7gMW4Vz2N8wcC99wdOs6yMEODEKP6w7+pi9J5s1DeaLzxK/Wf8TO
	/LRZzWeXbd+oBiYg6NI1JMqLqRZDzTNF56kB0jKpe8NYzB0iRfW2Dt+8W7AhHwzVdauF6Vkatez
	IdrkDMD87LUCRpUoHgg7RznaAIEPRtiQuQTbsEmw3Y+B6eucK3Tq/A9TNUyKRkFDopezYx9mOql
	t/5lKutliDaoElMXrZ2kSE8ECOwsJTGmxF3jzal+K1FtIEw3ck36yXbBX3HtxAU3ySioe5fMVM+
	y7Tgw5th9hLZEUdQbGzk1Pv22szWsIsWcmjGF4qfzK1wnQm9gZdRwWf5kd0CQsIVM43ROQcuMHG
	8eBQNKLfdYDIj/7/xu006lsDyQlxOK7/4+2tjgTSHtyn2dcwkgp53JH4FxIRgZOvo2pQ==
X-Received: by 2002:a05:6000:2903:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-47f9fc8f5ebmr8262938f8f.17.1785099418240;
        Sun, 26 Jul 2026 13:56:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm40400218f8f.29.2026.07.26.13.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:56:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 22:56:57 +0200
Message-Id: <DK8SXJEHTZ1E.SDF1CPGAYMXZ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 1/5] wget: fix CVE-2026-58469
X-Mailer: aerc 0.20.0
References: <20260722082024.15137-1-amaury.couderc@est.tech>
In-Reply-To: <20260722082024.15137-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 20:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242021

On Wed Jul 22, 2026 at 10:20 AM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-58469.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-58469
>   https://www.cve.org/CVERecord?id=3DCVE-2026-58469
>   https://security-tracker.debian.org/tracker/CVE-2026-58469
>   https://ubuntu.com/security/CVE-2026-58469
>   https://osv.dev/list?q=3DCVE-2026-58469
>
> Upstream fix:
>   https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4=
fb0b6f7826 [nvd]
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

Review from Hetvi Thakar:
On Thu Jul 23, 2026 at 10:44 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .
> I kindly request you to review my series as well.


> diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/=
recipes-extended/wget/wget/CVE-2026-58469.patch
> new file mode 100644
> index 0000000000..c5d3df9090
> --- /dev/null
> +++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
> @@ -0,0 +1,52 @@
> +From c7d858a9ca8b9840e5edc520c36fe4f33f2e9cea Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
> +Date: Mon, 29 Jun 2026 18:32:02 +0200
> +Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
> + underflow
> +
> +Reported-by: TristanInSec@gmail.com
> +
> +CVE: CVE-2026-58469
> +Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a4=
0fcb450153f69537c7cbc2a7a4fb0b6f7826]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + src/metalink.c | 9 +++------
> + 1 file changed, 3 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/metalink.c b/src/metalink.c
> +index de2439c9..2d6e5846 100644
> +--- a/src/metalink.c
> ++++ b/src/metalink.c
> +@@ -1041,7 +1041,6 @@ void
> + clean_metalink_string (char **str)
> + {
> +   int c;
> +-  size_t len;
> +   char *new, *beg, *end;
> +=20
> +   if (!str || !*str)
> +@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
> +=20
> +   beg =3D *str;
> +=20
> +-  while ((c =3D *beg) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=3D '\=
t' || c =3D=3D ' '))
> ++  while (isspace(*beg))
> +     beg++;
> +=20
> +   end =3D beg;
> +@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
> +   /* If we are at the end of the string, search the first legit
> +      character going backward.  */
> +   if (*end =3D=3D '\0')
> +-    while ((c =3D *(end - 1)) && (c =3D=3D '\n' || c =3D=3D '\r' || c =
=3D=3D '\t' || c =3D=3D ' '))
> ++    while (end > beg && !isspace(*(end - 1)))
> +       end--;
> +=20
> +-  len =3D end - beg;
> +-
> +-  new =3D xmemdup0 (beg, len);
> ++  new =3D xmemdup0 (beg, end - beg);
> +   xfree (*str);
> +   *str =3D new;
> + }
> diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
> index f0d3458462..a1f34dfb5c 100644
> --- a/meta/recipes-extended/wget/wget_1.25.0.bb
> +++ b/meta/recipes-extended/wget/wget_1.25.0.bb
> @@ -15,6 +15,7 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
>             file://0002-improve-reproducibility.patch \
> +           file://CVE-2026-58469.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"


--=20
Yoann Congal
Smile ECS


