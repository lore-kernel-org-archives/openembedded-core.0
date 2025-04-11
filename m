Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0024FC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:40:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.21885.1744364415042475940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 02:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GMMe+SD6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso12858315e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744364413; x=1744969213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+DsqoaoLL4TILMcMr0mzT+qO8K31DeFiPIdlWmmd96w=;
        b=GMMe+SD6LuZjYFRZlscQTphJ8EpslbxRSkdqiz92uHTV3LzUNoCGQGrh7kvn6VArgp
         o7bBM4hct2JFFmcHndV8insINC3jQtsPx5MZEqsclnS59ujE+iQgc1+omP10kw4AGQ+d
         SXDvkWZ7MR5O8E8QW5mrklyezF906NUQMQUeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364413; x=1744969213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+DsqoaoLL4TILMcMr0mzT+qO8K31DeFiPIdlWmmd96w=;
        b=JSXIK9wfQ+r7eWJdGZRhnz6AydR4LBz9UvjR1L20RvjTqAlVOJLFp7Ymmjdaq//scR
         6UvRXauHew8hMJAg4JMeiJkjWzHk8rbh49IQ5tA1YsZt391MceXA5XcEVk7iZDWxV3Lr
         xhgZwwBQU6CGBZwLWrj1klU6NfrbFYEhmvQjkIowEtwyMyuMPwgG8RVjB50oDdayFJdJ
         +PSfelk9hwjj5Php/vcLNZHybVCikbyVUFYJnZwZEQFAPA/Rb/saTcXs9mkwj/5MBddu
         lMFQzFMnQNlY20Hfb3svtL1dFHUVNc34/Dl8Wmjcf4QLHqGUHQm+lKizqR1JIMj6FcAx
         KT7g==
X-Gm-Message-State: AOJu0YyFDlzm40TSG9u6O/ZFpRy1cgYIuRv4CgqEYmd4vwQoa2T/Z5UL
	6ADKZny5PPVuE1evk6uBAZ4cw6AHoaniHZbs5rh0aIEN/2gvTjZGgZFIofyeXxg=
X-Gm-Gg: ASbGncurUsGZrwNbDybrxtE/nyoF9XuPU4xITWS1eH6wY9iLjei/AGV4d7tTdmK9O1O
	q0yTIbY0IvjWIJhXY0xt539wwscPd9gZTwUjsfjGwufc0MzA5BDyPOdG03SHTJRXCZ+AeN5PEd+
	AsTFlGrxNCuRm6zw4V/AGxjFBXXVOrpHi+8EBn4Ez2/gsLPCGKILyAKPIaLQ2OOqUCtWWPgsku+
	dmMoEhgbgwVGbA2dEIhyPDnpTTGYQC/ULJ1IPmPCbYikNF0hAZxJ2tcKk7aSOehnu46nY7rRISm
	KKzYfMRoSgrpyKe96t+qYjI3E/qjaz3dUA6osjx5yF3IEJVbV4cXkfNtUIVBD0lKqnBYzPyYBpb
	8r8JU1L9MDeRMYYwsr7dSICwb68OMpw==
X-Google-Smtp-Source: AGHT+IEhq3oaELyoItYV0yqNj3gqzu8T0Kn6lIqBktr/d22Gn211Zmu5KXU3jBJsFQMriOHkSQlDHw==
X-Received: by 2002:a05:600c:c8d:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43f3a9b02eemr20785055e9.31.1744364413219;
        Fri, 11 Apr 2025 02:40:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1556:e863:7570:d375? ([2001:8b0:aba:5f3c:1556:e863:7570:d375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d7cdsm81823515e9.8.2025.04.11.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:40:12 -0700 (PDT)
Message-ID: <6a09019c1c3ea528627a817c2fe0a4671309b5eb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] initramfs-framework: remove hard dependency
 with busybox
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, gavrosc@yahoo.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2025 10:40:10 +0100
In-Reply-To: <ce4a1e37f12e7951bf19c3abc2a2b8e6a1f212d5.camel@gmail.com>
References: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com>
		 <8404.1743264073178142467@lists.openembedded.org>
		 <CAMKF1spsxXoWi_GMqcBqip7yvJGSvsPMXe3RXGBi8FfLaDMdNg@mail.gmail.com>
	 <ce4a1e37f12e7951bf19c3abc2a2b8e6a1f212d5.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 09:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214723

On Thu, 2025-04-10 at 23:27 +0200, Adrian Freihofer wrote:
> On Sat, 2025-03-29 at 09:29 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > On Sat, Mar 29, 2025 at 9:01=E2=80=AFAM Christos Gavros via
> > lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
> > wrote:
> > >=20
> > > hi Adrian
> > >=20
> > > thank you for the comment. I had a look in commits log and it looks
> > > that '-c' was there since the beginning in 2008/09/10 in script
> > > 'init-live.sh' and then moved in 'finish.sh' in 2011/12/08.
> > > I reproduced the issue by using qemu and I described how I did it
> > > in detail in bug #15716.
> > > After I applied the change I tested both busybox and packagegroup-
> > > core-base-utils. The boot was successful in both cases.
> > > Also '-c' is an option in busybox:
> > > https://www.busybox.net/downloads/BusyBox.html
> > >=20
> >=20
> > -c option is to redirect the console after switching root. Some
> > devices it did not work properly because util-linux version moved the
> > pseudo filesystems like /dev automatically
> > but busybox version did not, maybe things have changed but I would
> > suggest that this operation is now happening with both switch_root
> > versions with you script manually doing so.
>=20
> I tested this on a device with kernel 6.1+. It seams to work as
> expected also with a busybox based initramfs. Maybe you are right and
> this is more like a legacy thing which can (or even should?) be
> removed.
>=20
> Additionally I looked into the code from busybox. The related lines
> are:
>=20
> 	if (console) {
> 		close(0);
> 		xopen(console, O_RDWR);
> 		xdup2(0, 1);
> 		xdup2(0, 2);
> 	}
> https://github.com/brgl/busybox/blob/master/util-linux/switch_root.c#L143
>=20
> At least on my device this would just close /dev/console and open it
> again. Not really useful.
>=20
> I think the patch is beneficial for probably all kind of systems.

Thanks, this analysis really helps.

I agree that this does appear to make sense. I guess it is in case the
initramfs and the main system have different /dev/console entries but
that is probably/hopefully very rare. It would only be the init process
affected.

Cheers,

Richard

