Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D862C0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 13:06:27 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.7570.1689599184585244961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 06:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=H8meppkJ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4036d80caaeso24092631cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689599183; x=1690203983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsiE6S00hL22vuzD7DTO4V+QFwgWEbWgVX+4sdnKoNQ=;
        b=H8meppkJMCKi2sy9+Bp0CsUwyMLdCApGeXK2obFsNGJ2+XuXignIDuBYXChO0h6unr
         rQUWDkyqAJYnn+uNZRzwlodG5qLcuoUrVU1reupCmDkRz75ZTfOSgcmU1K2MDoxdrM2h
         NND6rgy5wXOebARXkc90B3zja29Uj3XBjM9v16ki8TlFwRvhghou7S/JMUjAv4xjpdtK
         hXX6bCit+Spd9AmbRHWYzNk9oF4ftZP1R5RyC46u25suQAa6jDp+L/9zq/JWGVocIylm
         dNrai0tVVok2wYl2bFInW0SHnYX/KvZ6LSU+In4wM5T3/0lVU0lc/LVUrhl3F2meEhY+
         awLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689599183; x=1690203983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsiE6S00hL22vuzD7DTO4V+QFwgWEbWgVX+4sdnKoNQ=;
        b=eADORH4NthUy8owi9h+JmQ1yxbp1XMHUkpJzpUNU7FdyDl497OzEyxTspQxp3JJTp3
         VTeLftchEqYFo9QGpFXszRdKvjnD5cSK/N2rrNCXgOB7m8HkLBIJMCTXq9fRGlSiTJtO
         9+bEz7FKRUQNF+4/PIamnfIarrjw4DLUk9bupwmGDFsBYhGWZL9Yz5dM3aM2mi+ducLj
         2pSt475nntRF08FqOtLbN+0Nzi8NxJRJL9TM9nVmVISt1Gwin4BNNvZ+vbKlDjQePtCR
         5ySoos/TBxl/KC8XZAkt2+BK4JjP8EhMpmgQ8rUaKeC7LfbKLrKJA5ewTxFp0v16QkgM
         CpZQ==
X-Gm-Message-State: ABy/qLaAIHpoqaJq6toer2uv9VpPj0aoDBf/6Bo37wa8XTmGqQmE6z9Z
	5OD6dFFwsXGWsihTM9luG+Gpug==
X-Google-Smtp-Source: APBJJlFGigOTHopvgToF2M4d4LcKG6UjYqqV5XvNZEEe9yH5yWYKhEjl/8o2/1lsRbvcLUuwQIh7cA==
X-Received: by 2002:ac8:5781:0:b0:403:ebb1:c70a with SMTP id v1-20020ac85781000000b00403ebb1c70amr3484056qta.37.1689599183256;
        Mon, 17 Jul 2023 06:06:23 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id s19-20020ac85293000000b004035c1062f8sm6268329qtn.10.2023.07.17.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 06:06:22 -0700 (PDT)
Message-ID: <c42e28fd-7c9f-ed6c-d2f7-8b0930233808@baylibre.com>
Date: Mon, 17 Jul 2023 09:06:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: parallelize ptests, add test_cppext
 dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230711172545.738677-1-tgamblin@baylibre.com>
 <CANNYZj-7ZzO65GN+_X+peMDFp31Q1M9Tx8OEfj0p0PS4VB5Ecg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-7ZzO65GN+_X+peMDFp31Q1M9Tx8OEfj0p0PS4VB5Ecg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 13:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184465


On 2023-07-12 14:27, Alexander Kanavin wrote:
> I would suggest just one more tweak here: insert
> || echo "FAIL: python3"
> after python3 but before sed. That way it'll catch failures that sed
> does not (that silent regressing did just happen with
> zipapp/cgitb/cppext).

Sorry for not responding sooner. Trying this out now - it works fine 
with manual tests but doesn't report correctly with testimage:

WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were 
failing ptests.
Traceback (most recent call last):
   File 
"/workspace/yocto/manual/poky/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
^^^^^^^^^^^^^^^^^^^^^
   File 
"/workspace/yocto/manual/poky/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
^^^^^^^^^^^^^^^^^^^^^
   File 
"/workspace/yocto/manual/poky/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
            ^^^^^^^^^^^^^^^^^^^^^
   File 
"/workspace/yocto/manual/poky/meta/lib/oeqa/runtime/cases/ptest.py", 
line 27, in test_ptestrunner_expectfail
     self.do_ptestrunner()
   File 
"/workspace/yocto/manual/poky/meta/lib/oeqa/runtime/cases/ptest.py", 
line 120, in do_ptestrunner
     self.fail(failmsg)
AssertionError:
ptests which had no test results:
['python3']

If I add the echo after sed then it's OK, but that might not be what we 
want.

>
> Alex
>
> On Tue, 11 Jul 2023 at 19:25, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> This is based on a previous patch from Alex Kanavin (thanks Alex),
>> but it retains our use of sed to parse the test output into a usable
>> form. The intent was to use the test module's --junit-xml feature and
>> parse the resulting log instead of using sed, but various errors were
>> encountered when testing this method, so that will need further
>> investigation before we can consider adopting it. Two missing ptest
>> dependencies on python3-cgitb and python3-zipapp were already merged
>> in a previous patch, so only gcc, g++, and binutils were left to add
>> as ptest RDEPENDS.
>>
>> ptest output and runtime with this change:
>>
>> == Tests result: SUCCESS ==
>>
>> 405 tests OK.
>>
>> 29 tests skipped:
>>      test_asdl_parser test_check_c_globals test_clinic test_curses
>>      test_devpoll test_gdb test_idle test_ioctl test_kqueue
>>      test_launcher test_msilib test_ossaudiodev test_readline
>>      test_smtpnet test_socketserver test_startfile test_tcl test_tix
>>      test_tk test_ttk_guionly test_ttk_textonly test_turtle
>>      test_urllib2net test_urllibnet test_winconsoleio test_winreg
>>      test_winsound test_xmlrpc_net test_zipfile64
>>
>> Total duration: 5 min 3 sec
>>
>> [YOCTO #13298]
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/recipes-core/images/core-image-ptest.bb   | 1 +
>>   meta/recipes-devtools/python/python3/run-ptest | 2 +-
>>   meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
>>   3 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
>> index ddc56c8f9f..74cf933b72 100644
>> --- a/meta/recipes-core/images/core-image-ptest.bb
>> +++ b/meta/recipes-core/images/core-image-ptest.bb
>> @@ -26,6 +26,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>>   # ptests need more memory than standard to avoid the OOM killer
>>   QB_MEM = "-m 1024"
>>   QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
>> +QB_MEM:virtclass-mcextend-python3 = "-m 2048"
>>   QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
>>
>>   TEST_SUITES = "ping ssh parselogs ptest"
>> diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
>> index 05396e91ab..ee1130284b 100644
>> --- a/meta/recipes-devtools/python/python3/run-ptest
>> +++ b/meta/recipes-devtools/python/python3/run-ptest
>> @@ -1,3 +1,3 @@
>>   #!/bin/sh
>>
>> -SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
>> +SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v -j 4 | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
>> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
>> index 86ecc4e297..2d7b1bac2c 100644
>> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
>> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
>> @@ -426,7 +426,7 @@ FILES:${PN}-man = "${datadir}/man"
>>   # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
>>   RDEPENDS:libpython3:append:libc-glibc = " libgcc"
>>   RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
>> -RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed"
>> +RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
>>   RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>>   RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184149): https://lists.openembedded.org/g/openembedded-core/message/184149
>> Mute This Topic: https://lists.openembedded.org/mt/100083497/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

