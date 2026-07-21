Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF3C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 06:42:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16904.1784616135083695114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 23:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s6z7rQJC;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1507613f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784616133; x=1785220933; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgO32/6kjRkLvb2+W13zTuBz6fhqRF+n94wP1Abnsrw=;
        b=s6z7rQJC6Zipn4+q6/bSBDP1dkleLHBMCQcO16oDHmGbELYkBUeBz+73kP/CP4KJ1f
         kNQAdELT0yUY19CQjKwnTDLZLN+VQ31Pry+GKTiykBpmZmjfCvoJH+ONPZrpmsVRHzhy
         plmrxQt/TyqvTxd12coMRnREMLjPjQJFABrv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616133; x=1785220933;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgO32/6kjRkLvb2+W13zTuBz6fhqRF+n94wP1Abnsrw=;
        b=m3lMvE5z9xBvk4vspb6r7eH+NIUXmF72xMPiuJbeIxwRS/cj6Q06N7YKquspsqXsKU
         nGPgi9ZXNqVRgnNy8B3pxXLEoCdrPsVj9fWHu9BY2VrBM9ICCt4pj0FgOout6D+zVUTO
         Fi2F/gAL4OLM0Pd1qhDFkU9Bk6EEkg4woleulds5pTAfGSEjqFvnFEuVFswRO4V0saaI
         o8MZsZZc/diFbGJth2eZIDRrV8FpivYZwOe28NgIvV4RKd7Eaaf07TrPjVAYEjFLxFwX
         wDPocGqcrYzm7iLZ51lN/dUWWEKHgNbDKdeAHzkWzHFdvJrfFzQ3gvjhZj1l4f8i22uh
         qS4g==
X-Forwarded-Encrypted: i=1; AHgh+RoG20M4K/HunmgHERWbGkADBRLYLGhxe9btnpEjMGY8j2rIYuDSLyrbrktjANfGlyLxrRLPBRyRcSwIvf80vBMo7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFgJ8sQNb9dBzIPKm5wE8mZKs3r+X7gWQ7gQVAcVFMFWLczIFG
	wO/x2bO4mo66CShUqwBB01oh25hUnmx/ppvUdOAndmwtA60S01HHGxPa3RVdjWXK7dQ=
X-Gm-Gg: AR+sD12DhpwfIzd3ybL61sM6WwO4wDDVurErikgTKw7zzLLLoXvW+Ebgg2Y82XO3pNf
	lUujccl7SocWtKG3w3stkd/B+1pRDC6YXj63DR8p9plnHe7UOGGpxaAJ9ul5NG2f8TAriQTrL0j
	o4QH5AnTK1I6C46hw3c4adU0cGfNI/VRRqqcoVG4nnbYuSsZRHuffqq9D0onc0/GCLvMFdrImip
	aJPFhQu8RByBbOkM1N7hS73R7mtMTXeWrakuxHNV1jCtvTPeOR9dpdFC8qk85grsVmaqLieOn5N
	b8gi0Rfo1gPKAlkN7y0sdPXTFuk/+14wz0fQAapT7WKupeXbB29CX9O97SaTGdOFM7DNfv56hdQ
	oJrMVWNASmcnefDEXX68Z0qoFZd2bqmcOdLkloFUvQWBJVTHk5Q80vpYHA5BkdKwcomfSdqSH5I
	G+l9vHIyszRvrFLjOwBjT3GMX+CvdoTogNPanb5XDzk/nAvUDT8/xP+msL6fYjaGFZ
X-Received: by 2002:a05:6000:480d:b0:47f:77dc:aaa2 with SMTP id ffacd0b85a97d-47f77dcac77mr9125269f8f.45.1784616133119;
        Mon, 20 Jul 2026 23:42:13 -0700 (PDT)
Received: from localhost (2a02-8440-2509-496a-d790-de00-baf5-e0f9.rev.sfr.net. [2a02:8440:2509:496a:d790:de00:baf5:e0f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm35233599f8f.37.2026.07.20.23.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 23:42:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 08:42:05 +0200
Message-Id: <DK41M9SEVODI.SQ2O8HYVEGSC@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2 5/5] curl: fix CVE-2026-7168
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <20260720113041.2479444-1-deeratho@cisco.com>
 <20260720113041.2479444-5-deeratho@cisco.com>
In-Reply-To: <20260720113041.2479444-5-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 06:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241506

On Mon Jul 20, 2026 at 1:30 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Backport the upstream fix [1] for proxy Digest state reuse across proxy
> switches described in [2] and tracked by [3].
>
> [1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c=
8594507
> [2] https://curl.se/docs/CVE-2026-7168.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-7168
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v1 to v2: Refresh the patches on top of the latest
> wrynose branch.
>  .../curl/curl/CVE-2026-7168.patch             | 373 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 374 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-7168.patch
> new file mode 100644
> index 0000000000..b848fbaf84
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> @@ -0,0 +1,373 @@
> +From c1cfdf59acbaf9504c4578d4cf56cdd7c8594507 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 27 Apr 2026 09:14:51 +0200
> +Subject: [PATCH] setopt: clear proxy auth properties when switching
> +
> +Verify with test 1588
> +
> +Closes #21453
> +
> +CVE: CVE-2026-7168
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59a=
cbaf9504c4578d4cf56cdd7c8594507]
> +
> +Backport Changes:
> +- Adapted setproxy() insertion and test-list placement to the curl 8.19.=
0 wrynose layout.
> +
> +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/setopt.c               |  14 +++-
> + lib/vauth/vauth.h          |   1 +
> + tests/data/Makefile.am     |   2 +-
> + tests/data/test1588        | 106 ++++++++++++++++++++++++++
> + tests/libtest/Makefile.inc |   2 +-
> + tests/libtest/lib1588.c    | 150 +++++++++++++++++++++++++++++++++++++
> + 6 files changed, 272 insertions(+), 3 deletions(-)
> + create mode 100644 tests/data/test1588
> + create mode 100644 tests/libtest/lib1588.c
> +
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 84f3e02..d12ffb6 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -49,6 +49,7 @@
> + #include "curlx/strdup.h"
> + #include "escape.h"
> + #include "bufref.h"
> ++#include "vauth/vauth.h"
> +
> + static CURLcode setopt_set_timeout_sec(timediff_t *ptimeout_ms, long se=
cs)
> + {
> +@@ -1664,6 +1665,17 @@ static CURLcode cookiefile(struct Curl_easy *data=
, const char *ptr)
> + #endif
> +
> + #ifndef CURL_DISABLE_PROXY
> ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
> ++{
> ++  if((data->set.str[STRING_PROXY] && proxy) &&
> ++     !strcmp(data->set.str[STRING_PROXY], proxy))
> ++    return CURLE_OK;

Upstream patch has comments in this function. Please keep them.
I already reviewed patches 1-4/5, so, could you send a v2 with the
comment preserved only for this patch?

In general, please review the output of the tool you use to create those
patches. On my side, I use a wrapper around interdiff:
https://linux.die.net/man/1/interdiff
Maybe you can add something similar into your workflow?

Thanks!
--=20
Yoann Congal
Smile ECS


