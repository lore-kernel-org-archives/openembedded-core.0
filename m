Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D81CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:30:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19125.1762266602127881350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDIJrZ0F;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47117f92e32so45871185e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762266600; x=1762871400; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/rfEttdC96N+4hLCbf1BDztHspWjB7pJQAcVO6HeZ4=;
        b=SDIJrZ0FkvTII+CgdrkTOcQict7yz0BiY2PJZsfjfxjBoE19LwL/NiNye5bd/U6ZkS
         EN75E9c5y0wDMXnj+ZplWkXJxfODrUcghtz9i0pvHRTXttoBPYX5dIcD04VKoppBJ0wI
         uWroHzqRYOiW0PkU5z9Me6bA88gjSCKg4Smk+QQ+13eVsOTDNZlA8fRirJxlX9MXGovm
         jKsCpb+O56vOogWe4D1rYeJFqQ0kv2voQsqBMuJWc2WpDafnc6B3wsyuG63ZV+QCkwq6
         ten/opm1uBJLJr+wC32H8zneQeJgmeaV07qYeDMR8fAruGXULqkuCp5AfH2kvIS24WtM
         E7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266600; x=1762871400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/rfEttdC96N+4hLCbf1BDztHspWjB7pJQAcVO6HeZ4=;
        b=UdMj5coFI4C0Njiev7UDd/2ic3vWFaaVwBVfn5hEI/n6IQebGy0OOmdZU08A2oqGBU
         RP46wzAvS6LuJJpp2xUsTB1xxEjv/0KR9nS7CUUauDGMaY1o71s7LnZ3o+kEHON6LPvw
         QKZDx94S894tzMiWuHrFHLNlDPoYJ5SquWjfDVbzaCwT7kxOSl4qgL+Km1dXQGA8D/QQ
         9tkqC16/SB0jT/RNlimwLWG8CiNi47FZPBfs7vbr0S1dibV4VdhJPUB2dZ8D3o1ik6e/
         BVlFhwSUofvcTf0w6vrnzjdfmtQLWw0EYD3jbXYaJ6F3xVEcifvJaEgFv8HjeC27eivN
         h42A==
X-Forwarded-Encrypted: i=1; AJvYcCVm9I7eSVfBYNuadkhY+rCrHKsp5nnCwA87mCnTrzBNFKo18y800Wi5d8X5gePEwjdfLuWx4Mi5YSi9HtSzIG3W5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzh8vNYds8gjRAkwHtMZ0anI0Kq4f8pJdqk5pawWVQ/wlAbPXYl
	0JUoJ6ex4sMS9lFCFBnwElGeVHYPOFNg2g3miygN41aBK8Mvtqg3Ak52
X-Gm-Gg: ASbGncsZ/u7/kCrQb4SqZ390jDNxVBbvB8ou7MohxmRCq48YBJsCOAuusy9r7QJsg+E
	ehwQG6U8hBGcNCNvATM9K4l25tHzhBf13dJ85nV8gA0nktvkNG0j1aYMZN72bHNME+daVnQmY3L
	UbB0QuIIz+ea5oxxh3jEjHyCuXqys4EWPpJ+sj9Gc2X5v5R9tMqdpBaLzPqkyljQpz5PAeosKBU
	0Yta0qpBz1vCysu5Gjr2PpK5sqvZyIP1vaOKU29iN5+nQrXq2C4EIo0CG5Axa9VuoZ+o8ML7E6y
	+8fZakfZ7qFbxux/31GgqgyHCyL/4itxpxNfNsBshglScALJxDyqsbCilJA24t4iaqjR+t+PWIx
	xPKr8bl2zySQuIk8IF5JKLBFsic9w2BqbeGzxafpNLlZRHZ1TMljCkbokRxStA9l4qJ2yF1TmH2
	rrgnInluPD
X-Google-Smtp-Source: AGHT+IESu21KF32u6ogAmuWLIanBUsclFrY0foKl+j0NAjGF2KNxxdbv6nosUuIcs7fYgfHkGf7ecQ==
X-Received: by 2002:a05:600c:4f93:b0:475:de05:661f with SMTP id 5b1f17b1804b1-477308aa918mr161244575e9.41.1762266600183;
        Tue, 04 Nov 2025 06:30:00 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2e66f8sm219694135e9.1.2025.11.04.06.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:29:59 -0800 (PST)
Message-ID: <40e50f76-5076-424d-888f-aaef4a0c1cf8@gmail.com>
Date: Tue, 4 Nov 2025 15:29:59 +0100
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
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <GV2P189MB3005DE0FB9724D6E9D17AF7EFEC4A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225724

On 11/4/25 15:05, Pratik Farkase wrote:
> Hi Gyorgy,
>
> Thanks for your support.
>
> I’m now seeing more test failures (as seen in the Autobuilder) when using the `libxml2_2.15.0.bb` recipe from the mathieu/master-next branch, compared to the default `libxml2_2.12.10.bb` recipe from Scarthgap.
>
> The ptest implementation for libxslt is identical in both cases, but the number of failing tests increases when we bump the libxml2 version to the one in master. I’m not entirely sure if this is solely due to the version change or if other updates in the newer libxml2 are contributing to the issue.
>
> Would you prefer that we wait for the libxslt maintainers to fix these tests upstream, or should I disable the failing tests and roll out a new patch with the existing passing tests in the meantime?

In the libxslt repo there are 1-2 recent commits that say suspicious
things like "update test outputs for new libxml2" - if that could be
checked if they[1][2] fix the problem with new libxml, that would be
good to know. (I haven't gone further than looking at the recent commit log)

If they are relevant and they fix the issue, then I would remove libxml
update until it is fixed (it seems there are some other issues with it),
and accept your update in a way that passes all tests with the
non-updated libxml. And then, once libxml update works, the test-fixing
patches can be added to libxslt, and everything supposed to work(TM) again.

But on this ML I'm just a random commenter, my personal opinion might
not be the same as what the project wants :) You might want to wait for
a second opinion also.

[1]:
https://gitlab.gnome.org/GNOME/libxslt/-/commit/a7287acdf1dd95e32bde828c10e07949a16b68f3
[2]:
https://gitlab.gnome.org/GNOME/libxslt/-/commit/33cd5e56328ab29ef1fd939c4632915e834bb7af


> Best Regards,
> Pratik
>
> ________________________________________
> From: Pratik Farkase <pratik.farkase@est.tech>
> Sent: 03 November 2025 10:41 AM
> To: Mathieu Dubois-Briand; Gyorgy Sarvari; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
>
> Hi Mathieu,
>
> bug-146 test failure as seen on my local ptest-runner output seems to be fixed and will be incorporated in libxslt master :
>
> https://gitlab.gnome.org/GNOME/libxslt/-/issues/159
>
> I am not sure why we get different outputs of ptest-runner on Autobuilder and local QEMU test setup. It needs to be investigated further.
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: 29 October 2025 12:49 PM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
>
> On Tue Oct 28, 2025 at 10:05 PM CET, Pratik Farkase wrote:
>> Hi Mathieu,
>>
>> I looked at both the Ptest logs you sent and seems like more tests are failing in the autobuilder than in my local QEMU test setup. The failures appear to be byte-level differences (e.g., “230 bytes vs 275 bytes” for bug-147) rather than functional errors.
>>
>> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-ptest/core-image-ptest-libxslt/
>>
>> For both qemuarm64 and qemux86-64 machines my local ptest-runner has the following output :
>>
> Yes, it looks like a bit intermittent. I launched another run both locally
> and on the autobuilder, and the result is different: it is closer to
> yours.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2550
> https://valkyrie.yocto.io/pub/non-release/20251029-63/testresults/qemux86-64-ptest/core-image-ptest-libxslt/
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


