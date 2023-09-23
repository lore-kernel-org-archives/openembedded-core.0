Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D3CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 17:16:32 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.25049.1695489384128583062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 10:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=AYpFaUEG;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 1FF225F6;
	Sat, 23 Sep 2023 19:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695489382;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=1115; bh=iIsQOfrKw7GhF9VQkrG01rWp3MzxZSX7wNqHk9quhBg=;
	b=AYpFaUEGOCpSzQDtHvQcLkdRsMPhsSJWeCMC3s7iluIpjcBixswnWIIADUoet9jX
	yOUPhSgX1jF/2fiEtIGF8iJRvL4+MjQS+AIY/hUPADK0w5PRegPGBJs2kkGBichH3Xa
	qfX+Pqn1q24V7cDHAUiKDeRA+tw41TaJIb6PQ84aDtGNRtJmYSgnEaKnQoIw87nZk4F
	gw4QzmEFrxs24Rhtjndn0jCpUy4L+QsJOfWaD/ufZrpEcLa9QBbb5XtAzgPOIi7/5fs
	ZWKOTvJ75rqo2xclvmUVwCfQUON+ZAOs4hUWfl1xJurXYxRbPyfM7UTORphzQ5JjzjP
	OuRmWssr4A==
Received: by smtp.mailfence.com with ESMTPSA ; Sat, 23 Sep 2023 19:16:20 +0200 (CEST)
Message-ID: <3affb0c8-a454-42d1-9cc8-cd3ca017256e@redrectangle.org>
Date: Sat, 23 Sep 2023 10:16:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
 <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
 <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
 <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org>
 <8020b725b64f722d6eded90a5b92b38c758da0c9.camel@linuxfoundation.org>
 <8ceb1c53-6a41-4c8e-88a7-ec8e190542fb@redrectangle.org>
 <CANNYZj-JEaB0ui+f0=NT4-7_hu0UL0EDb0YzNQ0KFXGJWr+zRw@mail.gmail.com>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <CANNYZj-JEaB0ui+f0=NT4-7_hu0UL0EDb0YzNQ0KFXGJWr+zRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:454140407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 17:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188151

On 9/20/23 10:12 PM, Alexander Kanavin wrote:
> I applied the patch on current poky master with default config
> (a83a16b7939e066b6686b62ae7ec66f12ef34f1e) and ran the tests locally:
>
> root@qemux86-64:/usr/lib/curl/ptest/tests# ./runtests.pl -a -n -j4
>
>
> The failure I am getting is:
>
> test 1964...[HTTP AWS_SIGV4 with one provider and auth cred via URL,
> but X-Xxx-Date header set manually]
>
>   1964: protocol FAILED!
>   There was no content at all in the file log/3/server.input.
>   Server glitch? Total curl failure? Returned: 48
>
> So you should be able to reproduce this. Did you rebase on my curl
> changes that landed in master recently?
>
> Alex
>

I didn't have your commit on my branch, sorry I should have checked 
that. I rebased on latest master and am now able to reproduce this. 
Adding aws to PACKAGECONFIG does fix it for me, so I think the test is 
just running even when the feature it's testing is disabled. I'm fine 
enabling aws authentication, upstream enables it by default anyway. I'll 
send a v2 doing this.

Thanks everyone for the help on this!

Robert


