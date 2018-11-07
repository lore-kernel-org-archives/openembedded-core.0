Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4AD979D83
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:25:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u13-v6so15084730wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NsHell/QPXKi5D6EXuhimohePGwsX9kfapCELZh0K8s=;
	b=bvsFjdwNwIahHqFJuDsdWulJWV96mMlhmxFtldF7NTjHE5TEfXKxBrs5uNWmVwETeJ
	247EGYWBf+WtptnJraXx0kCzSKhGI/wlYFbWe/bkeNry/K5AiaBFcBOY8scpsTu2TJdB
	K15ZrRQAtBi6FtyPkavy3F8viU/KK3Va1SDLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NsHell/QPXKi5D6EXuhimohePGwsX9kfapCELZh0K8s=;
	b=h1sRGXlLLrCwFuZLmak+gn4CLVZwuIqTsku0VnLoKmV2PHegyZ9Wmq777TSCin+177
	LqQ+zYA1tmi1zK/nZODXx1R0Rgt2IjjAWYie7VT1nPVzj8S9CPU006T+MHPt9xPLUKaC
	vcfF33PBI0qGatJso5LB5jt6VddFDfXwEHtwGJe40dUoyyoPozzGcLcPui7FNatIGAM8
	YwviQlGC/svrISz7WyBEjU7e4uRFRQi+AfQEWJRQ5hBHsL73m954bKMgL5YZZYp/KvVW
	VUGUPfw47uurwrQwoXeiVPEJMJiGK2nUXSFtvt1apRgQk03apOfEmGBVaTErGCtiG/xj
	ExGQ==
X-Gm-Message-State: AGRZ1gLcIHswRUEyIMaBDXDDp5Q69BofCMCUlLVrcDyfWMioLf8RMnf1
	d6WZsSLL8iRErG6nla3H2ujMRA==
X-Google-Smtp-Source: AJdET5c2XIcGtLz26mBEaZmghFqcXNQXDhBFJbkPNGVxo5/k8R87XVbfzcWOgbPHLR9t1/0B5gK5cA==
X-Received: by 2002:a1c:248b:: with SMTP id
	k133-v6mr1216255wmk.148.1541582744107; 
	Wed, 07 Nov 2018 01:25:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k3-v6sm162777wro.9.2018.11.07.01.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Nov 2018 01:25:43 -0800 (PST)
Message-ID: <b9e7108611d6536150b7863e69cee43e2ea16b13.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 07 Nov 2018 09:25:42 +0000
In-Reply-To: <58a09038-bc29-6ea0-1dca-c7ac8501d670@windriver.com>
References: <0c2d7e77034c3b860d55073e4743b9af7be92b0a.camel@linuxfoundation.org>
	<1540866169-70689-1-git-send-email-hongxu.jia@windriver.com>
	<58a09038-bc29-6ea0-1dca-c7ac8501d670@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] machine/qemu*: fix kernel finish crng init more and more slowly
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
X-List-Received-Date: Wed, 07 Nov 2018 09:25:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-11-07 at 09:45 +0800, Hongxu Jia wrote:
> On 2018/10/30 上午10:22, Hongxu Jia wrote:
> > Just adding `-device virtio-rng-pci' to the QEMU invocation will
> > add the device with a default host backend. As of QEMU 1.3+,
> > the default backend is to use the host's /dev/random as a
> > source of entropy. [1]
> > 
> > When the entropy pool is empty, reads from /dev/random will
> > block until additional environmental noise is gathered. [2]
> > 
> > For Yocto, if call runqemu frequently, it will consume lots
> > of host's /dev/random, and kernel finish crng init in guest get
> > more and more slowly.
> > 
> > Here are 4 times runqemu boot test:
> > 
> > [    3.464432] random: crng init done
> > [   20.874030] random: crng init done
> > [   23.583589] random: crng init done
> > [   23.858945] random: crng init done
> > 
> > Modify entropy source to /dev/urandom device on the host which
> > returns random bytes using a pseudorandom number generator seeded
> > from the entropy pool. Reads from this device do not block and
> > kernel finish crng init in guest will not delay.
> > 
> > Of course, the side effect is obviously, we lost the quality of
> > randomness, but the modification is only on runqemu script
> > rather than real embedded device, and it benefits oeqa efficiency
> > in which many cases call runqemu especially multiple oeqa builds
> > on one host.
> > 
> > After apply the fix:
> > 
> > [    3.364670] random: crng init done
> > [    4.619061] random: crng init done
> > [    3.403897] random: crng init done
> > [    3.450717] random: crng init done
> > 
> > [1] https://wiki.qemu.org/Features/VirtIORNG
> > [2] http://man7.org/linux/man-pages/man4/random.4.html
> > 
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta/conf/machine/include/qemuboot-mips.inc | 3 ++-
> >   meta/conf/machine/include/qemuboot-x86.inc  | 3 ++-
> >   meta/conf/machine/qemuarm.conf              | 3 ++-
> >   meta/conf/machine/qemuarm64.conf            | 4 +++-
> >   meta/conf/machine/qemuppc.conf              | 3 ++-
> >   5 files changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/qemuboot-mips.inc
> > b/meta/conf/machine/include/qemuboot-mips.inc
> > index 7d9fa52..75bb988 100644
> > --- a/meta/conf/machine/include/qemuboot-mips.inc
> > +++ b/meta/conf/machine/include/qemuboot-mips.inc
> > @@ -3,6 +3,7 @@ IMAGE_CLASSES += "qemuboot"
> >   QB_MEM = "-m 256"
> >   QB_MACHINE = "-machine malta"
> >   QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
> > +QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
> >   # Add the 'virtio-rng-pci' device otherwise the guest may run out
> > of entropy
> > -QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet
> > -device virtio-rng-pci"
> > +QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 
> > -device virtio-rng-pci,rng=rng0"
> >   QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
> > diff --git a/meta/conf/machine/include/qemuboot-x86.inc
> > b/meta/conf/machine/include/qemuboot-x86.inc
> > index 1456bf7..5fdbe4d 100644
> > --- a/meta/conf/machine/include/qemuboot-x86.inc
> > +++ b/meta/conf/machine/include/qemuboot-x86.inc
> > @@ -11,7 +11,8 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
> >   QB_AUDIO_DRV = "alsa"
> >   QB_AUDIO_OPT = "-soundhw ac97,es1370"
> >   QB_KERNEL_CMDLINE_APPEND = "vga=0
> > uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1
> > uvesafb.task_timeout=-1"
> > +QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
> 
> Hi Ross,
> 
> I am afraid the patch you merged to master-next is V1 which caused
> runqemu
> 
> failure on qemux86/qemux86-64, we should use V2
> 
> [v1 snip]

Thanks, I picked this up out of mut thinking it was the V2 and meant to
check but forgot. I've the right version in -next now, thanks!

Cheers,

Richard


