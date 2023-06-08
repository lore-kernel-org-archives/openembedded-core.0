Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DD4C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:56:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.7056.1686225409263318311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=MvfZ7QBL;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so4474335e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686225407; x=1688817407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u29ZGrh3PNfSFl6mDQVNcUkCn3muDKNH0su1wpIcXwU=;
        b=MvfZ7QBLX1o18dnqmnr+pSkbKttiAGktmayHP7YjH81T+bUN/DHmgXpYYkWIgW9QBm
         c1p+dFpClJIPihMFVufVoZ4dCOBiqLn54tJJMo2G6DwiMEDU63J5PR7SfLYcUjM891+f
         asDMJ5rFfe333+Mk7XnyA3i5887Gg9M2G5itJJG3SOvGsq4DuiXcpOH2juYtdlUHiaea
         pdL7Lu3mahFISlkwzGk9XqUNBEmTSjKmXTT5LeW3+fuFBVGfOwM4OCNgT6ZwEAo+5XKv
         wsP2l8NdkUzJastsmbf2RnXMhd3fSr5pZC861mQrCFpUx1Mx4ZJGr/dJCakoOiQ4Op7S
         sMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225407; x=1688817407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u29ZGrh3PNfSFl6mDQVNcUkCn3muDKNH0su1wpIcXwU=;
        b=LZafhwc7zUivYToiwFZU0zBL0uLavYeLjn2Dhd4Zwq+rnY4EzLu6j8LH43uNCBLLhT
         3lKpjvBwICbx+7V+RYgFZxIb/eI+wfpQIup3uLCWMmTTgBJYtbTzICb9Jrhv4qXDVua8
         5DSCODT6sBqcEpQxEnd0Jid5RVjPivcsYj/e1I6elPMxIKnNIcqr7jprMH8W4akd9TPG
         iJkUVaPP794eE9rGR7adL3r+pl3d9dhdimBuznHqUp8FGrVmop9rlyRfi+Bo1Qy6+0xc
         inNIeEWdjJuUXZTvtX86OJq04TKlfCJ8VEjCeZrduqcjfwPNXIxFIYRjPB5PANP+dB2z
         N2LA==
X-Gm-Message-State: AC+VfDyMRcVQbDT0/BAdM2LeKlCzPknpszNamER2vHZynEpSxhMs6VfK
	uAmvKAJ9HNP8GvSLUurhqCk7Aw==
X-Google-Smtp-Source: ACHHUZ54VSehtEzsHSYqONlRK5EzDVmzDoKHnD9/cEhZ/wfczeyJkcw42Xkq4fHBUv1JbUzmV8cV8A==
X-Received: by 2002:a7b:cd8a:0:b0:3f7:36ae:de6d with SMTP id y10-20020a7bcd8a000000b003f736aede6dmr1443187wmj.6.1686225407577;
        Thu, 08 Jun 2023 04:56:47 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id h4-20020a1ccc04000000b003f7ec896cefsm5041633wmb.8.2023.06.08.04.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 04:56:47 -0700 (PDT)
Message-ID: <74576333-4bd3-dcd8-b581-85e1bc289e41@baylibre.com>
Date: Thu, 8 Jun 2023 13:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [OE-core] [RFC] incorrect parsing of sysusers.d in rootfs
 generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 tgamblin@baylibre.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
 <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
 <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
 <63764037-0417-ef4a-30d0-1fe74d7c9825@baylibre.com>
 <c914f55e1cf6a1ef38a2c683d42ba315a204a182.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <c914f55e1cf6a1ef38a2c683d42ba315a204a182.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 11:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182505



On 08/06/2023 12:36, Richard Purdie wrote:
> On Thu, 2023-06-08 at 12:28 +0200, Louis Rannou wrote:
>> Hello,
>>
>> On 08/06/2023 11:19, Richard Purdie wrote:
>>> On Wed, 2023-06-07 at 17:16 +0200, Louis Rannou wrote:
>>>> Hello again,
>>>>
>>>> a python solution could be one below.
>>>>
>>>> Also, I found that most of users/groups defined there are redundant as
>>>> they already exist (such as root). I guess they are defined from
>>>> base-passwd. I am not sure which recipe (base-passwd or systemd) should
>>>> have the precedence on this. If it's base-passwd, perhaps this
>>>> postcommand should check first if the user does already exist.
>>>
>>> I'd say base-passwd should likely be the winner but we should probably
>>> error if there is a conflict between what sysusers.d and base-passwd
>>> are defining.
>> There will be some conflict. As an example the root home directory in
>> sysusers.d is /root.
>>
>> Some others users/groups defined in sysusers.d files are already created
>> in recipes with the useradd class (such as systemd-resolved,
>> systemd-network who are defined in the systemd recipe).
>>
>> In the end, almost all users/groups in sysusers.d/* already exist.
>> Perhaps it's a wrong way to parse this file to add users. In my opinion,
>> we should only parse this file to check users/groups are already created
>> and raise an error if one is missing.
> 
> Perhaps lets start there. The fact different bits of systemd are
> configured with different home directories is a problem we should
> really fix though and ultimately that probably should be an error too.

Concerning the root home directory, I asked a question to systemd 
https://github.com/systemd/systemd/issues/27959 and LP answered he 
doesn't want to support a customizable root home directory.

Should we patch systemd to match our configuration, or should we change 
our configuration to match systemd's will...

Louis

