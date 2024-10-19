Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3F2D3C92E
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 21:48:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.14618.1729374508708395941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 14:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z0woEcRD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2766056f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 14:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729374507; x=1729979307; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHRaIts2MC5fwcXGS0e2E7K/0lz3wH1dWyA4CBwXw0o=;
        b=Z0woEcRDQm8aQGaA6a6rrqHxMx4owEXHdJNHX3Co+eH4uXDhgmsHgbb0WXBxB9usUL
         oTaOwZRZ/w4qK6CSlVdu391R/2JKOLYPao94PeQUTnZsuReJIjmm2SMezHEchp+QqUL6
         jECtLbPsdQzYJrxpydbhKfBHAdVkDgHlCCMlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729374507; x=1729979307;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bHRaIts2MC5fwcXGS0e2E7K/0lz3wH1dWyA4CBwXw0o=;
        b=iWCP8VRboJpVTaiS9AMvNAavwqsQnF1vj4O+Mxr6BY38Kq+jjyCT8M/94jbFqUikrU
         2c7RM+CEpGLptHsSPBYCCa8SADNVWHiEcdUyNjVPmQ+ZvFnFK+FBrPQ3rOu1zT1i+afZ
         WiejeV9oMd9kGNYYCAean0c1M8AFi6N/wCh04XmWbIbdh7qZIx7yyKJ6LAjJbusVAkIo
         5yNWGxMdi+DNI5u6ASNjE+ZApgy9Tic8jl8VQ4JDUEXfL/gWgEbXCEsE0ZQ2FQ09SdoL
         Gg1T8/qJIEt3z+t7ZoIEhxLcjP9DM4vPX+TY6eLJ6fgM08wrVmJZZCBjjOBMqcMJ2Q7k
         DC7w==
X-Gm-Message-State: AOJu0YzlEe4QBqJwTHxmR+JrAPg4K+oY25HqSBYr8T9yn4eF2PgXKhRx
	X7vjRZAim7xDljuA/+eko58GUoFJVoUF4uxp5x72tI5n0EFS6acsCAegpG6NRaWmggP+UQYavz4
	3
X-Google-Smtp-Source: AGHT+IGGdxOmnXQpop6qKSU9iCoJQ/cog+/2bpWRzf2SY4xxxJHGuCd9zn4PZchB9Cs7R1TuX5u1dA==
X-Received: by 2002:adf:f34e:0:b0:374:b6e4:16a7 with SMTP id ffacd0b85a97d-37d93d6f384mr7743056f8f.8.1729374506802;
        Sat, 19 Oct 2024 14:48:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d275:580c:d39f:fb71? ([2001:8b0:aba:5f3c:d275:580c:d39f:fb71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a485dcsm401989f8f.34.2024.10.19.14.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 14:48:25 -0700 (PDT)
Message-ID: <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 19 Oct 2024 22:48:24 +0100
In-Reply-To: <17FFD5DF016C394D.24795@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FFD5DF016C394D.24795@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 21:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206087

On Sat, 2024-10-19 at 12:05 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2024-10-13 at 16:26 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > I've spent quite a bit of time trying to reproduce/debug this:
> >=20
> > https://valkyrie.yoctoproject.org//#/builders/35/builds/216/steps/14/lo=
gs/stdio
> >=20
> > 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> > runtime_test.TestImage.test_testimage_apt: FAILED (218.02s)
> > 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> > runtime_test.TestImage.test_testimage_dnf: FAILED (155.47s)
> >=20
> > on debian11-vk-1.
> >=20
> > I've a successful test and a failed test testimage output for
> > comparison:
> >=20
> > https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftes=
t/log.do_testimage.1487387
> > https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftes=
t/log.do_testimage.3323465
> >=20
> > along with qemu serial output:
> >=20
> > https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftes=
t/qemu_boot_log-fail
> > https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftes=
t/qemu_boot_log.20241013104106
> >=20
> > I've tried rerunning that exact series of tests on that worker with
> > no
> > success reproducing the issue. The image was overwritten by a later
> > test so we can't retest the exact image. I've checked the journal
> > on
> > that system and there isn't anything related around the time this
> > happened. The two failures were on different network interfaces and
> > both interfaces work on later tests.
>=20
> This is happening on most builds on debian11 for my test branch. If I
> add new changes, the issue doesn't happen so it looks to be timing
> related and needs a populated sstate cache.
>=20
> I put auditing into runqemu's tap locks codepaths and the devices are
> being locked/released correctly, there is no duplicate device usage.
>=20
> I also went through the non-tap/tun codepaths and I can't spot any
> issues, we do use slirp in some tests.
>=20
> Since we have a trigger point where we know it is failing (the
> runtime
> ping and ssh tests), I added a os.system("ps awx") into it. That gave
> me a process dump of what was running when this happens.
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
3/log.do_testimage.3603268
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
3/log.do_testimage.3902903
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
3/log.do_testimage.4042146
>=20
> From those we can conclude that there is only one qemu-system-*
> running
> using the appropriate interface. I couldn't spot any other
> particularly
> untoward processes running. That tells us a lot of things it isn't I
> guess.
>=20
> In addition to the ps, I've now added a netstat -tunape to see if we
> can see something holding a network connection open. I'm wondering
> about our httpserver used in some tests, or debuginfod, or something.
> That build is ongoing.

https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/5/=
log.do_testimage.123265

This has netstat from the host but also uses the serial connection to
run ping on the host/server IPs and ifconfig.

This tells is the interfaces have the addresses we expect on both sides
and that packets are tx'd but not rx'd on the other side.

Creative ideas on further debugging welcome, I'm not sure where from
here. I think it narrows down the issue to the host kernel or qemu and
these qemu binaries are working on the other builders. The host is a
5.10.223 kernel:

$ cat /proc/version=20
Linux version 5.10.0-32-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Deb=
ian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 =
SMP Debian 5.10.223-1 (2024-08-10)

Cheers,

Richard





