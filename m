Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B36C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:27:34 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.76793.1723566450576395612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xW+JecKX;
 spf=pass (domain: baylibre.com, ip: 209.85.222.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-81ff6a80cb2so1607391241.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723566449; x=1724171249; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taCuabcHxXVoA8omFpkhrq5a+xbj75LZ5PJywCiCCt4=;
        b=xW+JecKXHFo/oyEXY3YzlKQfbl6bCjLIu8H64MzfJEbvOhCBm4O3BfU4+L9cuYPbYh
         bHMl2kNi8gm05vmpvrhmJQ/lidsypVCfDyZUStimXwcVFedx2j7S2n+kfwwRtjE58JLx
         xQ4Psem/fvLc04JVlVYgjTmaddXwAH4NVavQxroG6RSiN9OwcBWdLLlzcA4GumWsLYP3
         wdhYx9QoaMZ5/iFGAXGm4oKfepVLBTUtSMhMZ7nIuTlQs/ZDZJxR3qQMq4IHuvTpgV2/
         zAgRfh2URtH9zWAthuySd9JLoOTkQ7Kqvm7PONL72J2mbvC8LHlC+YG5r88wn6hM1NGz
         ikEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566449; x=1724171249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taCuabcHxXVoA8omFpkhrq5a+xbj75LZ5PJywCiCCt4=;
        b=BU9xemm7KeaQYiheG5XfOlHLpif8MjQ2ZWb1UCA57mzJABcQynfjR+xqyVic6oJGCM
         mFS88ujoBJTSGWRXBmgquJbF3s9BkEu4fDzMxRPaEq7aNA1V9Oc3LfGviywJbqZAyVQ/
         h0E4HSA8EAESKu/J4+pQ3KBR+y2PTjGVT3k6fd5ss7aIyt0ThH6W0i6wuc9vbWbPih0+
         aEW/EAF6DUlWEzmfXDdCagFok4NeqZBXTyVIxg/UVB6XBn/H7fQDoHBU3CeMMoC8gDQk
         NCdNOSJvIRurUrPYDy+g4bndJLXWr5CbAgyN5Qt1pkVik+IOkBBpfvzoapFcg+3LzmdT
         Wn2g==
X-Gm-Message-State: AOJu0YxFniV+cvLMS54AuUVGZR2EdQzW0EvcPoVDEfuTNnp+HfCEf/jf
	sM2UPLkfos8Jf7axtTLM456AFxzAHk0higet1EOnwaICZHUbVHSbZxo+Q3wu5V0=
X-Google-Smtp-Source: AGHT+IGzLA03KGNPGRdkyCcLdtPOLwM7UMOiRC6UiKa6aWe+q5mFfkuoM1OE4T9HOSOiwgq+hsrZWA==
X-Received: by 2002:a05:6102:a4f:b0:48f:3bcf:58a5 with SMTP id ada2fe7eead31-497599b14bbmr294260137.19.1723566449449;
        Tue, 13 Aug 2024 09:27:29 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e13605sm349989685a.135.2024.08.13.09.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 09:27:29 -0700 (PDT)
Message-ID: <35f62b85-e227-4be4-86da-0dbced10cf47@baylibre.com>
Date: Tue, 13 Aug 2024 12:27:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: skip readline limited history tests
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
References: <20240813153039.3395682-1-tgamblin@baylibre.com>
 <CANNYZj9XU05XrGeKhg=yTmyWuvm5GoT8NYVQG6chv6dbsg62Kg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9XU05XrGeKhg=yTmyWuvm5GoT8NYVQG6chv6dbsg62Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 16:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203286


On 2024-08-13 11:47 a.m., Alexander Kanavin wrote:
> On Tue, 13 Aug 2024 at 17:30, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> Python 3.12.5 is failing a newer ptest for reading/writing limited
>> history. Skip it for now until a proper fix (if any) is determined.
>> +This test was added recently and is failing on the ptest image. Disable
>> +it until the proper fix is determined.
> We should not be disabling tests without any investigation at all into
> why they fail, just so some other functionality (e.g. version updates)
> can merge into master. I have to say no to this. Please look into it.
>
> If it was added recently, what was the commit that added it? Can you
> add a link to that commit?

It was added in 
https://github.com/python/cpython/commit/263c7e611bb24715e513d457a3477a61fff15162

The GitHub issue is here: https://github.com/python/cpython/issues/121160

>
> If it fails, what happens exactly? Where is the failure coming from?
> Does the test expect something on the target image that isn't being
> provided?
>
> etc.

The failure looks like:

FAIL: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)

======================================================================
ERROR: test_write_read_limited_history (test.test_readline.TestHistoryManipulation.test_write_read_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
   File "/usr/lib/python3.12/test/test_readline.py", line 153, in test_write_read_limited_history
     readline.read_history_file(TESTFN)
OSError: [Errno 22] Invalid argument

======================================================================
ERROR: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
   File "/usr/lib/python3.12/test/test_readline.py", line 362, in test_write_read_limited_history
     readline.read_history_file(TESTFN)
OSError: [Errno 22] Invalid argument

----------------------------------------------------------------------
Ran 11 tests in 0.266s

FAILED (errors=2, skipped=3)
test test_readline failed

It's not clear to me what the fix is, seems like maybe an issue with the 
readline available in python3 ptest images. I've looked at TESTFN and 
the HISTORY_FILE environment variable that the test is supposedly using. 
The aforementioned bug report suggests that OSErrors like that show up 
when using the GNU readline-based readline module if a workaround isn't 
also incorporated. It also mentions a new readline backend will be 
available in 3.13 that might help, but that won't be available for a year.

>
> Alex

