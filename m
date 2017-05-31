Return-Path: <dev@codyps.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8057F77BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:04:03 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c206so641649qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Vli3iYWYyQFoEGBFBo8r5wFCXPb2eZEeDsc2POR9Ww=;
	b=DAnEiy6+Rt05YtjUooeBeyfE2M3UmS9i4j3u++ZcFgz+NRWxOpFwj9BXl8ykhJrKM/
	ncAhdpfyNCjtnh9HFFkKioUAyhMSZP23WUBRpCsthe1aPYF7MVNthKn4bUIgeStRAc/h
	VyGXMIcgMa2kbphWMC3gRGZwhM3Ckk2mTxW7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Vli3iYWYyQFoEGBFBo8r5wFCXPb2eZEeDsc2POR9Ww=;
	b=C536INW26htxqyo8Us7A3FSMqnTb7zCUsXM6gvls0ch2cCyCOHCfTsJsq3ZkcaHCfv
	QuYKC+VgwQWeNs3GwLcXtd6firXeJdSGiWzuomKIYu6uC0HRQEeBtjgB+CECzglF/ZZH
	L0nQUVoVEqzvYefb+aaeDYj3ZW587Np9DpxE+EIgOlCgBosSsbhRDPoZ9bxWi/5ZNq2y
	Lm2EpOsHDHR1GBx9Z4B55soY8HfOpRtZyXMGwxUr/zbWfmvqTk9bcV4A+4Zq+Th30l9F
	MSLIVgpIm3BFPQmqsejulWNvEdx8k74aQiW1GHI0X43FWbyqFug/1/44q6Y2wsDnmYLa
	qfYA==
X-Gm-Message-State: AODbwcBeNiBA2iTrS6RpuV9hobfWroW/ZKIOJ9+lgKDUg7algEysOIj8
	650OF48PtTDmh/nuAo2+Glz1jS2oBWuyY9k=
X-Received: by 10.55.200.209 with SMTP id t78mr21187163qkl.178.1496207044457; 
	Tue, 30 May 2017 22:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.168 with HTTP; Tue, 30 May 2017 22:04:03 -0700 (PDT)
X-Originating-IP: [2601:190:67f:ebb9:65c6:5dd6:daeb:67d1]
In-Reply-To: <20170530211436.16397-1-dev@codyps.com>
References: <20170530211436.16397-1-dev@codyps.com>
From: Cody P Schafer <dev@codyps.com>
Date: Wed, 31 May 2017 01:04:03 -0400
Message-ID: <CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 05:04:04 -0000
Content-Type: text/plain; charset="UTF-8"

> The result of this is that trying to mount filesystems exported by
> runqemu-export-rootfs in modern kernels (at least in 4.2 and later, and
> probably more like 2.6.20 and later) doesn't actually work.

To clarify, when using nfsroot with the current kernel & unfsd
options, my boot stops, waits for the nfs root to appear, and then
times out. When trying to mount normally (ie: via `mount -t nfs` of a
very recent vintage in arch-linux), I get immediate "protocol family
not supported" errors.

With this change, both mount methods (nfsroot with new kernel options
and normally mount) work without issue.

> I'm honestly not sure how anyone was using this for nfsroot support.
> Maybe an initramfs with a version of nfs-utils that could handle the
> mountprog/nfsprog option was in use? Not sure.

Or is there some yocto kernel patch to enable support for it? I'm
running a custom kernel.

