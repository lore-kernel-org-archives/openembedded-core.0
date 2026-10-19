Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35D7CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:21:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34260.1792416082479048028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 06:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YeDtiyuh;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so16290185e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792416081; x=1793020881; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9/M5DZQQaC6L5UznBOM+ODTGi+5qozYjx+oajeLj70=;
        b=YeDtiyuhiVcVwAGkMeF3bw+iRMem0RReS1W3IwwZtz9Zl9k2GpfP9djePDfMHoOq3N
         svMwwRuI8sLBv2/bEzb4RHwOz5o4s5C88tXb+RLfjteBdYgLmnTs0tV6YdY0MFtw/NbQ
         v/9Q7mFla4EaS5v1Pp96D6cCzgnvhju8Klnwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416081; x=1793020881;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9/M5DZQQaC6L5UznBOM+ODTGi+5qozYjx+oajeLj70=;
        b=PryCFDVJNgRAsNI+Qil/cNTFOcXZY0nEq2AX453tDfxtgwhjFXl5W92dkFy2FZSKYe
         +vSX1ZqWzGycfIkO5SAcUBp9e5NoEwxTZ95Dqm8osbLx1pcQxRL3w/Q7Al8/q2q5Zz6S
         lSwdm+RceTcOgR+SwUMFggy7xFsIto30oPAnOnyDleJ82d39alsWUBnQ7RuWsGfganIJ
         iWRkL6vv9gK8PgixtR6usFeYqu+Kmde6hUsL6vDWLAK/p/z2c5fjI99eTrsvC2lFKNF2
         6PRuLYd5xV0OprSEaaG6Pu4EwZYkbWvSWsAwthWrH7arM2a4RzAH2P8ETWWgsRlTtGPr
         W+FA==
X-Forwarded-Encrypted: i=1; AKwUvBw/lQvpNkyo1/WQrj6CEf5tKTBRVQweGRVW/5hKp7TaqQ8E4AR54LCB8cXBXW9+J3kN2BVHEq49O8BKzGClw9OhZg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI8Sm7IJu1jU6oxOtTKeeM4WtFqaHC8fbEYGQNnNAzXtaXg5HsC
	UP6QHU2gQXCA/eSuZp1c5oCqpXITx6NNF9uieJOrufnaSyc8ADMj9xNdUMMVNa0AEjQ=
X-Gm-Gg: AYBFou0pmulUlnFGwRCDDE2l3sjR+B/n5f47QmBAfuE9uSGrZ0SBeX3QsJH7MZ1U+n3
	JqdNE0hDXi5Nm+6lC86ytma63MRwf+hTsjhY+FY1ZVskOfKHf7yJRlIc9+SCmHNE//IwAbberCi
	BFpVBZpOQ8tr0ZKZZ4YhgY9ap6qNFa13YcX8nS/bnR0Bwg1srHw4n24gjyX6Xy8zuXeAkfaWXyr
	biSlNvjboy693BWeVctdKsi+0Rxqe4y9vYGMsuYy0egnYweqp1P5PmAleZne4UIK/OxanndVW1h
	LV9IOV7n980N1hWMBslgbVIxydRrEMTj7QGx7OzT3OGBCJWeaqG/F+hNNw5K/plHJDIXyhcOC6t
	x6ZhAzcukReq+jfGVOAQ10xNfHT8hiUPOFN3qyIfkuLYVbzZ4FRXsGfqc45h4qXeBgrY9TPzwi9
	cKPT6GtuSrzypBphlfhqMdEUFf8gKBs0iVEmYNIOzJSkPj+AkSWMoaBfqV6aaFEpIBuxKUj7oLL
	ZNYuYVfa0IDsqjIJxsCmo7C5rLCg3Tffbp39x7jXjUOcas6N+3hQlsBLNMxMHwhfu8gmuCz
X-Received: by 2002:a05:600c:4f82:b0:4a1:df50:5758 with SMTP id 5b1f17b1804b1-4a1df505962mr131535805e9.1.1792416080433;
        Mon, 19 Oct 2026 06:21:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm358727105e9.8.2026.10.19.06.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:21:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:21:19 +0200
Message-Id: <DM8UGZKR7J6J.1VNILIXTWOKFX@smile.fr>
Subject: Re: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit
 pkgconfig
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019125142.3407486-1-pkj@axis.com>
In-Reply-To: <20261019125142.3407486-1-pkj@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 13:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248167

On Mon Oct 19, 2026 at 2:51 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
> The use of pkg-config was introduced in version 0.21.04.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb b/meta/=
recipes-extended/stress-ng/stress-ng_0.22.01.bb
> index 548edf292b..adf9331cd7 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb

Hello,

master and blacksail have diverged, blacksail is still on
stress-ng 0.22.00.

I'll ignore [blacksail] for this one.

Regards,
--=20
Yoann Congal
Smile ECS


