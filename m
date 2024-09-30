Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42467CE8356
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 14:49:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.56432.1727707764908227943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 07:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BZ44PQLQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cae102702so32860415e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727707763; x=1728312563; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCWlzncW0j6XYoyR7/gySOOMaEYLy1ivKayEvPKknUw=;
        b=BZ44PQLQkMSpBg2RTPKt4dUxcpQCLe90OrvNVuWfj/bY4TKKlSb5dHFmQXLuV1oWYm
         YPKC69drmp/435pHwxxJGepARObTDLa/uvr7qJX/1JuyJapOdsGT7Iqqpi8ZTY3vxDgT
         ImiVzLtp1B/Lj+8JWo2HfKH8qSNZYVt3noER0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707763; x=1728312563;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCWlzncW0j6XYoyR7/gySOOMaEYLy1ivKayEvPKknUw=;
        b=rofDkH+87cFfGmvJrB97RpPb5Vjz0rxDs4PjGeUteXr6oflKh5FDd/kRn+o++VitZU
         NAO3K7lxv7IKDqTJ2KvNpgKl9BbrHHSlRtihl6vTx9HDP2QUZTqBuCA2j4yoE2GcCNPa
         SI3GmzW2in+mRJ6WnoKx2UQeUvl1qIiqH5dSMYdp9Undt2A5sVWBI21drAL4HxnYgG/N
         99D2kAvX/zk+CTDzb1mh7Gr9Rk0GRoLf0r4Mfog9Q4fxI58bZoFsmQO+T2odfgTLAJxi
         C9NVYEiVyuDaR4FYIfZSRC6wf/ieM0s4/zzqy6+StHCm2dhGyqL1jYjr740H9f9g6KVp
         eI9g==
X-Gm-Message-State: AOJu0YzYxvFIP0zBE5iiHsGiKupxAEFz1ruuMj13tS1jIPY+A/AC/7rR
	fh29urbJYucwSe3mGxve/V96znt4EHwJ7qrXyrvREZyISNRHKWqVEett3SgnZBM=
X-Google-Smtp-Source: AGHT+IHLRXGU/Uh2Yluj5dlziCf88nw+JIkGjhOmiVBSpWtLvCZ3Aa8IlSiMimQbdzC3SIBidH+WpA==
X-Received: by 2002:a05:600c:348b:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-42f584646b9mr83639205e9.24.1727707762936;
        Mon, 30 Sep 2024 07:49:22 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dee0d3sm103921325e9.28.2024.09.30.07.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:49:22 -0700 (PDT)
Message-ID: <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr>
Date: Mon, 30 Sep 2024 16:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240930091015.21148-1-yoann.congal@smile.fr>
 <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 14:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205120

Le 30/09/2024 à 11:20, Alexander Kanavin a écrit :
> I'm not sure I can support this. It adds a lot of difficult to
> understand code with the sole purpose of dancing around the build
> failures, I'd rather just fail the test with no attempt to salvage
> reproducibility comparisons and keep implmenetation simple and short.

The problem I'm trying to solve here is the reproducibility of meta-openembedded. While oe-core world is always buildable, this is, sadly, not the case for meta-openembedded layers. In order to move forward with its reproducibility, we need to know the reproducibility state of as much packages as possible.

Do you think that goal is worth making the code more complex? Do you have a suggestion on how to approach this? Making (and keeping) meta-oe build every time is the goal, but history shows that it is hard [0].
[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155

Thanks!
-- 
Yoann Congal
Smile ECS - Tech Expert

