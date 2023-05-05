Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B22C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:21:10 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.2133.1683310868125078561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=NZfghcFr;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-74df951e897so100938785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683310867; x=1685902867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LwaB3gFsg1akS6+DPiBettMKS24YpzUR+Suo1VnVp0=;
        b=NZfghcFrqTJ+5m9U2XRKOYwtq1jjhDlHyc521yJWGUSsGVoKp74HxoQ+t8YIDmGEQH
         GLSKkpvSHd/QhAl4+xg1qffR51kfGwHNAfMeA3wl9fgxuaxYrB8cEPkP140J+rQRrIZb
         jexxOPIOln0GUkrDrDnZWhLAUGeiAj3fTou8+Wruxc7/W32Fj65UgwqS431P9b9/JK2V
         eZ5c5LmbHya0BCcuWno8bOnk2oVfixJD3CnbW4Bum0+rmRkuOwhVoibUTRtKixea627x
         bvYI4fU5MKB73L/FbbHJNHYjvtIvNxVqg2OmJ/Vn7HSpI8UeWJgoCOoPYpAGOgruVf6i
         u7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683310867; x=1685902867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LwaB3gFsg1akS6+DPiBettMKS24YpzUR+Suo1VnVp0=;
        b=h2o3m6Kz/J1qZnxurORlXowjubPYn1gen5sJzhXVV9UZWWxPKjJHlrCvBaj9EuAuOF
         LsIJqu14/k0klQ4dUlS411btMrN9VlgojncT8gRPtIujr4qRCMdRCiNFlPPcpRG+oxiW
         /9MLuGapIXrai1+P0QL212R7xxbu9fanIL8+JM0CCsw3pOQcKRDThjuqPJ3fjH4ozZUY
         C1qaez4iCdZ78R1WojZen85i3CMH3CF9cowHLGgcxTKjEUgqC2z1gqTb/eIHNysqFlNN
         SW3NrkYI2HxjnTcuGVyIhZemFMup5l1PRqvjvttWUkDjuYd9rObRQ6eXIxy15i4lVu7d
         2bZw==
X-Gm-Message-State: AC+VfDwt253AopUbpPlP1KPzovrdHNUP6AkJEjeqOuo+SDoTy2yeaHy9
	6KczPG6BMW7tzKIs6N0GM9Szyg==
X-Google-Smtp-Source: ACHHUZ7I04TCzRXB9RtbRXqFLZfB/h9bwVklIo4CDZh/6hboF74ra0aEoWoGB2v5newTnL4w3HBe0w==
X-Received: by 2002:a05:6214:5193:b0:5ef:7d5c:a76c with SMTP id kl19-20020a056214519300b005ef7d5ca76cmr3535409qvb.14.1683310866824;
        Fri, 05 May 2023 11:21:06 -0700 (PDT)
Received: from [192.168.0.195] (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id y13-20020a0cec0d000000b005ef5f7c1ae1sm756899qvo.105.2023.05.05.11.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:21:06 -0700 (PDT)
Message-ID: <ce83564a-1362-f45d-8c4d-e33e68a72d27@baylibre.com>
Date: Fri, 5 May 2023 14:21:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] Contributing, how it works?
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180965


On 2023-05-05 13:37, Alexander Kanavin wrote:
> There is
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> and some additional pages linked from it:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> http://www.openembedded.org/wiki/Styleguide
>
> The wiki is not great, and needs improvements, but the problem is it's
> difficult to write an authoritative and comprehensive answer to the
> questions you ask because there's just so many possible things one
> could check with any change to yocto. If you touch a recipe, you
> should of course check that 'bitbake recipe' still completes without
> an error. But that's obvious, isn't it? Beyond that... it depends. And
> requires a bit of intuition and experience, or advice from someone who
> knows the specific item better.
>
> We generally don't expect people to learn 'the rules' upfront - just
> write some code, and if you're not certain how to test it properly or
> whether it even makes sense, submit the patch as RFC and ask to take a
> look. If it fails in integration testing, you'll hear about it too,
> and that's normal and expected for anything more complex than a typo
> fix. My patches appear 'perfect' only because I pre-test them myself
> on the autobuilder :)
>
> Where we would *greatly* appreciate help is a special bot called
> patchtest that used to check mailing list submissions for common
> problems. That fell into disrepair due to lack of maintenance. Fixing
> that would be fantastic - and people could run it locally too. That
> could act as both a repository of rules-as-code, and a way to check
> them automatically. It could also offer hints for testing, depending
> on what the change touches. All sorts of nice things, if there is a
> person looking after it.

I'm actually working on getting patchtest running again, and I've 
assigned myself as maintainer :)

To add to what Alex said, a good place for you to start might be looking 
at the Newcomer Bugs list: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs

Alternatively, watching AUH failures and figuring out broken upgrades, 
or looking on the Bugzilla under terms like "ptest" could also be very 
useful, while providing better understanding of how recipes are written 
and being somewhat more accessible.

You can also ask questions in the #yocto channel on the Libera.Chat IRC 
server if you need additional help.

- Trevor

>
> Alex
>
> On Fri, 5 May 2023 at 19:17, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
>> Hello list
>>
>> I'm wondering if there are documentations on how contribution are managed for the project.
>>
>> I try to find some but didn't manage to. There are easily reachable doc about how to contribute of course (how to make patches, fixe your identity, send mail via git... etc) but I didn't find what I usually find on other open source project (CONTRIBUTING.md file most of the time) like
>>    - what are the tests do should I run before submitting (I learnt by practice about test image or bitbake selftest for example) ?
>>    - is there a specific configuration that I should test before submitting (poky is ok, or should I also test another distro)?
>>    - does some commit writing rules exist ? (some projects want commits to begin with a prefix, usually the software component that is modified by the patch for example)
>>   - what are the coding rules you should follow, if any? (having common coding rules helps greatly the review of patches, pylint for python code for example, and I saw there are some bitbake recipes linter from meta-sca layer)
>>
>> Long story short, I really would like to know what are the different steps a patch should go through before being merged into master (and as a side question, what are the steps for a patch to be backported into one of the LTS branch).
>>
>> I'm deeply sorry if all these questions are obvious to you and have been already answered somewhere, in that case, please just give me the link.
>>
>> I recently started to contribute to yocto / oe and I think it will help me to make better contributions if I know more of how it works "under the hood".
>>
>> Best regards.
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180962): https://lists.openembedded.org/g/openembedded-core/message/180962
>> Mute This Topic: https://lists.openembedded.org/mt/98710419/7611679
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

