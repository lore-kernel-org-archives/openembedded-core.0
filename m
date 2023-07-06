Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DC1EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 17:22:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.30693.1688664154877168077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 10:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=EXhm68fw;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76754b9eac0so96260585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688664154; x=1691256154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3A+aH11zjQpsc73jsiG51M7sAeyTPqziQXxETqnoQ8=;
        b=EXhm68fw29W5TFdh1MYSPJV/wXIYk5JjXMjKhZ2dbBZJb0vD3fyYfsz//HmpThN+Ai
         f5Wl5E9As3PuUYuKeItOHfppDqR+TmbI8g8MQQzoNmjU+l2xU9GvPJo5I6rNcoCycbPD
         sNmd2wLuM+FKBgyMS+cso9zDAtDuzH5SWmQfRTbEf4zwQN9CbFit0zGGqAGA6JiMYQS4
         lhxfkMzYfpqbuM7DqktGbs9XPqrKiKDRJ2zs261jDxQSSq4jI8U8ivkWayxhJWTMGxr1
         Lb7kmTmmItJ/aB2lHtog1YU4+Sn3erU+84PvR8UdD14E7cm20Tpec3FEh5EcKucydvlb
         rJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664154; x=1691256154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3A+aH11zjQpsc73jsiG51M7sAeyTPqziQXxETqnoQ8=;
        b=bSf+AOu6S9KhkqFAOPk80KJqiHh0T39L1zT/Rxt2yeTEZaWEMmZFFK2AG2dS3+nBQG
         yqX3dEHY70TTjCYCHH/pJ052QTZ0gAd48zPvmjkq7eRHth87l1ICovCHy7Jr72BBZxfv
         ujy1tZLVih/Lur/BfwTPNeBDGb1rZ3t/VkhhiLYypjGVtc6rBY+OhOI8Tl8w+lZ4l9XN
         TMqojfIGIxDh8AESK2wGel304/ZPC48xDdFijU8P2ubZ0vjsH2DdpxFcHuB/77ZBQomO
         i+Xs/PFxmRiw2tr87xCwZfn7V9NGQ90nyBkD3uztgmSHBi9q0W9TYJ0qHLzKCRFtvKHU
         RY+A==
X-Gm-Message-State: ABy/qLZD2/DhWxqMB5O52Uj3Ee7tQbxYnI6M2767Ml0F7nOjWxJjnb2J
	RjMi39yh7zx/4Te8v8DaQghVPpI0t6uIKHhAPgw=
X-Google-Smtp-Source: APBJJlGpvYjbmWVOT6DQPBvsBUNY0IajsEqUSjLkn2Xf76KqtKx5C5jaR+KGuGtz4COOn0YXGUDUpg==
X-Received: by 2002:a05:620a:2993:b0:766:fa6d:fc with SMTP id r19-20020a05620a299300b00766fa6d00fcmr2939297qkp.38.1688664153388;
        Thu, 06 Jul 2023 10:22:33 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id f12-20020a05620a068c00b00766fd910e41sm963955qkh.39.2023.07.06.10.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 10:22:33 -0700 (PDT)
Message-ID: <5efb8cd4-46ee-50dc-40bf-6d5bf61a7c04@baylibre.com>
Date: Thu, 6 Jul 2023 13:22:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
 <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com>
 <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 17:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183984


On 2023-07-06 10:41, Alexander Kanavin wrote:
> The issue here seems to be that python ptest failures are not reported
> as such? Does '-c testimage' succeed for you, and do the logs for it
> then still contain the fails? That lack of fail reporting must be
> addressed first, then we can look into the fails themselves.
Until recently yes, but it seems that a different issue has crept in 
that is preventing me from seeing the logs in the same way. I'm looking 
into it. Interestingly, running ptest-runner manually used to break on a 
broken pipe for me before, but now it's not happening...
>
> We have plenty of ptests which do pull in the target toolchain (that's
> why you always see it building even for images that aren't going to
> have it), so I dont think it would be a problem for python.
>
> Alex
>
> On Thu, 6 Jul 2023 at 16:30, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>
>> On 2023-07-06 09:50, Alexander Kanavin wrote:
>>> I don't understand. We run python ptest all the time, and it doesn't
>>> report fails, so why do we need to disable tests that aren't being
>>> reported as failing?
>> This is what I see when running the ptests with core-image-ptest-python3
>> (I've already got another patch in to fix the cgitb and zipapp failures):
>>
>> ----------------------------------------------------------------------
>> Ran 210 tests in 0.382s
>>
>> OK (skipped=26)
>>
>> == Tests result: FAILURE ==
>>
>> 403 tests OK.
>>
>> 3 tests failed:
>>       test_cgitb test_cppext test_zipapp
>>
>> 28 tests skipped:
>>       test_asdl_parser test_check_c_globals test_clinic test_curses
>>       test_devpoll test_gdb test_idle test_kqueue test_launcher
>>       test_msilib test_ossaudiodev test_readline test_smtpnet
>>       test_socketserver test_startfile test_tcl test_tix test_tk
>>       test_ttk_guionly test_ttk_textonly test_turtle test_urllib2net
>>       test_urllibnet test_winconsoleio test_winreg test_winsound
>>       test_xmlrpc_net test_zipfile64
>>
>> Total duration: 23 min 1 sec
>> Tests result: FAILURE
>>
>>> Besides that, I believe that yes, adding toolchain bits to the image
>>> is actually fine.
>> It could be. I discussed this with RP and thought he didn't want to be
>> adding those dependencies for python3 ptests, but I may have
>> misunderstood, so maybe when he's back we can discuss it. The
>> core-image-sato-sdk image doesn't have this problem.
>>
>> Trevor
>>
>>> Alex
>>>
>>> On Thu, 6 Jul 2023 at 15:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>>> This ptest requires gcc, g++, and binutils to pass. This is a lot to add
>>>> for one test, so disable it instead.
>>>>
>>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>> ---
>>>>    ...-test_cppext-omit-from-python3-ptest.patch | 37 +++++++++++++++++++
>>>>    .../recipes-devtools/python/python3_3.11.4.bb |  1 +
>>>>    2 files changed, 38 insertions(+)
>>>>    create mode 100644 meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>>>> new file mode 100644
>>>> index 0000000000..9fca815368
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>>>> @@ -0,0 +1,37 @@
>>>> +From 11f77795efa9aa15b0459006a16e3bbc72ec69b9 Mon Sep 17 00:00:00 2001
>>>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>>>> +Date: Wed, 5 Jul 2023 14:29:33 -0400
>>>> +Subject: [PATCH] test_cppext: omit from python3 ptest
>>>> +
>>>> +These tests fail when running python3 ptests because gcc, g++, and
>>>> +binutils aren't present. This is a lot to add to the RDEPENDS, so
>>>> +disable the tests instead.
>>>> +
>>>> +[YOCTO # 13298]
>>>> +
>>>> +Upstream-Status: Inappropriate (OE-Specific)
>>>> +
>>>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>> +---
>>>> + Lib/test/test_cppext.py | 2 ++
>>>> + 1 file changed, 2 insertions(+)
>>>> +
>>>> +diff --git a/Lib/test/test_cppext.py b/Lib/test/test_cppext.py
>>>> +index 465894d24e..93b71d5100 100644
>>>> +--- a/Lib/test/test_cppext.py
>>>> ++++ b/Lib/test/test_cppext.py
>>>> +@@ -17,9 +17,11 @@
>>>> +
>>>> + @support.requires_subprocess()
>>>> + class TestCPPExt(unittest.TestCase):
>>>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>>>> +     def test_build_cpp11(self):
>>>> +         self.check_build(False, '_testcpp11ext')
>>>> +
>>>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>>>> +     def test_build_cpp03(self):
>>>> +         self.check_build(True, '_testcpp03ext')
>>>> +
>>>> +--
>>>> +2.41.0
>>>> +
>>>> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
>>>> index 6b074c48cf..6a471e706d 100644
>>>> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
>>>> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
>>>> @@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>>>               file://deterministic_imports.patch \
>>>>               file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>>>>               file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
>>>> +           file://0001-test_cppext-omit-from-python3-ptest.patch \
>>>>               "
>>>>
>>>>    SRC_URI:append:class-native = " \
>>>> --
>>>> 2.41.0
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#183947): https://lists.openembedded.org/g/openembedded-core/message/183947
>>>> Mute This Topic: https://lists.openembedded.org/mt/99985618/1686489
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

