Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D89CC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:39:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.50064.1702921170972391865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uljg+zcd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c6e2a47f6so34858145e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702921169; x=1703525969; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fYrpJeIGMH7qTCEQTlMp202aeGfAlAKUDYK8nSoN7Pk=;
        b=Uljg+zcdvUvIELQva3QW3wp65lgOVGm2a3UUZGGVa9iTp+M08s5Iie7PJwsTO7ofII
         O3SvE/AXZ5c+w5YFSWu6G9IxkSdV98+ZIpLrfWakDosSNXDiEWJGGzuv3OwR756t0/On
         BEG3GbB154+Rj2k+XWv03RQ4ACivGtxuOvIzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921169; x=1703525969;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYrpJeIGMH7qTCEQTlMp202aeGfAlAKUDYK8nSoN7Pk=;
        b=Zws6BuCSoMGRr+/iCTUWg/NR7QZUSXjOv6SlDl+ecgjzgM1RPAP0p7ouF0KvGMT1UE
         h/BbSL8u3pea4rHH3Qc8CZHCNANLnx910CEKL4r/nu7TjRT/gpW1pai4GZjSrwOejXyB
         DP2K6YNvCms7eF+zVXqVlkTZtDih6zOP4uXvbxdemVHFTpq+oQnz4iLaSS2mdUick3r7
         c5O9NQKNStBew9MGzlgUgnRaZ3M0NU4MjpSaZzSb/CR463tPh8JWtROzp7gs7r/+Abqp
         OFesDcExRr1wWrPRlHPQVcqGbQqHQZA422LqjCqZA6qTd0V7WcnLtZ4qxh8QGC0B4Vd7
         9lTA==
X-Gm-Message-State: AOJu0YyTMGAe+oy7/MQWLgHrMmHgKAybVVESnitt5Z5czwHyBDK8Wsr3
	6fbbS39qOupRXa2/OPlUtgvBpl76/8AMI0qoKf0=
X-Google-Smtp-Source: AGHT+IHFALT5U/GC+HKWrkNalbTy1A1/52RymFoFRONDfiMwZfMS+rD+pUFC/x7anDOPhk6l9R1mgw==
X-Received: by 2002:a7b:c019:0:b0:40c:62a7:1fb0 with SMTP id c25-20020a7bc019000000b0040c62a71fb0mr2174047wmb.12.1702921169390;
        Mon, 18 Dec 2023 09:39:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a720:6e27:acc4:d591? ([2001:8b0:aba:5f3c:a720:6e27:acc4:d591])
        by smtp.gmail.com with ESMTPSA id iv20-20020a05600c549400b0040c4afa027csm31808346wmb.13.2023.12.18.09.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:39:29 -0800 (PST)
Message-ID: <8c6798ae99a7ef9be3d4ed558762e910851a4c6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2] qemurunner.py: continue to drain
 stdout after login:
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, 
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Mon, 18 Dec 2023 17:39:28 +0000
In-Reply-To: <17A1E9406CB748A4.24236@lists.openembedded.org>
References: <20231211155729.106010-1-alex.bennee@linaro.org>
	 <17A1E9406CB748A4.24236@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192669

On Mon, 2023-12-18 at 11:23 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2023-12-11 at 15:57 +0000, Alex Benn=C3=A9e wrote:
> > If qemurunner doesn't continuously drain stdout we will eventually
> > cause QEMU to block while trying to write to the pipe. This can
> > manifest itself if the guest has for example configured its serial
> > ports to output via stdio even if the test itself is using a TCP
> > console or SSH to run things.
> >=20
> > To do this:
> >=20
> >   - always create a logging thread regardless of serial_ports
> >   - use a semaphore between main and logging threads
> >   - move the login detection into the logging thread
> >   - wait until the second acquire before continuing
> >=20
> > This doesn't address a potential overflow of stderr although generally
> > stderr from QEMU will be a lot less likely to block due to the volume
> > of data.
> >=20
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >=20
>=20
> "bitbake core-image-full-cmdline
> -c testimage" just hangs, it can't work out the login prompt.
>=20
> This code has been the source of a lot of races issues and intermittent
> failures which we only "just" got to the bottom of and introducing a
> load more isn't something I'm feeling great about. I'll try and find
> some time to see if I can work out any better approach.

I've posted an alternative couple of patches to this. Could you see if
they help please?

I realised that we may be having the overflowing buffer problem on the
serial connection as well as stdout.

qemu stderr is being sent to stdout so hopefully there isn't an issue
there.

Cheers,

Richard

