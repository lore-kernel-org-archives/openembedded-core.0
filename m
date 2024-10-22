Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C05BD1CDCF
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 09:58:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14750.1729591116717815783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 02:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HcKu9HNK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so28122025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729591114; x=1730195914; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u2tJVkG7SWui0wLjFoQvPZSUZI+br52aR4Mcbt5Nox0=;
        b=HcKu9HNKtRQ+KHtmItheQKvOfk9XmDDW19Y+mBUubyfRs8MZ/puaqbWS9idD0TwfCM
         Hehx7TcoljABUB8G4AGMRvHMQvZxzCHz5YWjtn6B9OzDEE4mFga4L9gUoKtxaZzcpUhN
         +cgKQJrM9htWv/fMABKGK9JXityJ0u0B5+bWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591114; x=1730195914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2tJVkG7SWui0wLjFoQvPZSUZI+br52aR4Mcbt5Nox0=;
        b=B4+InImu0BEldWGmEK2FQSc+nTlFucW2t8fzPm0ydiyJMw+bjSbg0IAQWLHFkcWHUI
         dhKwADPAajHplbHZ8T3AuIrKN8jOhE6ePaeW2KQkWONyfM9uOWm6qNNaEejzeolhNa1z
         +0Jhsgzd3GG1O/MsirnsrvYggoPEaJhpl4zZnR5XnCNrD+5byOcPuvUtSnegDBBwOib1
         n94OeyCoyqx3KlK6PS8Q7sWPakhuR/dgpqUBWBqFJnqLA+0yIoGilw55ziYyE1XJz+tW
         j3f5wxR2XOn2LlaMupia54IIcJezlKjLJ6GZByxVZ+4sAQRZQsrmIEQ0g6/69vrepba1
         iaBg==
X-Gm-Message-State: AOJu0YzWFHxZwr70e+etsMEj4pctZDOUrDhFmXxnA/UB3ZO57VTdu4Ab
	UPfiyPoU/5rNLpbjmVWuVt5DONTmVS+G/+LEqSkZBh7OgdDHkBKK0mu5oPcTCzA=
X-Google-Smtp-Source: AGHT+IFYnvasWpBDbugeuJeCx+vBnEZ/vT3mKnYmbrLDC+0o8GVDxWP8TzbCcOWjyFwT+7VTypZu3g==
X-Received: by 2002:a5d:6506:0:b0:37c:ccad:733a with SMTP id ffacd0b85a97d-37eb48a9df9mr8463943f8f.59.1729591114443;
        Tue, 22 Oct 2024 02:58:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:65f7:2a12:edef:6771? ([2001:8b0:aba:5f3c:65f7:2a12:edef:6771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a378d7sm6252442f8f.16.2024.10.22.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:58:34 -0700 (PDT)
Message-ID: <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Halstead
 <mhalstead@linuxfoundation.org>
Date: Tue, 22 Oct 2024 10:58:33 +0100
In-Reply-To: <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FFD5DF016C394D.24795@lists.openembedded.org>
	 <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
	 <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206146

On Mon, 2024-10-21 at 12:55 +0200, Alexander Kanavin wrote:
> On Sat, 19 Oct 2024 at 23:48, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> > Creative ideas on further debugging welcome, I'm not sure where
> > from
> > here. I think it narrows down the issue to the host kernel or qemu
> > and
> > these qemu binaries are working on the other builders. The host is
> > a
> > 5.10.223 kernel:
> >=20
> > $ cat /proc/version
> > Linux version 5.10.0-32-amd64 (debian-kernel@lists.debian.org)
> > (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for
> > Debian) 2.35.2) #1 SMP Debian 5.10.223-1 (2024-08-10)
>=20
> There's an option to use 6.1 kernel on bullseye:
> https://packages.debian.org/bullseye-backports/linux-image-amd64
>=20
> so I'd give that a shot, if only to confirm (or refute) it's
> definitely 5.10 on the host.

Michael was able to switch debian11-vk-1 to the 6.1 kernel (thanks!)
and I've run  5 builds successfully on it, the single build I tried on
debian11-vk3 at the same time failed.

I'm therefore willing to say this is some bug in the 5.10 kernel,
switch our other two workers to 6.1 and call things "resolved".

Yes, ideally we'd track it down and get it fixed properly but we're not
really setup to debug Debian bugs in old releases and we have other
more pressing problems.

Cheers,

Richard

