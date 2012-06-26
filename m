Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjOMq-00017I-Jk
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 07:31:12 +0200
Received: by eekd49 with SMTP id d49so1565222eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=6c1VKB1jgDIv6wBR8SeqaTCivPsSHItKEe0ahcZM17E=;
	b=Kizb2oxWQ4Fcb+Ec6EDe+xcXDAXAo/3UWBccbWOUhjuu92G8IcLK6KD3vxnkfN8cAu
	LTV9wx9ZUQfaURjSghHdc4yrxzu9bTdANlxPRSVsVoWjCGgXgfIMey7dN6Q4e4iHwLFc
	w+z7/TOmA4igvcoERqZMWZFs8IWy75uJvvJu14GSQFxrQo0U3y6EWBzsQYgOFXRNZKMq
	d0d4t5JuVQriJV5V1hxPpflfEhWIKSDmwjMezBZ6ODZ/EZxqe4ebF82341NO7gY1LyDB
	2gPCD+DUUd4xVkgqakUUzbQ0vdSfPBNdMVgoQM6pS41xSqE0Ugd7gOLOlJy/Vaco6lZc
	pTRw==
Received: by 10.14.97.16 with SMTP id s16mr2651505eef.117.1340688020901; Mon,
	25 Jun 2012 22:20:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Mon, 25 Jun 2012 22:19:50 -0700 (PDT)
In-Reply-To: <4FE8F542.2070304@linux.intel.com>
References: <4FE8F542.2070304@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jun 2012 22:19:50 -0700
Message-ID: <CAMKF1spxr+RVQ85YoxdPdrPi+f4V6A_6Gt8QOWTeLCcF_DXEaA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel: building target-arch scripts/* to include in kernel-headers package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2012 05:31:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2012 at 4:33 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> I'm working on a patch series to provide a kernel-headers package which
> allows for the compilation of Linux kernel modules on the target. I
> currently have something working, but it requires that I first build the
> scripts/* binaries on the target, prior to trying to build a module.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# cd /usr/src/kernel-headers
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# make scripts
>
> Then I can build modules:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# cd /home/root/hello-mod/files
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# export KERNEL_SRC=3D/usr/src/kernel-headers
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# make
>
> And test:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# insmod hello.ko
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# rmmod hello.ko
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# dmesg | tail -n2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello World!
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Goodbye Cruel World!
>
> I would like to package the target-arch scripts binaries with the
> kernel-headers package, but I'm not sure how to go about building both
> the native and the target binaries as part of the kernel building
> process. Does it make sense to build these as part of the do_install()
> task after I've moved the files from the linux recipe's workdir and
> removed the host-arch binaries from scripts?
>

the hostprogs there are a bit hairy. you could set HOSTCC to point to
cross compiler and build scripts dir in some O=3Dfoo after copying
.config into it but the problem would be that build system expects the
hosttools in build tree at exact same location
e.g. fixdep would be needed even to build other hosttools e.g.
recordmcount etc. and thats where you have to patch kbuild such that
it could reference another fixdep tool which then will be built for
the host you are compiling kernel on.

I have a reverse problem, I want to package the scripts/ for cross building=
 :)

> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


