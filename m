Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D641737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:02:54 +0000 (UTC)
Received: by yhda23 with SMTP id a23so28201926yhd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 00:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h2Xq2z2ZCgpdfaEDpAEhZXVdWKbKK96OJBSFzWn16ss=;
	b=wIwMO1o0nTrE+RfUd+8R8vf6+6xvwbvfT4Hp4xSkNq5q6r9EWAQYcfMME53Rl22IvO
	/FeZR4bUZsmTsU3N3PiUIHshGIkIncZf41GSzIs/6Aopoc11qtopivwmtaA+c2l9I0m2
	cWhuw8OH+C4HqlHvWpTzdDcc9DHVewa5bBqmBBrwRnMs0uRXIZ8aFInVMtk8ouHKUoIM
	/U1Ca92RwwEE53A7r/ql585TQ7ZwGN/7Gc6EhgEk4wID/MXDvewTOg9Vz85dNrGylRVE
	gFpgtOKZNVAQD8YAD11JrS8v2r3AHYe+H/J/RpZ2EjOtpntJSsAyCSe9dSe1sIyILKCT
	X8ig==
MIME-Version: 1.0
X-Received: by 10.170.55.143 with SMTP id 137mr22187299ykx.16.1432623775854;
	Tue, 26 May 2015 00:02:55 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 26 May 2015 00:02:55 -0700 (PDT)
In-Reply-To: <55641868.1080406@topic.nl>
References: <55641868.1080406@topic.nl>
Date: Tue, 26 May 2015 03:02:55 -0400
Message-ID: <CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 07:02:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I get this when running
> bitbake -c menuconfig virtual/kernel
>
> scripts/kconfig/mconf.o: In function `show_help':
> mconf.c:(.text+0x884): undefined reference to `stdscr'
> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
> checklist.c:(.text+0x2c): undefined reference to `wmove'
> checklist.c:(.text+0x4c): undefined reference to `acs_map'
> checklist.c:(.text+0x54): undefined reference to `waddch'
> checklist.c:(.text+0x66): undefined reference to `waddnstr'
> checklist.c:(.text+0x76): undefined reference to `wmove'

This has popped up on and off for several years now, and we have a few bugzilla
entries that track it. The fix is never as simple as we would like.

The most recent version is here:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7609

If you have more details about your enviroment, adding them to that bug would
be idea.

The problem with using the -native version, or the host, is that at times menu
config is rendered unusable. The fix isn't only in the dependencies, but in the
way that menuconfig is build within the kernel environment.

This older bug tracks the details of that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3898

Cheers,

Bruce

>
> A bit of googling reveals that this is probably due to "ncurses" not being
> present.
>
> I just can't figure out what the proper syntax for this dependency would be.
> menuconfig needs the "native" version, so it's not simply DEPENDS+=ncurses
> here.
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

