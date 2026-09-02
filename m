Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAF0C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:27:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11262.1788352047594761546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jEx6Bw99;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so9888875e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788352046; x=1788956846; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoLfKGPE6Yxxh5X3+98ahqpBU2Gxrwbjif2BLN1yz2U=;
        b=jEx6Bw99FhLupKj1kmzKtC5B4m9LPURrIjdyaGXWD8UzWOKD+5WX7Nsm/a0DHeI2qV
         i7GMLUt58z8IqJb2K35jCvt9rJMmpbajDc1oz2aX5kgmyEoxrVxltGDl3+NN80tyrIiA
         Y+ib1vQxBpw3wYxq7NdrJV5dqMsC3g0j5yEvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352046; x=1788956846;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoLfKGPE6Yxxh5X3+98ahqpBU2Gxrwbjif2BLN1yz2U=;
        b=odCFOKqem/ywRlvRq5i+c6KpRlMFmn3frtdnDdhTxDozM7IBrldJs1k2rOiaSn2aU8
         sdrGNlglC5HgD9OMiu4z8j7ZtbxttKPNF7USEqFpG2O5S3ypZH9BCESIN6jQXX9NgQrj
         rSmNd2GcGY8eSmKTWBeY7JouGEsFUe/NMPrL7CJXnT9PQHnAOxsmx8PZBQ/omaq1iSFJ
         R/gG/n5pJgMOvhxb6AgwznXN1GEsfVRwl+9X5FJUO7NYX0L/F0hIPTusUGUohO4lUU18
         fQhknuDi9lfnmOc2Kcecfsl8wzx0FhNlPKSekK0dQu2TG5rWSit6qIybpwTcheIJAKow
         363A==
X-Forwarded-Encrypted: i=1; AHgh+Rqbacb30XALUScsFAkpKovoeOteIeG2DQGxoxgrkDNpOGGC6See2rhV+Xmg9lxW8RZqWg5Y7zg7CN+FkzBq7LStvA==@lists.openembedded.org
X-Gm-Message-State: AFuF++k9VKA2ylizeS21TS/TINEaPpd6esDjHIhc3Z+urmV7X8i+we3c
	vjDT/LyVnxcbl0nv/sDX4rKpwUkYhGAJ0J8+wH83cZ3yIv+S/hKGI08DDNPaxu8MiWtbx4oW0NE
	ateF4cV0=
X-Gm-Gg: AR+sD12bVXUXFy485s+SKO7qS3lYGeuothKqsPwZI+4d0i58l/acyGlbz7iE9avVC3O
	BJ3mkQYnWHvfXxnZVmwzqr5K3HWgZNGhFkupdfdCiw2NuUyDVdLCCH8Y6dtqDcqlbDthMlQyook
	/aHIWJ0+db1d+04zRv/Ak3yD5lQbpacmFXavL6ilch5/nm65G/J9hcDr8SUxQtCZ2AFh1eCT9uD
	KA7eGCSI0BYgtfm0yTbCbu3DTdaxo9kQUbq5xkT6b2oE/LXuVB04DU9tDPFfzUgxNfvuoaSzixV
	/VO30nc7SF0vqALZd5Zht5CfddtL513RucdimdBh0nRGf+Uxa4wtnldJZPpruf/NUMi3f3rUNLR
	gfBzjk6JYPOfBPGJc9zFohWDbqTfKTVamJd0TZfFBSRZFmJupXo1uLzb06MAcMCHTx1BHzsExSV
	n5yrQrielDdg0fjoZewweRgy8izBkh+he1tPtlHsOHaBawpJ6JI7jegy/y44qHB5ZNrFFpFMBJt
	ontjc6e7qh66xh0Eboa33BL8zxylEf6gZpToONY/JqGuUyo
X-Received: by 2002:a05:600c:8012:b0:49a:252d:52f5 with SMTP id 5b1f17b1804b1-49ce583d99bmr89124765e9.11.1788352045788;
        Wed, 02 Sep 2026 05:27:25 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce164bcsm141253195e9.7.2026.09.02.05.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:27:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 14:27:25 +0200
Message-Id: <DL4TW3TEQW7H.12E8VXJ763YYG@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-lxml: fix CVE-2026-41066
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260819055403.4036170-1-dkelaiya@cisco.com>
In-Reply-To: <20260819055403.4036170-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244943

On Wed Aug 19, 2026 at 7:54 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e=
9aaf358
> [2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/python3-lxml/CVE-2026-41066.patch  | 4613 +++++++++++++++++
>  .../python/python3-lxml_5.0.2.bb              |    4 +-
>  2 files changed, 4616 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41=
066.patch
>
> diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.pat=
ch b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
> new file mode 100644
> index 0000000000..9c333d7ef7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
> @@ -0,0 +1,4613 @@
> +From 4fe0735416504223919151aa43c8ccba4626597f Mon Sep 17 00:00:00 2001
> +From: Stefan Behnel <stefan_ml@behnel.de>
> +Date: Fri, 10 Apr 2026 10:13:03 +0200
> +Subject: [PATCH] LP#2146291: Set "resolve_entities=3D'internal'" as defa=
ult for
> + all parser subclasses.
> +
> +CVE: CVE-2026-41066
> +Upstream-Status: Backport [https://github.com/lxml/lxml/commit/ab431ea0b=
9a7357d968f1d1c5c614649e9aaf358]
> +
> +Backport Changes:
> +- Keep the lxml 5.0.2 XMLParser signature without decompress.
> +- Regenerate etree.c because Scarthgap builds without Cython.
> +
> +(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + src/lxml/etree.c       | 1242 ++++++++++++++++++++--------------------
> + src/lxml/iterparse.pxi |    8 +-
> + src/lxml/parser.pxi    |    6 +-
> + 3 files changed, 629 insertions(+), 627 deletions(-)

Hello,

As I wrote in https://lore.kernel.org/all/20260819103604.107840-1-dkelaiya@=
cisco.com/:
> Also, if we go through with regenerating etree.c with cython. I'd
> appreciate:
> * some info about how it was done,
> * a little effort to decrease patch size (the scarthgap one had a lot of
>   meaningless line number changes): I'd accept a patch format change from
>   upstream if that results in a small etree.c patch.

Regards,
--=20
Yoann Congal
Smile ECS


