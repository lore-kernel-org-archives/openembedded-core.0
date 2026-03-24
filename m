Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE36E9A775
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:36:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17370.1774352175541922487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jdXGmWwa;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b5bded412so924920f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352174; x=1774956974; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzqBDLlzhDfRBXSqyBEHbYpyuZyL5b4vFGvmpVTmZqA=;
        b=jdXGmWwaCsBvOGdlTRepuywYIkkGBO8kLD9JlksnZcefR5AEH8sZAEInUjUgDeP9Ga
         C4aRS72YGhWXo39a1xO9ZijAmQ4tHgRHDPY0JGf3/KIyed/hLlkLhhhXP108YM9wbETN
         xoiBu5Xm1TH5nCflfQfrCFvWJEJtLaMGytarkg6SkZu1accEbfHdlgnOus1tcZqpPuf5
         g0u+M05A5MzNSC2ZzUwQA3zmEfhShqQrBpYyQXV1kUktV/SB5B5anBWazuY7EDSs/fLz
         uL7mAQ/u7vArsbqPSiZaIA8P0lZo51RTVYN6Y96gleTtbELVCh8vq4jMzDdaGlN1Rx2n
         uqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352174; x=1774956974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzqBDLlzhDfRBXSqyBEHbYpyuZyL5b4vFGvmpVTmZqA=;
        b=HKS4/ptXGdqnxyI8fFC3w2nFRNsjIlVo3aI7j7d1Bjt1z1mW+/km9zY1BEiidMIibq
         DVZpBcDmbDZLGvKnp92aBUf+VDhq4XtEe/BGf/PlVdTvbAjwLDMrSzXb6yPrt/Iq1JOg
         G0GEsI9wj5jE0VDtKhF3RxUttczyy9G0oLDnhHuCj2CMLxJMb9hrlzEdbSY9OivFYUMo
         3y4CzFpP+5munQYwlRWO98lP+ZscDXZ00UJ5jsA2aErzYnvGM6iwELPVXzzcmBHGL/w4
         CHd6k2WL+Gq0E1xs3OZJGo6DPXgA02KBj6PsOTZrlGq/TNLVFLx4EcTltQmd5yx4sf4r
         2AgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dEHoTEsiuFSdZngIdgCu8LyzVLSS/AK5dGDac3rKU1gX8gpCbFs5pne0preK01sA/4KOAST+ulXDsZyN323PHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKBSVia4crOEBNP+O6XLSNwJ1fAp2R8i19MyCeCDKtw6REnA4j
	fBZAPFZ5Ux1nJo65iA5a0O9CYfWYx+Ou9+NSkYdZg8p5sKkHMFifpAMK
X-Gm-Gg: ATEYQzxKVswF/Kbp5uWB2P9Pf4N2D+gNQzlABiFLrJRtcGUxc60Ot7hOTUiqMM06/m7
	QhFoRrjuklJ0YVNOr2yd6eLev2nK0jR0FiCc3dq4iQWNiaS/fiY4ZvJ3z7jacdwjE3lCiHVVNCj
	QEMX5SHtrKJuKGn5t97D/CY6mVn3kePJSYLTOU+dcdNs6CKBgBZMTItCYTTfyPl3cg6NQHRy+uR
	Cb47IGaJPBCA60nCIYABl44UIdPFLDadY4BM1fVen+w/2LbsnVXqOHCs0Zyk68kZVK6LW+9JwnI
	lub4i9L6uBdjEHSjEWTScwxJLvVk5CCjj9r6Hsexw7AftTVNvnYVSeh6a1ESO8bMyfvyXxSgN4q
	tr6vB487ojKDkj9cMFxh9xoW2lEc44ve9/k3RCaKcvSCqPnfe3DCSxTBactyHFolX3pUWHfbrCC
	bLMFoBdfEm1W+5P3PkMtb91RX6+RRdi4wqjD5auNex1KsWlg6BkOlvNH4=
X-Received: by 2002:a05:6000:2012:b0:439:b623:a9e9 with SMTP id ffacd0b85a97d-43b6423bde8mr25559717f8f.19.1774352173692;
        Tue, 24 Mar 2026 04:36:13 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm36459229f8f.37.2026.03.24.04.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:36:13 -0700 (PDT)
Message-ID: <590cb5e1-5ece-45d2-a5d2-60f42c933008@gmail.com>
Date: Tue, 24 Mar 2026 12:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] mesa: Upgrade to 26.0.3
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <20260324111711.2929939-1-zboszor@gmail.com>
 <9775bbc5-cbbc-4d61-961f-868c78123e97@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <9775bbc5-cbbc-4d61-961f-868c78123e97@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233794

2026. 03. 24. 12:23 keltezéssel, Quentin Schulz írta:
> Hi Zoltan,
>
> On 3/24/26 12:17 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> Release notes:
>> https://lists.freedesktop.org/archives/mesa-dev/2026-March/226616.html
>>
>
> Please add Reviewed-by and other tags given to earlier versions to the new versions if 
> no changes were made compared to the earlier version.
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Do not send a v3 just to add a Reviewed-by.

There was no previous human review, only a patchtest mail which said that
my patch needs a commit message, besides the summary and my Signed-off-by: line:

FAIL: test commit message presence: Please include a commit message on your patch 
explaining the change (test_mbox.TestMbox.test_commit_message_presence)

The v2 patch was because of this. I won't send a v3 as you asked.

Thanks!


