Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD065C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 19:47:49 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.60146.1746474459850363420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 12:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=awR0zJzO;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0ad744811so39672706d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746474459; x=1747079259; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFEwymayktIApX+6BJYRWPmM7rIyh+wwQczGvw2E3zY=;
        b=awR0zJzOGHhYAXZQQNsFKETA87jHhPNzRv+HeJOlvjMc3xUweds6tQNsR5di1KawgG
         CDCbgAf3jmB0mP8DsjYmlLmwFS+AIML3d7lovaa0Ii2x5NUvlMhq1dK6bSg7MHpRVQB+
         14DKxBfOHIFEoSSUb7ScNnobcfmN250IGs/C/8lElCH6tbK1iWXkE/N/bKo4fiv1O2Y5
         61q7y+6b4UXSAcsQ5ksod2zbRuQZrGZfFa4da+dvJO6uXHteFm87AZaypturIagqejMy
         6tGuhvAwwW3LIanZh88osfQnb/lwBX6gt54gDQtE977uEiDhbCqBH+8kN/dtGwISxCZU
         WTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474459; x=1747079259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFEwymayktIApX+6BJYRWPmM7rIyh+wwQczGvw2E3zY=;
        b=ur+kZXJIQ0fPiQ4T8U5nA508rrZnHm7/iTeJppng0h9J57TV7/eO3bV/wpUr4gkdls
         PKefRwv7oOwXMG2YtsWSLJpekuBKgb1Mf4aMwD38xjybfoplnnoOkT8BJwl2EsHxL3Bo
         RQH6FL89yvEdZ9Nh0SSeWALTVjcJP9QPSNns5hxAoSTXiFS1L4Tn/jpTH7XGa8qCmld4
         Bwqii8z26mJlRcAi6F1yFchaxsyVarcvt6kUgU3cTjmkNowT9w4JIJ9YCEGaYagfLsKe
         gwlzABdKVp8RDvBhfVaPdWWF1HQnvWYQJSalMTatLtzOvMEfPW3HkTDFJUF9Y929WsqY
         ZWcw==
X-Forwarded-Encrypted: i=1; AJvYcCXseukFijyASJ6TQMR50iJrZ6jt9pSN0Uozm+sATj4XxXjawQibLFQpMJlkhljniyRFPyKEkYNV2Y6ONBQzeMT7vA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6dKWFv8ne25oz88DYzURPCT+9d7Nb7nMWumWh+/QDV1+w8c1X
	X8K0Vt03ePdl5VIO1NLrDC8/eFmxTbbMtIJdYe5Apngl+SZ6GOze8+/W5OESmmM=
X-Gm-Gg: ASbGncudZiR7lW/YNs78sDXksHaoRD1pJl2yjMeUOFkevmRPthdGLfDpyng4ieAJMT7
	1WmhhcCwnON8ZAnba0tYboIwcy815g4z9vv573KACJA9M5y1g86QyEHOrGWWyU3l0Arv845q2ey
	P8gFMX7oGxs5S9ahwu6BJz+TUPL2jhWYOT9VKocQ2NImr/oVIJ3olbjJvmTHABFd/wSkz7/GR9V
	yfxDdB5DNca/vHtlM3R4NDobrJTwh8Ya/n2n2VfGnVZ3Hajb/1g49hgOTmC5M44EUdQKtyAAxGr
	svyst7lo3FSg7vXWKCFGYrA1/ysgabRkCFOF/dQw67pegQspxyHgstheJtgA3TzUf72Q/V3lubx
	lveykrOs1
X-Google-Smtp-Source: AGHT+IHK4yUm7prPjH+IRAttNrGI6NfIc6P4kvy7lfzHLeZIdqgP+sVeFN3B+EGdpn+x1pBUri/gJQ==
X-Received: by 2002:a05:6214:1bc8:b0:6e6:630c:71e8 with SMTP id 6a1803df08f44-6f528c3b40dmr165526906d6.7.1746474458631;
        Mon, 05 May 2025 12:47:38 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b068csm59736006d6.11.2025.05.05.12.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:47:38 -0700 (PDT)
Message-ID: <36031367-1c4d-48ed-8c65-38217bd3ecf9@baylibre.com>
Date: Mon, 5 May 2025 15:47:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.2 -> 3.13.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250423162714.2261296-1-tgamblin@baylibre.com>
 <D9FOR4M7UASR.23XL7B0KAMZNQ@bootlin.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <D9FOR4M7UASR.23XL7B0KAMZNQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 19:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216018


On 2025-04-25 07:33, Mathieu Dubois-Briand wrote:
> On Wed Apr 23, 2025 at 6:27 PM CEST, Trevor Gamblin wrote:
>> This adds some security fixes and many new changes to the library.
>>
>> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-3-final
>>
>> Reproducibility looks OK.
>>
>> ptest results OK:
>>
>> |----------------------------------------------------------------------
>> |Ran 81 tests in 4.331s
>> |
>> |OK (skipped=2)
>> |
>> |== Tests result: SUCCESS ==
>> |
>> |29 tests skipped:
>> |    test.test_asyncio.test_windows_events
>> |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
>> |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
>> |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
>> |    test_android test_apple test_asdl_parser test_clinic test_devpoll
>> |    test_free_threading test_generated_cases test_idle test_ioctl
>> |    test_kqueue test_launcher test_msvcrt test_startfile test_tcl
>> |    test_tkinter test_ttk test_ttk_textonly test_turtle test_winapi
>> |    test_winconsoleio test_winreg test_wmi
>> |
>> |9 tests skipped (resource denied):
>> |    test_curses test_peg_generator test_pyrepl test_smtpnet
>> |    test_socketserver test_urllib2net test_urllibnet test_winsound
>> |    test_zipfile64
>> |
>> |442 tests OK.
>> |
>> |Total duration: 2 min 51 sec
>> |Total tests: run=43,896 skipped=2,268
>> |Total test files: run=471/480 skipped=29 resource_denied=9
>> |Result: SUCCESS
>> |DURATION: 171
>> |END: /usr/lib/python3/ptest
>> |2025-04-15T17:54
>> |STOP: ptest-runner
>> |TOTAL: 1 FAIL: 0
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
> Hi Trevor,
>
> Thanks for your patch.
>
> I believe we do have some build errors on the autobuilder:
>
> ERROR: nativesdk-python3-3.13.3-r0 do_compile: oe_runmake failed
> ERROR: nativesdk-python3-3.13.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475' failed with exit code 1
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/log.do_compile.477475
> Log data follows:
> ...
> | 0:00:01 load avg: 8.37 [4/4] test_types
> | test test_types failed
> | 0:00:04 load avg: 9.14 [4/4] test_types failed (1 failure)
> |
> | Total duration: 4.1 sec
> | Total tests: run=321 failures=1 skipped=1
> | Total test files: run=4/4 failed=1
> | Result: FAILURE
> | make: *** [Makefile:897: profile-run-stamp] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475:195 exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> | 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 195
> | 	#2: die, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 179
> | 	#3: oe_runmake, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 174
> | 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 157
> | 	#5: do_compile, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 152
> | 	#6: main, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477475, line 208
> NOTE: recipe nativesdk-python3-3.13.3-r0: task do_compile: Failed
> ERROR: Task (virtual:nativesdk:/srv/pokybuild/yocto-worker/buildtools/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4197 tasks of which 4029 didn't need to be rerun and 1 failed.
> NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/log/error-report/error_report_20250425111940.txt
> You can send the errors to a reports server by running:
>    send-error-report /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/log/error-report/error_report_20250425111940.txt [-s server]
> NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1461/steps/11/logs/stdio
Was this the only occurrence? As usual, I am having trouble reproducing 
this locally...
>
> Can you have a look at the issue please?
>

