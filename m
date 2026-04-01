Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F41D35171
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:17:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9750.1775038626243042030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GEda8LSH;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so9739765e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775038625; x=1775643425; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaHryvqtbNlNMtQqCLf/E2/kxnsN9NEl9ubKJPa2p9c=;
        b=GEda8LSHz16m6aVNe+CsyBRkPZnRGID9esLpJcRppyRrDjTRIwRVxvZkrBzzHwqR0r
         lU5wKn+56yawI3fEkwEMbYuTZGpxbXzCigAW9bODq73L3WyxRqT/NPKMf7JGzSmX0nNd
         EytHiW1vFA6VKTfzpHz46hQV6nt0uc7P66xe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038625; x=1775643425;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaHryvqtbNlNMtQqCLf/E2/kxnsN9NEl9ubKJPa2p9c=;
        b=axhjsfMYom5NYrPT3iVMyCh0BzhW7kggR8BAm3gLIoZYYjmrhV4+WYHuDOCxCb2CDM
         JxrhHa2le424wfCmIhUwt0vt7evFOae8dJSzK7ykHuD2OkgHW/3gFtHMmi+1C7ay7wj7
         2PifevBrkExl4kl3wEsPPToefa1rzAJOCp1nlr5fi1jIWoCuPk7fgb0hBXhEZKImPSyM
         M023d/b3iXp9Ef8PRq9Id6mp0snp+ClQnMGzPHayHQAGhohQ+BGQAA1aso/safHfIMGh
         RS8PwokxvE9wwTsnM3mJ63Gw/XsBYQtEHm3ANvBQGHJs6pYTmuIYoZv4a3EY4FH7t7mu
         8Idg==
X-Forwarded-Encrypted: i=1; AJvYcCWz9mTcKHe3Q7jc3qbsELSc+IDA6gsCJ0OsB4zCDkIpSGyMjOniPZxPGHAuzYHESZt6cRrhO0K57/s5j+mWJoEfJw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQzKfSEVOrAA7d+R7XvRIKQ4gNaAkHOMgLgqDW4PnzWm1FIgQU
	SgaQ+rHIIgG4N0mlfKwiycd1psU32Z4beei52GxmBpn9qydEz5amTwXw0u4aRdF8sAg=
X-Gm-Gg: ATEYQzxycUk+CZhf1AfyFsL6nQa51SZe65ua/0Y7aZOqWYtRaMYV3/ULjHNlXCAhRMB
	gRj6aHiA2XyIGaKX8FYigCs0SWo/GQREaDlVz+efIrGjxz9uw2XTjEhqA15Fn3zlpWRXkVYg0yZ
	gmMlQS/WThnnWZKHTQXuGLYmFIMloHzFkxMx4MzveDJSFLAILHi3CDtMMcMP844Z9t9LyQd4zYI
	nLf/CuiuqM7tBv90+bJMR8gvdlSdB8KTvIVxaReO5VHhpUTk8mQWOOQ82zZqHluNYUsbh/VPcBp
	dxWKVgB0wfzHXFpbRp84/9+1OzKPnat8HO5aCuSTDcCOpgxwvHu30FKt0Agh8KfI4oQpgJGvDGg
	bY0YhkttcoGIsS2QkGoYHVSEGtSjMxEgCFezTZP9unvFk1/FyzuC5hOMYFX6J1i9Sp4pq99WE+M
	CcAV1bzG3OhyU2PhPFH1DfLumXXHQcqnsipwtuDv+UZm44IxC0RVq3xIAQDXeRdSkxGSeSPLQ8y
	OL3JtmvTPsnPptvHI78qA==
X-Received: by 2002:a05:600c:6211:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4888356611bmr48771995e9.2.1775038624520;
        Wed, 01 Apr 2026 03:17:04 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm108931575e9.8.2026.04.01.03.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:17:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 12:17:03 +0200
Message-Id: <DHHQOEIYRXI3.1M76QFBVQALSI@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 1/4] binutils: Fix CVE-2025-69648
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260317041229.2932275-1-deeratho@cisco.com>
 <DH75Z2970Q68.2IIP1XOVZ2EPX@smile.fr>
 <787045.1775037934082826911@lists.openembedded.org>
In-Reply-To: <787045.1775037934082826911@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234341

On Wed Apr 1, 2026 at 12:05 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> Thanks, Yoann, for your review.
>
> I have corrected all the patches and sent to you for your review.

Can you please resend a full series instead of individual patches?

And, while you are on it, "[whinlatter][PATCH v2 1/4] binutils: Fix
CVE-2025-69648" add a patch that would apply to oe-core itself, not
binutils.

Thanks!

>
> Regards,
> Deepak


--=20
Yoann Congal
Smile ECS


