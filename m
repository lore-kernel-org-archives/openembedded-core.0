Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C83C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:10:47 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.41303.1744013437397910225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 01:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y0nI//3I;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4656284e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744013435; x=1744618235; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qm1pPBg++ksFLNVdpLluB0YnwOr2O28jIvctT9o8nMU=;
        b=Y0nI//3IniTOa0u1J5cIGP6p0kIZcliExXlxk1BUBegyR2bmtsNRXsUPgM+NLM4ElX
         abZTAC8cvXdM2G5FEENzqbgogBHPv9FtCZLJMjxmgDbdQV0a2Iw/ckx5nQiUDmkN57cG
         f9hA6NP9Zr+4MVxhBg3m1oRN2E8V8YTP8DBMj9uN3eoMKlDWvk+sRhJ4+BjxCFPSYxWc
         JWY4j+xmZEIeQga+oiV0o4wEWeH7jASU4gsbB9KIkWUZ6iRoOFo8b/FUllkLSr2+QC0f
         rwz8JUVnczQKyn4mv9qncKOhDeYkG175SNOvJAR21KzmJw8basjkUg9ryZdNBoF7PQo4
         O2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013435; x=1744618235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm1pPBg++ksFLNVdpLluB0YnwOr2O28jIvctT9o8nMU=;
        b=pwgqSbT8O+yAo7TRkhMomKSbOQZrpJB3zEoEyzMyC1y5N7PJju9xxAYEgsVdS7xH/I
         65jduR9GUmqqBgXj6Na3oFwOFeJveJB4FW/FppW4dxnM5nmx4ww96RveWFJh8D39l4pq
         HPu11WepXGfwuZXVZbVjR79los76TzxuNX6ms5oE5/bEZlvgizHok2AsAf8k0vz6GkYn
         UeSjN+MSiHXNDI+8GkjRZhGa5iV7nJm7UjyCoHhdY2EbzS3i1o85L3VqT4zneuaEgzCx
         zP7vCxiAvPn0SW8kfrSLqMt7zavpy6YRpVkTQUOAn/qyHraGTYDCv/aGPMiH2QJ/x/GG
         KSAw==
X-Gm-Message-State: AOJu0YzmbemmE9BJEiQur9GxLPC3VpYNZwUG+P4OAhRriJKNkDX6XSY+
	EXlZUI8NVSJknrjVD7Fj+Cc9rfn3n8fgVUMOzU7ez7p6RjL+bYcqxGnZoWeALR0=
X-Gm-Gg: ASbGncsH+Rl/8sBz1e04HG8dZqAhCfVoFu5naGDc9IHaVsSP0nOEy4WuAUTe/3GErHv
	atBJIt+wyFoDOKv1zXNFzpr8GWUxMIaPsFwws3oPy8tXBR67+iFVLV1OIprcgZBtpSikFlzjhPL
	UI/3Wd/O3bnJXZdsesQ4rXU6p3krsAgTq/2WlJqWpQgPZjlskHG6qcIbXQiD2/qrWK1J5+3QhS4
	CPH0BYgFVPv/xTd4HJvriFPqJvzRvCUSwmsk07PxyMdb7X43JXXxzR0EatmaFmZALNOPpo2daCw
	LOBzg9enM5sIh7iNSxKGqfQpWqCCPCWJdSGEAWhAB273Cjja/rYWgX1jMs5UADtSGoo3KSQ/Twe
	Zo6Uy4hXI8UWS
X-Google-Smtp-Source: AGHT+IGxMFujIFX5eQT4EMy+m322v+Za6QUdb1bZuImma+3ieNOqs0si2IbuLNw6+3DP3I/dVcAMtA==
X-Received: by 2002:a05:6512:696:b0:542:91a5:2478 with SMTP id 2adb3069b0e04-54c232fa97bmr3370943e87.32.1744013435163;
        Mon, 07 Apr 2025 01:10:35 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d730sm1147841e87.187.2025.04.07.01.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:10:34 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:10:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
Message-ID: <Z_OIeeFp_hWMjTkJ@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214403

Hi,

On Mon, Apr 07, 2025 at 09:53:45AM +0200, Mathieu Dubois-Briand wrote:
> On Fri Apr 4, 2025 at 6:29 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > systemd based initrd supports more security, encryption etc features
> > than custom shell script ones but oe-core lacks support for it.
> > Convert core-image-initramfs-boot to create systemd based initrd
> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
> >
> > Sadly the boot time is really slow, e.g. over 30 seconds with
> > systemd based initrd. One of the major reasons is the large
> > amount of kernel modules built into the linux-yocto kernel and
> > processing of their udev events in userspace. Thus add
> > kernel-initrd-modules meta package to easily install
> > subset of all kernel modules to initrd. The subset
> > supports "mount rootfs from any block device" but
> > doesn't include graphics, UBS etc support. Without this
> > generated meta package, initrd recipe needs to manually define
> > which exact kernel modules to include which breaks if
> > those modules are built into the kernel. Thus the initrd
> > becomes machine and kernel config specific and hard to maintain.
> > With this meta package a generic initrd can be created.
> >
> > Separate changes to linux-yocto compile a lot more drivers
> > as modules but they depend on these initrd changes.
> >
> 
> Hi Mikko,
> 
> Thanks for your patch.
> 
> I believe one of these wic related patches is responsible of some
> oe-selftest failures we can see on the autobuilder:
> 
> 2025-04-06 15:51:49,317 - oe-selftest - INFO - wic.Wic.test_permissions (subunit.RemotedTestCase)
> 2025-04-06 15:51:49,318 - oe-selftest - INFO -  ... FAIL
> 
> ...
> 
> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_checkuri, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_checkuri -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
> 
> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_fetch, the basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9cfba7cf. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_fetch -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_fetch -Sprintdiff
> 
> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_unpack, the basehash value changed from ae9d94aafc721d891f8754df82ed90da8191357178f3db64221a49d5c1de3bcd to 1ac8f87a71db151b8eb2ae8d13f9a6ea1a0c884ef98555d61d2c2fe07a476a8a. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_unpack -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_unpack -Sprintdiff
> 
> ...
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1391
> 
> Can you have a look at this please?

I can have a look but how can these patches change the basehash'es when testing?

I've seen some of the wic selftets failing on x86_64 build machine with zfs
but changes to fix this was rejected multiple times.

Then I've seen some of these failing with odd pseudo failures on aarch64
build machine.

With my patches the end result was the same.

I ran wic and uki selftests on x86_64 and aarch64 build machines for targets qemuarm64,
qemuarm and genericx86-64.

The wic patches have actually nothing to do with this series except I ran into bugs
in wic which resulted in unbootable images, e.g. the UEFI bootloader binaries
missing from ESP partition. These were impacting some builds but not all
which was really troubling.

Cheers,

-Mikko

