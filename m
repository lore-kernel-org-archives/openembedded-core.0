Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7757C10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 14:36:05 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.21987.1715006156460033590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 07:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVbBliaS;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-23fb052ca41so501337fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715006156; x=1715610956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GAsaBp/z+j5FRycGoKs6dqrm+dncXXgdLn6iVPZ59Y=;
        b=XVbBliaSLrzz2JLET9iqMrZRNZ2Mbx77T2dVeeaYBmArwHAt2HN3KPajO+/KQiYJI1
         C0TtA+dpu3n9JxBHJAl+OpcGR7j3TJqf9EROOmfivGdkoXsS74jIDj5Vex2p5SxtcXOe
         PwyD+nt4dl9Z55T6xKZDdRWOtJaq9nirqmP6OI/KOV9dD1rPGz4LQqlyjooJam/34Yw3
         1Ij8Vh9MEpWReW77UFhTPNGpeyMVnQGkq+My/h5cC5otZtUbkMxI3kSg9+Q7StcB3drZ
         Cn1Pa8/9oG3TSu7SF44ZhDwHi3a9IeXAwmriZiHjQoSgk+7yZaGYd/AZRpgzum/EaF9x
         jhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715006156; x=1715610956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GAsaBp/z+j5FRycGoKs6dqrm+dncXXgdLn6iVPZ59Y=;
        b=AALLK0hCX046rfLarts6SIU4F2xvc/Y+vjIt9I6Od2gcYInN+L6jM6Hxv6O/GYErP1
         bQ3Ms8QETpAlL8euJO0+2tF2L7asmGcLvhjfQ61PYKJ8vpA22bYcLp6QyB92g1+Mn4xs
         wfw8BC2dOYebp6TpKf5VS+VW1BfiBrIyFTs25HpmZwLL4cTiPZHT1/qpglr7uZTwFk0L
         KM9tBuRJF7RKn78kE0oIy89epfOARO62NyNbhJeAWIJw2CDydkMj0iMdrCmwKkP2LeBE
         vp3uMyTZ6qUPWfFf9zdxJoGF/WEwDfVSLRuTcPTzVneSb9FrWuXn58Vd057As8tA/5rU
         7IlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbHTyvZiW32T80MSG4sz9Qybk15lxT7C2PhK3Ue+2EmwfT8M39F8TR9ji3CeHbH4kF82JkxZq/GubAQY1kWdLrkSHh/yL0gRXR3v2f3URF1VCRiGPDgIb4
X-Gm-Message-State: AOJu0YxFPGNTWfoIk6solFzmRCYqZ6xVh7LCoAB6OJL2YYZ1nJ2j1gXT
	tXKOTR4kMCrvKrCVJkmA1EM8+YuO+Jj4jFtO23mWrKbunF1GB6uYTM/zcdq2uUw8g61xgawT1ZB
	wOtqKLfAEG+GoEkcEz0Xy/gnWBkji/0vl
X-Google-Smtp-Source: AGHT+IFFUXuzfq/LHKbJGFr2iizl57ZvxNNk84EtDoQUB15HmgjktqHzjHS/QXZwC6mfmY1pIF2jiUKQLEjPWK1NQ28=
X-Received: by 2002:a05:6870:e98b:b0:22e:cbfa:678d with SMTP id
 r11-20020a056870e98b00b0022ecbfa678dmr11577157oao.57.1715006155443; Mon, 06
 May 2024 07:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <58234ff1-421e-4907-b303-5f733397a363@bootlin.com>
 <CAMKF1spFTiAO+PngFDCQvGBw2cBd3xNJi_1HkrEQ2Dp89CG8QA@mail.gmail.com> <613c5d5b-62e5-48d6-8377-0d908acc43e5@bootlin.com>
In-Reply-To: <613c5d5b-62e5-48d6-8377-0d908acc43e5@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 May 2024 07:35:28 -0700
Message-ID: <CAMKF1sri-foYapbLctZ9Hndm-Bpaf3YXW1sQX=y3b6KHp=YcmQ@mail.gmail.com>
Subject: Re: [OE-core] python3: ptest failure
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 14:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199046

On Mon, May 6, 2024 at 7:04=E2=80=AFAM Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
>
> Hello,
>
> On 5/6/24 15:56, Khem Raj wrote:
>
>
>
> On Mon, May 6, 2024 at 6:51=E2=80=AFAM Joao Marcos Costa via lists.openem=
bedded.org <joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>>
>> Hello,
>>
>> I noticed the ptest failure below, in a recent build: https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/81/builds/6570/steps/12/logs/stdio
>>
>> WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were failin=
g ptests.
>> Traceback (most recent call last):
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
>>     self.do_ptestrunner()
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/runtime/cases/ptest.py", line 120, in do_ptestrunner
>>     self.fail(failmsg)
>> AssertionError:
>> Failed ptests:
>> {'python3': ['python3']}
>
>
> I think there are detailed logs where it will show
> Individual tests which failed
>
>
> Indeed. Here are the details:
>
> =3D=3D Tests result: FAILURE =3D=3D
>
> 25 tests skipped:
>     test.test_asyncio.test_windows_events
>     test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
>     test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
>     test.test_gdb.test_misc test.test_gdb.test_pretty_print
>     test_asdl_parser test_clinic test_devpoll test_idle test_ioctl
>     test_kqueue test_launcher test_msilib test_startfile test_tcl
>     test_tix test_tkinter test_ttk test_ttk_textonly test_turtle
>     test_winconsoleio test_winreg test_wmi
>
> 9 tests skipped (resource denied):
>     test_curses test_ossaudiodev test_smtpnet test_socketserver
>     test_urllib2net test_urllibnet test_winsound test_xmlrpc_net
>     test_zipfile64
>
> 1 test failed:
>     test.test_concurrent_futures.test_shutdown
>

is this failing on re-run too ?
bitbake core-image-ptest-python3 -ctestimage
will rerun the py3 ptests in qemu if you are using one of qemu machines
as target

> 453 tests OK.
>
> Total duration: 26 hour 16 min
> Total tests: run=3D41,292 skipped=3D1,499
> Total test files: run=3D479/488 failed=3D1 skipped=3D25 resource_denied=
=3D9
> Result: FAILURE
> FAIL: python3
> DURATION: 94569
>
> I'm sending the whole log attached, just in case.
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa

