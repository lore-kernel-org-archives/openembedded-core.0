Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B162EA3F18
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 08:53:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15205.1770800009832148749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 00:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i3UhOd/m;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-480706554beso53501065e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770800008; x=1771404808; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1WmpNFXhoxbgMsum1wtZIWflEVZBSotnuCHZ6/H9Vg=;
        b=i3UhOd/mgxXq1WknJaKLhBaMzOdxMv0yqSInMGXM98TrOwNeUAsJuxjVNpXHbEbc+o
         S5rn6/5QscGctt3BgnIDc98teqjtdH+2gtBnXNMi5qUfof4q4jVxeuq/8yMG+NQkMWCg
         2xjljihHxsZX9i6B1eaWdrQYsDDebh7ry2cPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770800008; x=1771404808;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1WmpNFXhoxbgMsum1wtZIWflEVZBSotnuCHZ6/H9Vg=;
        b=XCvJWU5GJNOFiQZnY42nAAZZ6YfqU1QxMOAWcqhl7cBvL+Vs1eHID1wMjnsytimZqm
         6IfmWD8Kp6ZdEq3YrU14tmowQsCuOerl20i8+RJaLhx2fu6GZ/Svwg36zIpKkzcOUw2U
         dD9T6Cevx5x4VH3owl2GMGaBo6ISgrcapRSwKoBNa5BZAmS1OqGqsZjOyoFcFb9IF4T1
         AqxqZ1tR2fOCyksrf0zjLUliwvs57A9KLMir6R8wFYi3Q2RrLSr0Dk5vDGd4kLvajtGH
         oA5No8Qsl9273Q0eSqSjWnCPsFudT+rU4VU44fo9ro9VDCS+tGemzLFgnI6vnG5DQQ1/
         GGdg==
X-Forwarded-Encrypted: i=1; AJvYcCXFmaIO7GAi23MLRoKX/nbfqsuHN7C80dEGDzEEcL0jQxmdaDmwJCv+ocCystWFnTXurakI7W/jAgUIIZQI/N/r1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx97xqhUuD0I0OaMh4KftXPqc6D0WeU0CCYZaie2wkO6ps8bvYI
	nceIJ8JEBjyRZNDAE1cwPsSiO/ivdk/CwhJKyExZ9t95d61gfJ9A16gjBRu4X6jqCPs=
X-Gm-Gg: AZuq6aJoVJf5AsRlfK91RtDy/orKJFHLFGecVU89Q/PK0qvxMErXO9Ur80juROVbTh/
	MA8hcxf3yU/ShHy5/tDKgBeagXv5uSD0XHMs+6CqfiFw5Ti6VginiTNxiodqr05VMfRq2faocZZ
	YSufkbigKArV8fe9wMH3y+/IZBwzT9FsSs60TtrSvGrPHJhltDly/P5EiqbM1pWmSQfcD6Yq7Nm
	lfBqnIx2JDgHIAkzZz2avQ5D68FbCYO4OpTtVgmjAi1EcY0rXJ/PKp23ZW8DSO7CmX8CtKGhvXB
	1IpZk8WGgymbOxUicZLpf/zAl364oaRiRrXaKa7i3A5QR5YP16BPQRrPuxY2EO04pdbsr7K7LdJ
	o5MVAWdKqQOa2gVSD8f//bYdhzXknQR2rQEMzbqVH8w2rS20Mgzhbavp4QOaVAkiZXfQIhvb676
	aF3gVfV8WLtCsgtdhBSt98N6fdYt1/4h0uKDTvu2eM8MKucYLStRdQW1VoS1llfAGwjDastNyb5
	hhzPYW9dzK6bg==
X-Received: by 2002:a05:600c:354c:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4835b96e5a0mr20287675e9.29.1770800007999;
        Wed, 11 Feb 2026 00:53:27 -0800 (PST)
Received: from localhost (2a02-8440-2506-5f9e-4d83-7b97-a841-bf93.rev.sfr.net. [2a02:8440:2506:5f9e:4d83:7b97:a841:bf93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d30f6dsm2901849f8f.3.2026.02.11.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 00:53:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 09:53:26 +0100
Message-Id: <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211072322.79206-1-moins@kpit.com>
In-Reply-To: <20260211072322.79206-1-moins@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230975

On Wed Feb 11, 2026 at 8:23 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> Install libpcre2 test suite and run it as ptest.
>
> Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest=
), and grep utility (RunGrepTest).
>
> pcre2posix_test: Verifies the POSIX wrapper API
> RunTest: Executes the core PCRE2 test suite through pcre2test
> RunGrepTest: Checks pcre2grep to ensure its grepping style matching works=
 as expected with various patterns and input files.
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  .../libpcre/libpcre2/run-ptest                | 39 +++++++------------
>  .../recipes-support/libpcre/libpcre2_10.43.bb | 22 +++++------
>  2 files changed, 22 insertions(+), 39 deletions(-)

Thanks for the patches but, as I already wrote, adding ptest is not
usually acceptable under the stable policy[0]. That also applies to your
kirkstone patch.

[0]: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_P=
atch_Acceptance_Policies

Regards,
--=20
Yoann Congal
Smile ECS


