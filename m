Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC38C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:28:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.25964.1703089719927122015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 08:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xgiYZ7SL;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so6049205e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703089718; x=1703694518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsLYkdrKUwkWYdXfYSPmKFMsiWOO6JNLEVuo2qKERQ8=;
        b=xgiYZ7SLfLexsrSylmKhIiEQMXbQrce9FWVScFrgTIkmtRKeJHJnbiS2mXyZ57C+Lx
         Sqqk+giTbCtZa+0eyfOHTuiUx+ulLFpJTH5xdBjNn6eHP4fkLyUv12IqA0uCR//8t71X
         lN2C1eiX6TW9ISesLefe21kp+K0Q1QvxWbwXmDRot2+C7Cn3uE8Z2xj/8g3riV/BQ0bj
         4CIn2nnXDpsYnkdpw1bX6mfomyJC6ogZT6IXfCv4/S5scipxpFST97pklMSCcgtI0bFX
         aPa/hPxhnzSuko6xSV1CS83Au/RX7Od9doF43csEihovV7QRvinRIUWif8kUbcYRt4bU
         6zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703089718; x=1703694518;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OsLYkdrKUwkWYdXfYSPmKFMsiWOO6JNLEVuo2qKERQ8=;
        b=QzSbSRU1IZRL2cOh7h0MCl20nnpIJkStqiX3KUL9vHerStkcy2rbAePExNpUVMxTnF
         fkFPlQuSNsYv9Jtyl7KDyROjYGH4iZF/Ns7PgpqSHW+5IcUDREbjGPaXdipP+/baKZTo
         U92qhPheIxMZ2oBFscq9yNtb4XH74zu2rtzPoF+uVf3Hx7N9Kqoo2nyguHNZW0IHXo3b
         pe52ZF21nKfzXFpL7VzosxZOwrn1nOFM4gIoWJL3U5AkTEcx8QhRQgJlkjSLMG3XVdRH
         516l821oBFeQqzAmkGPjyglh5ohaGD39Bg8xKbCtByvt1M2wpURiqFy/N+mtQcfu3tcN
         ZFuA==
X-Gm-Message-State: AOJu0YyPAToQiSCYCt8GPQ85HGAGQZzTwqLxTXjk7u7svlQRMTPKgoLC
	GK0nOUhIH6mYd+oK3dDvLaZOjw==
X-Google-Smtp-Source: AGHT+IGSqwfVZKSuSF+/foV74pZV8mfSDgnVuBK8ITSJtrWnHTGmiRMeI7+9St7eGEkTqIApLl/myQ==
X-Received: by 2002:a05:600c:4690:b0:40b:5e56:7b44 with SMTP id p16-20020a05600c469000b0040b5e567b44mr1560546wmo.141.1703089718231;
        Wed, 20 Dec 2023 08:28:38 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600c450300b0040c4acaa4bfsm7964739wmo.19.2023.12.20.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:28:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6E4A65F8BD;
	Wed, 20 Dec 2023 16:28:37 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
In-Reply-To: <3a7d3b6a2762163c7ca668c205962cd6cf5d5fd4.camel@linuxfoundation.org>
	(Richard Purdie's message of "Wed, 20 Dec 2023 10:04:57 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	<87bkam449t.fsf@draig.linaro.org>
	<86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	<87r0ji2lc9.fsf@draig.linaro.org>
	<8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
	<87a5q52oa0.fsf@draig.linaro.org>
	<3a7d3b6a2762163c7ca668c205962cd6cf5d5fd4.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Wed, 20 Dec 2023 16:28:37 +0000
Message-ID: <87sf3w25ze.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 16:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192803

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2023-12-20 at 09:53 +0000, Alex Benn=C3=A9e wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>=20
>> > On Tue, 2023-12-19 at 16:44 +0000, Alex Benn=C3=A9e wrote:
>> > > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> > > Yeah I'm only seeing A10/A11:
>> > >=20
>> > >   o regression_1010.5 Invalid memory access 5
>> > >     regression_1010.5 OK
>> > >   o regression_1010.6 Invalid memory access 6
>> > >=20
>> > >   WARNING: here A10
>> > >   WARNING: here A11
<snip>
>> >=20
>> > How long does it take for the test data to "back up" and timeout? The
>> > logging thread should take a maximum of 2s to notice data not being
>> > read/handled on the serial port.
>>=20
>> I don't think it goes around the logging loop more than once. I only
>> see:
>>=20
>>   grep "got" build/tmp_trs-qemuarm64/work/trs_qemuarm64-trs-linux/trs-im=
age/1.0/temp/log.do_testimage
>>   DEBUG: got [(12, 1)]
>>=20
>> from the poll.
>>=20
<snip>
>> I'll keep digging.
>
> I've merged the patches into master since they are helping the stdout
> issue and helped a number of issues others were seeing.
>
> In the final version of the patch I did fix an issue where the
> exception handling from the thread was not working so well, it does at
> least print a, exception/traceback properly now (in threadtarget()).
>
> One of the reasons I asked about the warnings was in case that was
> showing an issue, previously it silently failed.
>
> I can believe there are other issues hiding in here :/.

So the failure was due to an exception being thrown at:

  elif self.readsock.fileno() =3D=3D event[1]:

when my config hadn't triggered its opening. A bit of defensive coding
and it works. See:

  Subject: [PATCH] qemurunner: more cleanups for output blocking
  Date: Wed, 20 Dec 2023 16:14:50 +0000
  Message-Id: <20231220161450.1422484-1-alex.bennee@linaro.org>

>
> Cheers,
>
> Richard

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

