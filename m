Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C93CA9EBB
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 00:02:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.790.1791590528168135114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 17:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tFcMRVjv;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so2865395e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 17:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791590526; x=1792195326; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3kG4JdlsvGXd00wG/zlNMRyNyjvr2AazyBgQLPh3ud0=;
        b=tFcMRVjvcahKxjXiNl67nyoGXyWlyHV8u5eJd2cYJ12rJhn/XklmvzbnMqvb/tlEOt
         ZUy49KRi8simIsU6a3JwIi34uz1BWEiVoGZR8Ov8XMbaAgYbYgIM4y8+2GEytvoqVAZZ
         55B20r+GRqoUOxtVD1T+k0zxrOGz1jBm3nY4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590526; x=1792195326;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3kG4JdlsvGXd00wG/zlNMRyNyjvr2AazyBgQLPh3ud0=;
        b=0kvnqQFL7GX9dS/PATOB5Ha+ovLP1alNQPsUJDHK3j9kj+9ynQaNMOyN6OjIGS3Ujq
         iOfpedt3JmK7FDIkeNThhpPEsNIFY19c/1ILQhVgWDrrm+7H34eDd99I1auGXBJG3hf2
         Gqyj03tsbQuw90iqI4j7e4lBdemt3SwWYKQ7dGsZNfOzEldYXc32U+poCWvEikiUqo8O
         q6UideCy7Ywbbj4QR8ol4uC1YL/iLLioDz+l/NR8OAB6pUMSqmXgktmGkG4nigSqnCUk
         EF0dmK/HGh0ihp76JkQdXVTNtD5UCwDuqkY577pKFtZckp+Pgap41UfPq3/DqAVesdRi
         pBpw==
X-Forwarded-Encrypted: i=1; AKwUvBw3bCeYPfMAULHyByAwAwU9u53bgiHlhkr3pBVw6pZE9DuOLg+yjQ0Y+4AIf35tSfC1V78X1sPnZVBJImFv8VCyZg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJmkTCRF0bawwPL2m0AQUG9GHBmCoCOnHWhi7ey4M0vMTKUTbai
	on64IZaQ8/2mqZYgb32SvXxKJUmuU1kRnAFVqj3qD8etL7kcvHTDZW5gVxTQd/KKd4o=
X-Gm-Gg: AYBFou2oJ7oqKgGG78QyN7++FSJeZ3thFRvTF8yHERQOoSRH1BIlU9XMhCW/aCWrdIK
	azM/bC7aKkU0++qOfVgKuIhnAlR0ZIe0VC0hEA/9v2WHDReb2JL15+nqW2kHn2RNohLtILXN2xM
	/wn+VJ9qdW4ry6sGZb+Y01WNJ/pgd/YkqtOzDNe53iiGFz4GCNxgoRJX/+HpOJbNeDvKK3HXzFg
	sqGTJHr3fkgda22E+morsOYOPp4Ob5Drkx4wyqVKe5mUzN1x0521M40qvaeapyA0ilFMVR0JqOk
	XN0lKjpTF9XPN9YWQRz36Ha++WEOgOy9R7imuZFDlCqNQPl9S8RiklQcgl6WnTMP7karbF5Iyy5
	j8oUw6Qj6FagWxEzhYg3ErQ4qnGm0+W8JbwPuL05SXquJFpcqtaY+aFACrLvtdmSq4MR4HSUpVl
	LuQBU4NoaUU0Tr3o5rREvXEk4FGuMyQ4KI2711YkBhG8mylZ+g42Ga5rs6j7dZ1e2PLbvWdRiIw
	eWsnvAsFJ2Liri1oB5TWT9ptFKR5WtwrB37olvNqi1P9s2CXngULaWXo2e+f4PIQJzlJw2y
X-Received: by 2002:a05:600c:a00c:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a18e4e0a3emr70727135e9.28.1791590526314;
        Fri, 09 Oct 2026 17:02:06 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a193f2c992sm20627345e9.5.2026.10.09.17.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 17:02:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 02:02:04 +0200
Message-Id: <DM0PU4S33ZKY.3RX5ANQYUOJ0V@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 5/6] expat: patch CVE-2026-102633
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261006193638.2018393-1-peter.marko@siemens.com>
 <20261006193638.2018393-5-peter.marko@siemens.com>
In-Reply-To: <20261006193638.2018393-5-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247486

On Tue Oct 6, 2026 at 9:36 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-102633
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../expat/expat/CVE-2026-102633.patch         | 68 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-102633.patch b/meta/r=
ecipes-core/expat/expat/CVE-2026-102633.patch
> new file mode 100644
> index 0000000000..1785120126
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
> @@ -0,0 +1,68 @@
> +From 69edbec09f2cd3e0bd6e0a093b55ea38af902d7d Mon Sep 17 00:00:00 2001
> +From: Filippo Tedeschi <filippotedeschi98@gmail.com>
> +Date: Thu, 24 Sep 2026 21:14:23 +0200
> +Subject: [PATCH] lib|tests: Replace assert with runtime overflow check i=
n
> + expat_realloc
> +
> +In expat_realloc, the size passed to realloc_fcn is calculated as
> +sizeof(size_t) + EXPAT_MALLOC_PADDING + size. Previously, expat_realloc
> +relied on an assertion:
> +assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >=3D size);
> +under the assumption that preceding accounting checks and parser
> +invariants preclude reaching an overflow state in practice.
> +
> +However, in release builds compiled with NDEBUG, assertions are
> +compiled out. Replace the assert with an explicit runtime check:
> +if (size > SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING) {
> +  return NULL;
> +}
> +immediately preceding the addition, ensuring consistent defensive
> +behavior across all build configurations.
> +
> +Also extend test_alloc_tracker_size_recorded in alloc_tests.c to
> +exercise SIZE_MAX and SIZE_MAX / 2 with expat_realloc, verifying
> +that the allocation fails and the recorded size remains unchanged.
> +
> +Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
> +
> +CVE: CVE-2026-102633
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/6=
9edbec09f2cd3e0bd6e0a093b55ea38af902d7d]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + lib/xmlparse.c      | 7 ++++---
> + tests/alloc_tests.c | 4 ++++
> + 2 files changed, 8 insertions(+), 3 deletions(-)

Hello,

I beleive this one is needed on blacksail as well.
Can you send it?

Thanks!
--=20
Yoann Congal
Smile ECS


