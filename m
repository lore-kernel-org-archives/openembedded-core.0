Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 70D8B606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 14:05:29 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so14146779lbv.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p65w8s54YmCIChJpmxWjzm6JEEzxkJnoIFsK4cmJwGA=;
	b=tySkidcTmZ0hbC8EWpgTYfMw9cw6X1SoB0yJABzDaCY2U0UcCnlUY+9721dISqnq7n
	l2uPUYeZ7kjUu5+vAi5omHPWwzKcRTvschgecIfLSeL204zYFJVRC8lWMKbFs6+rzR/b
	9yIL0mBGSY88SSzLbplNeKzQRYZ/uJ5xFK3lMP0I3OQwkArUOBEu4b1FoDIeqzqrnZ61
	ovPiYxxSnIJ/c8vb0yTMTeySfUMR4HH1SkoaPKMbcBWd8Pnv3X5Hw5LHWf2B+YT7JkRX
	nS+xvbFpYdQP/qySd3WCuH9DVZbOv8lZOlcHw6TDtMQIx5np/rGtc9BNEyJLSZtGGkRa
	2JYA==
MIME-Version: 1.0
X-Received: by 10.112.114.230 with SMTP id jj6mr5759923lbb.112.1424613929997; 
	Sun, 22 Feb 2015 06:05:29 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Sun, 22 Feb 2015 06:05:29 -0800 (PST)
In-Reply-To: <1424610251.11836.74.camel@linuxfoundation.org>
References: <1424610251.11836.74.camel@linuxfoundation.org>
Date: Sun, 22 Feb 2015 09:05:29 -0500
Message-ID: <CADkTA4O-Ju8e1xLVdCfCeyNNgHymUW8gHwK2WkyE1LPPe6bKyQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto task performance numbers
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
X-List-Received-Date: Sun, 22 Feb 2015 14:05:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 22, 2015 at 8:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As people know, I've been looking at performance a little, one of the
> benchmarks is how long the kernel takes to build. I dumped out the task
> performance data from buildstats for a linux-yocto build (nothing else
> running):
>
> do_fetch:                 Elapsed time: 0.04 seconds
> do_unpack:                Elapsed time: 1.61 seconds
> do_kernel_checkout:       Elapsed time: 4.39 seconds
> do_validate_branches:     Elapsed time: 0.47 seconds
> do_patch:                 Elapsed time: 57.77 seconds
> do_kernel_configme:       Elapsed time: 44.92 seconds
> do_kernel_configcheck:    Elapsed time: 8.94 seconds
> do_configure:             Elapsed time: 0.60 seconds
> do_compile:               Elapsed time: 72.95 seconds
> do_compile_kernelmodules: Elapsed time: 34.84 seconds
> do_populate_lic:          Elapsed time: 0.14 seconds
> do_strip:                 Elapsed time: 0.03 seconds
> do_uboot_mkimage:         Elapsed time: 0.03 seconds
> do_install:               Elapsed time: 1.87 seconds
> do_populate_sysroot:      Elapsed time: 0.16 seconds
> do_shared_workdir:        Elapsed time: 0.05 seconds
> do_sizecheck:             Elapsed time: 0.03 seconds
> do_bundle_initramfs:      Elapsed time: 0.03 seconds
> do_kernel_link_vmlinux:   Elapsed time: 0.03 seconds
> do_deploy:                Elapsed time: 13.17 seconds
> do_package:               Elapsed time: 31.54 seconds
> do_packagedata:           Elapsed time: 0.59 seconds
> do_package_qa:            Elapsed time: 5.30 seconds
> do_package_write_ipk:     Elapsed time: 83.24 seconds
> do_package_write_rpm:     Elapsed time: 44.58 seconds
>
> The "core" was getting blamed for a lot of the build time. As can be
> seen, the "core" isn't taking that much time now, apart from the fact
> that ipk packaging seems to be taking twice the time of rpm which needs
> looking into.
>
> Some tasks like the compile tasks are understandable and likely
> minimised by upstream work already.
>
> The other tasks which as consuming a disproportionate amount of time are
> kernel_configme and patch, I believe we need to look into those a little
> further too. To put it into context, should the kernel compile be at the
> same order of magnitude as the patch and configure?

I have some more changes that I didn't get done in M3, since finalizing
the 3.19 kernel took all my cycles.

But in general validation takes time, those pre-cursor steps are what allow
the kernel configuration audit to be performed, and also for the patches to
be pushed with proper attribution (and to confirm that it has been done).

But again, I do have some more changes that bring the time down, but
there's a floor to performance without breaking use cases.

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

