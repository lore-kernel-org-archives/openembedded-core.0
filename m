Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69D1C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 20:16:01 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26171.1786040973879175782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 11:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20251104.gappssmtp.com header.s=20251104 header.b=ujnaf04y;
 spf=pass (domain: elder-tomes.com, ip: 209.85.160.50, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-458de93b53fso1209129fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20251104.gappssmtp.com; s=20251104; t=1786040973; x=1786645773; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxwynYfw/kIm5s6U/YwntsF7qThveJrYDfs8GebDVrA=;
        b=ujnaf04yFr5NUoUXRA6+6mVBghyG+SSHwKvpGG1Y/Q9CVLrbauGO/3Re2J5PjERGnN
         jGSc6MrfhE4gLNu9oXiwKRx74fIPoW8Ni9MS0nRnqV+mO2zNcf4dpoqrZi+DwSqIQKVI
         IBqo/8a3FlgBwlEFtnGHnDiitKUoAiO527KO85kIgSYC6/xblpx/biJFjuQlgk9QU8Dp
         8cxgilPsjnHI2o5w2ybz5MOlJcb84IhnP64wbSGzCwehag0X6KZaVAXJOfYlfiSb7uQk
         UzRcDIvnheKimujrArrqcfogSu6U7GoIhnTnq8yPMZ+GJvo/gHsRYCW6HzvlKN1zp1Iu
         4lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040973; x=1786645773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxwynYfw/kIm5s6U/YwntsF7qThveJrYDfs8GebDVrA=;
        b=lVieINhnIYJnaAmbCVcRd47I0YlrLtVJbDFntKa9vyGuMmD6rpmgLR35lG8OOQYEsG
         aGdpS+aIXk3+HeS44k6Af4CggWosMotoXDbD8+Bxmk64hRxuXbxUdwUR9ifiSz/PWy8K
         g9t9Q1EQJgshl7oayJZtjGY/BDtRkGgBu4ckhpapBgMHW9gCo1K3a2K9dwf1+n6g3dbG
         n9zdzdj6Vf6hpXT0mg5EhSbnsZE4E1RyRz2qMcz1JdjuMmif320HxU1hyCU1iZ1HtXdz
         RS8TbCWLCb35ax5MEX+bS9VZLqBj+zjvmcAm8cY20lce2m7VtZzIZnzRELwm34uPPN7S
         cCdQ==
X-Gm-Message-State: AOJu0YxtkmUQtMJ23x1dF3Y38LvB+hy9TMT5NQX/a/E3Tb63MdXCOV5H
	8n1RckuB4qmpV70nHwizhyfJSzwKn7kWDSRzgLC8aJg61LPgiA39Z225eFL9teYYGSs=
X-Gm-Gg: AR+sD137agZIMN+Er+BAmrF4Vcc2jREbCVrLWhyMZG8XVxmF88DHtX4hKaOBYz/V2WJ
	qfFsP/D3P7w+Zh/6HPtYL7Tiw1NJrRofcD+udZoVYcnBTRWLPC93cbNna/Nc+RYhVcqkHXMFrBy
	TinnlxtcjysekuHv51/UNXng6FMHdhRqv6zsrAcPNReNjKgOk2qp/yyx6pXu6L4N3BYiwnX5LSo
	c/zgvQ1WpyrwEQ9JM/0XDssDk/7YyDbVKXo9Qdk99z804C1x8ZZwjktTFusKviIwci+iY1Z9kCw
	/h8a0LFnq/z5JKFTfGmd4AlBjgneM7x2+kEyW6phV5QuujO6N1jBO+e9jy7IosJtLITDh2Cdm6C
	7Ot7tfm+GhnBcLxCJolD8rvclgeo5FHPfrkZiNVEr1GJuQSg/TzfvOWIIuMPzRcSFwl5AnHTOh5
	LBmH3Ei5XRvQN4BLqc+AlV6R736KA+LLZPnk+EMFZzU+X8BbG39SM2eA5Arf0BuldkKJOtKwQs5
	bFLlClpuFzkbhQXvgE2WUUYO3nzNIzXTTX0T/CA
X-Received: by 2002:a05:6820:168f:b0:6ae:8b66:8726 with SMTP id 006d021491bc7-6ae96fe8277mr8720040eaf.18.1786040972714;
        Thu, 06 Aug 2026 11:29:32 -0700 (PDT)
Received: from [192.168.0.86] (ip-204-57-18-28.co.bambroadband.net. [204.57.18.28])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02be8ede0sm131614eaf.12.2026.08.06.11.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:29:31 -0700 (PDT)
Message-ID: <d1a58bb1-c43a-4fbc-920e-fd7c3514fca5@elder-tomes.com>
Date: Thu, 6 Aug 2026 12:29:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
 <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
 <16a7dbd0-b8eb-48a7-95d6-25cd3a8d446e@elder-tomes.com>
 <66486dfc-0228-496f-bbf8-cb2545904947@elder-tomes.com>
 <48190e0d86d61c3e6fbdd2a1f12f40f7a1899b5f.camel@linuxfoundation.org>
From: Levi Shafter <levi.shafter@elder-tomes.com>
In-Reply-To: <48190e0d86d61c3e6fbdd2a1f12f40f7a1899b5f.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 20:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242969

Hi Richard,

That makes perfect sense. I'll take another look and see if I can find
what else fsck might be doing to increase delta.

Thanks!
- Levi

On 8/6/26 06:39, Richard Purdie wrote:
> On Tue, 2026-08-04 at 15:45 -0600, Levi Shafter via lists.openembedded.org wrote:
>> Hi Ross,
>>
>> I'd like to bump this patch and ask if you've had a chance to review my
>> last message. Considering additional delta beyond differences in
>> timestamp information is observed between builds, do you think a toggle
>> that allows for a choice between problems represents an improvement
>> until the path to full reproducibility with the fsck command becomes clear?
> 
> It is really easy just to put a conditional code path in for every
> issue someone encounters. The trouble is that if we do that every time
> someone encounters an issue you end up with an unmaintainable and
> untestable maze of "if" conditions.
> 
> It is easy to argue this is just one more conditional code path so
> people can avoid an error but they do stack up and I'm still very
> reluctant to add conditional codepaths unless we really have to and
> there will be a clear number of users for both paths.
> 
> In this case, it will create an obsure variable only a small number of
> people will set and lead to fragile code which is easily broken.
> 
> I still think we need to get to the bottom of the issues with fsck and
> the only way we'll do that is if there is some natural pressure to do
> so. I'd therefore still be reluctant on the original patch.
> 
> Cheers,
> 
> Richard
> 


