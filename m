Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E91EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 17:52:31 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.46915.1689011549597189064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 10:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=qI/1e1Vc;
 spf=pass (domain: baylibre.com, ip: 209.85.221.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-47e06acce3bso1657791e0c.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689011548; x=1691603548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNNkHACm2vNROvd/5G5SFUAgSo655wabS8xvyAmOACk=;
        b=qI/1e1VcEmDrOfK0yrzrockxoTlrlzrNe6doo4W+X3yhzbX9zjsL2dnjXwseR+1nN2
         87SdVDh5NFVGE7BqBweBoqhescpKKKSBUODAoekqIyIZEFcMrUEE2ad40vqSl8507MQj
         416QwYKJzNSYbS1gjIdDHuPRCK5GU8PYvq0jmP4r2ZPBZ+shnjgK2yfg2V0ux0pm8Y74
         iS7zdW0TW++/UXEhsbakzJRrsqXDYeIKxJxhAcc0inBvKwyntEpth+TwTeQ4onmGYjhI
         lG07Wf1qeIZI2R7giC15mAxHiCX7DDHwemWJFerHomxKRzIbyvFnwrQqIz3HedhtR77d
         iDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011548; x=1691603548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNNkHACm2vNROvd/5G5SFUAgSo655wabS8xvyAmOACk=;
        b=ISmNNwIGFRX12a+Q8TLTY51D2+cQ9AN80amXX9ZzNSCg1/7jz/eEsfVvykyRuqarcC
         8aPwyjmIEuAEFh0Xq+ywqwfSAa7mPTExu4LvPwnVaBNKmRbtpWPP5HuPp8jTqApfE/Pc
         U3ATPFYbM/mX3rwQBmtotKKwVSJn+c+CIP25lzP1rY8q6Sj6b50AWjF5RgBy/sP7PySj
         DmHycuUww2RlyUTAfednfQ9JIzgHSncWs0XMawZPkTjeaAjpffuSTfEr7f2xw5G0vI0J
         LDmgbvppJnuqi307DEbWmkYSB5ykY9D4NloFkOIQeuOdFyEa8R6fY9URlDRT+uYbuHfL
         Y5rQ==
X-Gm-Message-State: ABy/qLYOrz6u28D98MYppJ9aPdFgmpDUzQHIpt18TRchuuO/xnf6P17J
	W848uhTLp4WwyU2FTkH2raVA3A==
X-Google-Smtp-Source: APBJJlEO9B8FtsLEHTJncIcGYHUFuDLFbDTd/BheG+ETX5C8dQxLzbSTcf3qvzEAecmE/2e+YIDLUg==
X-Received: by 2002:a1f:3d82:0:b0:47e:28ee:9d1d with SMTP id k124-20020a1f3d82000000b0047e28ee9d1dmr6497740vka.4.1689011548445;
        Mon, 10 Jul 2023 10:52:28 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id i4-20020a0cab44000000b00631f40503cbsm87599qvb.12.2023.07.10.10.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 10:52:28 -0700 (PDT)
Message-ID: <7d6aab24-0613-e865-d75e-96b71fa3733c@baylibre.com>
Date: Mon, 10 Jul 2023 13:52:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20230707132649.3841870-1-alex@linutronix.de>
 <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
 <176F9F2A43D46D21.7961@lists.openembedded.org>
 <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
 <176FAB1AAF8FB18E.3387@lists.openembedded.org>
 <ac5d0d60-6a48-8aa9-05d9-888763ffefb0@baylibre.com>
 <CANNYZj__syMeHd81Jic06529GxEVzBdm_JbfL1h40NHO7-kZ1A@mail.gmail.com>
 <4EC549E3-DBE5-4FD7-84F0-82E789959A7B@arm.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <4EC549E3-DBE5-4FD7-84F0-82E789959A7B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 17:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184092


On 2023-07-10 06:10, Ross Burton wrote:
> On 7 Jul 2023, at 23:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> On Fri, 7 Jul 2023 at 21:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>> FYI I didn't see the junit output option anywhere. Are you referring to
>>> an extra module?
>> If you run 'python3 -m test --help' you should see it:
>>
>>   --junit-xml FILENAME  writes JUnit-style XML results to the specified file
> I like this.  JUnit XML is fairly common and a well-written conversion tool can be used by multiple recipes.
>
> I offer https://gitlab.com/rossburton/python-unittest-automake-output as a holding location once it’s been proven to work.

It looks like there are some issues with the test code itself. Running 
"python3 -m test -W -j 4 --junit-xml TESTRESULTS" to try it out, I see 
things like this at the top of the output file:

|<testsuites tests="39396" errors="0" failures="0"><testsuite 
start="2023-07-10 16:02:38.119463" tests="8" errors="0" 
failures="0"><testcase 
name="test.test_opcodes.OpcodeTest.test_compare_function_objects" 
|status="run" result="completed" time="0.000520" /><testcase 
name="test.test_opcodes.OpcodeTest.test_default_anno
|  File "/usr/lib/python3.11/unittest/case.py", line 57, in testPartExecutor
|   yield
|  File "/usr/lib/python3.11/unittest/case.py", line 623, in run
|    self._callTestMethod(testMethod)
|  File "/usr/lib/python3.11/unittest/case.py", line 579, in _callTestMethod
|    if method() is not None:
|       ^^^^^^^^
|  File "/usr/lib/python3.11/test/test_descr.py", line 1790, in test_bad_new
|    self.assertRaises(TypeError, C)
|  File "/usr/lib/python3.11/unittest/case.py", line 766, in assertRaises
|    return context.handle('assertRaises', args, kwargs)
|           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|  File "/usr/lib/python3.11/unittest/case.py", line 236, in handle
|    with self:
|  File "/usr/lib/python3.11/unittest/case.py", line 259, in __exit__
|    self._raiseFailure("{} not raised by {}".format(exc_name,
|  File "/usr/lib/python3.11/unittest/case.py", line 199, in _raiseFailure
|    raise self.test_case.failureException(msg)
|AssertionError: TypeError not raised by C
|</output></testcase><testcase 
name="test.test_descr.ClassPropertiesAndMethods.test_basic_inheritance" 
status="run" result="completed" time="0.008526" /><testcase 
|name="test.test_descr.ClassPropertiesAndMethods.test_binary_operator_override" 
status="run" result="completed" time="0.000292" /><testcase 
name="test.test_d
|  File "/usr/lib/python3.11/unittest/case.py", line 57, in testPartExecutor
|    yield
|  File "/usr/lib/python3.11/unittest/case.py", line 623, in run
|    self._callTestMethod(testMethod)
|  File "/usr/lib/python3.11/unittest/case.py", line 579, in _callTestMethod
|    if method() is not None:
|       ^^^^^^^^
|  File "/usr/lib/python3.11/test/test_descr.py", line 1841, in 
test_restored_object_new
|    b = B(3)
|        ^^^^
|TypeError: object.__new__() takes exactly one argument (the type to 
instantiate)

There are numerous others as well. I compiled 3.11.4 on my F38 host and 
saw the same errors, which seems to suggest there's a problem with that 
part of the source. I wonder if we should continue using sed for now, 
but add the missing dependencies for test_cppext and the parallelized 
testing option. Thoughts?

>
> Ross

