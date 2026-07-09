Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDC7C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:26:34 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4378.1783585593451736067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 01:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MvR8z5w1;
 spf=pass (domain: smile.fr, ip: 209.85.218.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15f020a223so17928766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783585592; x=1784190392; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCjkXsfhKStRX4BPezISZKAKofYYCMrLUNz4xHjk/dc=;
        b=MvR8z5w1ZAlZefKXdiUAZu1GT3leas7ih5uhXFEOqqyf/4ygg2qfI+GuxmOUaCSfTj
         e8zAnMyOBj1sO9AnCF8KFzdm/+tWWymiQTKQOaba2FjkoJq765NbpGzYrSazvKpZpP13
         V4VCCeqTYCyiLBk7dDAz8H6uocstll1SqbVOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585592; x=1784190392;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCjkXsfhKStRX4BPezISZKAKofYYCMrLUNz4xHjk/dc=;
        b=epNxPplCOVh+Ck7g1dziSEUeg07AKRgIHwvEA4UGWL4ZW6tvdetHaS/k6NauAwPx3q
         LO2Uy4TjLlWMyPEXelXKG+Ar3tcjP3ZrPPL8TpLoFSKXoLN1rZTwyNOt0bu8PP2IVM7d
         nuzA2R7egjj7Z296FplqfBkqlDdi36Cvr8oZgC7xX/n1fbihZRt6OYywS4IxttlUMN2U
         yiRuHtbwsgI4okiO0Urkkl6GZCGWd6zKI67k1wTJ1g7IxzpwtSEWmhgJF+xrYrkgrRO2
         j/Mq6cpIMJvgwIx0QMVnszh7Swva8K7+ex/7deIpUNS8akY4JO6bFopKgdKYRmk/DU4F
         Hwmw==
X-Forwarded-Encrypted: i=1; AHgh+RoEnxqP0I2HHW6NlUiS42aGD1v/+MDFmDVqj+W/JdviYWnEOPXAAu2akdJqdUOxLVZWF5VEDeqzwp0uh21OjweiYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoWlSJPQTz9fKH2urEF7yf4ElmkdWkktenVmbYz/YhFf+i84n3
	NjyTR5AVXHCwVEI9YCZ+MZe9sVe7Flgx0YSjm0mTi6rpFOTapBRYXsKq5MefiwVZDVg=
X-Gm-Gg: AfdE7cmQEgt0zYo9Nafrq9Hno+o8zJCc2mQ+NHc72PL4W4Sp4gp93YmBfSZ9W9Y/+xq
	zu5ORiuUtDKUDzfVo5pRusYuF9fMW0F6cdyPjiyjrk08uxn1n0bqiQrjGzlHsAILoPntl1Zh3ic
	B4p7/89wBNtAsUCLdqlqzhoKi2SWorCQgpekdozOw6+5pZDItTB75RMh5sIS32QC/aqGLzUkfa7
	MbuRRFsgmpkHlInhNm6/2Hsay/dzQRdwrg2bMOAD4Ujm4X+y37j7J1YCaUJMteXfTYhZ4uXIURG
	uspq26DD4XOE1JNcH1hXuNxU1NS1RzbESi8xnh/D3gxnI/ib2wDgrBZ035cs8fkAe4K05VmiIUd
	hn4m8pKI3Ml/oD+2NDSMk5clODQv4Ts/GN7dS4ncMGZNiGM53DvxmN130M+Pq+6UHgBgwR2cuR/
	SEJ2FMa5lS5wJeg/P4agL3QpiTbrQORxpNEEZEN6YJPeG4K7OhIMd+lkfDvFE5B0DY/WclZkSLs
	cS5
X-Received: by 2002:a17:906:4fce:b0:c15:a9a8:66b with SMTP id a640c23a62f3a-c15ce14c385mr254608266b.63.1783585591477;
        Thu, 09 Jul 2026 01:26:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e05ebd6esm94828866b.31.2026.07.09.01.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:26:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 10:26:30 +0200
Message-Id: <DJTWBORYP0N7.1X1CWO18MKGVO@smile.fr>
Subject: Re: [wrynose][PATCH v2 2/2] gnutls: link mini-dtls-fragments test
 to gnulib
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
 <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
 <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
 <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
 <Haixiao.Yan.CN@windriver.com>
To: "Pritam Srichandan Sahoo" <PritamSrichandan.Sahoo@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
 <20260709053106.1630373-3-PritamSrichandan.Sahoo@windriver.com>
In-Reply-To: <20260709053106.1630373-3-PritamSrichandan.Sahoo@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240544

On Thu Jul 9, 2026 at 7:31 AM CEST, Pritam Srichandan Sahoo wrote:
> The mini-dtls-fragments test introduced by the CVE-2026-33846 fix
> uses functions from gnulib (gl/libgnu.la) but does not link against
> it. This causes a build failure with musl libc where these symbols
> are not available from the system C library.
>
> Add mini_dtls_fragments_LDADD to tests/Makefile.am to fix the link
> error.
>
> Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb=
63c8df61d1480121a859f8c955f4910c01]
>
> Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.=
com>
> ---
>  ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dt=
ls-framents-link-to-gnulib.patch
>

Hello,

Please squash the 2 commits together. We want to preserve bisectability:
musl should build on every commit.

Thanks!

--=20
Yoann Congal
Smile ECS


