Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A142EC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 21:23:41 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25735.1789075410852154189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 14:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NY+vxMXZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1005935e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 14:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789075409; x=1789680209; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SEF/Ja6E6u4JC/mMyC6ibT+aH1xt/+QxRnSpd9tGrYI=;
        b=NY+vxMXZesYnWOtECGHSvmRWuGEJYKajwZntUyIDcKHaWEl/vhXJtt6xwUgtjg/mGZ
         9oqFPtaeQgV8edBUazweeyS1wQlSglejI3XcaVc5fhEP5OV00s+W+/c3JT2yXY2bXEPv
         fpR1l2X8RFm3RluCIubcv6S0GtWai14sLoriI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075409; x=1789680209;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEF/Ja6E6u4JC/mMyC6ibT+aH1xt/+QxRnSpd9tGrYI=;
        b=EwoQ0M+VXACPxrWN60xKl7I1jCZjtSe8pJ/KB1Y5wE3nk2WCfenrq+rcuRhY/oCVxT
         tlyIwhINrHKDT9J8jzqBUcaOVcCEv65FDwJgicHmiBn6cKVjpYoU31dU1amVG8vIUa4R
         gOczHWSHDV2iVq/p2oMCxRpAQgS3TWOIFxnz5X5LQZaLw3NzWzi5zS2bSusL7Nm98FjS
         T1jOyQXAFtdmL3i9VUR6NCn7KUzgDameccsrQvfCp7BsaLi4g4QPl06BRYYy/sqQ+XJl
         ZTDfiCKSLF6tKu6QdzXsfDffyEvMWB4lik837J6m91d4WqlhK5jp3Q1W/wcsenM2nnbw
         iEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/j4vOBddQY2kCUZDWX0yjKKxctvcqowqA8TOsR9iPaayj7/HSmZDdxQsStGGOWcRkGXfGmbruRRfgRR/JIqehCw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kBtfrBkFul9oIbIUY/RMJOVvWBbPmsWfULJfgIRkVVjBwzY4Br
	Z9oju8yNi6SA2mJCbMMewjbkZds3kGBSz3wZFLeU/VUxy5w1Ke1C+cNSowZv+NHjhos=
X-Gm-Gg: AYBFou1MzMEq38LycZeEHuXNopLYDyb++E0Obc6Jze48AnU7F+mzA+dEesNm65MNBOz
	ukdGgLYObAzgCG8FJEbyGCmq+HcCSurqy97N6MAHGhysNCPYOt4w0ro772/4hHKJzE3hJ81LxRy
	YKWbork5QM5AkuxZKJXhP2YmRRpufS6yL4pA1QPPY2iKYftpj2Y+UccbpndJIlHLo6fJPuoV1y+
	q7Q3bPPcb6IzBRhhEzVQHEBdhcxuK1QH0Wm01pLVFa6mYJZSivtBXFcgwwPx2TGUK3biPijxSZE
	xq3ZromHzTU3yo5a1+RM8sGTx2mlCPdXVg4mQM3av/2r8o70BjsSZF9pXoMDJB23NAmItRKqYWf
	Hi9CZc4ZqLtaRH7+wxD6kDzZ756Dfv8ru/L9fAZQS2icr3MLxyXT2qzXOuPAOznJWyXhfd3rW7w
	5geVtSOufImKBbl9eTXTapyL9AQM/kZ/8A6r4c4gdvp+Y7HXCZXsnxO9ecnLGeb6Nw7s+/rMAMr
	nIkg4ZVhfGLY96//2D3Wn4FJ1VTlfXGstVwclbjjrkbaqGmgNPyDOmpVcEXDw34
X-Received: by 2002:a05:600c:3b1f:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49e60f6955cmr16098825e9.4.1789075408960;
        Thu, 10 Sep 2026 14:23:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:788a:18da:6c2a:9f16? ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm4435845e9.3.2026.09.10.14.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:23:28 -0700 (PDT)
Message-ID: <3facea2f77d3688b16d187414ffb62b2eee1eead.camel@linuxfoundation.org>
Subject: Re: [OE-core] Areas we could do with assistance
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Sep 2026 22:23:26 +0100
In-Reply-To: <9e7b33da-c8be-4a77-893c-37c7afa4701b@est.tech>
References: 
	<db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
	 <9e7b33da-c8be-4a77-893c-37c7afa4701b@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 21:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245603

On Thu, 2026-09-10 at 23:06 +0200, Jaipaul Cheernam wrote:
>=20
> On 2026-09-09 12:32, Richard Purdie via lists.openembedded.org wrote:
> > a) ptest in util-linux failing for qemuriscv64:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2369
>
> I send a patch for util-linux and reported issue to respective
> upstream=20
> as well.

I've merged it, this is great, thanks!

It is important as it means when we see warnings, we don't just blindly
assume it is util-linux still failing or have to check each time.

Cheers,

Richard

