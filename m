Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EDCC6FA82
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 08:22:27 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web11.1256.1662193340166373730
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=nRSkZNzw;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=gpJ9UVkdDn9LqctzhUTFdyD/PUtMf3gGsNzopJX4vMg=;
	b=nRSkZNzwLvEk5tOXtKc8IlgagiRPOTv47hc34WxIsKH6xLiIoktVKIkHiGocAZhjUPMo9C/AR38tE
	 d2SEdbRby98dVIzPfAiBJhNPK2ZFPVkyO3jIQCLHvuZiaXUtx8NLkkyxnrDoPWBmdZBfUypaHEuRzB
	 kQ4vySzCW1cWSdl7v2Ww1SKn3dQy4yyWbSHlLKCgFubq83Shm5j5Ldvx6CKGPEazvrcdDsH627F9nV
	 WJRZtofMN3T9/3vi4w/q63h4tCny0CtuhUtIu2E1QSfXb1QQESpqb9t/eLCR5jQ+jW6g2lFFOv4Kuv
	 K4RIrpkjDpR7DmNbpliDFRzpZE3tTAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=gpJ9UVkdDn9LqctzhUTFdyD/PUtMf3gGsNzopJX4vMg=;
	b=dQhnseS0vHK9sPQMylTjykBJtoMxIBHAtnR+v9O1kZXgITlmSPMFwjPW3T48RncqoA9MLJ6S/kq1a
	 6YgzRIwBg==
X-HalOne-Cookie: 6379d5135bfdf27681f0fcaef05a21e15dfa8309
X-HalOne-ID: 852f9a09-2b61-11ed-a6d1-d0431ea8a283
Received: from [IPV6:2a00:801:2f2:53a8:cbe8:646b:c89c:4bfd] (unknown
 [2a00:801:2f2:53a8:cbe8:646b:c89c:4bfd])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 852f9a09-2b61-11ed-a6d1-d0431ea8a283;
	Sat, 03 Sep 2022 08:22:17 +0000 (UTC)
Message-ID: <1b3ad5b2-ce2c-c011-608a-5fe23ec87afd@berginkonsult.se>
Date: Sat, 3 Sep 2022 10:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220823085636.30868-1-peter@berginkonsult.se>
 <20220823085636.30868-2-peter@berginkonsult.se>
 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
 <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
 <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
 <0f4a63bc-4be4-126d-a403-804f75140a53@berginkonsult.se>
 <17110E74E03CD5FD.12033@lists.openembedded.org>
 <43bf3206b5905ca67bc1c7e50e9d0110c8950bb0.camel@linuxfoundation.org>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: 
 <43bf3206b5905ca67bc1c7e50e9d0110c8950bb0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 08:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170266

<snip>
> I was able to confirm that fixed a simple test case for nativesdk-gcc
> on i686 so I'll queue it up to reset the rust changes.
>
> Cheers,
>
> Richard

Thank you Richard! Great that you could fix this and we could get the 
rust tests in.

/Peter



