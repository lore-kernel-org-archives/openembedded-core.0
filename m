Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AA4C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 08:30:24 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.1950.1748593810314537435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 01:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=drJogB/1;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551ed563740so2350490e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748593808; x=1749198608; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NnCFysZXhA57uR6uuFNEaaDpbaZAXQ3kBTouTkcOMj0=;
        b=drJogB/1aEARQuYJ/VmDtXC5X5f3b83d3TelbBnKEuS1skMBjGxnyc0JUjkwidUPSb
         ap1HMBqxGJ4HH1YWeBIohn+DG5r9Lm67EbAAjMR7kHI+s9CpbFliAOS/v9Qxso9uP3a+
         ZgGYIIxvIY8c6KKM6JFIc0qOMkm2zpAZSqV1o5BzNzyvya7BHNxTHxjbBB7uo5BlHKOt
         JGjsp8kfbuuGWISN5/oqJAcMdbWsu1DeywpZ2gJ/Tt5EOLxNZ+uC1YyN3Bj260d0qlbg
         svvcvj1Hnr83j2MUnha2SYEidG4l1fYUBv24CCqy9iKg+DFqOMFDfoiq+S7emuyE2m0R
         Gcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748593808; x=1749198608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnCFysZXhA57uR6uuFNEaaDpbaZAXQ3kBTouTkcOMj0=;
        b=NRt+TZCMJWw1Ex2LDU3WjtT86SC4e+OeP8me2NurQRfH98FaG44aee20aWScwoVkv0
         DiXST7TovPkbJG4MWDhjCagiSIPEGj+nfwQyAWcWl28uXls8FSO3aJsg/cPCMuBnW6rB
         2dnYFjc6Y5T0S2nwxBF8lmCq2KRl4dBfn2c/ruGUdKjYr7G7Dcfn78LcEWOjzP5P+yLD
         /UYehgpuZ9vWUaqNLXLXJJhnlkNk7FBFjQsQJ27UGoWGxHZ+FcSmzflkQ3FXEoKMLVmj
         vKZWd4CQnCVkxUo1K+97sgG902wFhW9wuPUy7iOltlXBjgq4dgGuLaB2hI/tMLIryUfZ
         zWfA==
X-Gm-Message-State: AOJu0Yz0/glLPeDfSzDbM/dVFLNpVhSGL0/eeayeKsqvHz73xInn04dD
	hmvsG9FcEfjwYilyIhkH3pNqwmMNzR0oSSS9acfqt6R8Cjd9YxA8pubpfHa/WNsVjNI=
X-Gm-Gg: ASbGncvlV7KcAsUn6Y5NrxWxayu57PwyiBFVz+hX5vC6xiwJd1S+TCmaoC9V52aPf/B
	kVWX0mvN8RdaEfOjmL340PYNuHEJ8qNh8cMEbvBBi33Go8dcqVIHPqNENpba6ICLiRemm3StGcI
	VGJ2TGCFGR20Jg24Wu9AsH8G5fQWzmOsKh9SoFXa2VSh3ZkTQikq7Htg1ADiYjOx6WtfyxOD6Zb
	QOctnU9vizTIK90SitWbNM+uLFTKB6pxd4PJqRjoCoOl1YUfogBRAl0n30kKQcdAEq40pA45Urp
	SLM7MWGKw2DRzSsz03HN715kVRqEEXaGHg2IPODC4qixC/hYjVjwBFcu7ZwurpvnFyLXwYYh1Er
	jG2+rpvKjC6eGTq/PfpE=
X-Google-Smtp-Source: AGHT+IECbp+h1rgl/tKd75rzlbvdhyGaixg7pjK7ZNbZxpu6l+6R2TmKDRUjn9MVnmg60+hfegYTEw==
X-Received: by 2002:a05:6512:3b8e:b0:553:34fc:3bd8 with SMTP id 2adb3069b0e04-5533b90afc6mr715411e87.25.1748593808351;
        Fri, 30 May 2025 01:30:08 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533793780asm620546e87.222.2025.05.30.01.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 01:30:07 -0700 (PDT)
Date: Fri, 30 May 2025 11:30:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 1/4] wic bootimg-efi.py: fail build if no
 binaries installed
Message-ID: <aDlsjsXaEl2sXn5F@nuoska>
References: <20250528125635.684302-1-mikko.rapeli@linaro.org>
 <DA8P2QRAA1SJ.3VHA71AFG09UZ@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA8P2QRAA1SJ.3VHA71AFG09UZ@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217489

Hi,

On Thu, May 29, 2025 at 03:55:56PM +0200, Mathieu Dubois-Briand wrote:
> On Wed May 28, 2025 at 2:56 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > With systemd-boot, some builds included correct EFI
> > bootloader binaries and some not. Thus some builds
> > booted and some not. Check that some boot binary
> > was installed so that build fails if none were installed.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> 
> Hi Mikko,
> 
> It looks like we have a new selftest error:
> 
> 2025-05-29 06:41:09,920 - oe-selftest - INFO - overlayfs.OverlayFSEtcRunTimeTests.test_image_feature_is_missing (subunit.RemotedTestCase)
> 2025-05-29 06:41:09,921 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1199444/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/temp/run.do_image_wic.2027179' failed with exit code 1
> ...
> | ERROR: No EFI loaders installed to ESP partition. Check that grub-efi, systemd-boot or similar is installed.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1649
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1590
> 
> Can you have a look please?

Thanks to verbose wic logs I can see from
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2526606/raw_inline

| DEBUG: _exec_cmd: install -d /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/EFI/BOOT
| DEBUG: ['install', '-d', '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/EFI/BOOT']
| DEBUG: _exec_cmd: output for install -d /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/EFI/BOOT (rc = 0):
| DEBUG: Ignoring missing initrd
| DEBUG: Writing grubefi config /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/EFI/BOOT/grub.cfg
| DEBUG: No boot files defined in IMAGE_EFI_BOOT_FILES
| DEBUG: _exec_cmd: install -d /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot
| DEBUG: ['install', '-d', '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot']
| DEBUG: _exec_cmd: output for install -d /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot (rc = 0):
| DEBUG: Writing syslinux config /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/syslinux.cfg
| DEBUG: SourcePlugin: do_stage_partition: part: <wic.partition.Partition object at 0x7f026ffef230>
| DEBUG: _exec_cmd: install -v -p -m 0644 /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/deploy/images/qemux86-64/bzImage /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/bzImage
| DEBUG: ['install', '-v', '-p', '-m', '0644', '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/deploy/images/qemux86-64/bzImage', '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/bzImage']
| DEBUG: _exec_cmd: output for install -v -p -m 0644 /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/deploy/images/qemux86-64/bzImage /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/bzImage (rc = 0): '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/deploy/images/qemux86-64/bzImage' -> '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/bzImage'
| DEBUG: Installed kernel files:
| '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/deploy/images/qemux86-64/bzImage' -> '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2677000/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/hdd/boot/bzImage'
| DEBUG: Installed systemd-boot files:
| []
| ERROR: No EFI loaders installed to ESP partition. Check that grub-efi, systemd-boot or similar is installed.

That the ESP partition did not install the EFI loader binary from grub-efi.
I think this is a bug in the build setup for the overayfs test since that
partition would not boot with EFI. I'll check how this can be fixed..

Cheers,

-Mikko

