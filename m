Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855C7C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:19:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.6323.1638440388729568785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LzWjo6e5;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id n12so70366664lfe.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8nFSQJBIfbhlIQRaquO/vMADa357Aeh3Lmiuunht9bs=;
        b=LzWjo6e5EILBqvOSVRFBg8Llw63sPye93Tv/Al31scSA4tlLxZYOMogtxhrcaDQJQN
         qlp1CQnmw0vTRghgA0zmRtRrD0FLObvpDkg62Fx/zw6rHOy7ZZ7ON5od1sQHE2uxQDEl
         E+c2sjfYu1EdA+LOQuGa7YCPi/p4IOVR9s0IIaIOpz9T1fYz3TD3EcM7Cgvh52Y5Sjfm
         MKdzWBlGykaabqQ5ylkZwU1lQZnEAvgupQPKgKfK27XrNr/kHFAeDs4DJtB/z4suIJ6d
         TySFrzMh6eNAztmsZSp1a3A2KyoUxTXscTOo8qvb0tDso6FuYXilDZafTozfitMKePor
         /Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8nFSQJBIfbhlIQRaquO/vMADa357Aeh3Lmiuunht9bs=;
        b=cDJKeBqG7O49cGdpDUTECv3o7N1d8nwJ/5dE77bj54Xi9GFouMjIwVqiPTti9rIOTi
         Mkgdis4WwcFM+vHFzi0T+wXqqPRh30IWXLRT/Arzt5S7Jg2cjbbqoDUsrkZkTwC77Zsu
         nd3ojnGqmP2RMKGRw9y5S7/yJ3nYLzVZ0InMDgCfQ7azn+WSbzsqsu90mzpQbcQ/kCFR
         QuLFr6y60bLi1rCL1mZwpmFK2pjAC/uNeQK+gdNdaTIE2/rdY1hW/WjR7615Sb+BBgd1
         boVSMsOeUXwhagwmlpeONXvscc4cxxKCjOOFtd8hNU5Wb9CVGZfZL7Gz7C7ooxOYwPBM
         Clyw==
X-Gm-Message-State: AOAM533kPRkPOqQ9Vh4aOq6VeQeRt6VeW3fMJaqALpEpvZOzihIIeoau
	eiupnywNyply0qLZ8cVwlX8=
X-Google-Smtp-Source: 
 ABdhPJxEI+nYxVaCxSvmEUUllbWDuS3JaLnu72a+x6gy/z9TM6N3Lq0Z4CDN9cP3/oZwXmApnw02ZQ==
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr11569532lff.336.1638440387035;
        Thu, 02 Dec 2021 02:19:47 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id l5sm263231ljh.66.2021.12.02.02.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 02:19:46 -0800 (PST)
Message-ID: <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
Date: Thu, 2 Dec 2021 11:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove
 build ID in native binaries
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
 <20211130223722.852434-2-jacob.kroon@gmail.com>
 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 10:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159082

On 12/2/21 00:11, Richard Purdie wrote:
> On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
>> Try to make sure that the RUNTIME dynamic entry size is the same for all
>> binaries produced with the native compiler. This is necessary in order to
>> produce identical binaries when using differently sized buildpaths. I've
>> tried using only patchelf, and keeping the linker flags as they are, but
>> I am unable to produce identical binaries. Has anyone else managed to do
>> this with patchelf ? If not, maybe we can write a new tool that can handle it ?
>>
>> The build-id also needs to be removed since it is calculated based on
>> the data present at link time. This includes STAGING_LIBDIR_NATIVE
>> and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
>> preserved since some recipes will execute the binaries during do_install()
>> (for example python3-native). Later on these are removed in chrpath.bbclass.
>>
>> This hack is the first step for producing identical native binaries when using
>> different build paths. 'zstd-native' is a working example.
>>
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>  meta/classes/chrpath.bbclass | 3 +++
>>  meta/conf/bitbake.conf       | 5 ++++-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> I'm a little torn on this. Our other option would be to hardcoded a specific
> dummy path and then edit it later to the correct value. That may be neater than
> adding the padding. It will change the end binaries but hopefully only after
> they're installed so should give the same net end result more neatly?
> 

Hmm not sure I follow. This patch adds a new dummy rpath entry,
"/rpath-padding-xxx...", then we remove it in chrpath. I don't know what
other value we would like to put there. If I understand you correctly,
we could perhaps pad one of the ones we already pass

-Wl,-rpath,${STAGING_LIBDIR_NATIVE}
-Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}

with spaces, like:

-Wl,-rpath,${STAGING_LIBDIR_NATIVE}
-Wl,-rpath,"${STAGING_BASE_LIBDIR_NATIVE}${RPATH_PADDING}"

If that works that would be less intrusive I think.

> If we separate out the build-id patch we could hopefully get that piece merged
> as that shouldn't be controversial? 
> 

Yes, I can split it out into a separate patch.

But now that I've looked at this for a while, I've asked myself what
good does all this do ? The only optimization I can think of is that if
we rebuild a native recipes, and the sysroot component turns out the
same, then we don't need to create a new sstate cache entry. So we save
disk space, but disk space is cheap. We still need to build it. What I
would like is to have a common sstate dir for multiple build
directories. So if I build libtool-native in one build path, then at my
other build path it would just pick it up from sstate cache when I build
there. In the end, is that something that would be possible ?

Jacob

