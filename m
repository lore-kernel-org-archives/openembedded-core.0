Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB606C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 12:58:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28934.1788181081819618473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 05:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CJSyi8r6;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2011399f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788181080; x=1788785880; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGdOUYazsPQYUDJ1K6n6JpIpBD6ESrcG5cYrYikTVQw=;
        b=CJSyi8r63yG5C1NdOvv4tTT1v3GGab+Rd9y42eHdtnSltXjM9tLrLMiRX8cFlUbOUW
         CyZ9h5btHK3W7Orq26FYaOv4toFnfB87rJhLhB0DA+9FrQ8ayvcjuvN+eRt6tzUqgG9K
         iTfpof4VXxVjqQ3qIxJxiDY/lEkbgT16dqeyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181080; x=1788785880;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGdOUYazsPQYUDJ1K6n6JpIpBD6ESrcG5cYrYikTVQw=;
        b=CmQYmuWJMWa2OY355XGGDmjs2cVZk2aUBodRa/y+LgiMnz+fsi+5R34NLLRB7/riM8
         DHnLnpJbJkf2gR8o2WryRpvW/u1I5jaFD8au3IXXpKYQReAciTaSv11JhE2XK3IlqUg9
         LXpOEZs3KYnKvRcjtcP3osB6emNChmbFfiZOvymRhMyqA7VeehJuMpvBg2f6a9dKlj2j
         AUcRWsZjKN7/jskaHDyAJQediSzKy0rWnaiBhT3BlUNwL30uMq+06T1Z8yPXgRWPksnU
         pHNyfvkWZXXzycWSl18klXJCnh2PYlviMH/i57qYSorRKVt9WvgLfrXJRLgQTfNTLYwe
         P9sA==
X-Forwarded-Encrypted: i=1; AKwUvByYMWkTQkrjbfBBBbN9EnQ463/x5R5CvKtnZqFqm555hvMRhkE34GBGdeD2VC9YGCMbgH9vr7cenR2l56ZapdhTRg==@lists.openembedded.org
X-Gm-Message-State: AFuF++k09bKQ7KPlITR7uHZmojWnJZQg7awl3lBpl834pPbkZG4ujq4m
	qRM1ddi0146HcI20A5u2zrxwsLQryJXmTX3Gi6JnAReX3SmHYTK4H2uuptiPYgzgE+0=
X-Gm-Gg: AYBFou11oOdqA0xKjkMPUsi+AAxRC5CnmJXDVzgOViB2nQ3sxVv84yjF+Lh1oaoe1YH
	xyuq/LeVVmRM/2h4LKGt8ZWkoNJG33bIgP5vpUVNVyhC8nprTHFOGvJChdjej1HM01SFwcH1odx
	4HnxxqJq4zQqPvo7mDI8b3PZ46K6dx4Re+gnK5TB3sGYkSW/6Qe6X3AQx+qO9TivUsWRVMqE8D2
	TNyBrYVJIoPreIb8TweX9289zKAOUhAPDE19ltIp3Bo6KSvlmqUVTUSEmNaAmqOCuKGJjpwVxt6
	R8yaxCp1YwmGJvPp3RaDZzekfHSo1PWSZBrJyTrs2PpvsBiWcpguUCsNR8He4/1gnRWK/lW+mNt
	AiCxMpWXNk2mibcP2rPFwjekm6O9M5HFAQBJ8uM22LLkstHnEqzm4kT7KePenEoR7ao1+r1EDAQ
	EskRoERjwRI2siXqLJVtbEm+84ArS6sTGy6cs8IqxK+ZaqMfMwwye/0Nl6AcV5AJpJpV91/qd4X
	/rE8gi2TEDuuFEJD+TATf/EgtKpLWtqF0JtsNrC1qpNzBzc
X-Received: by 2002:a5d:6e58:0:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-4844101e5cfmr808986f8f.20.1788181080052;
        Mon, 31 Aug 2026 05:58:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48432022ab8sm15772702f8f.28.2026.08.31.05.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:57:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 14:57:59 +0200
Message-Id: <DL35AF739W0S.3GWC5WP3828OB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-15308
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260723134304.2505230-1-deeratho@cisco.com>
In-Reply-To: <20260723134304.2505230-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 12:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244763

On Thu Jul 23, 2026 at 3:43 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Backport the upstream CPython fix for CVE-2026-15308 to Python
> 3.12.13. The issue is a CPU denial of service in incremental
> html.parser.HTMLParser parsing, where repeated feed() calls with
> unterminated markup could repeatedly rescan and concatenate a growing
> buffer.
>
> The embedded patch is based on the Python 3.13 backport in [1]. The
> public CVE advisory is referenced in [2]. Scarthgap-specific source
> differences are recorded under Backport Changes in the embedded patch
> header.
>
> [1] https://github.com/python/cpython/commit/7933f4bf7131aa4140750f9404f5=
de0aa2969ced
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |   1 +
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.p=
atch

Hello,

I plan to replace this patch by the 3.12.14 upgrade I received in the
meantime:
https://github.com/python/cpython/commit/785df8f743800661961528970f8598edcd=
291c14
https://patchwork.yoctoproject.org/project/oe-core/patch/20260822172544.192=
7400-1-peter.marko@siemens.com/

Regards,
--=20
Yoann Congal
Smile ECS


