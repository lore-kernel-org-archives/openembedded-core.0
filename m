Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159FAC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 14:49:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.9200.1638456569531798844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 06:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhUvnECM;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id v15so289931ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1/8QGK/XyiRm6DyYRLnFf8d41R6eiX1xz2nbZq/zQw4=;
        b=NhUvnECMirqs2gHbd5ALWfrCLe6++h4A5+Z3SzJwo125Q45j7WbTycMVsRa9k63Ro0
         LbTHtMj3vSVDz8wfPQDk4XNy+pRBK5HK35r7ZTG7HoSR7xN2Ac8Ou1tCtbnDIcXvseT9
         uVt0Y9Yx5nCD4CJnFDTFuW0ebnaD/xgVprjV2ZUeVIwR/8x1JtfMuM8cKl0TDFshQKfp
         O2HVCcfbN+EK4GIEYiajEiAL9nfO6J5ziPTS0jU8k0EN4JuernE8Qa5r82xi1GLKLcew
         anj6D/XwoXbUJ7/o+53LxtVoKdm63jPvo+Ei8WPQCaRIDw7A/33GOjHVSGsbkwPFKCqU
         T07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1/8QGK/XyiRm6DyYRLnFf8d41R6eiX1xz2nbZq/zQw4=;
        b=aGDMX1kcYnjH+mr1DGqPq54EgqwIro7e5z3ovcpRh5N0mjbyo7ahUL9gYR39H6Hy4C
         WdHakJWPJk1oHA1qcs6BjpK87cscxip5Sx6tjLeADuE3QUpyiwRtioXB7SNmcgCCV8Bs
         nTs1nJwPKRrrNQSEDs4Hb3fdBnINPdDOGuz1VCzRIBu1OZ9/2hctPtfTkAGZGjHDQGIc
         79CQ9i1nn677S6uqVoIdF7JemkVPNvTNe5iMeRsm8TIHUr2tB1q7zVh86PdAFwxcUgvm
         U/ULXCUimcbigOMIEmn2aj+cQWPxhq1Nm0uCeb1p/VrnQZQpGsq2A8KMqFKRpUjuRMI/
         k/0Q==
X-Gm-Message-State: AOAM533uScpOG00G7Ndp4xMv4Q5DBg1WS/nR+yDugDfqJv6Ubprn7BHW
	+b9tq+Ovf37XTroEyZzIy4E=
X-Google-Smtp-Source: 
 ABdhPJyh89TVkxQ3bpKvXhAHGjH90ZUoMtc0ysDadVadH6oqGyg8bHeuPtnMuMg9S5y9mNVp+vzQmg==
X-Received: by 2002:a2e:9ecb:: with SMTP id
 h11mr12360432ljk.212.1638456567514;
        Thu, 02 Dec 2021 06:49:27 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id e6sm655lfn.172.2021.12.02.06.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 06:49:27 -0800 (PST)
Message-ID: <e388fadb-04d7-e653-2dfa-ccbd6e589251@gmail.com>
Date: Thu, 2 Dec 2021 15:49:26 +0100
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
 <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
 <0ea48dd5b84dcba4971886b35790aad516b7b6dd.camel@linuxfoundation.org>
 <b83fcbb2-ecb1-6788-0a1e-1702f35165a6@gmail.com>
 <c95df2f5084fd93bb10e308e5b501c92c0779d44.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <c95df2f5084fd93bb10e308e5b501c92c0779d44.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 14:49:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159090

On 12/2/21 12:09, Richard Purdie wrote:
> On Thu, 2021-12-02 at 12:03 +0100, Jacob Kroon wrote:
>> On 12/2/21 11:51, Richard Purdie wrote:
>>> On Thu, 2021-12-02 at 11:19 +0100, Jacob Kroon wrote:
>>>> On 12/2/21 00:11, Richard Purdie wrote:
>>>>> On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
>>>>>> Try to make sure that the RUNTIME dynamic entry size is the same for all
>>>>>> binaries produced with the native compiler. This is necessary in order to
>>>>>> produce identical binaries when using differently sized buildpaths. I've
>>>>>> tried using only patchelf, and keeping the linker flags as they are, but
>>>>>> I am unable to produce identical binaries. Has anyone else managed to do
>>>>>> this with patchelf ? If not, maybe we can write a new tool that can handle it ?
>>>>>>
>>>>>> The build-id also needs to be removed since it is calculated based on
>>>>>> the data present at link time. This includes STAGING_LIBDIR_NATIVE
>>>>>> and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
>>>>>> preserved since some recipes will execute the binaries during do_install()
>>>>>> (for example python3-native). Later on these are removed in chrpath.bbclass.
>>>>>>
>>>>>> This hack is the first step for producing identical native binaries when using
>>>>>> different build paths. 'zstd-native' is a working example.
>>>>>>
>>>>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>>>>>> ---
>>>>>>  meta/classes/chrpath.bbclass | 3 +++
>>>>>>  meta/conf/bitbake.conf       | 5 ++++-
>>>>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> I'm a little torn on this. Our other option would be to hardcoded a specific
>>>>> dummy path and then edit it later to the correct value. That may be neater than
>>>>> adding the padding. It will change the end binaries but hopefully only after
>>>>> they're installed so should give the same net end result more neatly?
>>>>>
>>>>
>>>> Hmm not sure I follow. This patch adds a new dummy rpath entry,
>>>> "/rpath-padding-xxx...", then we remove it in chrpath. I don't know what
>>>> other value we would like to put there. If I understand you correctly,
>>>> we could perhaps pad one of the ones we already pass
>>>>
>>>> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
>>>> -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}
>>>>
>>>> with spaces, like:
>>>>
>>>> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
>>>> -Wl,-rpath,"${STAGING_BASE_LIBDIR_NATIVE}${RPATH_PADDING}"
>>>
>>>
>>> I'm wondering if:
>>>
>>> -Wl,-rpath,/not/exist/our-native-libdir-marker
>>> -Wl,-rpath,/not/exist/our-native-base-libdir-marker
>>>
>>> would work.
>>>
>>
>> Right, I'll give it a try.
>>

Unfortunatley this breaks building python3-native. Although it compiles,
during the build the python build scripts tries to import the created
modules, and if this fails (which it does) it renames the modules:

> *** WARNING: renaming "_curses" since importing it failed: libncurses.so.5: cannot open shared object file: No such file or directory
> *** WARNING: renaming "_curses_panel" since importing it failed: libpanel.so.5: cannot open shared object file: No such file or directory
> *** WARNING: renaming "_ssl" since importing it failed: libssl.so.3: cannot open shared object file: No such file or directory
> *** WARNING: renaming "_hashlib" since importing it failed: libssl.so.3: cannot open shared object file: No such file or directory
> *** WARNING: renaming "nis" since importing it failed: libnsl.so.3: cannot open shared object file: No such file or directory
> *** WARNING: renaming "_ctypes" since importing it failed: libffi.so.8: cannot open shared object file: No such file or directory

I suppose it tries to import using the built python which has those
phony rpaths, and can't find the per-recipe-sysroot
lbncurses.so.5/libpanel.so.5/etc and fails.

The new modules will be called:

> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/_ctypes.cpython-310-x86_64-linux-gnu_failed.so
> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/nis.cpython-310-x86_64-linux-gnu_failed.so
> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/_hashlib.cpython-310-x86_64-linux-gnu_failed.so
> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/_ssl.cpython-310-x86_64-linux-gnu_failed.so
> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/_curses_panel.cpython-310-x86_64-linux-gnu_failed.so
> sysroots-components/x86_64/python3-native/usr/lib/python3.10/lib-dynload/_curses.cpython-310-x86_64-linux-gnu_failed.so

which means any subsequent recipe that uses python3-native will fail to
import any of those modules.

I suspect it might not just be python that wants to run the produced
binaries during the build itself.

>>>> If that works that would be less intrusive I think.
>>>>
>>>>> If we separate out the build-id patch we could hopefully get that piece merged
>>>>> as that shouldn't be controversial? 
>>>>>
>>>>
>>>> Yes, I can split it out into a separate patch.
>>>>
>>>> But now that I've looked at this for a while, I've asked myself what
>>>> good does all this do ? The only optimization I can think of is that if
>>>> we rebuild a native recipes, and the sysroot component turns out the
>>>> same, then we don't need to create a new sstate cache entry. So we save
>>>> disk space, but disk space is cheap. We still need to build it. What I
>>>> would like is to have a common sstate dir for multiple build
>>>> directories. So if I build libtool-native in one build path, then at my
>>>> other build path it would just pick it up from sstate cache when I build
>>>> there. In the end, is that something that would be possible ?
>>>
>>> We originally started here with gcc-cross so lets consider that and multiple
>>> build directories where a patch changes gcc-cross in a way that is irrelavent to
>>> the output.
>>>
>>> The "win" is that regardless of whether I build in location A or B, I get the
>>> same gcc-cross binary. Hash-equiv will then not rebuild the target binaries.
>>> Yes, I pay the price of a gcc-cross rebuild but hashequiv saves the targets
>>> rebuilding.
>>>
>>> Currently it would only happen if you always build gcc-cross in a specific build
>>> path.
>>>
>>
>> I know the build path will change if I upgrade to a new version of gcc,
>> but then the output is most definitely gonna change as well.
>>
>>> Like everything, it is a question of looking at the changes and deciding whether
>>> they are worth any maintenance burden/code complication or additional overhead
>>> they generate. I don't know the answer here yet but I do appreciate the research
>>> in helping get us data to make decisions on!
>>>
>>
>> I was thinking if it was possible to add a "build-path-does-not-matter"
>> .bbclass that would make the signatures independent of build path and
>> then scan the output to make sure it didn't contain any references to
>> the build path. Then those recipes who didn't depend on build path could
>> inherit from that class, and then maybe their sstate could be reused
>> from multiple build directories ? Not sure reliable it would be though..
> 
> Another crazy thought is our sstate really is already path independent,
> regardless of the binary content. You could therefore make the hash function
> replace the path with a fixed string. The downside is that doesn't work well on
> binaries due to offsets, alignment and so on.
> 
> As I read the above I was reminded that insane.bbclass does sanity check the
> output for build paths and does have a configurable control mechanism. It
> doesn't do that for the populate_sysroot output though since it is for
> do_package.
> 
> Lots to think about here but you're right that adding some kind of scanner to
> mark up recipes over time would help us preserve this.

Jacob

