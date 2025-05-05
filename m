Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E309CC3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 19:50:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.59643.1746474600260306290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 12:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=yLUs7Qbp;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c9677cd6d7so555874485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746474599; x=1747079399; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt4eBh8SrwgQkuW5DOpxrjFhpUBuPD0v84qM7VObYKM=;
        b=yLUs7QbpE5UiGLi4PTPaosTnk4NYVGuNQdaUBcGapnsraBSF5zi3GmDAhYVEBcynSG
         30fTd7IIqw9uO2Z5R5RyvnREp7WH5mkJa+j9vErtJv/5rZkd8bBHKrWKB+gPL5/peDVO
         DVQArbvP38mLjdab6ogSO+4mVxcmOITXK+uvJKKlrNJrvOH0vIt3GzaEDcXpuT79qKEu
         19lhLBXb5rR+M4LuW1oWihcBrj/6JceE+odHs7VM5v+PGYRvOB8E5TidpNycu+n5fhFG
         YL8PQbTmMrGk5PshyyFWDm26q7wf1aRyfFOhK1D0fIkRJnArFuWGGwzcCIXItM1a7cZw
         ZBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474599; x=1747079399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bt4eBh8SrwgQkuW5DOpxrjFhpUBuPD0v84qM7VObYKM=;
        b=gZUmA06TQbmY+6u6TX8R26De/TthVozLnlCIGjoJwNC+cKXiqBAveZvK6YK4LAW6Xn
         hfA7OYwLuPdBcSq8J4hz58A1l3jHCIiZ9OTjx6ZC403z7URULhHxxqjuBiLlOgVrjtnb
         EoyHiNPOkOIH+Z0bufz/Q6fjemiYBYfW1TynIQYsD9G/B9lb7yIY0e36bKQ6Ybns6CKX
         dV6ZCezTOQpSBhOIUvN8kCUv1ZdLnFPy5FEPncrQsZzZjBBuY1dsiaYmssGcFI8MKkDE
         1OwYGatVbLT2lW9ezwWPXDrcGU8jecc57Jay6uKg/xHjQ7gg13CkLxD+ShOCBTOAihf+
         0PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4iXoWVGAWwlP4lGvTS28SX4pEUfJtRrijATPg6RKhUQr/anQ/EXhUC1AW4IFeYduUnoaKYlkVl+bZ96uzNs63vg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4HTkqDFh2Vn756GTnlZR/xi6d1puIRvpSQGkWHbKclVb3Fk6K
	lcn3wwJcnwSsZf95osem8HcbfesBZeKgYHQORz5Cc76ZMPyYbOvJR+5DkL37/qLC1Uza7N70RJ3
	5pNw=
X-Gm-Gg: ASbGncvX6AowaFSb/IaQ4uBnZilbIxqooSDnuYg399fRd2qB8s6mUNYiX8b3fFcd1iA
	5qzDWRhodYhmBox3f3/BHRuLPDQ4Lz4kUMDXdUtjffBT6UpNr+HSzj35d5NAKC9YbEOdXlCcNuE
	tnnVapW8g2yuUPfCnY7fevjTLFl5cCX9PidCNaETlICmfp/p+oF48wIIzkG727tInS+xi+Xa4QN
	UeckFeyS7Q3ZnBq9su/d+1XS6P8Sb3adxONVyO+tyEeKs96B4H8sPEk+aB1359M/GsMnFi7187S
	TirdPV0oe+kGd1Ee8cLhK7VAqTAhYB7BLZCkeMGmYz7uKJ8zdu7cD93AvUm3R1IwbjbI2+D+Jhu
	M3yPA/Sdw
X-Google-Smtp-Source: AGHT+IHY9j6/IC30KGRw4IL6XH3XSszxTzIJyhz4bhSb0r+zLGmVTgGXchhF8BssCtO/fTSdnWubUA==
X-Received: by 2002:a05:6214:124f:b0:6e6:6ba9:9e84 with SMTP id 6a1803df08f44-6f528c95d8emr106360236d6.26.1746474599185;
        Mon, 05 May 2025 12:49:59 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f4518c5sm59683006d6.84.2025.05.05.12.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:49:58 -0700 (PDT)
Message-ID: <744834f5-f1e0-4474-a07a-a6f4abfb002e@baylibre.com>
Date: Mon, 5 May 2025 15:49:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.2 -> 3.13.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250423162714.2261296-1-tgamblin@baylibre.com>
 <D9FOR4M7UASR.23XL7B0KAMZNQ@bootlin.com>
 <183CB944BEC47AC5.32718@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <183CB944BEC47AC5.32718@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 19:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216019


On 2025-05-05 15:47, Trevor Gamblin via lists.openembedded.org wrote:
>
> On 2025-04-25 07:33, Mathieu Dubois-Briand wrote:
>> On Wed Apr 23, 2025 at 6:27 PM CEST, Trevor Gamblin wrote:
>>> This adds some security fixes and many new changes to the library.
>>>
>>> Changelog: 
>>> https://docs.python.org/3/whatsnew/changelog.html#python-3-13-3-final
>>>
>>> Reproducibility looks OK.
>>>
>>> ptest results OK:
>>>
>>> |----------------------------------------------------------------------
>>> |Ran 81 tests in 4.331s
>>> |
>>> |OK (skipped=2)
>>> |
>>> |== Tests result: SUCCESS ==
>>> |
>>> |29 tests skipped:
>>> |    test.test_asyncio.test_windows_events
>>> |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
>>> |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
>>> |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
>>> |    test_android test_apple test_asdl_parser test_clinic test_devpoll
>>> |    test_free_threading test_generated_cases test_idle test_ioctl
>>> |    test_kqueue test_launcher test_msvcrt test_startfile test_tcl
>>> |    test_tkinter test_ttk test_ttk_textonly test_turtle test_winapi
>>> |    test_winconsoleio test_winreg test_wmi
>>> |
>>> |9 tests skipped (resource denied):
>>> |    test_curses test_peg_generator test_pyrepl test_smtpnet
>>> |    test_socketserver test_urllib2net test_urllibnet test_winsound
>>> |    test_zipfile64
>>> |
>>> |442 tests OK.
>>> |
>>> |Total duration: 2 min 51 sec
>>> |Total tests: run=43,896 skipped=2,268
>>> |Total test files: run=471/480 skipped=29 resource_denied=9
>>> |Result: SUCCESS
>>> |DURATION: 171
>>> |END: /usr/lib/python3/ptest
>>> |2025-04-15T17:54
>>> |STOP: ptest-runner
>>> |TOTAL: 1 FAIL: 0
>>>
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> ---
>> Hi Trevor,
>>
>> Thanks for your patch.
>>
>> I believe we do have some build errors on the autobuilder:
>>
>> ERROR: nativesdk-python3-3.13.3-r0 do_compile: oe_runmake failed
>> ERROR: nativesdk-python3-3.13.3-r0 do_compile: Execution of 
>> '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475' 
>> failed with exit code 1
>> ERROR: Logfile of failure stored in: 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/log.do_compile.477475
>> Log data follows:
>> ...
>> | 0:00:01 load avg: 8.37 [4/4] test_types
>> | test test_types failed
>> | 0:00:04 load avg: 9.14 [4/4] test_types failed (1 failure)
>> |
>> | Total duration: 4.1 sec
>> | Total tests: run=321 failures=1 skipped=1
>> | Total test files: run=4/4 failed=1
>> | Result: FAILURE
>> | make: *** [Makefile:897: profile-run-stamp] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING: 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475:195 
>> exit 1 from 'exit 1'
>> | WARNING: Backtrace (BB generated script):
>> |     #1: bbfatal_log, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 195
>> |     #2: die, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 179
>> |     #3: oe_runmake, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 174
>> |     #4: autotools_do_compile, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 157
>> |     #5: do_compile, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 152
>> |     #6: main, 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, 
>> line 208
>> NOTE: recipe nativesdk-python3-3.13.3-r0: task do_compile: Failed
>> ERROR: Task 
>> (virtual:nativesdk:/srv/pokybuild/yocto-worker/buildtools/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_compile) 
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 4197 tasks of which 4029 didn't need 
>> to be rerun and 1 failed.
>> NOTE: The errors for this build are stored in 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/log/error-report/error_report_20250425111940.txt
>> You can send the errors to a reports server by running:
>>    send-error-report 
>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/log/error-report/error_report_20250425111940.txt 
>> [-s server]
>> NOTE: The contents of these logs will be posted in public if you use 
>> the above command with the default server. Please ensure you remove 
>> any identifying or proprietary information when prompted before sending.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1461/steps/11/logs/stdio 
>>
> Was this the only occurrence? As usual, I am having trouble 
> reproducing this locally...
Scrap that, I got it...
>>
>> Can you have a look at the issue please?
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216018): https://lists.openembedded.org/g/openembedded-core/message/216018
> Mute This Topic: https://lists.openembedded.org/mt/112417405/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

