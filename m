Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B5FC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 14:21:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15391.1789050057745228595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dyQ/a6it;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so6607835f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789050056; x=1789654856; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrB4eNWRpatBF6LRCC3tOJdIZni05/tUZjzAftAgp9o=;
        b=dyQ/a6itRRKYgTdesNXXwM9q1qr6axGHJzik8LYu9PWUhjiKLaMhjZIneD1hNfimyE
         A6Bg0993vWb5HuUjYJ/fk1TIJJ2ry7dnsmdeH9vH9YV2Fq1t/gum17Q6BcpQtNzTMvNq
         Ogfs0smAcbfUPUxt2GRU2Nen0iJ0W6FbTOWMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050056; x=1789654856;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrB4eNWRpatBF6LRCC3tOJdIZni05/tUZjzAftAgp9o=;
        b=B+MRq5MsnfYHoE0uzLNzXhu4baDVkCA4L5s0V+TW1FbnXYIrRngYwQ26bSTH2z/3uE
         FbLoS5l1jzxDnFMiE2s05bOlt/hmeECRU2dskLl+gHtR63KH/CPxuGjRcJSLeKGhi6N5
         b9zLmp53rrh0O/ZGlW4bxTs/MYUXB5ozfxikZk8dussBYFeoDll6BKx250IxQqEAPpoB
         L0rlXfVvTeP4X9FjLKh7Ce/ytj3SwfefIHVQYOlB8sV9VdhFARQQCp0Dyv+yxWwPlnau
         mJd6C6OiKcDAnrC/9OT/08bU1f/rXduIw3OW6hP1f6F9TzTy64V2VISOcYwgwmRx+IHv
         IK/g==
X-Forwarded-Encrypted: i=1; AKwUvBznd7Q2W4CYY4MeyARA8AyA8voj+o/ItCfvP+mKPQnH8jNytDbDjtWu9qtkry9Gd8RxX48BABXALlmdZGcIzM1mEA==@lists.openembedded.org
X-Gm-Message-State: AFuF++m1XW+ZnWwASR9MP6bllehhAPJct8ZrgX5k+b1lLAJPWwK/Zk1F
	Tt5TutRrDec6XCfGwiiIwORrMn+jiYCvkMrt8OnYeY3xRKfGFLG0hcnA7U4ht3epyS8=
X-Gm-Gg: AYBFou0QMJFzoeh7QMlDULn6VAacTvVguscYNIkxVdwR6aeDGfFzBQxauTi5R304p6r
	BD3/seaWgMfZZH6XqHvExA0O4GRSbiSxGK36iJc9505ZNf6O76VLYaRBTzYFlrtv9AFoJsjRIsd
	VUpWlZ3nWL8MhneM440w3Flcl43y/JwhNoteXbBaZG9sMFgElNmySwg775gTiuhJ1ThygoChI9W
	AJxZfP/r3dlYndM3T/dpTmdg42QAWGoYsaeSZ8Iyp43QnNeDDummKLAC3BdX45KawfyGqIYkvpZ
	KYHRBOK8I1i+B3t/2hDmaTReLP59fy7O4vITt2ARMmUSZJmDtfAhAwEAIAWvCpe2AfdJLI6Om/3
	1iT9kTumZsnvnIhTogk+ydc1z9Oku0/c7Iif/E5iEtCQWUN5YHLYP4IlU6jk/MEu60wEed2fWPv
	fS+CGCLpKYlbjd8nYF1cBNrfqQsks+Tl5AAhb0vKlA23iqg5/fiJVTWrOwQfjuYBbqYnyUfq5y8
	EJDOClE4nLXMtvrfWxeXV93HoZ+suIi1XdzYICNhr9hnHqAiGGNYMe8K62meI0=
X-Received: by 2002:a05:600c:3f0a:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49cf81e4a10mr409352005e9.3.1789050055663;
        Thu, 10 Sep 2026 07:20:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5765152asm25011055e9.11.2026.09.10.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:20:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 16:20:54 +0200
Message-Id: <DLBPBCWV64LT.1TOCJCVQDN8GZ@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix
 CVE-2026-69248
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260901092741.34198-1-vanusuri@mvista.com>
 <20260901092741.34198-2-vanusuri@mvista.com>
In-Reply-To: <20260901092741.34198-2-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 14:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245584

On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch according to [2]
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-69248
> [2] https://security-tracker.debian.org/tracker/CVE-2026-69248
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../python3-cryptography/CVE-2026-69248.patch | 297 ++++++++++++++++++
>  .../python/python3-cryptography_42.0.5.bb     |   1 +
>  2 files changed, 298 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE=
-2026-69248.patch

Hello,

As far as I can tell, this CVE also need fixing on wrynose. Can you
send the need wrynose backports from this series so I can merge this on
scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


