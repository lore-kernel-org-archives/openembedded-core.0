Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D179BC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 22:58:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9250.1703026678093353336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 14:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LZQh3jpv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c580ba223so63895585e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703026676; x=1703631476; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SEeUSQYeENZkcT4Ey4TcdKwS4jBhmycEtKhfyPudx0E=;
        b=LZQh3jpvriM1YT1BBHPtzghu6KtyZ84+5b4bJIE/GK8CUZYTOUIiaEjB/FjIpVuZZx
         yjshCZAhk5Xj2HoNFaAAuX8G0Jpi0ZpJpbWmraRrRk+zXqFiOxUCD3EBChsGnfyRYqAe
         CE+DYJ30m42spTNI0exBu+k3rPNOiZ5unxNJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703026676; x=1703631476;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SEeUSQYeENZkcT4Ey4TcdKwS4jBhmycEtKhfyPudx0E=;
        b=ozs19Xr+YTEt3v2ZsCvdvC+J4NLlCpG+6YFHITlcU3aDl0CjpwiVXIis1+AOtzkrAX
         SFlNsMNAKgkhmBqQA3RBVgYeRcrIeVfEmMJ6OeDq2xnT9j9AYnVX68vCtA3KD545dE0Q
         x2nNQfnYvD8B/tb51uSUS6wx2n/Be031ng/2lbkQKbZ2R795hww2mVg8L1QWMQ9OCz1C
         6aPVW2ieHWW/DNP8X0RqRAAhUyrWhN1F6G8XJYrNuICFSBDLXXEwY5lGhn6iOrqluH97
         ccn43D1THSw7dgv18UfABLfUodNbV2A3uNjLPgBW6GsESKs5+8B0Jw1ttlzr7vnsXPwy
         8Fnw==
X-Gm-Message-State: AOJu0Yxof5Fdt21WhCBcvN2F/MZWhVobhTnBdr8T+4Q2f8CejHTIGx6t
	sQnxxXGthvnaVYhHK0GnqYxKbA==
X-Google-Smtp-Source: AGHT+IF3ZtvGSkpI+NVkqc7NhZVNzlx8LeWJwMb7kc/cZ6RzkI4Z4vQoFD//6Jv+CrFtqP9CeUOaMA==
X-Received: by 2002:a05:600c:4ec6:b0:40d:1b50:a6f4 with SMTP id g6-20020a05600c4ec600b0040d1b50a6f4mr2105181wmq.18.1703026676195;
        Tue, 19 Dec 2023 14:57:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c? ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0040c6d559490sm4892632wmq.3.2023.12.19.14.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 14:57:55 -0800 (PST)
Message-ID: <8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2023 22:57:54 +0000
In-Reply-To: <87r0ji2lc9.fsf@draig.linaro.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	 <87bkam449t.fsf@draig.linaro.org>
	 <86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	 <87r0ji2lc9.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 22:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192758

On Tue, 2023-12-19 at 16:44 +0000, Alex Benn=C3=A9e wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Tue, 2023-12-19 at 15:10 +0000, Alex Benn=C3=A9e wrote:
> > > "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
> > >=20
> > > > Similar to stdout in the previous commit, we need to ensure serial =
output
> > > > if written is read and put somewhere, else qemu might block on writ=
es to
> > > > the serial port leading to hangs in the kernel. Use our existing lo=
gging
> > > > thread to log data when run_serial is not in use.
> > > >=20
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> > > I'm still seeing hanging with my test case:
> > >=20
> > >   o regression_1010.5 Invalid memory access 5
> > >     regression_1010.5 OK
> > >   o regression_1010.6 Invalid memory access 6
> > >=20
> > >   Stdout:
> > >   Tried to dump info from target but serial console failed
> > >   Failed CMD: top -bn1
> > >   Tried to dump info from target but serial console failed
> > >   Failed CMD: ps
> > >   Tried to dump info from target but serial console failed
> > >   Failed CMD: free
> > >=20
> > >   NOTE: test_soafee (soafeetestsuite.SoafeeTestSuite.test_soafee)
> > >   DEBUG: Checking if at least one of soafee-test-suite is installed
> > >   DEBUG: Setting up a 400 second(s) timeout
> > >   DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=3D2 -o ServerA=
liveInterval=3D30 -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyCheckin=
g=3Dno -o LogLevel=3DERROR -p 2222 127.0.0.1 export PATH=3D/usr/sbin:/sbin:=
/usr/bin:/bin; sudo -i -u trs soafee-test-suite run -r -t -T ; rm -rf /tmp/=
soafee-test-suite
> > >   DEBUG: Waiting for process output: time: 1702998407.0291, endtime: =
1702998707.0285847
> > >   DEBUG: Waiting for process output: time: 1702998412.0338314, endtim=
e: 1702998707.0285847
> > >   DEBUG: Waiting for process output: time: 1702998417.0378022, endtim=
e: 1702998707.0285847
> > >   DEBUG: Waiting for process output: time: 1702998422.0417945, endtim=
e: 1702998707.0285847
> > >   <snip>
> > >=20
> > > The regression tests are hanging because that has triggered output on
> > > the serial port as the firmware attempted to service the test and the
> > > port isn't being drained. Then when that times out we start spinning
> > > waiting for more output.
> >=20
> > I don't really understand where it might be hanging unfortunately as in
> > my local tests it is draining stdout and the serial ports. Does it
> > login to the serial console correctly? Are there any WARNING messages?
> >=20
> > I did use this debug patch:
> >=20
> > https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=
=3D0d9029bad610736c114e0770d2433b53133fa620
> >=20
> > to prove that it can interleave serial commands with left over output
> > successfully. A similar patch may help work out where your setup may be
> > hanging?
>=20
> Yeah I'm only seeing A10/A11:
>=20
>   o regression_1010.5 Invalid memory access 5
>     regression_1010.5 OK
>   o regression_1010.6 Invalid memory access 6
>=20
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   WARNING: here A10
>   WARNING: here A11
>   NOTE:  ... FAIL
>   DEBUG: Removed SIGALRM handler
>   Traceback (most recent call last):
>     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/deco=
rator/__init__.py", line 35, in wrapped_f
>       return func(*args, **kwargs)
>              ^^^^^^^^^^^^^^^^^^^^^
>     File "/home/alex/lsrc/tests/trs/build/../poky/meta/lib/oeqa/core/deco=
rator/__init__.py", line 35, in wrapped_f
>       return func(*args, **kwargs)
>              ^^^^^^^^^^^^^^^^^^^^^
>     File "/home/alex/lsrc/tests/trs/meta-trs/lib/oeqa/runtime/cases/optee=
test.py", line 27, in test_opteetest_xtest
>       self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
>   AssertionError: 255 !=3D 0 :  xtest              =20
>   Run test suite with level=3D0

How long does it take for the test data to "back up" and timeout? The
logging thread should take a maximum of 2s to notice data not being
read/handled on the serial port.

What the code should be doing is noticing the run_serial function isn't
using the port and if there is data there, reading it in the logging
thread. You could put further warnings around the code there to see if
it ever detects data to read on that port. A warning when it exits the
run_serial command may help too to see if it is waiting for data there
or not.

I also ended up using:

https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=3Dfeb=
b0d892e4c3648cd88b8ecb9c0260edc45b68e

to show what was going over the serial interface when I found it wasn't
what I expected.

I suspect/hope my patch is a step in the right direction but it looks
like there may be cases it doesn't catch yet :/.

Cheers,

Richard







