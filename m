Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D471C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 09:53:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.18369.1703066010471944411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 01:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=e5ptK8hc;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso51106875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703066008; x=1703670808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IjeW2aXdVUqYqVWJqh4UHEFSypPU4lTF8CfCYh+5nQ=;
        b=e5ptK8hciu/CQRzEgtqB3v6m705D0mjn4V3bIMCVEngZ7UeK2RPJPdWJb6iKhyL5J7
         V1E3uRO8iuXwkTXN0puVPQ6A/trtzvjVP2bu/xPa2Rl2FjNaQeVUZ2e603lAkpvEPnr3
         q08FRz6F3H9YhemnYKfRfqKOurucwSayJwhfXQro2TYvs/wYs7LvnQRFfb+Oz+0y9vjH
         ZgOsBXWHgWxrz0myhO1iwNyf2aRkBy31PR3Y8+WpbvAb0c/yL6p7DDblPZqWBL5kHZzz
         IuYg6GaXQXrx4m7yQd7KsJtVXs59JiWOz80PiKGJnYPJNaMw+Ni9DfcM4AIhK3g0nSTt
         Cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066008; x=1703670808;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IjeW2aXdVUqYqVWJqh4UHEFSypPU4lTF8CfCYh+5nQ=;
        b=OGmy9IW7/pQJ98jPuQY7tlo4OPhWzTcSo3UQz0KfvtfyA9fNaI2DKkYCzvxIIJTbY1
         gxiExYoAaxcPEwFDyD7sZ8HEh0wVupkFlCcM2185oUTywDBE3yg1avLRaVWCVafwSUyF
         PwViqjAqYx21UcdCcujrJ3XutWMWx9mi6rCRkdBL7X9BY60bcoRT9M9DKQgnuJSZIaH0
         WpLru13oiNlSIVBoQkfhp2s06k10H7GnWr5KkExDnNQ4h6SfksRoAD7UAopnRQriWtlS
         FEaOqJ+4rObinVa4JyVicftp7Xyd1CJBkatT9vwCQmZuvW23Em1jPtLQUrO4fHWaaQ8E
         A/ew==
X-Gm-Message-State: AOJu0YzwhTumnZGEHK1ZLBTAROr5T2dWftAQQCm7tU7NfQRzE5uCXKKg
	J+UdxaYHB096p7S02f3HbTC1kw==
X-Google-Smtp-Source: AGHT+IHucbh+/9FRmR7tgEVS7LegJz/tTmEJkJ2IeNZGM2UcMGkXtwYEGrE/vMI1jSodb2CCHe6e3A==
X-Received: by 2002:a05:600c:1149:b0:40c:2348:b92 with SMTP id z9-20020a05600c114900b0040c23480b92mr12425434wmz.68.1703066008393;
        Wed, 20 Dec 2023 01:53:28 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v16-20020adfe4d0000000b0033672cfca96sm3778433wrm.89.2023.12.20.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:53:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B65945F8BD;
	Wed, 20 Dec 2023 09:53:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
In-Reply-To: <8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
	(Richard Purdie's message of "Tue, 19 Dec 2023 22:57:54 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	<87bkam449t.fsf@draig.linaro.org>
	<86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	<87r0ji2lc9.fsf@draig.linaro.org>
	<8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Wed, 20 Dec 2023 09:53:27 +0000
Message-ID: <87a5q52oa0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 09:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192785

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Tue, 2023-12-19 at 16:44 +0000, Alex Benn=C3=A9e wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>=20
>> > On Tue, 2023-12-19 at 15:10 +0000, Alex Benn=C3=A9e wrote:
>> > > "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>> > >=20
>> > > > Similar to stdout in the previous commit, we need to ensure serial=
 output
>> > > > if written is read and put somewhere, else qemu might block on wri=
tes to
>> > > > the serial port leading to hangs in the kernel. Use our existing l=
ogging
>> > > > thread to log data when run_serial is not in use.
>> > > >=20
>> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > >=20
>> > > I'm still seeing hanging with my test case:
>> > >=20
>> > >   o regression_1010.5 Invalid memory access 5
>> > >     regression_1010.5 OK
>> > >   o regression_1010.6 Invalid memory access 6
>> > >=20
>> > >   Stdout:
>> > >   Tried to dump info from target but serial console failed
>> > >   Failed CMD: top -bn1
>> > >   Tried to dump info from target but serial console failed
>> > >   Failed CMD: ps
>> > >   Tried to dump info from target but serial console failed
>> > >   Failed CMD: free
>> > >=20
>> > >   NOTE: test_soafee (soafeetestsuite.SoafeeTestSuite.test_soafee)
>> > >   DEBUG: Checking if at least one of soafee-test-suite is installed
>> > >   DEBUG: Setting up a 400 second(s) timeout
>> > >   DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=3D2 -o Server=
AliveInterval=3D30 -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyChecki=
ng=3Dno -o LogLevel=3DERROR -p 2222 127.0.0.1 export PATH=3D/usr/sbin:/sbin=
:/usr/bin:/bin; sudo -i -u trs soafee-test-suite run -r -t -T ; rm -rf /tmp=
/soafee-test-suite
>> > >   DEBUG: Waiting for process output: time: 1702998407.0291, endtime:=
 1702998707.0285847
>> > >   DEBUG: Waiting for process output: time: 1702998412.0338314, endti=
me: 1702998707.0285847
>> > >   DEBUG: Waiting for process output: time: 1702998417.0378022, endti=
me: 1702998707.0285847
>> > >   DEBUG: Waiting for process output: time: 1702998422.0417945, endti=
me: 1702998707.0285847
>> > >   <snip>
>> > >=20
>> > > The regression tests are hanging because that has triggered output on
>> > > the serial port as the firmware attempted to service the test and the
>> > > port isn't being drained. Then when that times out we start spinning
>> > > waiting for more output.
>> >=20
>> > I don't really understand where it might be hanging unfortunately as in
>> > my local tests it is draining stdout and the serial ports. Does it
>> > login to the serial console correctly? Are there any WARNING messages?
>> >=20
>> > I did use this debug patch:
>> >=20
>> > https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=
=3D0d9029bad610736c114e0770d2433b53133fa620
>> >=20
>> > to prove that it can interleave serial commands with left over output
>> > successfully. A similar patch may help work out where your setup may be
>> > hanging?
>>=20
>> Yeah I'm only seeing A10/A11:
>>=20
>>   o regression_1010.5 Invalid memory access 5
>>     regression_1010.5 OK
>>   o regression_1010.6 Invalid memory access 6
>>=20
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   WARNING: here A10
>>   WARNING: here A11
>>   NOTE:  ... FAIL
>>   DEBUG: Removed SIGALRM handler
>>   Traceback (most recent call last):
>>     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/dec=
orator/__init__.py", line 35, in wrapped_f
>>       return func(*args, **kwargs)
>>              ^^^^^^^^^^^^^^^^^^^^^
>>     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/dec=
orator/__init__.py", line 35, in wrapped_f
>>       return func(*args, **kwargs)
>>              ^^^^^^^^^^^^^^^^^^^^^
>>     File "/home/alex/lsrc/tests/trs/meta-trs/lib/oeqa/runtime/cases/opte=
etest.py", line 27, in test_opteetest_xtest
>>       self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
>>   AssertionError: 255 !=3D 0 :  xtest=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
>>   Run test suite with level=3D0
>
> How long does it take for the test data to "back up" and timeout? The
> logging thread should take a maximum of 2s to notice data not being
> read/handled on the serial port.

I don't think it goes around the logging loop more than once. I only
see:

  grep "got" build/tmp_trs-qemuarm64/work/trs_qemuarm64-trs-linux/trs-image=
/1.0/temp/log.do_testimage
  DEBUG: got [(12, 1)]

from the poll.

>
> What the code should be doing is noticing the run_serial function isn't
> using the port and if there is data there, reading it in the logging
> thread. You could put further warnings around the code there to see if
> it ever detects data to read on that port. A warning when it exits the
> run_serial command may help too to see if it is waiting for data there
> or not.
>
> I also ended up using:
>
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=3Df=
ebb0d892e4c3648cd88b8ecb9c0260edc45b68e
>
> to show what was going over the serial interface when I found it wasn't
> what I expected.

I'll keep digging.

>
> I suspect/hope my patch is a step in the right direction but it looks
> like there may be cases it doesn't catch yet :/.
>
> Cheers,
>
> Richard

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

