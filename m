Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id A130D60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 07:41:44 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id w25so881864qkj.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 00:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XZ4p2i+4+6fVLEUlMHyorJfuxAV5gDreArYFpwa6las=;
	b=S3TqBx+fD7qJ3f70l+6fKl3f8UOfBkg4IDyZGEk7CRcxRUWZnw78w8T1cwP4fEj1kH
	tIafg+VNg7eDHmC+pSv5EAHyY+V52qmmHcUrbdz8wK25Hs9o3BnBSXhaqudznl6P6kAY
	PSDPIwLTG/uTVKJGH2msZgDSY5BhaCq5AY3yMhhxGgVGSAagIRQ7F9Gyb9Qo4rrFn47U
	ZlfDZWqQuQNMfa+ZBGdHUXJcDCFjRhZPNziqUZNk7A0OQB4fDpDvRDsYfmGz7T7BM7Cz
	Bns2ltiP92zlg/yfUDoNJksTfhEa9Rt825xfm4zHOvh7jRq0OrV/wtN60bzvzlScvIkJ
	BQMQ==
X-Gm-Message-State: APjAAAUfyZdpUPHFVGf2JHuXQZhKj8N9Rtmvl0o4Hnu37JixSOpX0MGn
	vJRGtngsNWrFI9abCpIP0OtrfDOgyV8=
X-Google-Smtp-Source: APXvYqyrmg3cCeB19+FKO3y9wWNG0RSVis3uhp4Q5pX2eETj0BsnllvmCiTLAmUUBjyP73eg3efK/g==
X-Received: by 2002:a37:7b05:: with SMTP id w5mr30244055qkc.354.1557906105259; 
	Wed, 15 May 2019 00:41:45 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id m6sm569366qkc.56.2019.05.15.00.41.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 15 May 2019 00:41:44 -0700 (PDT)
Message-ID: <1bb31e0d379ecf4a08c02ac89e0b52cac4086ec5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 08:41:42 +0100
In-Reply-To: <d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
References: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
	<d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
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
X-List-Received-Date: Wed, 15 May 2019 07:41:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-14 at 17:32 +0100, André Draszik wrote:
> On Tue, 2019-05-14 at 14:35 +0100, André Draszik wrote:
> > Hi,
> > 
> > As part of the build, kernel packages are renamed, e.g.
> > kernel-image-zimage basically becomes
> > kernel-image-zimage-${KERNEL_VERSION}
> > 
> > When a package created by recipe B RDEPENDS on kernel-image-zimage,
> > the ipk generated ultimately depends on
> > kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).
> > Once the kernel is updated, it appears as though recipe B is not
> > repackaged, so the package still runtime depends on the original
> > kernel, which doesn't exist anymore, and thus building the image
> > fails.
> > 
> > Specifically, I have
> > MACHINE_EXTRA_RDEPENDS += "kernel-image-zimage"
> > in my BSP, and hence packagegroup-machine-base runtime depends on
> > kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.
> > Updating the kernel doesn't trigger a rebuild of packagegroup-machine-base,
> > so things fail for me.
> > 
> > 
> > Am I missing something in my BSP? I could probably do a bbappend
> > on packagegroup-base.bb and add something like
> > do_packagedata[depends] += "virtual/kernel:do_packagedata"
> 
> BTW, I've tried the following packagegroup-base.bbappend to no avail:
> 
> python do_get_kernel_zimage_name() {
>     new_dep = get_package_mapping('kernel-image-zimage', 'packagegroup-machine-base', d)
>     d.appendVarFlag('do_package_write_ipk', 'vardeps', new_dep)
> }
> addtask get_kernel_zimage_name after do_package before do_package_write_ipk
> do_get_kernel_zimage_name[depends] += "virtual/kernel:do_packagedata"

The above snippet was wrong, I meant to post this snippet:

KERNEL_ZIMAGE_PKG_NAME = ""
do_package_write_ipk[vardeps] += "KERNEL_ZIMAGE_PKG_NAME"

python do_get_kernel_zimage_name() {
    new_dep = get_package_mapping('kernel-image-zimage', 'packagegroup-machine-base', d)
    bb.warn ('new dep is %s' % new_dep)
    d.setVar('KERNEL_ZIMAGE_PKG_NAME', new_dep)
}
addtask get_kernel_zimage_name after do_package before do_package_write_ipk
do_get_kernel_zimage_name[depends] += "virtual/kernel:do_package_write_ipk"


(still with the same behaviour)

A.

> 
> 
> I suspect adding the varflag happens too late in this case, as the package
> still isn't rebuilt on kernel updates.
> 
> > This doesn't seem right, though.
> 
> A.
> 
> > 
> > Any ideas or thoughts?
> > 
> > 
> > Cheers,
> > Andre'
> > 
> > 


