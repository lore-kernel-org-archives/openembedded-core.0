Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F62374B83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 05:30:32 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y5-v6so19914162qti.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 22:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WaHPenpT2o4Up9gFB0A7puI2+k3kosAaq8Z2L7S/3fA=;
	b=RnTiaWLUThnC8760YmHsvHQwXRJYDztrJy4vclgdryFRfgLQC+9XD/QW34+pFbStMa
	WLrnDBjCM86X+NMmrNGTBY4uz7FvESUYDJOl7szRmjMe8bL5w+Ht0OFnaCpKhNj2iE33
	OzIYNN27OcAee64PILYi4taVeF84Gpa5qzo7nKo/FrhhqeV0cXgPj6nsLYYnMTaNhAvp
	HXHr3ZStpljzS78g4U6v2MsqptXQo5ENKe02SJIpwvnWFJzfMMXpRFXVo5Fth5QX8sjm
	9y7hfWrWxfkL0FYYWlGR8bA8TY6qj96pSDQGEw7iFxjlbjwOg6gaKFhBBsg19PL8Dc2L
	+M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WaHPenpT2o4Up9gFB0A7puI2+k3kosAaq8Z2L7S/3fA=;
	b=JIJUhIj2Q01V7qSCAMB/dhEbHzajqsOTxDZkWVzkAR5mmnZLuBKRu9k70kd85Suoz9
	8UXt2Jpb4NMJHvrXfgwDSZLCTGXmEH7vc8hRFf/VabtjdXuFLDlKXaeMga4mOBvQYsgp
	/ssdC3pkWgEsux/bWQBJjYfNRc5q0+veQpnmoIJlFD7jfYIGcNDeMKolBNe9HZsB/dW2
	Sm86aQwdRbtmK7ZDBXRArQ0dauT3k1CNa11MKXFisTyrRhvsKZN96OPaJbsnPRx/W5Ju
	q+kCa8eUJPgXbIS4QNBk+cFJwUfZYHI/uASTWOre3i+1OTeuJ4UdkF06Gb6GrTerj4fO
	VNJQ==
X-Gm-Message-State: AOUpUlH9LtvGWutd+DudtUdLohIDLBilyl2SIPXm16AEzT2O8cvJfeEg
	fbdPP86L/VshRa4bm1IBhxOQPRoTKe7M8IdtpI4=
X-Google-Smtp-Source: AA+uWPxCnGOaCATyKWIZATpxwQBWRA0H8eYzoFEbVU7OXave8Oo3mynbsxvA+aVe2Qb0cmXy7D+VQdAW6oXth6XbLrQ=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr20283959qta.128.1534224632918; 
	Mon, 13 Aug 2018 22:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180802184352.20258-1-raj.khem@gmail.com>
	<2ccce963b9eab04f088362bcc1ef6262d2bd5e24.camel@linuxfoundation.org>
In-Reply-To: <2ccce963b9eab04f088362bcc1ef6262d2bd5e24.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 22:30:06 -0700
Message-ID: <CAMKF1spY_UsJ4zWBvRV-Vf3D4-5iHD2UNS29p7K8yJQ0wPXqJg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Tue, 14 Aug 2018 05:30:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 7, 2018 at 4:03 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2018-08-02 at 11:43 -0700, Khem Raj wrote:
> > - its a general problem however observed on armv5te based boards in
> > OE
> >   other arches either have ways to compensate for misaligned access
> > in hardware
> >   or compiler does not use 8byte alignment
> >
> > - fix internal linux headers
> >
> > Full logs
> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb34
> > 9b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > V3: Elaborate commit message
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This seems to cause runtime testing failures for qemux86 and qemux86-
> 64:
>
>   4.137] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
> | [     4.137] (II) LoadModule: "glx"
> | [     4.138] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> | [     4.147] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: _ITM_deregisterTMCloneTable: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
> | [     4.147] (II) UnloadModule: "glx"
> | [     4.147] (II) Unloading glx
> | [     4.147] (EE) Failed to load module "glx" (loader failed, 7)
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/1208/steps/Running%20Sanity%20Tests/logs/stdio
>

it seems like this issue here
https://bugs.freedesktop.org/show_bug.cgi?id=35268
I am trying to reproduce tomorrow lets see.

> Cheers,
>
> Richard

