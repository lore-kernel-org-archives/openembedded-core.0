Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E458AC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 12:49:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29442.1786970939414489393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 05:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U0VlGYGi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so610294066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786970937; x=1787575737; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zs0U7KDX2aFEf1kpjqUI+A2VFhz65tUpf+Ugil2QZXA=;
        b=U0VlGYGiBDuSSpHcyR9KbtY6hhPMA3CyY96SHrJOUNicN3/lJXci9qFblpo5EqJtdc
         zToRxorH4puXQ/RWVmF5kR4LVEHIxi8FUqL6215vW6C5DIWJMtGBT9ysWRhbCcNeNEw6
         pdb15rqQ7ROl/rEQoY4jixGjYowwGSN7koqIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970937; x=1787575737;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs0U7KDX2aFEf1kpjqUI+A2VFhz65tUpf+Ugil2QZXA=;
        b=pluvmpuA7OfoeTBoeyKIB7DIczaTwlJRnZMYbAsZiJUHpvPPNP8kyVgIAGyF+xVyQi
         J/MYdicc13GHFr8C3KZArzLqbvfS7OuL+2EgYAuUSrV9td+Bvy8qNC3RqzdMPpzqEvO/
         6XqIqmR5hhbFDkzYoeW6chADelTXQkEaRGgz16RfwvJpYWv3p2qG1t/h3zZllM1gpSm6
         QA7yHaR2gF4fjuKWewYocxf9rjAnj/xx/qSPWIHOafBjCN/XKnRL8ad092sJ4jbncCnK
         XnCRXbuX7LkAxqmN2XW64wOKfpTymZQjIpjBzoeelulw5bb7vklAl3yHebdVri+HOOQY
         YZ1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMAVvTGGWidepb7ZAt2BKhNdSBzkNgCPe3jycm/dgbeZkmrHrwDHsLIp+/qW6j3MOZXvMcAvqbaDwzPm+t+2IgAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3sYswMOIu5muphPsWRbGl7fVIAl9f0v8DS/W/IIVTlpLX+5Mq
	g5iRHGEB8hnMQWJ8BhaV3Y1DOv/DgcSw0DqEVtCRbb+nCazl5XlEdu0HD9zyi1jQhYA=
X-Gm-Gg: AR+sD10L52etxPrWr9SLpBeD0cnImjVvFZDBIVXZEf6KF1Q1kX8vBbTq7KRloUqruzK
	pRLg84pg65V+yTe/PZIBTxbTdvVKcdOYhdDNR3BbR7NxJ/a/bhaxt/Oapf7vC9D3km0rIB5xZGL
	CxMFrzd4TPbjjG05LkHjuQYhXbxZ6PXj8o9sJmSljHXfw9gpEr2Tqv4QxLFLzYmhjzcDiB43FG5
	Dbkc8EnQYgx+QF3VNfNlWe5VVLooWkONIUClE8g026wfUGh96EQgfPbBdIgRksA5It8bpuAzk4K
	yF3aS8Wz8FlJp1hXNc5sH+6ERv90jxd0smSlVmci9eE2rlrOml2c5qAMewFNzxFuOdcGrQsXdEg
	siDW+pZ+hplnxfOflv7qwH99FhzuWGjPjVn+03tfmmsPyQjUDuH1pGUJQ7W1uMf8HXMjaGYmFeR
	0AyA6BV18D1sdueni5+pus+Jyi+vBjd9WNNmM9kCnEJOIZSggZ09IFSJ1JsVHqKoJD9Y5/CR0Su
	vvc+/ccGjvhFbsWTjHBZ7ivVpGaVhsaRHI6H/A5TvQtnfafZitf+14=
X-Received: by 2002:a17:906:99c1:b0:c20:56a9:af3d with SMTP id a640c23a62f3a-c212a904ab8mr1006524366b.32.1786970937511;
        Mon, 17 Aug 2026 05:48:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132? ([2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6a073sm54415666b.9.2026.08.17.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 05:48:56 -0700 (PDT)
Message-ID: <597b689f434fa7eb1b763db08652e393f2f71d18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa/sdk: update cryptodev to a
 revision that builds on kernel 6.18
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, paul@pbarker.dev
Cc: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2026 13:48:55 +0100
In-Reply-To: <CANNYZj9SqJ8CdKO6MruFqJ1mx3=NMEyx9wovrTe_QOYyRNFQpw@mail.gmail.com>
References: <20260813030515.1028627-1-twoerner@gmail.com>
	 <20260813030515.1028627-2-twoerner@gmail.com>
	 <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
	 <CANNYZj9SqJ8CdKO6MruFqJ1mx3=NMEyx9wovrTe_QOYyRNFQpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 12:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243619

On Mon, 2026-08-17 at 12:51 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Sun, 16 Aug 2026 at 13:12, Paul Barker via lists.openembedded.org
> <paul=3Dpbarker.dev@lists.openembedded.org> wrote:
>=20
> > I'm wondering why we haven't spotted this issue previously, we've been
> > using Linux 6.18 for months now. Are we missing a test case?
>=20
> I suspect it's because the execution of useful cases for sdk and image
> runtimes tends to regress due to 'soft-skip', e.g. if a needed package
> isn't present, the test isn't run. I don't think this is quite right,
> and each particular image and sdk should check that particular tests
> do run, and if they aren't, that's a fail in itself. I'm not yet sure
> how to technically implement this.

I've worried about this for a while too.

We really need to mark up the images with the lists of tests we expect
to pass. It is tricky as that list can vary depending on distro
features and package classes but should be possible.

The other option is to have resulttool have more checks where it
compares to a list of tests we should see running. The regression
report is supposed to partly handle that but if you miss a regression,
the difference will no longer show it...

Cheers,

Richard

