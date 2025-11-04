Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52696CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:43:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19530.1762267400083266427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTaOLUXq;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so45514145e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762267398; x=1762872198; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zYZ2DcS4/uKqHq9yLknDF3juI725uPOltF4+QzQm8M8=;
        b=TTaOLUXqY7d49ZIXRdVGeh6WAzHT99I8TuhWTaqSBMcfPsZ+znPOkcHQacT8sMxFkc
         MGQ5TWrlbZi3JZCi7ibSm23jHfn6GNziGDh5Pe1bw7QhKRunfO6Sc5DC0i1J8Qkb690R
         8pOi4QNB7AOMgc1fW7IE/PkTDsTW3Ve7jDCrv7920Mu5XIV9tsmz544ESSh/kVxPCAqW
         hrblsHnz+GyHnzD0C02PWbdaNJ3gzIFNH7B150MH/nXq2zGU0QvmKCFqEKgj8ecedeDq
         cIZ8+EN+ye7KwBvwc+0S2MZ3OwtU22Hi87kshTmOaKlw636WFeWA2Jt9IWtZYK786Csp
         WUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267398; x=1762872198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYZ2DcS4/uKqHq9yLknDF3juI725uPOltF4+QzQm8M8=;
        b=EtVRkncNuN+hbVj5qSxO/KADHc64e7YunQ0AW189Jy2/lNHFf6vKZ2agmfPylR1g7n
         sgGnDefStUtz5vJScO9q1hKzsIkUdL9GNcIBjjEKYre4mGqU8NQgPr8Rv9QGNP1jUWqi
         exujSeu6yK1V5Q5x5YVbFG5apebpSsr5Geyb+DJ8So+veSSfjYi3gAO/owpHqZ7Q150P
         rOJfVMAscE6iyARIenCfWBZBQ6YH/dlRdlaNmqKLSVrzPNkGUO4zgzUvty7VlOMAo7uX
         ote9jFr2Di86rrHjMT7qsHZurZN0E0mkgtfKd+PKDtAcmXdszVaZEYz58PLbFwxJP0yM
         7tGg==
X-Forwarded-Encrypted: i=1; AJvYcCWNQh9UvhPhAisQWcZDCaZg5ukdz4KowY3MeDjP5Rz15numYYYLXiAjHTXyl55Il2+IJmdC+FUyJ00MhJZwSaqhcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJwvt6zqfvt1I6mGJArsGlppl5oHueCzo+eU8ziBqrEEevhWuu
	DYzEraiWDsN9fC7/0jdRFc8SUtqtnpYE3/WmQelBheE64SvPvpU5VPrI
X-Gm-Gg: ASbGncuyxlHILTFwhpT1GpHvy1Gn9UcXVNthzjcU8ySG9MXnui5dYqQq8a59Te5koOc
	lUvrm7wgrEtdLxKl5KLdHZCIKW/q7U+wg4L4VBV9O7UQwDr7+LENh1eoWaBpIy30R6yP7uTDL2Z
	4VG6xGWhdeVKkPI2200YuDb8NpBMABL8j5ytq06FTubqZdrHNsrcxunRsfjGa8yrMC+CpQrLPVm
	QFrl5CJDPiH7rHdT0BgzkY4sZts+V9X2gdUZ5Yu60RuJep6L2tNsafARTRlGhHeJP4EhccVZ8Hr
	Pm/016DmavjyZqG5E+5umugdzgfzZ9NlwNzRj6SKLUAbAgf1lXE3New2Tvw6N8q+Mu9WOyXZogf
	IH2C7LbtKXggJLY+VUY6mf7X0yjBCkzf6P3tTGl8XYQPKWE+pelhTwfw8lAS1RLfixiwslrXFyq
	PDK5JJcm28
X-Google-Smtp-Source: AGHT+IE7ZdMJnI0Z5VGM1WNPHPriS5+ivGLJd6HV/WdIG80fonXT4sbTzDFSXoUW1nrmOL8lM8ZZIw==
X-Received: by 2002:a05:600c:470c:b0:477:bf0:b9da with SMTP id 5b1f17b1804b1-477308aac1fmr165573335e9.19.1762267398175;
        Tue, 04 Nov 2025 06:43:18 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755a550dfsm42242385e9.17.2025.11.04.06.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:43:17 -0800 (PST)
Message-ID: <858bd64d-77fc-40d5-a7d5-800fca2d98e5@gmail.com>
Date: Tue, 4 Nov 2025 15:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
To: Pratik Farkase <pratik.farkase@est.tech>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DDUS6ZLHP1TA.1RO2V3WLOWZXW@bootlin.com>
 <GV2P189MB3005B2A3572E768BB61E4E8DFEC7A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <GV2P189MB3005DE0FB9724D6E9D17AF7EFEC4A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <1874D423590E3BAD.264703@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1874D423590E3BAD.264703@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225725

On 11/4/25 15:29, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 11/4/25 15:05, Pratik Farkase wrote:
>> Hi Gyorgy,
>>
>> Thanks for your support.
>>
>> I’m now seeing more test failures (as seen in the Autobuilder) when using the `libxml2_2.15.0.bb` recipe from the mathieu/master-next branch, compared to the default `libxml2_2.12.10.bb` recipe from Scarthgap.
>>
>> The ptest implementation for libxslt is identical in both cases, but the number of failing tests increases when we bump the libxml2 version to the one in master. I’m not entirely sure if this is solely due to the version change or if other updates in the newer libxml2 are contributing to the issue.
>>
>> Would you prefer that we wait for the libxslt maintainers to fix these tests upstream, or should I disable the failing tests and roll out a new patch with the existing passing tests in the meantime?
> In the libxslt repo there are 1-2 recent commits that say suspicious
> things like "update test outputs for new libxml2" - if that could be
> checked if they[1][2] fix the problem with new libxml, that would be
> good to know. (I haven't gone further than looking at the recent commit log)
>
> If they are relevant and they fix the issue, then I would remove libxml
> update until it is fixed (it seems there are some other issues with it),

I have to correct myself about the "other issues" statement: I missed
that the problem was present with v2 version of the libxml update, not
with v3. In this case the libxslt tests should pass with the current
libxml (though don't know if it will reach master branch before
Whinlatter release).

> and accept your update in a way that passes all tests with the
> non-updated libxml. And then, once libxml update works, the test-fixing
> patches can be added to libxslt, and everything supposed to work(TM) again.
>
> But on this ML I'm just a random commenter, my personal opinion might
> not be the same as what the project wants :) You might want to wait for
> a second opinion also.
>
> [1]:
> https://gitlab.gnome.org/GNOME/libxslt/-/commit/a7287acdf1dd95e32bde828c10e07949a16b68f3
> [2]:
> https://gitlab.gnome.org/GNOME/libxslt/-/commit/33cd5e56328ab29ef1fd939c4632915e834bb7af
>
>
>> Best Regards,
>> Pratik
>>
>> ________________________________________
>> From: Pratik Farkase <pratik.farkase@est.tech>
>> Sent: 03 November 2025 10:41 AM
>> To: Mathieu Dubois-Briand; Gyorgy Sarvari; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
>>
>> Hi Mathieu,
>>
>> bug-146 test failure as seen on my local ptest-runner output seems to be fixed and will be incorporated in libxslt master :
>>
>> https://gitlab.gnome.org/GNOME/libxslt/-/issues/159
>>
>> I am not sure why we get different outputs of ptest-runner on Autobuilder and local QEMU test setup. It needs to be investigated further.
>>
>> Best Regards,
>> Pratik
>>
>> ________________________________________
>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Sent: 29 October 2025 12:49 PM
>> To: Pratik Farkase; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
>>
>> On Tue Oct 28, 2025 at 10:05 PM CET, Pratik Farkase wrote:
>>> Hi Mathieu,
>>>
>>> I looked at both the Ptest logs you sent and seems like more tests are failing in the autobuilder than in my local QEMU test setup. The failures appear to be byte-level differences (e.g., “230 bytes vs 275 bytes” for bug-147) rather than functional errors.
>>>
>>> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-ptest/core-image-ptest-libxslt/
>>>
>>> For both qemuarm64 and qemux86-64 machines my local ptest-runner has the following output :
>>>
>> Yes, it looks like a bit intermittent. I launched another run both locally
>> and on the autobuilder, and the result is different: it is closer to
>> yours.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2550
>> https://valkyrie.yocto.io/pub/non-release/20251029-63/testresults/qemux86-64-ptest/core-image-ptest-libxslt/
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225724): https://lists.openembedded.org/g/openembedded-core/message/225724
> Mute This Topic: https://lists.openembedded.org/mt/115943432/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


