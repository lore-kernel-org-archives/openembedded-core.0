Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABC9EC1133
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:22:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16482.1771924972457433153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IocmcBqH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4000846f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771924971; x=1772529771; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QExfzDa4PIhKLf8IOBFT82CwzK+nOycv/fRUnqlVACs=;
        b=IocmcBqHHEgO47ZbAubYbfKeaNzTpUQiigeihhqIlBx+NknD66g0epqEY3ocA/csOH
         dpaeeLBSl34vAtzLwhHgPZEzGweo1znSPpO2plog7u/Zuxd0a/e1JR/NJlt1lag4k7jY
         ApdJHU5ghSu7gmYhRWJlUc3N3QWB0pGMSnRaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771924971; x=1772529771;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QExfzDa4PIhKLf8IOBFT82CwzK+nOycv/fRUnqlVACs=;
        b=h7nMeKws2k1koG6GnGDkYwfexiJkYURV4nCmmsDEB1Cu9BreK1ilhPQwGSKbkR/pSy
         p1V3uKzEcYLIYKVOBYU6HedOOI3pK4jmie4OF6/iCG2RKVaMgsc+riz7knUr8hv1wScH
         aMPxi2P8yXT9BJVObOXZCJGvgL/gtFvJCuA9Ma2Dyya1EoaEadXMPIyAvBKfNhntOpRL
         3r6RsVFfbIRk7PhIn9NYdEghYof1+ucd8ZUe5KPoeMUgdJs1apExoxS97NX/vJSY6fPV
         cRSAg6uEqA7MQ2qz5aRsvvch3VH47i3Mj7x2FRFUp0b37i63WVAlY3pdmEjgm4pI2mYH
         uwQQ==
X-Gm-Message-State: AOJu0Ywz4XD7xmM4vaxGy2QUnKh5iCcZSUt1SliCPHjFdpn5JhnEEixO
	OTtIUYL4addMTG/bc2AfZAHeLessZGwD6LOUUgVMS3XQT7yQcvTwj5w/KoDRUlfPorc=
X-Gm-Gg: ATEYQzzYfLqtK4fhY9HN7TPs7w62dW8BH1I7v54ZvVSKjSFnb5LohenOO39UmZobuHZ
	whtt2aVQuNbOudzXrtLELm56NdonpR1qo99k8pYyKD2SR1fN8UoZJXkk9birPJRO3i8qyNRBPog
	LvqjbYsgeTSY7MZenwUojbszbSD2OQ0Ujs8GZ3XgB4NC6lRv2a1scgvrXeS3qYLKaOFTxYiyOxn
	ynda7l4shRzjGtuzeyzgJBynjLtlEMfXOXxC5VjgkqdKnpSPkB3m5/Ls35xVEvJVHETWQ+c8WbM
	FqIvcdeYY75uZPJ8O657aLPT8qDnrqdnwfkM+9BGqkqrs/UnZOhGs/UMQ6o8TnqCa8oL18FtCAW
	el7IvH0LzSdPnxTg/rP3ES3kyXob4SJZtE21zTaGNC5bz5N6wkwY7UL+nt3X5B/S2BjuJCEQhKJ
	Oo5u1XfKmhRv3s66GMjRh2FjYuqHliYP5G4i3A0D7aeA8WQZKtBW9ZUf7Jb8zIUUCgLFdzncEEe
	vFCTtaYUMbi+gY=
X-Received: by 2002:a05:6000:430d:b0:430:f449:5f18 with SMTP id ffacd0b85a97d-4396f185510mr20694615f8f.46.1771924970729;
        Tue, 24 Feb 2026 01:22:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c63:c7bd:87de:1edc? ([2001:8b0:aba:5f3c:8c63:c7bd:87de:1edc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43987f3ed03sm3114238f8f.16.2026.02.24.01.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:22:50 -0800 (PST)
Message-ID: <5cae187821817287fbb153a76a27e20d278159c2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] meta: fix generation of kernel CONFIG_ in
 SPDX3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: benjamin.robin@bootlin.com, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, kamel.bouhara@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, jeremie.dautheribes@bootlin.com, 
	thomas.petazzoni@bootlin.com, antonin.godard@bootlin.com,
 pascal.eberhard@se.com
Date: Tue, 24 Feb 2026 09:22:49 +0000
In-Reply-To: <2030868.PYKUYFuaPT@brobin-bootlin>
References: <20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com>
	 <CAJdd5GZqLc0ocXyMC9v4gV-DYBM4vA+RjQYVgnNyH7HH1QZDBg@mail.gmail.com>
	 <2030868.PYKUYFuaPT@brobin-bootlin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231753

On Tue, 2026-02-24 at 10:10 +0100, Benjamin Robin via lists.openembedded.or=
g wrote:
> On Monday, February 23, 2026 at 6:43=E2=80=AFPM, Joshua Watt wrote:
> > I like this in general, but if you're going to bbappend, the `return`
> > will mess with any other appends, so it needs to be avoided. Probably
> > just put all the code under a
> > `if bb.data.inherits_class("create-spdx-3.0", d):` instead
>=20
> Indeed, thank you for your feedback.
> My initial plan was to move all code inside a Python function named
> create_kernel_config_spdx, and to call this function from=20
> do_create_spdx:append().
>=20
> Sadly, the generated code looks like this:
> ```
> def do_create_spdx(d):
> =C2=A0=C2=A0=C2=A0 import oe.spdx30_tasks
> =C2=A0=C2=A0=C2=A0 oe.spdx30_tasks.create_spdx(d)
> =C2=A0=C2=A0=C2=A0 create_kernel_config_spdx()
>=20
> do_create_spdx(d)
>=20
> def create_kernel_config_spdx(d):
> =C2=A0=C2=A0=C2=A0 # Code of the function
> ```
>=20
> This is not going to work, since the create_kernel_config_spdx() is decla=
red=20
> after the call to do_create_spdx().
>=20
> From my point of view, there is a bug in bitbake code : The emit_func_pyt=
hon()=20
> function=C2=A0 declared in lib/bb/data.py does not generate code in the r=
ight=20
> order: The "write_func(func, o, True)" should be called at the end of
> emit_func_python().
> I am missing something, or is there any reason why emit_func_python() is=
=20
> implemented that way?
>=20
> Anyway I am preparing a v3, that solve this issue differently.

I think it would work as the emit_python_func code generates code for
debugging, it isn't what is actually run. What actually happens is all
the python functions are compiled and then called within the current
python execution environment.

Improving emit_func_python() to be more accurate is something I've
wanted to do for a while as the data store is missing, as is most of
the fakeroot execution environment that the shell/python tasks
sometimes use too.

Cheers,

Richard

