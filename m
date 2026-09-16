Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0412C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:17:17 +0000 (UTC)
Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com [74.125.225.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13533.1789561032815597787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mXNetqaR;
 spf=pass (domain: smile.fr, ip: 74.125.225.77, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f13.google.com with SMTP id ffacd0b85a97d-4843378fb37so323294f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789561031; x=1790165831; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Bn2FvlXBNZH31PVniJ+clvxyOG8Rgy+/a3/SXx19ps=;
        b=mXNetqaRyWUYUD0y5cG2fs45FEPaMou/Z7vUrrIzmo9agU/U+3hOGR4z8LL7TBgVYz
         7fYhZP8QTDK2yckuNjd30L9ToAU/epB5OQhRLi6pshcS1SiPO+ABhenfnkLmM/26OgI7
         Wf/gXM1C1PiRbBw5mHFDt0kjQMiwffxQgpN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561031; x=1790165831;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Bn2FvlXBNZH31PVniJ+clvxyOG8Rgy+/a3/SXx19ps=;
        b=DyC5V+njlHXuVnD2AZMJZkfqanUmrXAs9pkV8ZkCdFjV1rAAw/bWdR8s5oncygw5o4
         O5Y5mJ1pfmiOwavS/7wsHB2QEc22EjCwCvVgWGHdqHEPZi7E29o12s3zIDCyUoNlPaAH
         Vx090G5OhVtn2FsPtTHA/ZiqlQPO1wKeybY8HtB1gat5LOeUtL1Xr+fot2OAXDtfQy9J
         J7Jc8pODQche2adCPpmpmdY/zxiUQ04bX94kvwrbee6/hceApZwqfdp6INP09foxWOXB
         dbgKzitOnpsxr0YWFFaRt0pMA2G1FljzC+5OEr6Vk3eTfoxrkukyqs7Q91VYSrVZX9d0
         /uWw==
X-Forwarded-Encrypted: i=1; AKwUvBzW0bmmRvJlPcfGs0DE7xkowO9LvRHZEI6/TYcD4Rs78Xq7ph1DYHUMd8SIFC++AnfzUqH9bljgpWbga5KqrKKgHA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kt8qgX3orY0bKENPqBvs6KoKbeCwTLBOZv2DEmyqaof/OQJCUL
	jldFDPnLJPESP18o9+Up8wMwHCPKgK6loPzwMdQTwsC1w1UFvPKzHEU08ZnM274/pPg=
X-Gm-Gg: AYBFou2Y40vTPOzlBm/JHnix44TVQE6cj56m67ATAtCYx/RPddnJ9PbFM4oy7bueNEX
	7+bwjXOcQTDhlFdsqEByJQzq/M7GaPcCLmZaMPlBVRO28crE/hUjm5dH46Ni/08q7+VThnoH7/8
	+pwmD9kQpttPD0zzFO6xX8Bwyyra4V5NVv2BKLPn2y26XCDrpn04BXdWVXFXHV3rRf9Qubv0vR8
	6/7b+7n73hhgWJDZvJvnD5cmcDl9RVTOkljHvvxEjumerf0IRAcvvaG/AIiDS7JxHiBoxQrk+Bx
	axFqTBYSpEQpOCwA9PfGz8rPwkBVvhJzhNLaWFeZKj8w9PXByR/bUCuuvPJi9+PPgaXmFU58N09
	pYfkbB3+T3dpAN3JsshxO9sscI6HyYvB/YinWzG2a1IvMpWqlZ2wbOiySvvgEAvi6Q7xx8SWMXg
	nUeb0BJ5rJaA3HYVNlsNPZaCHaTNDYaD3DB/uvwGuCnpxMhmv2wOe6tNeio7lL4QS+HwokT6uAT
	/towJOUsN9KyRnAnXsHBrscolgf+/rAsnUMh52iqyJSIA2jUcUVfq2ws5k=
X-Received: by 2002:a05:6000:1a8c:b0:482:eadd:174a with SMTP id ffacd0b85a97d-4870cef1209mr3366996f8f.17.1789561030736;
        Wed, 16 Sep 2026 05:17:10 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43542sm6867926f8f.32.2026.09.16.05.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:17:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 14:17:10 +0200
Message-Id: <DLGQFVSIEIYJ.3FPJ3GOIMT0C4@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 4/6] curl: Security Fix for
 CVE-2026-80255
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260909203324.765094-1-sdoshi@mvista.com>
 <20260909203324.765094-4-sdoshi@mvista.com>
In-Reply-To: <20260909203324.765094-4-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245966

On Wed Sep 9, 2026 at 10:33 PM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> [1] https://curl.se/docs/CVE-2026-80255.html
> [2] https://security-tracker.debian.org/tracker/CVE-2026-80255
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../curl/curl/CVE-2026-80255.patch            | 106 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-80255.patch
> new file mode 100644
> index 0000000000..964193bcbd
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
> @@ -0,0 +1,106 @@
> +From 4f6aa41a0145e930e766775dbe860883d350aa0a Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 27 Aug 2026 08:33:30 +0200
> +Subject: [PATCH] cookie: improve TAB handling
> +
> +For entries with a leading tab. Verified in test 2885.
> +
> +Reported-by: Stanislav Fort
> +Closes #22699
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/4f6aa41a0=
145e930e766775dbe860883d350aa0a]
> +CVE: CVE-2026-80255
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + lib/cookie.c           |  2 +-
> + tests/data/Makefile.am |  1 +
> + tests/data/test2885    | 52 ++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 54 insertions(+), 1 deletion(-)
> + create mode 100644 tests/data/test2885

Hello,

I believe this patch is responsible for ptests failures:
  qemux86-64-ptest debian12-vk-8 wrynose completed at 2026-09-14 22:47:23+0=
0:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4557
  qemuarm64-ptest ubuntu2404-vk-arm2 wrynose completed at 2026-09-14 23:24:=
50+00:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4530
  qemuriscv64-ptest alma9-vk-2 wrynose completed at 2026-09-15 00:01:40+00:=
00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/56/builds/2408
  qemuarm64-musl-ptest stream10-vk-arm1 wrynose completed at 2026-09-14 22:=
49:53+00:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/builds/1202
  qemux86-64-musl-ptest fedora43-vk-2 wrynose completed at 2026-09-14 22:48=
:49+00:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/110/builds/1185

Failed ptests:
{'curl': ['1105_-_HTTP_with_cookie_parser_and_header_recording_-_output']}

I could reproduce this locally with=20
bitbake core-image-ptest-curl && bitbake core-image-ptest-curl -c testimage

Can you look into this?

In the meantime, I'll keep 1-3,5-6/6 in my branch.

Regards,
--=20
Yoann Congal
Smile ECS


