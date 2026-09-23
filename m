Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DE9C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:47 +0000 (UTC)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.415.1790176960021870465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 08:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ELSHrbLv;
 spf=pass (domain: gmail.com, ip: 74.125.229.205, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so1057476e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 08:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176958; cv=none;
        d=google.com; s=arc-20260327;
        b=Qvjgb1mADKdHL734pkYR/zholMEzhk6jt1vDJqPQeMYMkI6cKXRMfk+QM6xzEZarQ3
         LCCcsRXgiRNRONp53kemGm5BIPv3Ov+HeI/Zq+f0j2JZJZtcPzKhH/uWoB9lUa2eQ5ie
         owq5YyF6UcwiEb14zmiyRZW41SwGW3xLxs4iNdZleOpWBXqlIeqsL2JUpmd0Oj/L+yvE
         AroMn356V0wBd+X73+HI0XT5VNSUEf58hxB9TU6DeKG5u42j4iuV7Z1pRPVhj4IESJag
         jQFEc958uLMeStVtLskSODzPs7QMjTETXc3gIh5qsXVwkMNHHnZNd0BTrT3RFtP8kj3t
         MjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYggwEXoCHk7URFJHqFa0rUDLs1tvVW4QmuMFz7yr74=;
        fh=BfsWvjZvgXaStClBpDNu35+4JHSxlBx4uH6yv+xp1+s=;
        b=EmLBlqMcOlvCe+0sThQEQHjnxXIPDkXS7t1RTUe4bXE1e7gW0nEYcakto99aztIa1N
         kvuyyiosd+VxEJf6W62j/SiDs9h1tvHoFQJQXoCAGpRpGGrOE/7sE+vOjewgPosVarLk
         Xau6CnArkQ6njWJQ7Z8dGL+WIQJN4m8LB1GdbpqSqH2x+4sBkgsulONGPu1D0dHBlq05
         mgfEdMVK4BuKRIIlJ+prwD/bi2Scvl7UiUyuUMFGWqBb8wi4R7ONvg36WtFedCqOYoD/
         I6r7F7w7jrSihiA3X7aqk36tp/ReyRfuGd+NfS/+3Vummrraz1Gee8HpJ3is67WgfpY2
         L80Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176958; x=1790781758; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYggwEXoCHk7URFJHqFa0rUDLs1tvVW4QmuMFz7yr74=;
        b=ELSHrbLvrizC5yVu7wZqbvRmDA1qc/SNI6TxAA0Qgm9spnVZBc7h4T7XWtWuQz71Be
         cYZhWG66/7M+tUhy/XRhZt262fPcvmmygSlpLjabNxgsGSQ8j+svNJofHHtZ0vTH8q+E
         kbeWr1h9N1emPR3MsiVyc02PFwKVXENuS0lUHBEGhf+/AFnTC/CmA+owIX4nkJ+YDtF6
         7idAdulWlQ1dqg1TBAXP4KirxfV7sQ90SXU7HaFnUNqGsaoMiAPBUBUYhpll/X5892GE
         trsntrKZAvyps9IXApv10csqwmQugALm0KWoclrswwHLcIVeKpDqHDqYSMDs1ZzXTbWm
         gO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176958; x=1790781758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYggwEXoCHk7URFJHqFa0rUDLs1tvVW4QmuMFz7yr74=;
        b=URYwzsdQdV7v8f0FuXr3SYa36vsU5LUU1buMh7KC7N5NPkbNh0W0Q6EKKW+Dw8nKY9
         maDsjDzlD5YpIzC06Z/8lPS/vi1Xq12DL71JArxmLYAPx8PX2hNRk03s/K4906McHGFC
         +BtQCpBkFEDygdOsEDURq6M8GOg8j8UYuHqpngNNULL85jP60saP/JNARS37c9BK4b6+
         E55CtYqWslVDRbS3fs0sKUgJXha1WifO/mBsMVlZcBFdvhLS0LVXwDhyzzyo+a/SaCfK
         XbQxNN5esrxCjM9nhG5J6eiRsrSvRh3g2Fjjf8YANRrGIDts1nSFuiLKbDae5IGrDxxl
         8Mzw==
X-Gm-Message-State: AFuF++kW0eRoNOKmTbhNyUOS7NzaCcBaOcd84DGVw6Fwaa/Vl6oZRgTU
	V7e7NOtvOfSgVxANZjPM3nMZc9qVoGBbcfUpNCTBC4TS0Jlm3jJFctFCY0NcLxJ1Ud+GMNMk0Tr
	OhWx9MO/YLHHtvjjqr63syGUbxTbfhpg=
X-Gm-Gg: AYBFou1jItYtgGelvpGocvALkiC0R5DRsL4OACB6s9H18SdRdv00vkijD8u4CXsUqbx
	JCpMLHP4RekrYALKcB+MWvcYgGJ6pEphT7/6DnRuCU8muU12UyxMTAFyjv0WM4qBG9p6gFJ5gBn
	41zdT1NqPWBLC2xFTBPcCj/gnNBAlVfz6yODUOp3Uf5IND8YV71nLrr0OlJWyQaQavvSHJIETza
	qUwoE4eVOgmi/NzssF0U3IVT03RsCSPUTgp0IiUvXFoorhAmXpHk3ZfNCyOSe2ob4Tj4Xr0J7Nt
	cP1Nj02YSE8u7bSHMJMoT1KcOXcWS4jmWVyQODosdcmacejRZjht9QyOQ/Nm03K1Mc0/1UbzA18
	OgJczHTeh1cKnZ/JwXvckEbVFjhqQ+k5SKEZd
X-Received: by 2002:a05:6512:b96:b0:5b8:bc5e:d10e with SMTP id
 2adb3069b0e04-5b8d89c455emr1154532e87.56.1790176957593; Wed, 23 Sep 2026
 08:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790154074.git.yoann.congal@smile.fr> <8305fd4d8e6e4a7a4435989c57fedd470306f0e6.1790154074.git.yoann.congal@smile.fr>
In-Reply-To: <8305fd4d8e6e4a7a4435989c57fedd470306f0e6.1790154074.git.yoann.congal@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 Sep 2026 17:22:23 +0200
X-Gm-Features: AclHuK-YKe7kpVqq4xg4zrA2S_lro-bWZS1Mj2aRofWMgfcwzBAIfnE7F2o0xCk
Message-ID: <CA+chaQdq4NaDUJN7Zuxnmdv6EH0=z2Ru6HEXqTqk3jR0ei0W9g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 46/48] curl: Security Fix for CVE-2026-18924
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 15:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246530

This breaks the build when nthttp2 PACKAGECONFIG is enabled, because
curl_share.h included here was renamed from share.h in newer curl
8.22:
https://github.com/curl/curl/commit/3887069c661b40e76b053a4867eb565d4761ab3=
e
8.7.1 version in scarthgap fails with:
curl-8.7.1/lib/http2.c:50:10: fatal error: 'curl_share.h' file not found

Using share.h instead of curl_share.h fixes the include, but then it fails =
with
curl-8.7.1/lib/http2.c:781:15: error: call to undeclared function
'Curl_share_easy_link'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]

Curl_share_easy_link was added in 8.20 with:
https://github.com/curl/curl/commit/82009c4220774417c821496affa4aa834c028b6=
8
and that will be a bit more difficult to backport.

Please drop this one from the PR until it's resolved.

Cheers,

On Wed, Sep 23, 2026 at 11:12=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> [1] https://curl.se/docs/CVE-2026-18924.html
> [2] https://security-tracker.debian.org/tracker/CVE-2026-18924
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-18924.patch
> new file mode 100644
> index 00000000000..28934ababee
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
> @@ -0,0 +1,39 @@
> +From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 5 Aug 2026 10:02:53 +0200
> +Subject: [PATCH] http2: make server push transfers inherit share from pa=
rent
> +
> +Reported-by: Stephan Zeisberg
> +Closes #22488
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff04=
44cbdff368bda5d26d6405a0bb6ee43]
> +CVE: CVE-2026-18924
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + lib/http2.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/http2.c b/lib/http2.c
> +index 99d7f3b..e6305c9 100644
> +--- a/lib/http2.c
> ++++ b/lib/http2.c
> +@@ -47,6 +47,7 @@
> + #include "transfer.h"
> + #include "dynbuf.h"
> + #include "headers.h"
> ++#include "curl_share.h"
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> + #include "curl_memory.h"
> +@@ -776,6 +777,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cf=
ilter *cf,
> +       second->req.p.http =3D http;
> +       http2_data_setup(cf, second, &second_stream);
> +       second->state.priority.weight =3D data->state.priority.weight;
> ++      if(data->share)
> ++        (void)Curl_share_easy_link(second, data->share);
> +     }
> +   }
> +   return second;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 3f44cf02d31..905d0b47335 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D " \
>      file://CVE-2026-6253.patch \
>      file://CVE-2026-4873.patch \
>      file://CVE-2026-13608.patch \
> +    file://CVE-2026-18924.patch \
>  "
>
>  SRC_URI:append:class-nativesdk =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246508): https://lists.openembedded.org/g/openembedde=
d-core/message/246508
> Mute This Topic: https://lists.openembedded.org/mt/121389781/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

