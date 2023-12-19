Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA60C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:15:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15744.1702998933173428961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hr+4Lcns;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3365f09de18so3620450f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702998931; x=1703603731; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n0v5RFM1wb8p0R72daEVbnOJ+KIKRZcubFhW8/az85M=;
        b=hr+4Lcns+tlZY0s0sVLNL+rA4xn6Zp/GtcwzSMdpw2/BzwhQHoHl54WSxupkGKcq4R
         BQ02exZ/TpFQzFWSadCJJeEJ77VcFZR5mevRl/K7aJ54gpGfmm5xhDdq/9q8Y38bajti
         /5s2CER1RRe6JUdt9Fs0sre1tso0bB2gnLAtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998931; x=1703603731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0v5RFM1wb8p0R72daEVbnOJ+KIKRZcubFhW8/az85M=;
        b=TxJWdgz/Yi7/OpqFRySH4rlso+BHeRVfjWQMIFET9Z/ImEsU7NwBprQn8B1WL0Y1xD
         jPaW9/U4rhtZVG5rgmHGbC0ayr/9VROGK+OpFC/uz7wXfgQaP6/0HEvWQrT38ORIxupe
         BkAkLbzKqAWE1gU1WE1YA4UeazStDZR43OBdRNaBijLkXSYNvNADMHwmMxKSB6a14fxG
         ZfMiiiIMhIucI3/jUhYnKsk+FSj/Bx+33uNkXS2a6KyWmZCgWdHhVCkIh3hhAT3DyMPe
         cDco4bt77piV0OzypDfZvtOqDDPPFPVw40bMOG5dyQID84GtKuxeC31YaJ1pA98yxQej
         mTeg==
X-Gm-Message-State: AOJu0YzFs6U3tqGrxPDZNd+GUMp6t1VXSZ/xFj1PvvIKgymzZ1burL98
	7t0bMg0EuW6BUNPsRnGYUWBh5w==
X-Google-Smtp-Source: AGHT+IGbp3OjxQOuYeJV9fuPU2KXNCG7FzOiBUst/2Z+6L8SpiY3MukKfZJOtMPlA+CgVkoOD3j3Ow==
X-Received: by 2002:a5d:4a46:0:b0:336:60fd:868e with SMTP id v6-20020a5d4a46000000b0033660fd868emr2430856wrs.99.1702998931463;
        Tue, 19 Dec 2023 07:15:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d4bd1000000b00336607f6630sm8607212wrt.47.2023.12.19.07.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:15:30 -0800 (PST)
Message-ID: <86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2023 15:15:30 +0000
In-Reply-To: <87bkam449t.fsf@draig.linaro.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	 <87bkam449t.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192748

On Tue, 2023-12-19 at 15:10 +0000, Alex Benn=C3=A9e wrote:
> "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>=20
> > Similar to stdout in the previous commit, we need to ensure serial outp=
ut
> > if written is read and put somewhere, else qemu might block on writes t=
o
> > the serial port leading to hangs in the kernel. Use our existing loggin=
g
> > thread to log data when run_serial is not in use.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> I'm still seeing hanging with my test case:
>=20
>   o regression_1010.5 Invalid memory access 5
>     regression_1010.5 OK
>   o regression_1010.6 Invalid memory access 6
>=20
>   Stdout:
>   Tried to dump info from target but serial console failed
>   Failed CMD: top -bn1
>   Tried to dump info from target but serial console failed
>   Failed CMD: ps
>   Tried to dump info from target but serial console failed
>   Failed CMD: free
>=20
>   NOTE: test_soafee (soafeetestsuite.SoafeeTestSuite.test_soafee)
>   DEBUG: Checking if at least one of soafee-test-suite is installed
>   DEBUG: Setting up a 400 second(s) timeout
>   DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=3D2 -o ServerAlive=
Interval=3D30 -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyChecking=3D=
no -o LogLevel=3DERROR -p 2222 127.0.0.1 export PATH=3D/usr/sbin:/sbin:/usr=
/bin:/bin; sudo -i -u trs soafee-test-suite run -r -t -T ; rm -rf /tmp/soaf=
ee-test-suite
>   DEBUG: Waiting for process output: time: 1702998407.0291, endtime: 1702=
998707.0285847
>   DEBUG: Waiting for process output: time: 1702998412.0338314, endtime: 1=
702998707.0285847
>   DEBUG: Waiting for process output: time: 1702998417.0378022, endtime: 1=
702998707.0285847
>   DEBUG: Waiting for process output: time: 1702998422.0417945, endtime: 1=
702998707.0285847
>   <snip>
>=20
> The regression tests are hanging because that has triggered output on
> the serial port as the firmware attempted to service the test and the
> port isn't being drained. Then when that times out we start spinning
> waiting for more output.

I don't really understand where it might be hanging unfortunately as in
my local tests it is draining stdout and the serial ports. Does it
login to the serial console correctly? Are there any WARNING messages?

I did use this debug patch:

https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=3D0d9=
029bad610736c114e0770d2433b53133fa620

to prove that it can interleave serial commands with left over output
successfully. A similar patch may help work out where your setup may be
hanging?

Cheers,

Richard=20


