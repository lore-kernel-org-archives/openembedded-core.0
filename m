Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2582C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 14:34:59 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.4352.1653662092478332524
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 07:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=BnU+H3US;
 spf=pass (domain: northern.tech, ip: 209.85.167.41,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lf1-f41.google.com with SMTP id c19so7205722lfv.5
        for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zC0FSxKpLoe/OXKoGtYlADScSGk50YeMee0bEQXkC4Q=;
        b=BnU+H3USMqUcvaZMyebgmmWgWFoZT7EFXoqBpIGjwcKxcS34lZxddVZkM/rX3llu9x
         1xNwKbJDgDFoHtmM9zjuKa2JKV5bKzlLeVxtfJ6KjQ0oBgDYBPm38xrqOxI7P3N5AsCX
         C/015rXs3ARlX6U+McPUCmvHNxNLIA631kFzxthl2naNXH7C3nIGWIbE4BMrWxqKl+wz
         bfs3KaRTTtEtCJlKxnEd1VqEFV5yn5Jed1uKnXscAit3rL4geAlcoOuT7/QzJqoK7kw9
         c3VkZOwT49mGuCj1EH/eLolCrZ7uehmia84kPNFOA3BFZr9eJEyf7vTnis6vSzoevusP
         xFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zC0FSxKpLoe/OXKoGtYlADScSGk50YeMee0bEQXkC4Q=;
        b=fueRLHiSUyRKStEs6tH1aL/dMY6Y6EFTFFjNCDZGTTZXe8QCOV1rmSE6CplX3bYldp
         XfYVmxKKtllAV46nrjk4i/rh9TBBqXDCPqK6qCogYQIevzdF3jVU87KqS8ISdo41dYnG
         Io1db7jpe4tQvzku70at9yrGB4oNmexcYQ1p/xE5FFKQwkWAFKpZWekrdaKDWwLmI2Ip
         72aGuj5Gxzcwn4yQKDMQOzeTB6ZIO/I5Vx3PPAaQYIHcVi4yccomt/nurg3Fg7nMZgpm
         LngBqM+yP1Lc8UO4NS+peFTa5FAbzad3Oxs+BwSUm3/YYhQFxSnVonFtI5SXg8g629MF
         AmNw==
X-Gm-Message-State: AOAM533ooLpA6BzFQPpIQ5SLJPwT2xj8FLGXLQOvrPO4Xpcx/TgaxDys
	gzaYSdDH6sGE/0iW/HH3k9pecw==
X-Google-Smtp-Source: 
 ABdhPJyAHCYvpN9abnsKK5BbhT0B6y7pJ+fd/HBicVNv+TufVJIV0z7XLVAWQDI9f33+/9w0DBkryQ==
X-Received: by 2002:a05:6512:1509:b0:443:e7fa:1c68 with SMTP id
 bq9-20020a056512150900b00443e7fa1c68mr29736662lfb.58.1653662090472;
        Fri, 27 May 2022 07:34:50 -0700 (PDT)
Received: from [10.180.37.36] ([45.153.104.1])
        by smtp.googlemail.com with ESMTPSA id
 d13-20020a19384d000000b0047255d2118fsm893873lfj.190.2022.05.27.07.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 07:34:49 -0700 (PDT)
Message-ID: <f9566951-ab8e-10fd-5611-029e5b7a2685@northern.tech>
Date: Fri, 27 May 2022 16:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] externalsrc wiping out external source directory
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
In-Reply-To: 
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 14:34:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166210

On 27/05/2022 16:19, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2022-05-27 at 14:07 +0200, Kristian Amlie via
> lists.openembedded.org wrote:
>> Hey all,
>>
>> I have a problem on kirkstone where using the "externalsrc" class wipes
>> out the directory mentioned in EXTERNALSRC, in other words my personal
>> development repository.
>>
>> I have traced it down to the "do_unpack[cleandirs]" variable flag. This
>> flag is supposed to be removed here [1] when using "externalsrc", and
>> indeed I have verified that this is the case. But when the function is
>> about to be executed, the "cleandirs" variable flag has somehow been
>> restored [2]. This causes the directory to be removed after all, despite
>> the attempt at avoiding it.
>>
>> At this point I'm a bit lost, I don't really know what happens between
>> those two steps. Does anyone have any idea what might be happening? It
>> sounds like a pretty serious bug to me, wiping out things in the home
>> directory of the user.
>>
>> [1]
>> https://git.yoctoproject.org/poky/tree/meta/classes/externalsrc.bbclass?h=kirkstone#n93
>> [2]
>> https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/build.py?h=kirkstone#n191
> 
> That certainly isn't supposed to happen. As you say, the code is
> supposed to disable that and isn't behaving as intended. It is hard to
> say more though.
> 
> Is there a test case you can share with us so we can reproduce the
> issue? Without some way to replicate of more details of the environment
> this occurred in, debugging it will be very hard.

Hehe, I suspected that would be the answer. I'll try to come up with 
something, but it might take a day or two. This is in our quite complex 
build farm setup, so I'll have to pry out the specific part which causes 
the problem.

To be continued.

-- 
Kristian

