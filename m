Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D879C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 18:27:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.42130.1656700053372562868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 11:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jQvy8tPA;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id cf14so3931643edb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+/oTbGrvy9CZDAOT4+uNkJw+ZJmMMrapRdesYIRAAY=;
        b=jQvy8tPAJL+FnSlCgsh5Mbos7yXnqTNl6i85X3R+JNg5WjER5rJQqIPOGu7DSWbdDY
         9dvz5h2uAa5ws28UK6XKFwB4GKhpP0nUsH7q+BqpuzZuG3FepP3kbM4dK/FvWfNmqlM5
         6ecvmnZexAuEUB9zn08rQFNe90ozKjZFmuV/Y3K1XQuzf59k5N/QENgbyeRJEj0NFMFA
         9c2RQsJLfj4gJBfVSr10NoBFbNJgNvJvFQzee1MZ5uAkXcUsIKS2HCtXKpg0YiqRMB+w
         Hh34YLzf8qEowSmr02bPxaT7GjnhB9sYEfWxgOVrsndes1suinMbCNPn+AMDUzDEOMgP
         Jcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+/oTbGrvy9CZDAOT4+uNkJw+ZJmMMrapRdesYIRAAY=;
        b=hrsL8LV0e2iGWdVcjEBZxF5qatwPpb4xBhsxrACzSt+qZAjHR8QTqf4G0I/ToVsgcU
         Ly5tOuIbsYFKzbglusO27VtiNzMR0H4aI0dUN4JWc2kp4R5a+soqNCdqz40mG4Gy4oJ/
         pP4LjnvtU3nSO9CGug/+7iQ2oPP+pdFbApBkqPwXhg9mzv/WnopVozfx2Qdz8n8hItJ1
         5aie9do8orgSL4PZD8w6FdGk3Pc2LoY8tzWX/4vH1jMWbiBYBPT1mjK02zMrXb8UyPQv
         rs/w0DsLQODWievVRmvnMUgPayTCvB94G1wrFIAmEZGgUGBFFKR4eqWyMYWgwzPl0+nQ
         xOPA==
X-Gm-Message-State: AJIora9HcVRp94Ew+vq4PEk5jyUHC3SuV9Gf/heCMFUdAEjULmkyjcP5
	uD60GcZO5pUFoFoe90MlCFOHJcO9do3yIn1HffTFYQ==
X-Google-Smtp-Source: 
 AGRyM1tWnXE2+Cp6q975rzO76GhujlLdbk+602v1BqDiRigugbHWkwkJUdxTy3kxVoQKSepUPjtKLU98NtM++lQZ4wA=
X-Received: by 2002:a05:6402:698:b0:435:75d9:f94c with SMTP id
 f24-20020a056402069800b0043575d9f94cmr21322310edy.330.1656700051530; Fri, 01
 Jul 2022 11:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220701161205.112341-1-jose.quaresma@foundries.io>
In-Reply-To: <20220701161205.112341-1-jose.quaresma@foundries.io>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 1 Jul 2022 08:27:20 -1000
Message-ID: 
 <CAOSpxdbq+CJE-k7dn1wBnd9ay-wD7-FdxMyMS5SXQVy=afdQCQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] curl: backport openssl fix CN check
 error code
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io,
	daiane.angolini@foundries.io, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 18:27:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167539

On Fri, Jul 1, 2022 at 6:12 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Fix out of memory [1]
>
> OpenSSL host verification + hostname in certificate CN only seems broken in 7.82.0
>
> [1] https://github.com/curl/curl/issues/8559
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...0001-openssl-fix-CN-check-error-code.patch | 38 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
>
> diff --git a/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch b/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
> new file mode 100644
> index 0000000000..c5aa8f2d60
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
> @@ -0,0 +1,38 @@
> +From 0677924c6ec7e0d68964553fb760f6d407242c54 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 8 Mar 2022 13:38:13 +0100
> +Subject: [PATCH] openssl: fix CN check error code
> +
> +Due to a missing 'else' this returns error too easily.
> +
> +Regressed in: d15692ebb
> +
> +Reported-by: Kristoffer Gleditsch
> +Fixes #8559
> +Closes #8560
> +
> +Upstream-Status: Backported [https://github.com/curl/curl/commit/911714d617c106ed5d553bf003e34ec94ab6a136]

Should be Backport, not Backported!  The latter will get you an error:

ERROR: curl-7.82.0-r0 do_patch: Malformed Upstream-Status in patch

No need to re-submit, I've fixed it!

Steve

> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +
> +---
> + lib/vtls/openssl.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
> +index 616a510..1bafe96 100644
> +--- a/lib/vtls/openssl.c
> ++++ b/lib/vtls/openssl.c
> +@@ -1808,7 +1808,8 @@ CURLcode Curl_ossl_verifyhost(struct Curl_easy *data, struct connectdata *conn,
> +               memcpy(peer_CN, ASN1_STRING_get0_data(tmp), peerlen);
> +               peer_CN[peerlen] = '\0';
> +             }
> +-            result = CURLE_OUT_OF_MEMORY;
> ++            else
> ++              result = CURLE_OUT_OF_MEMORY;
> +           }
> +         }
> +         else /* not a UTF8 name */
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
> index ba3fd11820..d5dfe62a39 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -23,6 +23,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2022-27779.patch \
>             file://CVE-2022-27782-1.patch \
>             file://CVE-2022-27782-2.patch \
> +           file://0001-openssl-fix-CN-check-error-code.patch \
>             "
>  SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
>
> --
> 2.37.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167535): https://lists.openembedded.org/g/openembedded-core/message/167535
> Mute This Topic: https://lists.openembedded.org/mt/92113235/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

