Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61F5EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:30:10 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.24935.1688653803673738668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 07:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hu3YYAKN;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-634efb81e8dso6140176d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688653803; x=1691245803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nzi6UnDUCW1IiDp1amzqJYcRD6R2ROe6Aw5P9rALMaE=;
        b=hu3YYAKN9i0O5ienSM2UMJ/nvGErQ8sd27H3OEkchQuUjgw+YTZiOW28R/e4zYbTqk
         HyhLCdI8zQ7lj+DU2ZaBBhXgFcc1L/tqRY/P4xwAKNCVMYq8//h77Xbe6EGi5JAVLphz
         6JAWn1TbG2JUZeHuTIRyJ8KZW75vqdkW3xt8Oea9b41VpviKnXiCi4x43MpbCWPaRwTu
         FLsWQ8ue+/0+QyJw8SmanHpfNvZRrXoEJGcl2NMrwA/KlEjTP0FCtENVSLbWTjme0xIs
         Po8iugiHrigBihMeNGrheQMrRKzbkI9zzxj95t4ozxAJjziCiRbJFq0U/7JQm1SASYkQ
         jp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688653803; x=1691245803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzi6UnDUCW1IiDp1amzqJYcRD6R2ROe6Aw5P9rALMaE=;
        b=ivXLIfUtVasepOI54lcvTCB5/YG7Hrkbnvun6T9fXNDRcV6ufwxdazywudkwdnjiEa
         PcbR7KjxxW/lvs1tNa6kZNuGQ8F6eITEK+jXn/onh9E0Eczrwjgu9ySeHCpLq3bKOnyu
         V5AlZgoygPhnQYMpWtmLCKIsoJHVMEe1ldnh7vEeBcBL/5iTiZcQOMLKC+2F3se/CT2Y
         ipPzY7VzZZ7zaFrh50SlnkNQCB+Gnf+GY8BYHjzm7uMBuFa6x+zF5CwB7E1MqJEwxLWE
         CpPUmtCAiYpldliQBS7GDrpzo0LiCts1mN7TjSacmq/xa6+rTPIjjYKZaqVV6Kx4Qigu
         GFlw==
X-Gm-Message-State: ABy/qLYe2+TOfnunOvU8qU65id2VDhFuEYNyc/gG020HwZyLSEdYb58Q
	fgJ2td2U/gd0DOGdiNtV7YU8gw==
X-Google-Smtp-Source: APBJJlEdUfJ3aSXqT7wpP3V3xBWKnKa+CdA52QyvIJ5miGAsss0BNEEIA738XBV5ZUbPcLKRRBp/uQ==
X-Received: by 2002:a0c:db8d:0:b0:626:2bf5:d532 with SMTP id m13-20020a0cdb8d000000b006262bf5d532mr2051518qvk.14.1688653802700;
        Thu, 06 Jul 2023 07:30:02 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id v18-20020a0ca792000000b00635fc10afd6sm928003qva.70.2023.07.06.07.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 07:30:02 -0700 (PDT)
Message-ID: <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com>
Date: Thu, 6 Jul 2023 10:30:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 14:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183950


On 2023-07-06 09:50, Alexander Kanavin wrote:
> I don't understand. We run python ptest all the time, and it doesn't
> report fails, so why do we need to disable tests that aren't being
> reported as failing?

This is what I see when running the ptests with core-image-ptest-python3 
(I've already got another patch in to fix the cgitb and zipapp failures):

----------------------------------------------------------------------
Ran 210 tests in 0.382s

OK (skipped=26)

== Tests result: FAILURE ==

403 tests OK.

3 tests failed:
     test_cgitb test_cppext test_zipapp

28 tests skipped:
     test_asdl_parser test_check_c_globals test_clinic test_curses
     test_devpoll test_gdb test_idle test_kqueue test_launcher
     test_msilib test_ossaudiodev test_readline test_smtpnet
     test_socketserver test_startfile test_tcl test_tix test_tk
     test_ttk_guionly test_ttk_textonly test_turtle test_urllib2net
     test_urllibnet test_winconsoleio test_winreg test_winsound
     test_xmlrpc_net test_zipfile64

Total duration: 23 min 1 sec
Tests result: FAILURE

>
> Besides that, I believe that yes, adding toolchain bits to the image
> is actually fine.

It could be. I discussed this with RP and thought he didn't want to be 
adding those dependencies for python3 ptests, but I may have 
misunderstood, so maybe when he's back we can discuss it. The 
core-image-sato-sdk image doesn't have this problem.

Trevor

>
> Alex
>
> On Thu, 6 Jul 2023 at 15:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> This ptest requires gcc, g++, and binutils to pass. This is a lot to add
>> for one test, so disable it instead.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...-test_cppext-omit-from-python3-ptest.patch | 37 +++++++++++++++++++
>>   .../recipes-devtools/python/python3_3.11.4.bb |  1 +
>>   2 files changed, 38 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>> new file mode 100644
>> index 0000000000..9fca815368
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>> @@ -0,0 +1,37 @@
>> +From 11f77795efa9aa15b0459006a16e3bbc72ec69b9 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Wed, 5 Jul 2023 14:29:33 -0400
>> +Subject: [PATCH] test_cppext: omit from python3 ptest
>> +
>> +These tests fail when running python3 ptests because gcc, g++, and
>> +binutils aren't present. This is a lot to add to the RDEPENDS, so
>> +disable the tests instead.
>> +
>> +[YOCTO # 13298]
>> +
>> +Upstream-Status: Inappropriate (OE-Specific)
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + Lib/test/test_cppext.py | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/Lib/test/test_cppext.py b/Lib/test/test_cppext.py
>> +index 465894d24e..93b71d5100 100644
>> +--- a/Lib/test/test_cppext.py
>> ++++ b/Lib/test/test_cppext.py
>> +@@ -17,9 +17,11 @@
>> +
>> + @support.requires_subprocess()
>> + class TestCPPExt(unittest.TestCase):
>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>> +     def test_build_cpp11(self):
>> +         self.check_build(False, '_testcpp11ext')
>> +
>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>> +     def test_build_cpp03(self):
>> +         self.check_build(True, '_testcpp03ext')
>> +
>> +--
>> +2.41.0
>> +
>> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
>> index 6b074c48cf..6a471e706d 100644
>> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
>> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
>> @@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://deterministic_imports.patch \
>>              file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>>              file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
>> +           file://0001-test_cppext-omit-from-python3-ptest.patch \
>>              "
>>
>>   SRC_URI:append:class-native = " \
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183947): https://lists.openembedded.org/g/openembedded-core/message/183947
>> Mute This Topic: https://lists.openembedded.org/mt/99985618/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

