Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002EEC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 15:44:32 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15.1790005465741251454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 08:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a5d8NUQM;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so16393145e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790005464; x=1790610264; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bs8Zc//yFzdcQqovZFC2kPmBwg60OoROZGYUUMRef7Y=;
        b=a5d8NUQMZBSGEj3ihX26TL5140/iDTr0BJhI5I3TLnVFIE9I7Na9ylgok4RljWMY/G
         +TkukV0g+Ez7Dr4mkPzJmpgZs9j6R/jlRAYBVrGfLXtrvzYTgf6ZCO/cSAxJ+53GRXmX
         t0Sc6U0RJTX2pAruLopvZLs7nh+DemiedUIGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005464; x=1790610264;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bs8Zc//yFzdcQqovZFC2kPmBwg60OoROZGYUUMRef7Y=;
        b=K7GDkQc2fXzmZaAqBQDRYzU+FzXuhYqj3pZ5s4HU6jWT6kkEUfjg1BNkyQ1a/7Pcv/
         OtZauZxpZhc3UpLgRp9Qa3iegNIuzC9Yp77aGDol8C4CRr/7U37iRZUN43HQAYZOORLj
         biQAoFQ9BBOkTwAZVOkNv7VR35RHPzzAxfxgJoGVKIgVyun+p7jeZI6tJ5xnTGyLpWQH
         IVMg+UtqR8FBo/nsFA4/z/+snX/I1nE5Ejae2EfngVPnu7KIzJMEU9G03E7nq7wIjsNw
         5ftKi6l9gJ6yRleAYxgudYEU/tVK6D6lebGrpfazmve9+R1PnL6puTzm5Q3Q+DJuWZ+R
         sacQ==
X-Forwarded-Encrypted: i=1; AKwUvBziF+WNfop0iijiIOI7EOr8dNtSHfd9AWfv2T+T/0X29wLCgUMYGdgnqWrI98nzYWJikbqwKazmhgjvuxRmRNOCTw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kYp0YmkEna6fO1dEmWvcFCZhwyaYXhyNwHx06KfWFz1tarX/ju
	nGeQH25O718ANvzq8rFIX2YF1gxP7txdlCy31Fwce6B+L+T8wxaxC7h4j0EOxkq09/pxUDoW5Pa
	COYclons=
X-Gm-Gg: AYBFou02/YffE5xv6YV59An0QrGEGvmd1X7w8W+CE8bHR9IV8pvVYKlaDg3un9bcSd9
	hI3DHVhcUydAyyR/TNzaSctw/ldwqZigFdX5ypRxVmTMnYIk8C5Yaj71buzhv4vsjoRu9y1by2c
	y0nplELQoBuZ92XKo70MN77PZ7pfAu5+WARUXDy2hrte0DYCzYe/+cRvGMHC9fLqCCwiNr2JKUs
	vteP1Mw2VM93EdOpUJq1clvZmxICsO+2YTnT5cg1tTaNx8OZLgJrjeG8/0edQ3rD4H7VjILvD7b
	q94Cdoer9aOdSE7LoFBNnj/NeagOwbNo0ek5LrHgvHh0N7loJCBLYdK5QWcjfqDr08wpUNHhRjC
	qVXUjwBwORUz5zWPz1Zrmr5E35mrh4tohLpfk8RNZl5478+C9bBK6tJzcfLbahinI+FWHoJeisL
	/V7ajII7uFq7wkcQViZyzG4vDAKfugrFsr6+yrVX4gjDqV92XPYKFTGD5tmkllYt5ZNMp3qEWlG
	hlx7J2mF+UBGk+NCBomLoPl9UpKgvcu9/Pz2qP3wc3KUNMJOmMZqla4DLY=
X-Received: by 2002:a05:600c:c4aa:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fd88534b4mr371685e9.4.1790005463817;
        Mon, 21 Sep 2026 08:44:23 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm214230205e9.1.2026.09.21.08.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:44:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 17:44:22 +0200
Message-Id: <DLL3Z9HE1TTX.36E2F147N6AS9@smile.fr>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix
 CVE-2026-69248
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260901092741.34198-1-vanusuri@mvista.com>
 <20260901092741.34198-2-vanusuri@mvista.com>
In-Reply-To: <20260901092741.34198-2-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 15:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246341

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
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-6=
9248.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-692=
48.patch
> new file mode 100644
> index 0000000000..5ccccd8034
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.pa=
tch
> @@ -0,0 +1,297 @@
> +From 4d035a4225965edeffd312079a510ef25fcfdcb2 Mon Sep 17 00:00:00 2001
> +From: William Woodruff <william@yossarian.net>
> +Date: Thu, 21 May 2026 20:44:05 -0400
> +Subject: [PATCH] x509: distinguish NC kinds when evaluating wildcard DNS=
 SANs
> + (#14888)
> +
> +* x509: distinguish NC kinds when evaluating wildcard DNS SANs
> +
> +* Bump x509-limbo
> +
> +Upstream-Status: Backport [import from suse python-cryptography-42.0.4-s=
lfo.1.1_6.1.src.rpm

Hello,

"suse python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm": Where can I
download this? My usual Search engines/LLMs are not helpful here (and I
don't want to resort to boot a Suse container, yet)

Regards,
--=20
Yoann Congal
Smile ECS


