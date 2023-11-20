Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B850C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 15:28:50 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.53003.1700494126834289582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 07:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ljRZqGDt;
 spf=pass (domain: linaro.org, ip: 209.85.214.173, mailfrom: javier.tia@linaro.org)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc394f4cdfso32709925ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700494126; x=1701098926; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nn74mB9jpYvA1Nw2klKub3lB/fuGHoEHyf8DiG+W6Ks=;
        b=ljRZqGDt3Z0QQu3c8eeUV9SNb4SriV7XGH2r9h+JuGqwoch0dSe6xbKX8Bb8Rke/w1
         C9C/McQ/HqSzgZOHujDggPu5hEKVVjiUtRwRp3C0lM+lI59GVmsq5V8z+kJId7SwjnG5
         JK2EyFby9cU6acSOeLyUriF8Pa9Hr4p8v0QS8bJX4yo2Umntsj+6pt774//AfXhkSK4E
         X025y/rg15FOpwj1V6yu0H0/FQRogsSUG0U7rwv/20+zSv4vR4/4cTSS71hp3pETGRFZ
         ehj/ht3LbM4tpTziC8QkM7ja4p453W0ZTud7xOuJ9HHnh0c0EWFJoTibO/ngjS6tS38b
         TWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700494126; x=1701098926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn74mB9jpYvA1Nw2klKub3lB/fuGHoEHyf8DiG+W6Ks=;
        b=FB6c0rOGoXCB/Wg4jdEzOqqJEgRy16aeh55N23m2rH3Trji3L7f9BPihrIrx3u3QAZ
         2ULd/PkuYN0qC6kpfOgqNTZ3xeU2tSgZpbA50NFO8imUc93+9leZzUuuzgzdW28G6qvr
         3SB99PvCFwvP9nC+qB283IzjPeRxLt34RIOuEIlCNMNDjdBO0xg3tYmyVkFGw5fmjkbk
         Dj2eG/uWt/O6o8QvhMdofO1DId+amS+OBjQMK5k5CKKN+jjIS9vAMF80twLf2qTCleog
         f2LNj3WVjV8c0W33p33iqoxNlpmvq/HLn5pM8XMCeYWFKhKT+0y2W/188uYIL85a7Dk4
         JHmg==
X-Gm-Message-State: AOJu0YwE5uIueJZv49NMDUmKCgNtJuIJhfLFYX7WHAE65/pFbdskmZCT
	QBJ8HX9D0FRXkkU94YyIk23neA==
X-Google-Smtp-Source: AGHT+IF3KCp4zKL+kbmbULmMCtf41boC0zKQRDR4fojRhLws02BYj5smtjeN5xOjUi9d51nbOi7a0A==
X-Received: by 2002:a17:902:cec5:b0:1ce:5f09:ffdf with SMTP id d5-20020a170902cec500b001ce5f09ffdfmr8826983plg.0.1700494126264;
        Mon, 20 Nov 2023 07:28:46 -0800 (PST)
Received: from [192.168.1.2] ([177.93.3.242])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b001c5fc11c085sm6234327plh.264.2023.11.20.07.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 07:28:45 -0800 (PST)
Message-ID: <8aee753f-8ebf-4205-87d3-7988a46e3676@linaro.org>
Date: Mon, 20 Nov 2023 09:28:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package: split strip cmd when ccache is used
Content-Language: en-US-large, es
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231031042735.3842176-1-javier.tia@linaro.org>
 <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 15:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190882

On 10/31/23 06:26, Richard Purdie wrote:
>
> That looks very like a hack/workaround rather than a real fix. The 
> packaging code shouldn't know/care about ccache.
Took another look at the problem to find a proper solution. Removing
CCACHE from KERNEL_STRIP along with the rest of the KERNEL_* variables, 
except for the compiler.

As of right now, ccache is limited to compilers. Attempting to use it 
with other tools is not beneficial. I received the confirmation from 
ccache's maintainer. [1]

I will be submitting another patch.

[1] 
https://github.com/ccache/ccache/discussions/1346#discussioncomment-7616180

Regards,
» Javier Tia 🖋


