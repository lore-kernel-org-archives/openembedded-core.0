Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0EAC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 21:27:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9997.1744320462766019423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 14:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivG+dBOh;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so13936105e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744320461; x=1744925261; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9xi/M8rLeAuzR1q067tVbDKxh4i61kZ1fjE1p32AG5U=;
        b=ivG+dBOhz6/1857tJEsA9itj9+WCWM4Ry/7pCr+E3gp/w3fFYKHKoQdTBXO0d9E24e
         FbnHQnqAXjrgYRKhewFnWNT/gHJwZWC24QxNOpUjWApQJuEHGWR1JQOI4AJucPq+yoQS
         h0+ZFTNBumSNNhmXzNH3Gc/zYg2dtVXNmrSusZKkoU43bISM5cJmkVTriWV4s2w2rvEo
         aFv5KKQVg70srR1niwdsQ+WD2xSx/lUSXmgUqMPtabAFb5Jra2dPimiBK0TnyTd5SdXT
         vF9pMs6oyFTBk+IKdXGmRqaj4+K5X0t4RR/UBXRfukLPGe+iIqkUr+mFR5eS06Kn7Z9k
         /2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744320461; x=1744925261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xi/M8rLeAuzR1q067tVbDKxh4i61kZ1fjE1p32AG5U=;
        b=shKsKtBtXHJC7wpEsf2UMpNWPnBhB5wR/XwXbPfYAx23qiyvGpCzpFKJ6rZFQzov6F
         tVxq6Y/U5h0b2ffK5/LQh0n5qLAYbFIieE8ndTPYyP/66ar3KpTQzP0PWwTEMbGtP7U3
         JW4oC2WoQfy4s4uSP3qM3MdhdHU2sXuFnUbSz3VjjFo7Cpfh8fMIsrTE+h+h52gAJ3u0
         wDRzDc43V/eS1PUM7ulDvHpo/lZZZD3z3ddvBzIjFSALjGnVpqkosdUMunD5hnXPJ8BU
         K8mruEP5TU21iuec5uzS9aynfuSx+YRG/fdvu4c7CnuFBZIZ/RdoxBu63BLhSl+FT5bP
         GJqQ==
X-Gm-Message-State: AOJu0YxbswVZsFMTzKiR0W3tAvIkcETCYYpfIE/FLTHcthrk0J4+sZcK
	b8UfYM0G8dLJXjI9Zsg97LMr1rXp9QBeZL4bE1N6jDib1GMupLM0
X-Gm-Gg: ASbGncuMsawVFwkqz8Fo6JdBYP104A28Q6yniFnyOMuqaqReRdtEVVTclYErbaxhCBy
	+NVTHg28O8RGa9M5PXLnmOTLc6HqXkELaCIAsKGcwEaqM9FxzAXD0CQWB3h/HZ2z0JeUi7vbxis
	BPcbsglm7STKSFXK2S2E/9s6S5vMBMCE9VRHXHKwo2tTijPZK7hDQJLj+e/w4uaeUm0qmER/9QS
	J9YNFBJCz8jD8tZIo87Kw0utqr3iDhwR+h7D6FWNnXyHhHGBY6eJ0T9DjimxLaXFuKTMmged8br
	uLzYzN+3KukI+Tf7S+SzieYZp62fC4B9ju9NT+i4zIwjx5ukWOfsh6m7Puzegj3r5Y7oogGKk88
	Wv//rUJJtN/aZ9A==
X-Google-Smtp-Source: AGHT+IHifGl0DonAQzqeEilmQcM9nS0kZB0doB8/kL8SGPOVREfUcvYE5t7RF+/0OUgaFtJpY8QE0A==
X-Received: by 2002:a05:6000:1a8a:b0:39a:d20b:5c14 with SMTP id ffacd0b85a97d-39eaaed2122mr173400f8f.36.1744320460656;
        Thu, 10 Apr 2025 14:27:40 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cf42sm71934f8f.64.2025.04.10.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:27:39 -0700 (PDT)
Message-ID: <ce4a1e37f12e7951bf19c3abc2a2b8e6a1f212d5.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: remove hard dependency
 with busybox
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: gavrosc@yahoo.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 23:27:38 +0200
In-Reply-To: <CAMKF1spsxXoWi_GMqcBqip7yvJGSvsPMXe3RXGBi8FfLaDMdNg@mail.gmail.com>
References: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com>
	 <8404.1743264073178142467@lists.openembedded.org>
	 <CAMKF1spsxXoWi_GMqcBqip7yvJGSvsPMXe3RXGBi8FfLaDMdNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 21:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214710

On Sat, 2025-03-29 at 09:29 -0700, Khem Raj via lists.openembedded.org
wrote:
> On Sat, Mar 29, 2025 at 9:01=E2=80=AFAM Christos Gavros via
> lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
> wrote:
> >=20
> > hi Adrian
> >=20
> > thank you for the comment. I had a look in commits log and it looks
> > that '-c' was there since the beginning in 2008/09/10 in script
> > 'init-live.sh' and then moved in 'finish.sh' in 2011/12/08.
> > I reproduced the issue by using qemu and I described how I did it
> > in detail in bug #15716.
> > After I applied the change I tested both busybox and packagegroup-
> > core-base-utils. The boot was successful in both cases.
> > Also '-c' is an option in busybox:
> > https://www.busybox.net/downloads/BusyBox.html
> >=20
>=20
> -c option is to redirect the console after switching root. Some
> devices it did not work properly because util-linux version moved the
> pseudo filesystems like /dev automatically
> but busybox version did not, maybe things have changed but I would
> suggest that this operation is now happening with both switch_root
> versions with you script manually doing so.

I tested this on a device with kernel 6.1+. It seams to work as
expected also with a busybox based initramfs. Maybe you are right and
this is more like a legacy thing which can (or even should?) be
removed.

Additionally I looked into the code from busybox. The related lines
are:

	if (console) {
		close(0);
		xopen(console, O_RDWR);
		xdup2(0, 1);
		xdup2(0, 2);
	}
https://github.com/brgl/busybox/blob/master/util-linux/switch_root.c#L143

At least on my device this would just close /dev/console and open it
again. Not really useful.

I think the patch is beneficial for probably all kind of systems.
Adrian


>=20
> > I will wait for more comments and then I will extend the commit
> > message and send a v2.
> >=20
> > Br
> > Christos
> >=20
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213886):
> https://lists.openembedded.org/g/openembedded-core/message/213886
> Mute This Topic: https://lists.openembedded.org/mt/111959232/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


