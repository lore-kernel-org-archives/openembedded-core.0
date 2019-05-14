Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id E8FFA7DE54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 16:32:15 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id k24so14775705qtq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 09:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EMychilBc4W1SYmZdmszBexNJKDQpM5rPBIbVp1E3lU=;
	b=PdSvLzoZrzoPP/Ag3mGIEBPFhvWdRPhfD9UUiW49UJJwGsh0HtN9A7n8kHk3H04oTp
	S9Xa2Jb1v4VdxK+NZXPPea1n7y9DdDLssDXyUQNM0aGlBAPAP1/F6q/0TuLOynqnnJTk
	GwNXUKORau6t0OZeTeU/V+Q/cFN0F976gKul2SkH8o6IM0JgiExecyzINVK71tToAbjX
	C1+9wp2g2qpvEyHk+bHSUhIADjnGPGtDx3MyVC1s6/39cZR60hTVCVExchj2avZn8/4Z
	wJpZQwng4oMe4nEZAKxR30Q/SebzTYfDzVhoU3aUQXq7B16w6szDk/i1EbsyF1jh7zts
	IIpQ==
X-Gm-Message-State: APjAAAXRkSQ2AoZP5oN0O3lEaFrAXUMzO3RhMRbXQ0y1tQ4qUiJYuIvg
	SdFEOtgtZXpSlnNgDKvgCO4qZUegUXY=
X-Google-Smtp-Source: APXvYqyffqgxgemVYQgkvkrLbLQrllE87ZZx9RXCCVR95p5DrWaYdKo9jQDNKBYF7z54UM/p9CSrvg==
X-Received: by 2002:a0c:9523:: with SMTP id l32mr30254103qvl.75.1557851536774; 
	Tue, 14 May 2019 09:32:16 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l40sm5181173qtc.32.2019.05.14.09.32.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 09:32:15 -0700 (PDT)
Message-ID: <d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 17:32:14 +0100
In-Reply-To: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
References: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: RDEPENDS kernel-image-zimage & kernel.bbclass PKG name
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
X-List-Received-Date: Tue, 14 May 2019 16:32:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-14 at 14:35 +0100, André Draszik wrote:
> Hi,
> 
> As part of the build, kernel packages are renamed, e.g.
> kernel-image-zimage basically becomes
> kernel-image-zimage-${KERNEL_VERSION}
> 
> When a package created by recipe B RDEPENDS on kernel-image-zimage,
> the ipk generated ultimately depends on
> kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).
> Once the kernel is updated, it appears as though recipe B is not
> repackaged, so the package still runtime depends on the original
> kernel, which doesn't exist anymore, and thus building the image
> fails.
> 
> Specifically, I have
> MACHINE_EXTRA_RDEPENDS += "kernel-image-zimage"
> in my BSP, and hence packagegroup-machine-base runtime depends on
> kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.
> Updating the kernel doesn't trigger a rebuild of packagegroup-machine-base,
> so things fail for me.
> 
> 
> Am I missing something in my BSP? I could probably do a bbappend
> on packagegroup-base.bb and add something like
> do_packagedata[depends] += "virtual/kernel:do_packagedata"

BTW, I've tried the following packagegroup-base.bbappend to no avail:

python do_get_kernel_zimage_name() {
    new_dep = get_package_mapping('kernel-image-zimage', 'packagegroup-machine-base', d)
    d.appendVarFlag('do_package_write_ipk', 'vardeps', new_dep)
}
addtask get_kernel_zimage_name after do_package before do_package_write_ipk
do_get_kernel_zimage_name[depends] += "virtual/kernel:do_packagedata"


I suspect adding the varflag happens too late in this case, as the package
still isn't rebuilt on kernel updates.

> 
> This doesn't seem right, though.

A.

> 
> 
> Any ideas or thoughts?
> 
> 
> Cheers,
> Andre'
> 
> 


