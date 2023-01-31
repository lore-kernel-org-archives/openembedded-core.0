Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AE0C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 16:03:45 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.15971.1675181023156440564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 08:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VVjEZNt4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d14so14665068wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 08:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Q9bSiNDoblH20uvAmAnAWS2dAMQGyYHsDh2drpFQ5M=;
        b=VVjEZNt4FskPLiKTat6bsqIFG2g0C5iGjpQP7wnFKgUkxuzpnFsbZb37QIOeV1AgxC
         oCQ6APhNrsH0Wc015N4qjTnNjSQraUp0a1Pm2fgfvwT1m5I8QOZ9n3TRwB7mWMctwDpP
         9LQkdmU3pjA5KYDyIsvpC4Tz6u3Br103Tr9r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Q9bSiNDoblH20uvAmAnAWS2dAMQGyYHsDh2drpFQ5M=;
        b=BrcFWpqopp77hZXtj8sSzHeKCM12u1QGzyX62YIytkhda1L5lb3I/NG/JX2NVL8MML
         ByTmikYFWtuOj9/b3svbkhO2q/IJ97hRCxIm8B49U+lm94VJ9YbLSxc4wbYNFzruFeE4
         do3j+JMikoLTV0MHQKDP6vgBr9JXjxG990Z2WXF1QZ0NAOii+LOwNBK9aTJY68U4+bs5
         MgVcEtUV2EuPadHUwKhHlAXLpn/5Ht8Gw9fiFZ4B1zwiv1vDuMayCLaHpKpRBeYT1TBg
         ROLexaZcp0eJBGcffmZYGQqiRfzbMwLpGxCov407N6pxW8DP5brV9Dmu0Ceje3PDl+6Z
         m+QQ==
X-Gm-Message-State: AO0yUKUyV/ooxxPBFMF2KpYmBzMmd66dvsPs1ScES8/JzjWc7Zz2KHOy
	iEKtRqyDjPGZ4iDeUyuFAP3ybA==
X-Google-Smtp-Source: AK7set93AcBfcLxaqNL7MYQJIlXEc9LmsYp+FS726mSBuccUAFJdDhz+C/WckMwN5AkmEKvV9jSPfA==
X-Received: by 2002:adf:ab19:0:b0:2bf:d7e3:f4cf with SMTP id q25-20020adfab19000000b002bfd7e3f4cfmr12957128wrc.29.1675181020996;
        Tue, 31 Jan 2023 08:03:40 -0800 (PST)
Received: from [172.27.248.57] ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d4c83000000b002423dc3b1a9sm15229918wrs.52.2023.01.31.08.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:03:40 -0800 (PST)
Message-ID: <00d550d449b589937bcfb07b6c23941b5ead27e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 31 Jan 2023 16:03:39 +0000
In-Reply-To: <CANNYZj-o537KRKz8J9zn5EspbakeK-SxbCEPpKKad1xkCgRVCQ@mail.gmail.com>
References: 
	<aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
	 <CANNYZj-o537KRKz8J9zn5EspbakeK-SxbCEPpKKad1xkCgRVCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 16:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176523

On Tue, 2023-01-31 at 16:14 +0100, Alexander Kanavin wrote:
> On Sun, 29 Jan 2023 at 16:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > http-server in dnf tests breaking
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > We've started seeing a lot of short packets with the http-server used
> > by the dnf package manager tests. dnf retries and succeeds leaving a
> > failure in the logs which parse_logs picks up.
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6592/=
steps/14/logs/stdio
> > Central error: 2023-01-29T11:43:32+0000 INFO Error during transfer: Cur=
l error (18): Transferred a partial file for http://192.168.7.1:36183/corte=
xa15t2hf_neon/libc6-2.36-r0.cortexa15t2hf_neon.rpm [transfer closed with 15=
758 bytes remaining to read]
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6592/=
steps/14/logs/stdio
> > Central error: 2023-01-29T11:07:31+0000 INFO Error during transfer: Cur=
l error (18): Transferred a partial file for http://192.168.7.3:42417/core2=
_32/busybox-1.35.0-r0.core2_32.rpm [transfer closed with 14627 bytes remain=
ing to read]
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6598/=
steps/13/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6532
> >=20
> > and a load more. Why the sudden increase in frequency, not sure. Could
> > be 6.1 kernel related.
>=20
>=20
> I ran this locally three times with master and it wouldn't reproduce.
> Probably build host has something to do with it too?

I think you need two different host OSes. Which two trigger it and why
I don't know.

The last run on the autobuilder was fedora37 and then alma8 FWIW.

Cheers,

Richard


