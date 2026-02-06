Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29695EB28D2
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 06:48:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5936.1770360469582318440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 22:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C6h4wvWo;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so10699845e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 22:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770360468; x=1770965268; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+80QvVZ9aLwWrk48d3ed/xxj2kqqQOpJ3nSDDE86BmA=;
        b=C6h4wvWotmtwbgqx94/jPZBvOFDUGiTerpCcifycLKNKTx4/wVpO9rOXIiSDrR0X7C
         VhVdjeLBCHV7MuYGqkpYUxHOTYZvPgQsOu31wPI3w53aQfAexyY9i+5vvd0Sm7Tps9eA
         uTH7dNvC5rlNwcNtO7631NnqCIQHDu6sbank4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770360468; x=1770965268;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+80QvVZ9aLwWrk48d3ed/xxj2kqqQOpJ3nSDDE86BmA=;
        b=kupBMqcjnovd5+uRjHUvdRXP85DBfLlVzgfHJJ7Iu448jBvO5YGp1Emiw9qiluVNFK
         ch3H36zuVOpwedQ7uZZhUmn2lOPPR12YXN6QvQnx4n7BDeXlf+3x1yB+Noj9kMJCtx/v
         L6YURFGRb71KRssra//vjyBBqRcTCWXdrvYXkvJ7TlzvS4uC8c5yE+ORYWSjROHBLWbW
         NcY38tM8LldHMKdFRwjNW7NYlftntaI9V6wWYnni4Hn5lJxaOCR96l8vvV9bGZ6oz8lT
         kbqQDXQhTLtRuSHnQowoba8/Wre4nSf0+cQGuuaL7M9t6SdNaDfPtE/nGm58vMmibiS9
         GtcA==
X-Forwarded-Encrypted: i=1; AJvYcCXqjZbzLKjkDQ6L7GjweErZsODBXw9GPKUvVS8YtYe9FsCrTl1rtGvh5YCo6uIq5l+9/j/pqtn2f3jfsb4Zpry+6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCgpzWMcxlZYips9Df5V/aTNtcB/z71mp+PjJVSaeXpcfL8zuK
	rje+aA9ag8cS7rhcVSeyQaUYaTg39XyZDoqEKsjulFI8vHb1KK993p0wnSeAZDxB4DnA9rwto+J
	ITffmHjU=
X-Gm-Gg: AZuq6aK1sd48a4LvRWRzpMOFf87mDSf2snAoS1i7Ax1ssGtfeyP8JmckmlWkBzZ0bsx
	K+keWW5FeRabvPZGYhd3v3Z9lVRRRWdCVh19q4s3MvfA0fMpRNymoRTi2Glxa8yd+sjH3yCE2oE
	nt/VEA35NhIEMG1JaFX0VeOQwRdQavEWE3G+NbdRYFocNbJ/xwhESKmZfmCDngCKLc38bRJbBly
	O7/H3v2ehyVgdZqyhZOvlM+mP/GhKQCtGo9FkjVsCOutZ9zMmfVRJyu9PkEPU44uNdumzVO6vhJ
	GRFKx5zTLmeukTJRiuaV+rPAyWBbnaCKDYPyhMsxo405Jq5GumwuEVCQRYa3pzXOj+TZkCPK+9x
	hDSFmIYTIsUEUOwa2p5bnZneH0PJncLxkoTZeqZepUMyVDp7agfAe7O7+w8/2DRWp4PVw4baKRU
	qUqX0lTwoTMNUT3ALkRao1Nk5INwafmCNcaWby2XkgBzDGVjM1X5sPQgJXotkYdq39uXwBOxJTL
	MYpkCzVLCk1ng==
X-Received: by 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr25118025e9.28.1770360467714;
        Thu, 05 Feb 2026 22:47:47 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206d8c60sm40307005e9.8.2026.02.05.22.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 22:47:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 07:47:46 +0100
Message-Id: <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260125161623.729884-1-peter.marko@siemens.com>
 <554632.1770355472810056681@lists.openembedded.org>
In-Reply-To: <554632.1770355472810056681@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 06:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230594

Hello,

On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via lists.openembedded.o=
rg wrote:
> Hello Peter,

(Yoann here)

> We sometimes see regressions in glibc test runs depending on the local
> environment. In such cases, it can help to re-trigger the tests to
> check whether the failures are consistently reproducible. It may also
> be useful to cross-check the results with autobuilder runs, which
> generally provide a more stable baseline before concluding on
> regressions.

I'm willing to test this on the autobuilder. But I never done that...
Any pointer? Where do I get the nice test report with the comparison to
the previous version?

Thanks!
--=20
Yoann Congal
Smile ECS


