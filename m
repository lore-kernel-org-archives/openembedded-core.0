Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 99B7A6B8CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 02:40:27 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so4216677pab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Vp2OXQDEF42o8kCq25toAhg0QzqWvelMCPx+wct8qsc=;
	b=UINtFt8aozEgwRiNgOF2FU1EEKKrYmYQVIldX4lqWB1Rh6qjWd9uN1OFiHQ7FBim9H
	TarSkU+JMzlr5p+MTrvRsiQKSb2YBVvO+8fK6eLM1J4QMa4lPS5dqca1HEw1Rdh7A7M2
	4EnZzJpU63dUQF62Jm5RB82zAFJEm7ppJwC1sGNz40TNaD6GbfPz7Aoolqht4ye7Z0aW
	MXftDYFDWvjO/ZBFZWNvJRzLqJ72+YK+wreZht2i1sDtMDyjvXJKHf235dsC5/5acWDd
	7hZuaYrPPqgcF7AZ9CPrhpq83FcgyFq9/TG2eiadxItQIyAyi7nVq3p5GbcNd55C5Za+
	3AvA==
MIME-Version: 1.0
X-Received: by 10.68.253.161 with SMTP id ab1mr18443039pbd.76.1377571227594;
	Mon, 26 Aug 2013 19:40:27 -0700 (PDT)
Received: by 10.70.35.235 with HTTP; Mon, 26 Aug 2013 19:40:27 -0700 (PDT)
In-Reply-To: <a7cb7b0c2c43a8cc4c45608ed805dbf015e4fdc6.1377145501.git.raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<a7cb7b0c2c43a8cc4c45608ed805dbf015e4fdc6.1377145501.git.raj.khem@gmail.com>
Date: Tue, 27 Aug 2013 12:40:27 +1000
Message-ID: <CANwerB1Sj-YRkr=0i2TrWzraD4rWQmsnJOWoh4Kwoo3eJsor7Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] systemd: Upgrade to 206
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
X-List-Received-Date: Tue, 27 Aug 2013 02:40:28 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2013 14:31, Khem Raj <raj.khem@gmail.com> wrote:
> Add new PACKAGE systemd-rpm-macros, this will hold
> the macros which are interesting when rpm is used as
> package management backend
>
> Forward port uclibc only patches. Add a new patch
> to stub out use of preadv/pwritev in testcases
>
> Delete patches that have been merged upstream in systemd
>
> Remove force export of GPERF variable in environment
> this was causing AC_CHECK_TOOL to not populate GPERF
> variable as expected
>
> systemd needs kmod to be present on rootfs so add it
> to RDEPENDS
>
> some services substitute discovered kmod when the service
> file is generated during boot, however the discovered kmod
> is from native sysroot and it gets into the service file
> with absolute path. So specify the target path of kmod using
> KMOD variable so the unit files have correct pointer to kmod
> on target
>
> Add a patch to make sure that mknod capability is checked
> before the service which excercise mknod, this patch is also
> submitted to upstream systemd
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Arch Linux had some issues with systemd 206 with regard to device
nodes in /dev getting wrong permissions:
https://bugs.archlinux.org/task/36259

I wonder if we need to add patches for that as well:
http://cgit.freedesktop.org/systemd/systemd/patch/?id=15a722007dc1d8a9a11934b2ab528cf4d25b6c62
http://cgit.freedesktop.org/systemd/systemd/patch/?id=a2aced4add1964f82cfd250f1fee8de9d974b507
http://cgit.freedesktop.org/systemd/systemd/patch/?id=5c7951141fa9f33e1b97de97586cc16bce2776e0
http://cgit.freedesktop.org/systemd/systemd/patch/?id=ec99834cb0e76a9e7096bd42249053712db9c32d

Regards,
Jonathan

