Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F4AC44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 23:14:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.628.1784330046107383389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 16:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=smhlx45L;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4720d22c94aso5533441f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784330044; x=1784934844; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2nf4U1tCl+aicGIJd8MUDnhHJqiZKdjvlC94XFgH74=;
        b=smhlx45L6xgFOX2P3ap8DHygQ9UbBhhRQNGX1uFS3sNGhd4fHCL2tIS67BefADRkpw
         351LC33HLykA2TgmX/3BnlzNuK4DbuRdiT4w+A76VkxEPpdAlXCFfg4FFP73+rvzku1/
         RWwqwFS1H2YCt7LF7S+E4SHIz3Hh6QbaNrKY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330044; x=1784934844;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2nf4U1tCl+aicGIJd8MUDnhHJqiZKdjvlC94XFgH74=;
        b=ejCOaBMWFdKO+Bxk7G8dRA7rJt6TgQFhVTJPBTgywNEEXHXjN9UOAeA4UatT7/dSfY
         lYBF36ITdg4aRh9JfyOz7CgVzoxEAvM33AI8OxQXNdH3bUkxqJzrBockTjDEmM0CzXi+
         3G150snOJsvC+1dGROvt7ORIrmnDjylTBetks9SEY/4a0IAjJWD5Ifu3f/+buJj6uVte
         l4ohEOEmF57MBbf99bCUS+vMTu+1cudbo22ba3o9HAz28UdZ1iOOrvg6t2HCK/nO7sik
         kUKKZ6RERYxQk5iAB7OQANwruBOdGGE2nuzk2jXzExDKq38gVwWJb8PIMXgAacJMJSVD
         8BLA==
X-Forwarded-Encrypted: i=1; AHgh+RrdmIX1m6zDVlWycmNq7R1cCSxs7OuS7NqWV4yWLIZMj4fO3yvx6g2/360aiKVSMxa8yx4KKbDcBjXB0ydzcMCUPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygF1Giuk/eP2gH9LCIkVxnDTVf1k4FhQ7q0vMZromvcWMCQ3G9
	BRGCYjhsNeeVOW20iLhhN12mjMxxp+NQ07LxLy0ka8nHrWz7KOmTagY8eCKud0draB0=
X-Gm-Gg: AfdE7ckDG0OTWGKCV3yaK9TK6M5q4fwlgQSy8pWkr4B5qk8pPJjvTEOMm2bXPXZrZJg
	8LgfALYkzhhk4npX9MQ2n3BTEyJJQ6PaGsa93TfEGudOPx2H+FO6it/xK2B6dHkJvGfrhryyunp
	6Ogh78Rpt+KlFMt04Dnu0EP6u4p5bxCmsMkuRySlD4rTk9YxMO7LJCv9n2m6HVbi0P9wMklrv41
	iRqYGLdtKIbT0NvslVDM/EmgjZLoOU6nMboOgy3HASXo9fak2fDLLApjwBd1oRxDMyKY5/9tEfk
	P1KjkFQ8nzgivvYpP4IUuFq5Lg9iwfa6cwAffNSA0mHkBT/kqgOjclk6oaAFOAxkO+wKpFtPF7s
	KtJRseOB1TDLZH06A489y2joS+hRWuV8pJiNNHSuTA8+5zNm6cEf+USj8NYTlEKquyAjEb8ZqzB
	UkBwTWEWkic2bnAjuJRDO/gfZSnbOweWZrI6CAdJfZGTJRbui6r7W1tGKaM5xxxPAXECMcJmPrB
	LGrVA==
X-Received: by 2002:a05:6000:41dd:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47f623226c6mr5258209f8f.41.1784330044397;
        Fri, 17 Jul 2026 16:14:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm6861676f8f.4.2026.07.17.16.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 16:14:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 01:14:03 +0200
Message-Id: <DK187LU4ZQWP.1A0SLMXGHL48Y@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] python3-pyasn1: Fix for
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260715055355.20351-1-hprajapati@mvista.com>
In-Reply-To: <20260715055355.20351-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 23:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241227

On Wed Jul 15, 2026 at 7:53 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] also mentioned at Debian report in [2]
>
> [1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e=
5b3eff30ef0
> [2] https://security-tracker.debian.org/tracker/CVE-2026-30922
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

Hello,

This patch is included in pyasn1 0.6.3 that look applicable on stable.
Can you double check and tell me if I can cherry-pick
https://git.openembedded.org/openembedded-core/commit/?id=3Da82592f0a7d
instead?

Thanks!
--=20
Yoann Congal
Smile ECS


