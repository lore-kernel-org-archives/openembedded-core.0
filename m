Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B17CC433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 10:33:43 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.34330.1634553221455799898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 03:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UoR7GBns;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id t9so65761992lfd.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=pTK2/6EPcPIui9RvXhCt+EwLF+MEQXLYKJH/1hEFm5w=;
        b=UoR7GBns5ot0V3hsnKWZpjjHGG9cZ7yNSTd+MPdPS+Fahtge5kxlM1A4Xcb+ATVTea
         uPrnQGnPLPg2nvVQg7h30G2Qcm2DrUmXFmV50mxI+lQAgTO2meGTDa6YeLnFSmbSi0la
         1XOgiUsyCMIf2z4gOBLmkA13hN+CY8diZSoruIVTj58wA+WhoqT395eHc/mtWwwGd/L+
         ZlP5fg4z9sUrLGn9XEj5/Xe4flJ3OUljoGkKL8o0YZx6pmapZphY1X97+yMnsgvsW39I
         nsz1rxyNYPV9PmuUI/k5y3dPxMpOd72oiJBACbuuzbZCkDkrha/03VoZH4S2j3/zTciu
         zVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pTK2/6EPcPIui9RvXhCt+EwLF+MEQXLYKJH/1hEFm5w=;
        b=VLgT5uiPiyLH1Od5G4Vz+dS7Wt4FvTlkMo4eD3iC2Pg69sOtG2BMM9LDSse7OYRynk
         qAYOFeqXX2U0ewZJXYFauDAVVDGXczxctSKQiuM1loPj7HiW320uXKViIXJ1atjUnclb
         xcKVIChLjeAxrIR6dKQIAgYBcUIYy495LVxIJQPXRf/23Vf2y37jSWRcx+Gdcv5cZn0J
         fu7I1MIKoKeNrwEq0PBd5h8gs5XaM3cQTGRs7p//hRQRgM8fE8bFFO76ZmyXZX25oNlh
         JWsICys1zCp/GJh398la3qmMSGU0II0O+OveACeVm8DLkIKt1TCZt1dqiv4fcG7tHGbQ
         wiwg==
X-Gm-Message-State: AOAM530XuxaPXt2+KX0mSXrs7muI4s//1V+mOAHbRF2V1TwcSr4bqE0t
	iG16p40FA7zjdaQ7I4gu/qY=
X-Google-Smtp-Source: 
 ABdhPJx4kzGQNfBOLh9TGyjgahpr+fQphZJ+Xvk96lzljjNvr1oK48ILeFQn56FTV/zf3kZ6nUHPOg==
X-Received: by 2002:a05:6512:710:: with SMTP id
 b16mr1405686lfs.141.1634553219294;
        Mon, 18 Oct 2021 03:33:39 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 g5sm1370430lfr.115.2021.10.18.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 03:33:38 -0700 (PDT)
Message-ID: <27aa8fe5-5ebc-b1db-1418-abdabd945581@gmail.com>
Date: Mon, 18 Oct 2021 12:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [OE-core] Little sstate reuse when using uninative and yocto
 sstate cache
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <f372075e-51d0-da3b-837b-d5143cb7c7c4@gmail.com>
 <d3c28cb331c25a4ef6350fc0c4d1d950a1a45c87.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <d3c28cb331c25a4ef6350fc0c4d1d950a1a45c87.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 10:33:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157054

On 10/18/21 12:15, Richard Purdie wrote:
> On Mon, 2021-10-18 at 09:16 +0200, Jacob Kroon wrote:
>> I'm on latest dunfell and using uninative and have put the yocto servers
>> in my SSTATE_MIRRORS:
>>
>> my-distro.conf:
>> ...
>>> SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/3.1.11/PATH;downloadfilename=PATH"
>>> require conf/distro/include/yocto-uninative.inc
>>> INHERIT += "uninative"
>> ...
>>
>> but I thought I'd be getting more sstate reuse than I am:
>>
>>> bitbake m4-native
>> ...
>>> Sstate summary: Wanted 12 Found 1 Missed 11 Current 0 (8% match, 0% complete)
>>
>> Is the above reasonable, or should I be able to pull m4-native directly
>> from yocto servers sstate ? If so, is there a way to debug what differs
>> between my local siginfos and the ones on the sstate server ?
> 
> 
> In dunfell hash equivalence is enabled and this unfortunately means the sstate
> doesn't work very well unless you also have the matching hash equivalence data.
> 
> We do now have a way to have a readonly hash equivalence server and we have made
> one available from the autobuilder so this data is shared. Unfortunately there
> isn't a way to configure dunfell to use one though :(. That patch is a feature
> but could be something we consider backporting.
> 
> That said, I did a lot of testing/work with master recently as sstate reuse with
> hash equivalence was not what we'd expected. We ended up making a lot of
> changes, including a bit of a rewrite of the server side of the hash
> equivalence. I mention this just to illustrate it isn't a simple problem and
> that fixing this in dunfell may be tricky and would need backporting of some
> invasive changes. I'm trying to at least get master/honister working right in
> the first instance.
> 
> Cheers,
> 
> Richard
> 
> 

Thanks for the detailed answer. I will focus on getting this to perform 
well with my master build then.

Regards
Jacob

