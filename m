Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04E9C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:47:45 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.5558.1648216064659007122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 06:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nWnlNmbP;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t13so5244466pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=vvyuZHaQGCMnx81K9ahVM9k/4cft26DVpg+FMbq4GUE=;
        b=nWnlNmbP5Li8Wq21DjBPe6IsKzXaGkiHnD6H8yVgWdfsZTWEBU1cvqVb26c1vPjn0X
         iNFWFsC6vhYRhjr9sesnZeaanfWNCuWTCsiSAP9C2VNBPpaGfFTmGVUwFEt3TYbj7vIV
         gFs1CfB7xfnWgYBbgmI6tsSGhSNrCgnTQz28RLqi/Nu5xYt4y+e0Zlb8Oi4KGxvEe/IP
         SynxxWQODXsBIeBR3P6kLkcR0DKnJbrE2IUsqNlZPiOLdBu/EPOlpPosyMwLn3vhLZd9
         vSwUuED7Z/B6VALElS3XrArE0N0hHYaJuyfmPmdeeHlJYIroc6tZNy84ug3pQHSrSLul
         Hhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=vvyuZHaQGCMnx81K9ahVM9k/4cft26DVpg+FMbq4GUE=;
        b=pYRKvvmBImKuPqTpcbS6bLonRZAJXC7focTv4RHCd3GKCIQhCQ4cTGw266Y3BX90lT
         i8gaK5OMN5LUfO/urQ066rC40a8Huy7UlGeeEv81AHHYG/MFBrFb0p4SgvKn6+3aGcsD
         HweH3Gn5uC+EM19oAuxweM6cki96lb7dtWsAHWBtHwBRDKoN0ycsEGicHyMYo/14AU1Z
         VAVWBaTj8yHvwZKwL0cDIwioKbkib3YZjki93LWv6714TiH+atDosQMAglolWEZ1s52h
         AysTQYMTQWHvXD+VOIE0P4SMVPjP3iZ0Q8bdnRLdv8Wq/0+0gAqbFPm/3Ej67J6TXrPJ
         Ntzg==
X-Gm-Message-State: AOAM531XJbZbQM4XMjqgYnzdVgfEeov8E0/2Gey9XfE0wrwE+axktd82
	N+KSyukSy24SUbaMdMjSyqg=
X-Google-Smtp-Source: 
 ABdhPJwLrX3Dx00ZiyL2JeN0KqmuvQ9T7q1AprrcZu+WaJAZQawvHd/2G4z8KpR3Stj9g5xevSTGjQ==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr3533036pgc.593.1648216064193;
        Fri, 25 Mar 2022 06:47:44 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::f749? ([2601:646:9200:a0f0::f749])
        by smtp.gmail.com with ESMTPSA id
 s141-20020a632c93000000b0038134d09219sm5595434pgs.55.2022.03.25.06.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 06:47:43 -0700 (PDT)
Message-ID: <1a104385-ede3-53df-37f9-141de5e191cd@gmail.com>
Date: Fri, 25 Mar 2022 06:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 13:47:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163640



On 3/25/22 03:48, Alexander Kanavin wrote:
> The standard way to do this is to inherit lib_package.
> 

that is appropriate when main package is a library but it also has some 
utilities accompanying it. This case seems reverse, where its tryin to
create a fine grained packaging and separating the lib out instead.

> Alex
> 
> On Fri, 25 Mar 2022 at 11:19, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a libzstd package to remove libstdc++ runtime dependency from
>> library users and reduce the size of the library package and its
>> dependencies.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>>   meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> index 0ddff469b8..3887f31ecf 100644
>> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> @@ -36,4 +36,8 @@ do_install () {
>>       oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
>>   }
>>
>> +PACKAGE_BEFORE_PN = "libzstd"
>> +
>> +FILES:libzstd = "${libdir}/libzstd${SOLIBS}"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.30.2
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163633): https://lists.openembedded.org/g/openembedded-core/message/163633
>> Mute This Topic: https://lists.openembedded.org/mt/90019254/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

