Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BB7C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:44:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.831.1703004280784735874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mfMWbwco;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d2764c0f2so11121555e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703004279; x=1703609079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Rx/PgHlSGJbJHUGnVK8GJm/Xyd7BFAepE5/3XFFQy0=;
        b=mfMWbwcoJboHuNpI9XJmnKTZ1+dGCnVLTU9OpJ+K32lDNxC9gaUax0fdGVkx2AqY1o
         ka9yo0UTDrbEH+4mN9C3DpDd5zw9NDa83z2CFZa8saKlFr7BnSRbA12nG7SkbtOk7KD/
         hYAvNE+TiX9gyHN8DlYytxnSjgKx5Mcac0RbFm89oFzOceTL/nKFvvH2l2ZOObZb2do8
         hZB+gAk6HdEz0fcRHHcjnd7urpPoJHYTYDePXSDxDAsrih7wsp3cvaaIzB+Wiz1vPuhQ
         D2TisewEnqzn70JHbK/9dRGOcsq9iNC9jYUXyaPxWL3HBCT2eSeofWlYBwkOhlZjrXzm
         AHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004279; x=1703609079;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Rx/PgHlSGJbJHUGnVK8GJm/Xyd7BFAepE5/3XFFQy0=;
        b=chWw2hq/Nkl4aj/Ye4G+JZ0vdnn1RZyrocLqf3wqIWbSKGJfqarCvFydM3s51/fRwx
         kU54+P2/XOWKZ12LyC9Z/3w/ucn7XobPzRCqhHbOlSbn6wtbqN1Tl2zBGk71rpIvKpvE
         b4R7ZyEdLyOHcxqOGort1gom+BNuLHtszmzSfaaj18JzEfRlqtAOVxosUcRhNu54dVor
         rOE5Nf0NVolfczs1nzvjHSX/IXVq10SHyCkMIHwDksjKYbdtrKuiOvZsoFtKRbvjqYBi
         gO1pNjW4bV7zT/a7/4uZEUFsDUXSb3l9n4+h+1vMi0jUFYcvddrCdsbDkb6sO8pLJake
         dfNg==
X-Gm-Message-State: AOJu0YyudGFCXIVcvztGZfjSBsEsRGoHcvoKxxAv9NRfD6baI/hJaS/V
	saZGubS2HD9G8gmpLCDCp86TDg==
X-Google-Smtp-Source: AGHT+IFOwABN4dqWd634EeY6pvKTNwuyyFt0qUWXRDmHH9yij8DGpo8PwgbkPRN50GlgXwSZw8+QvQ==
X-Received: by 2002:a05:600c:4d0f:b0:40c:3bb2:ca3e with SMTP id u15-20020a05600c4d0f00b0040c3bb2ca3emr8597104wmp.207.1703004279121;
        Tue, 19 Dec 2023 08:44:39 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm3613709wmb.7.2023.12.19.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:44:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 58BC45F8B9;
	Tue, 19 Dec 2023 16:44:38 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
In-Reply-To: <86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	(Richard Purdie's message of "Tue, 19 Dec 2023 15:15:30 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	<87bkam449t.fsf@draig.linaro.org>
	<86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 19 Dec 2023 16:44:38 +0000
Message-ID: <87r0ji2lc9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 16:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192752

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Tue, 2023-12-19 at 15:10 +0000, Alex Benn=C3=A9e wrote:
>> "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>>=20
>> > Similar to stdout in the previous commit, we need to ensure serial out=
put
>> > if written is read and put somewhere, else qemu might block on writes =
to
>> > the serial port leading to hangs in the kernel. Use our existing loggi=
ng
>> > thread to log data when run_serial is not in use.
>> >=20
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>=20
>> I'm still seeing hanging with my test case:
>>=20
>>   o regression_1010.5 Invalid memory access 5
>>     regression_1010.5 OK
>>   o regression_1010.6 Invalid memory access 6
>>=20
>>   Stdout:
>>   Tried to dump info from target but serial console failed
>>   Failed CMD: top -bn1
>>   Tried to dump info from target but serial console failed
>>   Failed CMD: ps
>>   Tried to dump info from target but serial console failed
>>   Failed CMD: free
>>=20
>>   NOTE: test_soafee (soafeetestsuite.SoafeeTestSuite.test_soafee)
>>   DEBUG: Checking if at least one of soafee-test-suite is installed
>>   DEBUG: Setting up a 400 second(s) timeout
>>   DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=3D2 -o ServerAliv=
eInterval=3D30 -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyChecking=
=3Dno -o LogLevel=3DERROR -p 2222 127.0.0.1 export PATH=3D/usr/sbin:/sbin:/=
usr/bin:/bin; sudo -i -u trs soafee-test-suite run -r -t -T ; rm -rf /tmp/s=
oafee-test-suite
>>   DEBUG: Waiting for process output: time: 1702998407.0291, endtime: 170=
2998707.0285847
>>   DEBUG: Waiting for process output: time: 1702998412.0338314, endtime: =
1702998707.0285847
>>   DEBUG: Waiting for process output: time: 1702998417.0378022, endtime: =
1702998707.0285847
>>   DEBUG: Waiting for process output: time: 1702998422.0417945, endtime: =
1702998707.0285847
>>   <snip>
>>=20
>> The regression tests are hanging because that has triggered output on
>> the serial port as the firmware attempted to service the test and the
>> port isn't being drained. Then when that times out we start spinning
>> waiting for more output.
>
> I don't really understand where it might be hanging unfortunately as in
> my local tests it is draining stdout and the serial ports. Does it
> login to the serial console correctly? Are there any WARNING messages?
>
> I did use this debug patch:
>
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=3D0=
d9029bad610736c114e0770d2433b53133fa620
>
> to prove that it can interleave serial commands with left over output
> successfully. A similar patch may help work out where your setup may be
> hanging?

Yeah I'm only seeing A10/A11:

  o regression_1010.5 Invalid memory access 5
    regression_1010.5 OK
  o regression_1010.6 Invalid memory access 6

  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  NOTE:  ... FAIL
  DEBUG: Removed SIGALRM handler
  Traceback (most recent call last):
    File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/decora=
tor/__init__.py", line 35, in wrapped_f
      return func(*args, **kwargs)
             ^^^^^^^^^^^^^^^^^^^^^
    File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/decora=
tor/__init__.py", line 35, in wrapped_f
      return func(*args, **kwargs)
             ^^^^^^^^^^^^^^^^^^^^^
    File "/home/alex/lsrc/tests/trs/meta-trs/lib/oeqa/runtime/cases/opteete=
st.py", line 27, in test_opteetest_xtest
      self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
  AssertionError: 255 !=3D 0 :  xtest=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
  Run test suite with level=3D0

Those are the only two bits hit in the logging:

  grep "WARNING: here" build/tmp_trs-qemuarm64/work/trs_qemuarm64-trs-linux=
/trs-image/1.0/temp/log.do_testimage
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11
  WARNING: here A10
  WARNING: here A11

>
> Cheers,
>
> Richard=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

