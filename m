Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A7C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 10:34:45 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web11.4599.1637750083015656668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=Y2hToUNy;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=q5Ad3OVRDvvDi9Wle9cDmLqIiy2GAOFaCxi3e+0AdVc=;
	b=Y2hToUNyrhRAdDWXqZk3tEO+VKE3NonYWkALAyZfxiHH2oAIbt4Ve/CSs7lCrvge4iECN4Bir/LZK
	 PLNbIeEB/vRAlqphLReniMfMjYX3wq2ATbE3uAEpGPktFtUcEuoUIH22yvAFaKjX6JNyZMXC0qtmW6
	 776mWa+F9Jr1I58vjT6ebC0KfhU6JHnlQw7DlxdpdyNN5DAHdKRxRdTv9jKgb2PZZnhthp/WMHD7JI
	 HkmeYIh6YUaUA08t01z1wZRs9BYGY8kmaEE5rlywNKPsBuHT41TQnZ4B9FNLiUxB5ChUEWQ6Y0KIGO
	 QsXcPBSjJibCjShd1oR3CA/xI6DyEEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=q5Ad3OVRDvvDi9Wle9cDmLqIiy2GAOFaCxi3e+0AdVc=;
	b=GrmL8U9Xx8SnOyXuIKbWcsqw3hNb1Q1hGE7qa1zTpG9lcu1sKZRcjBgYD5dBEQeLvJcTw/GlqWNBg
	 pJK96z6yW6kRUNjzqYw8w63sv3jIlbUc7BC1k1mBktocAfVzPhtTjUFXsWlp+iVByLoPg4+8X0QF+X
	 LvzYomHZykgKL3ui4a1BXVBSxmTJLuRiHePfFM3SupAzSPijHXrUINCfxY24ViGR7uWdigqmwwZ5QI
	 x7uNu73Q4wCQj7dex140ECRIeF7bwJfSXnfb5EdIEj+w9bLneSHYXloEfZLMuWtFsy3AuSCisGFC+Q
	 c3AQW89QbY55PjTmqEWq+LtCW3zO/mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=q5Ad3OVRDvvDi9Wle9cDmLqIiy2GAOFaCxi3e+0AdVc=;
	b=nsP5P5D/KFJ97bSBqMofq5uyu75GKBZJtaGy8frAqWBqbGbb/JCuxiAcdTThXSaKpYOMJIUiO1PGW
	 cCjcDgGBA==
X-HalOne-Cookie: 721774920b77742d4b0e4dc72c4f77f4c8bb61ae
X-HalOne-ID: 1e457938-4d12-11ec-b7dc-d0431ea8a283
Received: from [10.11.12.89] (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 1e457938-4d12-11ec-b7dc-d0431ea8a283;
	Wed, 24 Nov 2021 10:34:35 +0000 (UTC)
Subject: Re: [OE-core] rust in SDK
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
 <CANNYZj_qUME7wgpfra73y4WbQ67wY79Xb0aXu9Lj4VJpuTwkMQ@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <959fcf95-b4ca-1cde-59c8-7104d4675692@berginkonsult.se>
Date: Wed, 24 Nov 2021 11:34:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj_qUME7wgpfra73y4WbQ67wY79Xb0aXu9Lj4VJpuTwkMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 10:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158687

Hi Alex,

On 2021-11-24 09:04, Alexander Kanavin wrote:
> Yocto is what you make it, and you shouldn't expect things to 
> magically happen if you wait for them.
>
> If you are able to make rust work in SDK, adjust the docs, the 
> readmes, add the tests and examples, and send the patches, and then 
> that's the new status.
>
> Alex

I'm fully aware of this and would like to help out and send updates. As 
I find the current docs a bit unclear I just seeks information if I'm on 
the right path. How other people is doing this or if I'm the first one 
exploring this task. I had no assumptions to let someone else fix this.

/Peter


