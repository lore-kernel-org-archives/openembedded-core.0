Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886A7C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:11:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.23984.1675260666602943990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ex48ovxX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id t7so9080133wrp.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QL14F0/wHFbXhhl3rfzxqdgXeDaEXoERU8kyBZl573k=;
        b=ex48ovxXDl7Jl5SOntLK9arc2EzIfqTMfYX/JeHJgkyB2DDJM81hkUv9woZy5wq6J8
         92W+K9w5P2UKm1edXOB+NQzRirox8HqQh6JmQggjNF2JAFPSyVrcM5SIJM8Ts2/mWmei
         dCu/3dr6hzth2hGWkt4ntCezqN3jZR37PqnzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL14F0/wHFbXhhl3rfzxqdgXeDaEXoERU8kyBZl573k=;
        b=5LTmyrEdRLr36oWmuSKneCQ7WRODvEUxLr/sJoblMqtvSJGw1GzZBDVfsmAijrdsEs
         QR/wyZrzoOdz5NoI93CkynmPlvHT7KIZlFm1OCkt0pTWgau4SKQKKiX/s4Qz4MaDWIAQ
         bID20hoS7P9WTnxVjbKD+Zg9yGB/pV+BJmkfN9z2Yu/pPVddwp2RFgyVuchhsMLZqVUZ
         Vn40QnnC6U+np6B8XUgPnTf/w9612cWVEyS59ThLk8nTMUnVTfbpsFZcmMWrfnJB/R12
         xhl6XCZkCM/Ehuu+7Y5J0QbbWYcYJn724KzXK0K+E5QWIq2NTQh7YhrFkOzndcmDs980
         dGqA==
X-Gm-Message-State: AO0yUKVngCp/WXtHwkNF41zmqOOkhDGMm03dtTlgRKeWWkqrqayrWwYI
	WTjKxg8upPvmhfE3F2f+KLVzB5VCRb1AbLO2
X-Google-Smtp-Source: AK7set/5XvOOg+wwFVqEZS83Ay98Dw0B+DB56/QVIktsiLEOrzRzuCMrT++AsBGvL0wa5jitWBW9Nw==
X-Received: by 2002:a5d:60c4:0:b0:2c2:de2b:e7ce with SMTP id x4-20020a5d60c4000000b002c2de2be7cemr2416960wrt.63.1675260664596;
        Wed, 01 Feb 2023 06:11:04 -0800 (PST)
Received: from [172.27.244.82] ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb11000000b002bc8130cca7sm17561212wrr.23.2023.02.01.06.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:11:04 -0800 (PST)
Message-ID: <7af62c7f16458da3fa0d5254fd904b0c959fec29.camel@linuxfoundation.org>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt
	 <JPEWhacker@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 01 Feb 2023 14:11:03 +0000
In-Reply-To: <173ED1DEED132984.27165@lists.openembedded.org>
References: <173ED1DEED132984.27165@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176534

On Sun, 2023-01-29 at 15:41 +0000, Richard Purdie via
lists.openembedded.org wrote:
> http-server in dnf tests breaking
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> We've started seeing a lot of short packets with the http-server used
> by the dnf package manager tests. dnf retries and succeeds leaving a
> failure in the logs which parse_logs picks up.
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6592/st=
eps/14/logs/stdio
> Central error: 2023-01-29T11:43:32+0000 INFO Error during transfer: Curl =
error (18): Transferred a partial file for http://192.168.7.1:36183/cortexa=
15t2hf_neon/libc6-2.36-r0.cortexa15t2hf_neon.rpm [transfer closed with 1575=
8 bytes remaining to read]
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6592/st=
eps/14/logs/stdio
> Central error: 2023-01-29T11:07:31+0000 INFO Error during transfer: Curl =
error (18): Transferred a partial file for http://192.168.7.3:42417/core2_3=
2/busybox-1.35.0-r0.core2_32.rpm [transfer closed with 14627 bytes remainin=
g to read]
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6598/st=
eps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6532
>=20
> and a load more. Why the sudden increase in frequency, not sure. Could
> be 6.1 kernel related.

We've noticed there are virtio networking fixes in recent 6.1 stable
updates so I'm hoping we can try and pull those in, see if they help.

Cheers,

Richard


