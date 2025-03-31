Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFF9C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:18:24 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.1163.1743437895213747660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLpQWCaO;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ff37565154so39734427b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437894; x=1744042694; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/JDXoklA9q5Qi0jSArOlb+/nJEiBZtiX+lbOZdWAO1o=;
        b=NLpQWCaOL/uAPN0pgimW4++IeAQ4/CT4F+Y8/SisGiptdiemE2Ro0AV90ZQ6Wvjs3+
         6I/nZwT0X0rKr2cWYhYyy3sCoAHznDP+QIDi8GhEFh9lwZe/tEyGkj3oPalYp/Zk80I/
         GCwr6L0divC1Nkvk4TNcnIg3kJ13hWi7/PMAmd+e0Qkh/6KsmVY5eeY3IQNEJ6hL3dq6
         7Af7Hg9OlrVU8ShcTFtJKWu8wRD9bPZ5NTYAB0PcpdJmIxoVIv8cgdNt9jHNdhMxhp3o
         XDeeIJVe1/VODCYLflfF3nC18QuDLqMIQttI6Wn1HeC5aFauWTXTdAyhOqUG44Ir6MRy
         qGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437894; x=1744042694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JDXoklA9q5Qi0jSArOlb+/nJEiBZtiX+lbOZdWAO1o=;
        b=evON13ze12pY+LGQ3PlCAdhWLn9QcaTIqPEVbaywzmDMou9dXVt0PE968aX4bzAD4a
         PW+SXp15hUpJrAhXRF2+cOTFfdqLMeiF84lOQLWPIVbrM0yNcSk9/yWua5JvXxStzX4u
         PSiQULCFU/npXa3jUx19G4lcg1luCRDUfmba4uy1BWRDeVrOexDD0Ruy4nyNoKZyaTHB
         nninAz0zbtJEiP3pbad9aF72+c6WAEaFpfHA+9tDeCANNr9/LE1HMOG6DE+siKNLrUiN
         FWgcQlg3qi9kjSkr5AiHoan9c0qU4YsmfzmanOYnZj5CKDE8iqtENRFuZ469cA+9YkxP
         aUog==
X-Forwarded-Encrypted: i=1; AJvYcCXcrNtC8S5ywYf2VGsO1t7cWsTiCjr3mSCSWIM4KDXTNkS+l9kp0H8Gnf8Zb9n9ig7VdJZxTQGdnfdCWnfDuHquVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySDNHSRbxOhYvmxc+O+s17J5Ig1YiSHCkJsnOxeZr+AadCUnZ3
	mP2V6jIbtuaSb6FMLpz4LhZ3dIjXN+M44ojO3kEzLXlBt4o5CeSF
X-Gm-Gg: ASbGncur4W5+pfmsXG7YKbWxgwYcXHdchwjJg3A+Ju6+dmDFi98sVBEYGUVS6iQdeH3
	NDpPdYCaqjkbzM0O6qs8Kzkf3cmhecf1AZiRFf7uzTpbM9ID8vusAf9PMiDJUHjpT9EF/uYfylG
	v1Mn0oMTBhtcXmPuqukOspRggKR2fv2O1D+s4qeZqZu39dX7D1i7OL3HaPIn3lNDZfn8a4KDcmE
	zuZUttrL8d/A8nwjEDWg5cHzM3lKMVjMFc06dhZZxfh3KKud1UsSshwlViuu5eXRvxbjlIDLfw4
	KuTEVC0B+bFXQP7Zv8hg8hsx3GeQU4xwvZqEeLZQA+Q/xWxcjyy2ZZSncpaNFrPm9and33e7Cu0
	fN+FypXZX1s0f0817vZuj
X-Google-Smtp-Source: AGHT+IGlCiYIt0vGH3Plk39YHsZJpLXmDErGkgc1M17D+NE9jjLwgMeaKgKEbTrcLu+/U+R17ZSJhg==
X-Received: by 2002:a05:690c:620b:b0:6fd:a226:fb2b with SMTP id 00721157ae682-70257099020mr128727457b3.3.1743437894299;
        Mon, 31 Mar 2025 09:18:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:d1a5:1b6b:6f7e:8f81? ([2600:1700:45dd:7000:d1a5:1b6b:6f7e:8f81])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a9fc05dsm22037947b3.107.2025.03.31.09.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:18:13 -0700 (PDT)
Message-ID: <3e8eedef-b9a9-458e-a3a7-dd86db2f21bc@gmail.com>
Date: Mon, 31 Mar 2025 12:18:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending
 PACKAGECONFIG_CONFARGS
To: martin.jansa@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: jarsoper@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, DongJoo Kim <dongjoo.kim@lge.com>
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org>
 <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org>
 <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
 <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
 <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
 <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213988

Hello,

In meta-security,  suricata is  mixed C and Rust  build  so I use 
PACKAGECONFIG for the autoconf part and now the RUST portion is 
complaining about configuration options it does not understand.

Rust error:
error: unexpected argument '--with-libcap_ng-includes' found

reverting the commits fixes my issue.

BR,
Armin

On 3/24/25 3:30 PM, Martin Jansa via lists.openembedded.org wrote:
> I had to patch Cargo.toml in gst-plugins-webos to define all possible
> options in [features] to avoid "error: the packagekkkk
> 'gst-plugin-unifiedbin' does not contain these features:
> unifieddecodebin, .." and then I was able to change our PACKAGECONFIG
> to pass them with --features instead of --cfg feature and use them
> with cargo as the previous patch did. I didn't verify it in runtime
> yet, but it passed the build.
>
> If that's the recommended option, then I'm fine with that and only 1/2
> should be merged and not this 2/2 nor the revert RP sent earlier
> today.
>
> Regards,
>
> On Mon, Mar 24, 2025 at 7:55 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> I basically agree with Jean-Pierre. Optional features should not be
>> set via RUSTFLAGS at all, rather Cargo.toml in the source tree should
>> be extended to include them as described here:
>>
>> https://doc.rust-lang.org/cargo/reference/features.html
>>
>> So gst-plugins-webos should be fixed, then the recipe for it, then I'd
>> say we should reconsider this patch. If a recipe inherits cargo, then
>> it is expected to pass configuration settings via cargo, otherwise it
>> needs to use its own custom class.
>>
>> Alex
>>
>> On Thu, 20 Mar 2025 at 19:11, Jean-Pierre Geslin via
>> lists.openembedded.org <jarsoper=gmail.com@lists.openembedded.org>
>> wrote:
>>> In my recipe I use it as:
>>>
>>> CARGO_BUILD_FLAGS:append = " ${PACKAGECONFIG_CONFARGS}"
>>> The recipe is public here: https://github.com/Jarsop/meta-zenoh/blob/master/meta-zenoh/recipes-connectivity/zenoh/zenoh_git.bb
>>>
>>> Best regards
>>>
>>> Le jeu. 20 mars 2025 à 18:36, Martin Jansa <martin.jansa@gmail.com> a écrit :
>>>> On Thu, Mar 20, 2025 at 6:16 PM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
>>>>> lists.openembedded.org wrote:
>>>>>> On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
>>>>>> lists.openembedded.org wrote:
>>>>>>> This 2nd one was supposed to be sent only as RFC, but I forgot to
>>>>>>> update subject sorry.
>>>>>>>
>>>>>>> And this version also has a typo "= ?=", will send v2 if we want to
>>>>>>> do
>>>>>>> something like this (reverting the
>>>>>>> https://git.openembedded.org/openembedded-core/commit/?id=16745b20452de60ae2474433cc1a2fb1ed9f6a64
>>>>>>> is imho better as it doesn't respect the original author from
>>>>>>> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.60232-4-brgl@bgdev.pl/
>>>>>>> and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing
>>>>>>> than
>>>>>>> useful as the default)
>>>>>> I have a strong preference for not carrying things like this. If
>>>>>> there
>>>>>> are existing recipes that break, we should just fix them and move on
>>>>>> rather than letting the past dictate the future IMO.
>>>>>>
>>>>>> I'm trying really hard to simplify things where we can.
>>>>> Martin pointed out I was misreading things.
>>>>>
>>>>> If there are recipes using packageconfig in RUSTFLAGS then this will
>>>>> break that. We probably do need to revert as I really don't like the
>>>>> alternative variable mess. It does mean recipes will specifically need
>>>>> to add the flags to the carbo build parameters but that is the lesser
>>>>> of several evils IMO.
>>>> Agreed about the revert being lesser evil.
>>>>
>>>> I know very little about rust/cargo, so it's also possible that we're
>>>> using rust/cargo wrong and there is a better way to achieve
>>>> conditional compilation with flags passed to cargo not by RUSTFLAGS.
>>>>
>>>> I've checked the recipe where we're using:
>>>> RUSTFLAGS:append = " ${PACKAGECONFIG_CONFARGS}"
>>>> and it's public as:
>>>> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb
>>>>
>>>> With the RUSTFLAGS then being used as
>>>> PACKAGECONFIG[unifieddecodebin] = '--cfg feature=\"unifieddecodebin\"'
>>>> in the recipe and in code e.g.
>>>> https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unifiedbin/src/lib.rs
>>>> as:
>>>> #[cfg(feature = "unifieddecodebin")]
>>>> ...
>>>>
>>>> Will send revert unless Jean-Pierre or Bartosz have better idea how to
>>>> deal with this.
>>>>
>>>> Cheers,
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#213571): https://lists.openembedded.org/g/openembedded-core/message/213571
>>> Mute This Topic: https://lists.openembedded.org/mt/111812482/3616698
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [akuster808@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


