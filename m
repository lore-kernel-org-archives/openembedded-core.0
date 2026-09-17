Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F43C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:35:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42609.1789659296915771957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FXhEilys;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so9238265e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789659295; x=1790264095; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJWylsdrPk8uD3fB4qcnBgVz64EjH382WSYPreiXWDc=;
        b=FXhEilysUFdIwXeBRXx6Ayq6zKLJ+VV4sBc/CxczgAcnFFPRR6QBBaeRTICbvo2vbQ
         O0vx/SCpTwer9yis6lfLb2JbQJSdvBQZdzX/cfkbuuDj1mWdJoVFNtt3KikTsNYkrZ8o
         3a8u0dWNaYJC8aPkCntglhJeJgxh1NDfm5OQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659295; x=1790264095;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJWylsdrPk8uD3fB4qcnBgVz64EjH382WSYPreiXWDc=;
        b=GA5P/IbWd+FAW4G1OgVBJj4IvK5aHteoRE7EguwygagiKawcTBsd6lqXZX3B9OIs5v
         2iLJ27HxaiFP/V2dSu2fVd5xHk1s4kvMasEHVdvQu556+NOOTai+POK2a7lUziFWZINf
         7rqkHFnH8dFpRbQkTit5M9Mx1ykX6sQ4pRpdckdCDaYTfnKWrtofmose7BYltfcYyP6e
         whZ78qVBxnS62hUb99O1nFwKTZqq5bYzTYMuWiUf0qZh4d57hEuyJ+sTr6hgO2mep5D0
         U9fjWhyoFCVqB+LNh7f/XBg7gnv99NokcG2ZaOcXRAwPQQ/dfWq8KeOvYkO71dvG5prx
         /mtg==
X-Forwarded-Encrypted: i=1; AKwUvBwKwcNVgOeOQk/GxWNTCqkGGZunIk+aSZnjMUnZWqv2aZvGxWloDdD39lxstdx3ZDxN8x93iDvuX86aCnh7kM4QTw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kf2X716qxS60x3t3icakYztZW3BrneusxlCV+MXiLc7htPle+i
	aZs3Axt1ST2yoX9ksZnWsxoxk1SASfieZ/SlpJ4jAR0jIrdwo+O5WFjeT58bdYrCKfM=
X-Gm-Gg: AYBFou0K7pFPC5o3glqQv3EFMbqmesj9+dVDX29Szw0I8i0ihCfDwYtNLcn48oTP9P0
	dPilSrvp193UuCAdIwNnaF+/PdeZ1FOo0rx5Ss9Ey+JA4qLNZL0mTDJk/5+vb/A/rWYL+u3Gw54
	Nys8HsiQGtyQH0/DhT6U9I5oE/bTJNX5QRJtSpDTdnZpiDNtqXaM5aLUlZdJ8KuCVlNSFnh+Sx6
	JKTiwk9BWX7LyQUXZ1hmCK6n6FqTmD7mAvVOSDOBPOWWXVkZIlWuxd6EgR5GaBiBww+A7Q9sq0f
	5+EfNCCi0dVmM52vDmD9qvvBjuIjg0HbA6B4mi+Lp5WTIq77i2ScihIe8wICCkocDN2B3WWvcze
	+n5/LvpMktcWewAfXMiQDbQFPUgLUC0RIZLcjCbwU5TdGgwIPysTp3VnVgDcVLRE8e6PLdiHzv/
	gE7jm1vsZcv46l5miEhnUGwhGKZFxjVxq9m+GbFkWnIipibBAm7848YWpA7tXku0uerCGmLTqX1
	Q4Bvxedfb8tCkrou5ICSD2eHrRQk2mAqjcikfr9tgn2lO0LwG9DoQfllQcN1PI=
X-Received: by 2002:a05:600c:1f83:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49eb7306966mr82516495e9.12.1789659295115;
        Thu, 17 Sep 2026 08:34:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm60321425e9.0.2026.09.17.08.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 08:34:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 17:34:54 +0200
Message-Id: <DLHP9TW29FBH.3BUNJA3OD49Y6@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
X-Mailer: aerc 0.20.0
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
 <20260915191623.42107-7-jaipaul.cheernam@est.tech>
 <DLHLPNY1MXSH.3FU70J9S1LKQX@smile.fr>
 <d8bfee70-6f8d-4f2e-a854-e644609a2d6f@est.tech>
In-Reply-To: <d8bfee70-6f8d-4f2e-a854-e644609a2d6f@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246076

On Thu Sep 17, 2026 at 5:23 PM CEST, Jaipaul Cheernam wrote:
>
> On 2026-09-17 14:47, Yoann Congal wrote:
>> There is no need to detail changes happening in the context of your
>> patch (unless relevant). In this case "Notes on backporting to 1.10.6:"
>> on "bogus instructions" is confusing since this is not something you
>> changed during backporting (and is obvious enough).
>> The note on "CHANGES/changelog" is appreciated but obvious enough so it
>> could be omitted as well.
>
> Hi Yoann,
>
> The "bogus instructions" note is noisy, not a real change on my side , I=
=20
> should have dropped it.
>
> In future, will keep backport notes on point .
>
> Same applicable for scarthgap series as well .
>
> I can rework on that and fix if needed as its not under review now.

I'll soon start working on scarthgap so if you can send that quickly,
I'll take it in my branch.

Thanks!

>
> Thanks for pointing out.
>
> Regards,
>
> Jaipaul


--=20
Yoann Congal
Smile ECS


