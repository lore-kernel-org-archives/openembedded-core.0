Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 421306FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 07:09:18 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so23849205uae.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 23:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K8KyKLdgaGof4eRI4cbXZCIl9q0QKMvLnMKWDUS/NXs=;
	b=k5bBzYmB4q09dc2EJFgT6lsueaLTfZ/4zJdQpaIzx3McrdMaaxDh6REJrIaD6yS9pi
	3pO+vpYAWtGsOPShcu/6Z/7eGJ8wZ8N4tL9OMb3T01Tk3WX4yhbpYOxy7tw3HAaLOAG5
	6DfJ5o4tbjnZnQxyOq8KaMhk1/uEANj41QfB++U8IK51dyJ/SXGhflrqIkVJ/3yM+4xH
	UySihdY4V9HjzceB0AZvhNXAkBl7yf5YwhctnobfehpypqTcYNShT0RueR5k50FFo5Bi
	QWFPKz1rkmKT4a72gvyp1ReSTqxevgr1EQYD05y2u7g4AY2nSyk8yl/+/5LO1osAf59M
	NvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K8KyKLdgaGof4eRI4cbXZCIl9q0QKMvLnMKWDUS/NXs=;
	b=RRRE/FU38+IggcLZIaxxzIRO41PrQj37fp6oW7lgjlqFMF+EvZN5INrjyJ9Uv2gzq+
	dGpDFRFmPxXToTVsneyLplPrme96isNETVtz9qMIuCNvA4sppGcA+glZIlWK3aZPrZWK
	5uKeqslrHX6/Ism+R7/eqnMt8nJD3ytI+ESxWVstiYLnAces6C0qcnpF+JUQYXOBbegN
	+zuMPXZYTuvKFezN+n1kyHo6sPgqoTPAKTUf2/hj7qNwF9r7ewCwwDQw+Itu2ZQLFCiR
	YsW1jmgFYAXa2PL9KPilIxCKCx7hhK7UhUKkM5cN4KNCdhXW+bvR1fvShlpMQ4gF1uBc
	155g==
X-Gm-Message-State: AKaTC02BbFiyqnCKZrh2LM+NukOacX1UX++q2w9DcI+hdqRYwdvenwpu954bdOI4/8cZe4h52WN3PCYZ8lI2fQ==
X-Received: by 10.159.55.142 with SMTP id q14mr33434660uaq.107.1480662560179; 
	Thu, 01 Dec 2016 23:09:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 23:08:49 -0800 (PST)
In-Reply-To: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
References: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 23:08:49 -0800
Message-ID: <CAMKF1sqVdGwXPX-hg2NCgY-VxL_1bBVQL3vpzC00033ah1N7WQ@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: non-standard library locations and rpath
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2016 07:09:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2016 at 8:18 AM, Jack Mitchell <ml@embed.me.uk> wrote:
> I'm having some troubles with shared library, shared library dependencies
> and rpaths. I have libfoo, which depends on libbar when I try to link libfoo
> with my app, it requires libbar to be found. libbar is in a non-standard
> location, /usr/local/bar when I compiled libfoo, I used -Wl,rpath-link
> ${STAGING_SYSROOT}/usr/local/bar and -Wl,rpath /usr/local/bar. Now when I
> come to try link my app with libfoo, it fails to link as it can't find
> libbar, which I assume means the rpath in libfoo isn't being properly
> prepending with sysroot what is the proper way to support this in OE? My
> library has the following rpath information:
>
> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>
> So why isn't the rpath being prepended with the sysroot when I compile my
> app and link libfoo? The apps build system is using cmake, but this should
> be a built in linker feature, correct?

Only first path ( before :) is relative to location of binary at runtime

>
> Cheers,
> Jack.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

