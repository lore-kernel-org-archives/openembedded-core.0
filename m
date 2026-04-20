Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B9F557F2
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:21:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15454.1776676877888206944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rdWxF89J;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d74086e5bso2804426f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776676876; x=1777281676; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwuftBK80MeaVniYAwow4BKQ/AizR80a6JU1lF0O9eE=;
        b=rdWxF89Ju7TbtMQPU0xFnNG/F7EByv/ublMGFJqoslMLV6GWudtzPjzAyc5NUyacX7
         EJ/QSdILInrwONCTE/u9VdzLv+vG/Es2Z9YU6sPCoLD4q4f9I7A/HKDakIUP4LMxye9B
         2B6cBTSBDnU17daFCiWaPGzlYFw8Nt4A3bJQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676876; x=1777281676;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwuftBK80MeaVniYAwow4BKQ/AizR80a6JU1lF0O9eE=;
        b=ibtWTCvGmwa26zE442CtkYbn3+zAG7dbK/j2iqNd9yRi1tq+2b5ZsScautjUFzxY1k
         gdNyaC/AxKBz72+eztZyTZxmlgqDy1SDrJE5L8nkF3jJAVmCWefw29ghYAIXQjtM6b9V
         +WDldMNxlg60EMk8H63k0q7DoCHTjfEk0uabDPd//MhN9kY3xOK8wP9wqZW2OwuY/nze
         ipaKVt03bjPsL+Xd8CHetWB7JzLI+wANn5ByG6HEMePkvo/CUEI1TNPoOssY6CvdOVCi
         L3/Oqy31o9Kcgtk0UajjDxzBLLNfG9Zj2kHK6v0tnZFctzgPZuyPQo6fRCjEeHPx01vb
         DADw==
X-Forwarded-Encrypted: i=1; AFNElJ/KL0xZSQXvKNsDvUxbQAJnG3A2hAT7HMlRlmrSu3ZyMNkBaEinxDodOy+CHNadvEEaZJC4enwicK/1mSbXEPjYmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEqoMLRe+qCx1UxNNr/sFv8QKUSRc5Fsh2dAuE0nz3mcrIn9uG
	BCi2fXdpHJkPRmGoRWpOxkMumzztYfAG+C5ZjXY9Dey+aR5c3YXx7jHwMFmkfyg4DsU=
X-Gm-Gg: AeBDievfPq9pOyfE3Poq4sCLnxIafR5d8YGxDye6BTyx6qNQDgP9cgDbIePrzqoZEgc
	47ObNjYFpqFRNdvy+dm2/qUxkViIClQTwy8kVphOeqfPex4J8Hkr0Z2ZhILBYwPnagv/AO+eUuM
	nxtNZ9awxZmV9sNAv0ht7kWVBdRVwV7p7g1b90m+t4w7NhXBUECa0UasEZ7ZCGWpQb6wQF7J/gU
	fiDhRuLdAG+n3nK3pw/OKahMVirfpLMWm1pVAQCI+NIJnxH/BpCPIxPJTIM0BtblTtXnUkPcDEy
	4DuWplNdAo3Ydo83xb+R+9nV1XRtfPoH7SYKrf1S+/0G0OMUFK4ScrPxEdN3L1Vi80zqbBIlCDS
	obsDwZFzDNhYhdBLy+0L9OTp+1DvMwNyqUUICBCKaJZUjHr01H3vL7sSouC5cq+bNSADDAznOnb
	eFx/OltMqOp4iA+rKcotdDXcM5zMTcbQjpFqmYj5/wjJ92vZjvngwACDH/7FfSU7+WgJYywSMIi
	wGNeM7FQPK+w3Tx/Wq0QQ==
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-43fe3e1645emr19640064f8f.36.1776676876112;
        Mon, 20 Apr 2026 02:21:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm25111371f8f.14.2026.04.20.02.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:21:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 11:21:11 +0200
Message-Id: <DHXVDYUX6BAD.3KI382BFGEHD@smile.fr>
Subject: Re: [OE-core][scarthgap 00/11] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <af76f008-c484-450f-8c6a-955d4957a173@bootlin.com>
In-Reply-To: <af76f008-c484-450f-8c6a-955d4957a173@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235559

On Mon Apr 20, 2026 at 10:44 AM CEST, Joao Marcos Costa wrote:
> Hello, Yoan
>
>
> On 3/30/26 00:46, Yoann Congal via lists.openembedded.org wrote:
>> Please review this set of changes for scarthgap and have comments back b=
y
>> end of day Tuesday, March 31.
> (...)
>
> Was the commit below not picked, or am I missing something?
>
> commit b24d5cda19136fb8120154279eedd55d162b4640
> Author: Jo=C3=A3o Marcos Costa (Schneider Electric)=20
> <joaomarcos.costa@bootlin.com>
> Date:   Fri Apr 3 11:32:30 2026 +0200
>
>      linux-yocto/6.6: update CVE exclusions (6.6.123)
>
>      This new version of cve-exclusion_6.6.inc was generated with oe-core=
's
>      latest version of the generate-cve-exclusions.py.
>
>      Regarding the database used and how this file was generated:
>
>      Generated at 2026-04-03 09:30:32.247568+00:00 for kernel version=20
> 6.6.123
>      From cvelistV5 cve_2026-04-03_0700Z
>
>      The backporting of the generate-cve-exclusions.py script from master=
 to
>      Scarthgap is handled in a different patch.
>
>      Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric)=20
> <joaomarcos.costa@bootlin.com>
>
> However, I see the commit below, prior to this one, was kept:
>
> linux/generate-cve-exclusions: backport script from master branch
>
> I'm not really used to the backports schedule/workflow, so please excuse=
=20
> me if I misinterpreted something.
>
> Thanks!

This patch triggered a problem in our infra. I received it directly from
you but it is missing from lore. And lore feeds patchwork, and I use
patchwork to prepare my review branch...

This is a known problem: 16167 =E2=80=93 Missing (big) patch in patchwork
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16167

I've reopened and added your patch to the bug log.

I will now integrate your patch in my review branch.

Thanks for the report, otherwise I would have missed it.

I'll try to check for this issue in the future but this will be hard to
spot. If you send a similar patch in the future don't hesitate to ping
me if you see it missing during the patch review period.

Regards,
--=20
Yoann Congal
Smile ECS


