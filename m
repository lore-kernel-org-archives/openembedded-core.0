Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C75678CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:07:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u1-v6so9111417wrn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fyqFfLMC51LPWAOoJD07V5FunxrCBVOUJG++z+z/cMg=;
	b=QG6K7ufcqv+eBs2Xa5BwcFCB92iLUrAeY4fizvmGClkZOFTR1gv9IPcQdbg5smGEik
	iDctQf4Y2pLey5MmE6xJ2Uh1kLd/QNLJh13t4WA4Sjht/EVhhJWFeAb13PVUCWMkMbvy
	GmpdgpK7HMOeEa/tBBuoR1IXK3aWki8Cn9ePU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fyqFfLMC51LPWAOoJD07V5FunxrCBVOUJG++z+z/cMg=;
	b=Ih6L50icbSf3h7L7ts/0PTE6wjxluJiENNTRmrTLAcjlTnpQLft8f7m+6dyPlm3vj/
	5DJUXNYbAddpHcsCf7onZHqNYCgE6vKkH7JA7DKE4iajvN0tFm7P1xyRFVYYf9OVpNjw
	qKu82LvGrqdJscxaN7paPNLPEo6bhfzNk2hzxtITb+1xD+2Wn5A28X5wWwjxU/esegCR
	wc8bwA6gtPYa5bi4EsrKL8BATuH4Jm95Q3zYAgklVsyRAWhC3yrNfBX3ZZJ2slcrUWZq
	T6C+NbG4BVE0PD9o6+fbunnKI9quPSt+/wYs4jhAZdIn0HkcKFPUKbB4tHUyExMzfMW2
	D/Kw==
X-Gm-Message-State: AGRZ1gKYYK8SyPjt5nVayn2UytekeEqUKYH+O0IdIBYI/YWPTYMxJq/n
	xfJYzAT/8Z0wm6R140RnSA68ag==
X-Google-Smtp-Source: AJdET5enACV/5ZC/zut1u5GRR4hsvjcL58v8cobAVSqce/lHj9lH7pyAxnrT6zxV9pGPAgnF9fLA6w==
X-Received: by 2002:adf:dc07:: with SMTP id
	t7-v6mr14367649wri.107.1540825633970; 
	Mon, 29 Oct 2018 08:07:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b143-v6sm21149663wma.28.2018.10.29.08.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 08:07:12 -0700 (PDT)
Message-ID: <0c2d7e77034c3b860d55073e4743b9af7be92b0a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 15:07:11 +0000
In-Reply-To: <1540562395-6506-1-git-send-email-hongxu.jia@windriver.com>
References: <1540562395-6506-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] machine/qemu*: fix kernel finish crng init more and more slowly
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
X-List-Received-Date: Mon, 29 Oct 2018 15:07:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-26 at 09:59 -0400, Hongxu Jia wrote:
> Just adding `-device virtio-rng-pci' to the QEMU invocation will
> add the device with a default host backend. As of QEMU 1.3+,
> the default backend is to use the host's /dev/random as a
> source of entropy. [1]
> 
> When the entropy pool is empty, reads from /dev/random will
> block until additional environmental noise is gathered. [2]
> 
> For Yocto, if call runqemu frequently, it will consume lots
> of host's /dev/random, and kernel finish crng init in guest get
> more and more slowly.
> 
> Here are 4 times runqemu boot test:
> 
> [    3.464432] random: crng init done
> [   20.874030] random: crng init done
> [   23.583589] random: crng init done
> [   23.858945] random: crng init done
> 
> Modify entropy source to /dev/urandom device on the host which
> returns random bytes using a pseudorandom number generator seeded
> from the entropy pool. Reads from this device do not block and
> kernel finish crng init in guest will not delay.
> 
> Of course, the side effect is obviously, we lost the quality of
> randomness, but the modification is only on runqemu script
> rather than real embedded device, and it benefits oeqa efficiency
> in which many cases call runqemu especially multiple oeqa builds
> on one host.
> 
> After apply the fix:
> 
> [    3.364670] random: crng init done
> [    4.619061] random: crng init done
> [    3.403897] random: crng init done
> [    3.450717] random: crng init done
> 
> [1] https://wiki.qemu.org/Features/VirtIORNG
> [2] http://man7.org/linux/man-pages/man4/random.4.html
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/machine/include/qemuboot-mips.inc | 3 ++-
>  meta/conf/machine/include/qemuboot-x86.inc  | 3 ++-
>  meta/conf/machine/qemuarm.conf              | 3 ++-
>  meta/conf/machine/qemuarm64.conf            | 4 +++-
>  meta/conf/machine/qemuppc.conf              | 3 ++-
>  5 files changed, 11 insertions(+), 5 deletions(-)

Doesn't work unfortunately, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/21/builds/155/steps/7/logs/step1c


Cheers,

Richard




