Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57A2CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:38:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5615.1791841080587067656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tAx3DnMI;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso22909415e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791841079; x=1792445879; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cirKv6oAlYOfHAjjQM1/HicHH6rMyk/R4Xzxdulpo9M=;
        b=tAx3DnMISWgzWTj/59cSYWbQzU0Y87fAPWHEM1OlV4IO88Nrvysa/BvnSkIdyZfVMb
         J7HZLzJ1qGuwZ0VJhVQFxteNZDWrW5wGh5jTdoaEX8HwTpjdvmFay6nl0BBPvleZExv6
         FUeUCHn1u5PsIU3o2mf2zjbHUI3jimOgjjzcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841079; x=1792445879;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cirKv6oAlYOfHAjjQM1/HicHH6rMyk/R4Xzxdulpo9M=;
        b=MSYPpLFqrB5Qyu6Ox54W31jl5lmGoscCoDo83KnpgTy1LbFjXRT9i+xy1c0eVOA/fX
         N3Vtsod9yN98wG/bC84tqeK8wrdhDAF7cu4O+g6K27Art6yq7hXBq4+7DfcHVtxzhmhj
         HE+1jDrYlcCNn2tGgTti/MpPyq50QYg1rwd5y2RpKUqSRzLBQR/V4Uu2ku2MKz5KtdO+
         B4MCoORPSYqFxr7xxnW9+SyZO4c3tWOKLLoGaIXPJXyYOtkFw+nz1o/aRO/uijjDDuZX
         R8tKRkZnFQKWqzYneHklCYCKzFyI/INh+c8bXosdzV3RPJwAdhMbBCgXeOl29YcTgKgw
         xM3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMzna+lJSueWDKlEQYH8KmpIzHaZFhQo9BVG6rGoHtScnCrW2Lxg/7jPdUgugg/u2MWZqCmQxSnpOLcikexhHzEg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI8O9dZLBQVDpbX7va5j+D/ZNCgJxykB2YWv5OkU6KGDyceERJI
	taKKnjuFxsQvS3KPpcCsTyqv2v9s05Wr6kFubHynULvIS6VYO//qpHsp0ZRS/FLU/ME=
X-Gm-Gg: AYBFou3c9w9OxxgvMscvn1RHpw6QhubkIxHja2l5G0MYdBRLdRPMHvn/d8asikHAqEb
	5mD9ftLYh+WPK/9sSlZLAyzWFaRCEqLJWu6AHkrKzkb7+w7fpGDlabOEwtNrpK4scpwW5m8Dkz1
	kMSQ4cGI/OhlojeaKGkgcxV1bHQu6YX7WFpupmIsYj5LPAEkKLWuH2M2oneyhtAh8I+il9vNrIw
	+33BRglIF53oRHHH/NUssz8H5VmxVva3qIM6IlGUueGEbdy7H1P3FgNsKT3ZhPoOaUIGHtIrA5h
	SwOJtNWCucLglfHY5p5njLESlqanxPrFEXnrCqfFY6WauI9tbgp3tkz7akNGvjGNkojWwKbYrtQ
	sf+Z1P9cdOb1C7mPvPCdfA/iOoyf9Qm+/aRu2zzQvPfoOvj1IiZAmX5dY7TLt98UVsF5EUXMh+c
	BDdHIyQpAiL+qTQPwIsijmOqhM2wzJSvmYc5t0ulSJOL1FVOBvrC4WXjkGrntRvE3sgl6dw6VJh
	sg18T999jtJ2q09d7pLDf5EWYawJDHVRABz7zvIsiNAjas9ke7qeInjR07Qpg==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr204767375e9.11.1791841078716;
        Mon, 12 Oct 2026 14:37:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm581800145e9.9.2026.10.12.14.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:37:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 23:37:58 +0200
Message-Id: <DM36NFEVV37N.BP0VL0IXDWR7@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <souravkumar.pramanik@bmwtechworks.in>
To: <UpStream_IP-SP@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv2 2/2] glibc: Fix CVE-2026-5928
X-Mailer: aerc 0.20.0
References: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
 <20261005055601.111500-2-UpStream_IP-SP@bmwtechworks.in>
In-Reply-To: <20261005055601.111500-2-UpStream_IP-SP@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 21:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247689

Hello,

On Mon Oct 5, 2026 at 7:56 AM CEST, Sourav Kumar Pramanik via lists.openemb=
edded.org wrote:
> From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
>
> This change fixes CVE-2026-5928
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3D=
commit;h=3Def3bfb5f910011f3780cb06aa47e730035f53285]
>
> Comment: Patch refreshed as per glibc 2.39 source code
>
> Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.i=
n>
> ---
>  .../glibc/glibc/CVE-2026-5928.patch           | 105 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5928.patch

See my review of patch 1/2. It also applies here.

Thanks!
--=20
Yoann Congal
Smile ECS


