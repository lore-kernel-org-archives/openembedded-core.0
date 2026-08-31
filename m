Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35071C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:12:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25688.1788167565913869425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o40WwlfG;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1432925f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788167564; x=1788772364; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aA+ytBaLYJ/+MGFYVuvMTSfaUNxcE9FCV6A9c5b+UDQ=;
        b=o40WwlfGsQ6U4AKPI1bk02zCOKFp4LByG5GvyPZpq9mGJYmUSBRRUvQ9hKVcECknCx
         cOHj92PWEWmQqBm32coUgUDp+Yuo/87eUB7uo47JxoYoNpn9Q0gRU0UZ3zRgBIO1Qz68
         kh0bm2/6anPfa/TJmEf7wRSHr/hJXlEsqXVVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167564; x=1788772364;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aA+ytBaLYJ/+MGFYVuvMTSfaUNxcE9FCV6A9c5b+UDQ=;
        b=h0WhsP7ohnvBdLgQVuaISlyZ5jZXCmUiSXcaUdDHWMTvNjgOLJ3kasvaAllepMDAez
         HHcbi+ohf62a7z+vGFsDJCPtUrN+UsULXk4kqSKKKo4jwvk4UqSNvVFyrkHYL2g243bj
         w3GGSENAh82ddZgJO+hG8bXUtWQAZvhW26Csv361HQdZn5dllLesJfbeZzMABopjfPyW
         7LQ7nMEnLwRsIvtwQunC1H4bIIASPMs3TCGPlO3WLnO0l6ohumBrOvLsfY5tZpta8UR7
         mggLoOH2RHDx/o1wm7GIC4P4yYJOm6fVY29gjJn24MBTjlM+RKU1teEjgEot0+BqZ6U+
         i7cA==
X-Forwarded-Encrypted: i=1; AKwUvBw46Urs1mxp3GAx7myxQHlWNXzxD6H+9g35McGc92LbyjETdBRJYk/lQiZGWz7lIajOiGjQ9J4c+lg9q5Ui/6v2+g==@lists.openembedded.org
X-Gm-Message-State: AFuF++lQtggmOrHRMD9DKHPHEzD3gqKWhgirRrOOLNQBaNrylpq++QNF
	+j1wi6fkRgowoM8N5TIK3gy+SMbzG+TH8zDj6GrHIoTExeOTonYwU/BpBUd+P9XO58g=
X-Gm-Gg: AYBFou1UYUfi+CRrXdD8HSOjd0nrAkC+q8qAkcFLur5u6kiWi7624Aaqo77PjWa0MiT
	7dTia8XKHoIFmzI8kYxs/cp9P8uT8T2SWcN0AXff8fUmkBuO5I5bVEvxO6Zj6IUpTALX29fyamq
	PRinm+pH9ScMVBVIkNUcc/Fdx7u2s+nVQNgxdznmsb4cb17I99XxnCmDr0ZGBMk+gLt3joARIML
	+RrSGhwvbovr4Rimsvvb/9GYujWA7Ha8mL/JBmmqRGimEpPqQF8Oe3kvrfUfGCWiUQOakpVH/J9
	GuzHsp4ysBvdBpoZ6n+Mqe67iPh7gcCOJVXewWnw1vFRJBU6+eIJw4ZCD0iMu7x3wuRwCCRtzJ8
	1y718zUm6bpaEkeRD0W82rf85s/rjv91GEF5G8WexIXxMtloThHUu/GESTU5Rpv2ZiJdCXNLBJR
	xm2ItNLXiob7NM0Ardp1/Oq+CISnosNOms7A6gBSIJdKFuWWH9mUlIQu8f9EgDx5XlPKoIQzNXJ
	01CEL0JbwElejct3R5iS2Uz1v8+TJOdKuxzpxKTKJGLADIA
X-Received: by 2002:a5d:5f49:0:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-483ca4a5654mr22434375f8f.18.1788167563704;
        Mon, 31 Aug 2026 02:12:43 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm22489611f8f.8.2026.08.31.02.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:12:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:12:42 +0200
Message-Id: <DL30HXPDJQL3.3LPAQ8V1DUDRD@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-mako: Fix CVE-2026-41205
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260819111509.53180-1-hthakar@cisco.com>
In-Reply-To: <20260819111509.53180-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244754

On Wed Aug 19, 2026 at 1:15 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using
> the commit shown in [1].
>
> The backport makes Template URI normalization strip all leading
> slashes, preventing a double-slash URI from bypassing the path
> traversal check while keeping Mako at version 1.3.2.
>
> [1] https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd7=
2dc48328719a3
> [2] https://github.com/advisories/GHSA-v92g-xgxw-vvmm
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../python/python3-mako/CVE-2026-41205.patch  | 110 ++++++++++++++++++
>  .../python/python3-mako_1.3.2.bb              |   2 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2026-41=
205.patch

Hello,

As fas as I can tell, a fix for this CVE is also needed on wrynose.

I can't merge here until this is fixed there.

Can you send a patch to fix this and then, ping back here?

Thanks!
--=20
Yoann Congal
Smile ECS


