Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440BEE95A6C
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:06:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.27342.1696716355847155538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KhJ6ms2C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso25891595e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696716354; x=1697321154; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JYol2+FByjoOrU/BwlWNXfQaeP15QJEVERQSJ+OZw/0=;
        b=KhJ6ms2Co5m/o0C9KpHBjag0q1wONj/jE7Z1HmtltbGjM2fh8+U7wSP/dCyzFrDkuS
         0AuR7EC1hHntyjiH6yUYYI7vNoeewP4Sc6UIyC1E04YkkMblfGSRskJoQxLzk4ZwR+9c
         b2nsX6KZdh0mJk6J/4Pc3kBmeGW9259aguKjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696716354; x=1697321154;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYol2+FByjoOrU/BwlWNXfQaeP15QJEVERQSJ+OZw/0=;
        b=JTF2CV95V1tfGoUORdyrvSJz6LMmcZWBQWqHV64XqOHMnGaoCWAeYx1fIeBtaeZz4q
         TT2Bgay+b/yciTmENLbELb8i6kya9LjdJhDhYnm5BtIxBZ7eH/0GA3YMb4WkESaRDqq9
         7eVsylXWuoQjUz2y3aT0KRGepH1jP0Uv+yRLMwO3ksZzQmsTu6fnSVTK/FNAIbH1tetH
         MrL5sVtOxAbetYej4NaB1RJsrZ7jkabFWhszIbdbe47/KU8rmMm8KrHK3kCWYNBKfSOH
         /MGFxzi3mISVrHhzcy7Ho2NxJcvyz9ChoY3eJp0MHLl19OmLzRU5hTwDh95ChWe9DCsb
         9BuA==
X-Gm-Message-State: AOJu0YxU6F+mSJy7LHYPpQ+GZt8N8YRngz4pAo3L91w6Qck831HeFjj7
	8YjeJv9MBYvh9I7I/KjrykorQNNU9hxp7PoaseU=
X-Google-Smtp-Source: AGHT+IEW00VcXMvoZvQ36tN3ie9mTZYOUKfTnV2cuRcEvcX8sXus/IQ/BAdTywf4If7O0f00ydZRFQ==
X-Received: by 2002:a5d:4449:0:b0:323:31a6:c1db with SMTP id x9-20020a5d4449000000b0032331a6c1dbmr7168567wrr.21.1696716353758;
        Sat, 07 Oct 2023 15:05:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9? ([2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b003267b4692e5sm5192721wrt.19.2023.10.07.15.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:05:53 -0700 (PDT)
Message-ID: <44996460ea9ac8b1ac93dd4a51a9839c15ca600e.camel@linuxfoundation.org>
Subject: Summary of the remaining 6.5 kernel serial issue (and 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, Randy
	MacLeod <randy.macleod@windriver.com>
Date: Sat, 07 Oct 2023 23:05:52 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188800

I thought I'd summarise where things are at with the 6.5 kernel.

We've fixed:
* the ARM LTP OOM lockup (kernel patch)
* the locale ARM selftest failure which was OOM due to silly buffer=C2=A0
  allocations in 6.5 (kernel commandline)
* the ARM jitterentropy errors (kernel patch)
* the cryptodev build failures (recipe updated)

We've also:
* disabled the strace tests that fail with 6.5.
* made sure the serial ports and getty counts match
* added ttyrun which wraps serial consoles and avoids hacks
* made the qemurunner logging save all the port logs
* made the qemurunner write the binary data it is sent verbatim
* made sure to use nodelay on qemu's tcpserial

This leaves an annoying serial console problem where ttyS1 never has
the getty login prompt appear.

What we know:

* We've only seen this on x86 more recently (yesterday/today) but have
seen it on ARM in the days before that.

* It affects both sysvinit and systemd images.

* Systemd does print that it started a getty on ttyS0 and ttyS1 when
the failure occurs

* There is a getty running according to "ps" when the failure occurs

* There are only ever one or three characters received to ttyS1 in the
failure case (0x0d and 0x0a chars, i.e. CR and LF)

* It can't be any kind of utf-8 conversion issue since the login prompt
isn't visible in the binary log

* the kernel boot logs do show the serial port created with the same
ioport and irq on x86.

Previously we did see some logs with timing issues on the ttyS0 port
but the nodelay parameter may have helped with that.

There are debug patches in master-next against qemurunner which try and
poke around to gather more debug when things fail using ttyS0.

The best failure log we have is now this one:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5874/step=
s/14/logs/stdio

where I've saved the logs:

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu_boo=
t_log.20231007084853
and
https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu_boo=
t_log.20231007084853.2

You can see ttyS1 times out after 1000 seconds and the port only has a
single byte (in the .2 file). The other log shows ps output showing the
getty running for ttyS1.

Ideas welcome on where from here.=C2=A0

I've tweaked master-next to keep reading the ttyS1 port after we poke
it from ttyS0 to see if that reveals anything next time it fails (build
running).

Cheers,

Richard

