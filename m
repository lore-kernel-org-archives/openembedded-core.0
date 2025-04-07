Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D452FC3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:13:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.43980.1744024411858158616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=geBxHxyg;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-548409cd2a8so4938968e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744024410; x=1744629210; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PouMw21bwtZxAaQ+cgbb08PDsqoGoG0VMfb7wroM7s=;
        b=geBxHxygaoWRHI+z/DJ6EMgeBJ6fnD17BPSs+YlfGIvaKxtRkAOXeSDEys/54Lf8LL
         iac39j8jKlLl26pWOJmgA/XIs3XdrO4Pf9S3Ka7uAYbZ14GHeK5MIEjtOEmeIpC5l6A3
         nBpVMjNKZftpkjr6nhHMyumx3iKZNwSGjFPK59Ayzu6uh2pm+PR2TZNgivgwwW2N9m8Y
         texFUtAQr5oO1jmGnYOwNISlyIvlmkmvtaEqLFW6yZsghVo2tzauzuU+o8JsxGkdARJB
         n4tXaWWXc5Fhz95XdwRYP+iugWCcU8IuyLHKHiLuAGWsMfzr56E285zcpbHP7XT1xtOk
         887w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024410; x=1744629210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PouMw21bwtZxAaQ+cgbb08PDsqoGoG0VMfb7wroM7s=;
        b=Sq5E5llbelnqAKR74l2boci8tSE2KoN86wg5jaM7RmYjsNQEyHZ+YK2gDccdvreK7M
         BjzmrzCGH1QYmULdmNqCHu05MbgNqMLIM4f2iqU7d1u4NwF9o+qMZNhar66/ctzSF/0Z
         BHzmGas1B8GLVhzJKtneMHcFwtHQq3xPXwbho1TNhHFmPoT/FylCtgwhxsJ6IumBmPR9
         7VlsC57gnGJZI4yiQoqa2kb+4JeU6IyXInMCh/Etl5u2QPm78jgZwNJqtfnUrTTBqTD9
         AN4kY6K2oPx7UfEabKgWgFjDsar7QMf1PpfzSgh34oHnNaO5RkiHcivraniUS6fC91JR
         hawA==
X-Forwarded-Encrypted: i=1; AJvYcCVZWY+BWOdd2D+4cwGIRpKT3e/xO/lkeah1Bq2O4ZnpWR6zQ++Iy1r+wTpn8wVeiFqf/YhMVTWI0xKo0f92SZU13g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpKCbhJLQodUMthwcu5K+qUnIzh4QtT8bZapyzm1XGFKtkW9ZT
	Bgc3MxTbfwCqPS67LBWfd7W4YfBk7O9jbRjnO6e/5yJFlf9nK1UYhGYgAFTEjbQ=
X-Gm-Gg: ASbGnctQ2nEAqH5mPET+GYw1LSm1DoXJyzBuFbmpYRNqtjRdya+0ZiLLfbDNYbZcbKL
	1XkqMs89VGm400HigeOooI0q7jhjZwpSWDqkx45mRC8qwbqQfhIrWERWgtEHk8kbdlZDgbjoP4r
	vXWRiiFGduLH4P7C1YAjLzLT8bp3wMqoirSCbEuenjF8nXHkg0pL5viViTc+meToOa9CRxckaGj
	AVCT20P10U6Zjs8aFO7S0sEyvEyaoMquQRJMbhEeeqvCJRBNDfJmoZ5x/DTsd3uSQeULjS5xKBG
	LK4ho0eB62/atjRrGbjou4jyQPmv2J5tCM54Q/qgXDoPWIPnS2Vuib1a2rODjFYaSOMMkhzhgcm
	rVQ==
X-Google-Smtp-Source: AGHT+IFPLngubZjPframfHisn2gyl1K0A8lJFZWVHzeqjA+1mQXixeTD6c08UyhgPt0SSZMxKw1dkQ==
X-Received: by 2002:a05:6512:b1d:b0:545:746:f36a with SMTP id 2adb3069b0e04-54c2278b039mr3108293e87.34.1744024409686;
        Mon, 07 Apr 2025 04:13:29 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e67141csm1262076e87.224.2025.04.07.04.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:13:29 -0700 (PDT)
Date: Mon, 7 Apr 2025 14:13:27 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
Message-ID: <Z_OzVyWUGja6dkMe@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com>
 <Z_OIeeFp_hWMjTkJ@nuoska>
 <D90A1HIWOZYV.25J0FOK1DMUDK@bootlin.com>
 <Z_OZ24jicgPP2HaP@nuoska>
 <D90BBNJUDNA5.3UQXSK0K43FNK@bootlin.com>
 <18340261181AE46F.21691@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18340261181AE46F.21691@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214450

Hi,

On Mon, Apr 07, 2025 at 01:26:06PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Mon, Apr 07, 2025 at 11:52:01AM +0200, Mathieu Dubois-Briand wrote:
> > On Mon Apr 7, 2025 at 11:24 AM CEST, Mikko Rapeli wrote:
> > > On Mon, Apr 07, 2025 at 10:51:43AM +0200, Mathieu Dubois-Briand wrote:
> > >> On Mon Apr 7, 2025 at 10:10 AM CEST, Mikko Rapeli wrote:
> > >> > On Mon, Apr 07, 2025 at 09:53:45AM +0200, Mathieu Dubois-Briand wrote:
> > >> >> On Fri Apr 4, 2025 at 6:29 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > >> >> > systemd based initrd supports more security, encryption etc features
> > >> >> > than custom shell script ones but oe-core lacks support for it.
> > >> >> > Convert core-image-initramfs-boot to create systemd based initrd
> > >> >> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> > >> >> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
> > >> >> >
> > >> >> > Sadly the boot time is really slow, e.g. over 30 seconds with
> > >> >> > systemd based initrd. One of the major reasons is the large
> > >> >> > amount of kernel modules built into the linux-yocto kernel and
> > >> >> > processing of their udev events in userspace. Thus add
> > >> >> > kernel-initrd-modules meta package to easily install
> > >> >> > subset of all kernel modules to initrd. The subset
> > >> >> > supports "mount rootfs from any block device" but
> > >> >> > doesn't include graphics, UBS etc support. Without this
> > >> >> > generated meta package, initrd recipe needs to manually define
> > >> >> > which exact kernel modules to include which breaks if
> > >> >> > those modules are built into the kernel. Thus the initrd
> > >> >> > becomes machine and kernel config specific and hard to maintain.
> > >> >> > With this meta package a generic initrd can be created.
> > >> >> >
> > >> >> > Separate changes to linux-yocto compile a lot more drivers
> > >> >> > as modules but they depend on these initrd changes.
> > >> >> >
> > >> >> 
> > >> >> Hi Mikko,
> > >> >> 
> > >> >> Thanks for your patch.
> > >> >> 
> > >> >> I believe one of these wic related patches is responsible of some
> > >> >> oe-selftest failures we can see on the autobuilder:
> > >> >> 
> > >> >> 2025-04-06 15:51:49,317 - oe-selftest - INFO - wic.Wic.test_permissions (subunit.RemotedTestCase)
> > >> >> 2025-04-06 15:51:49,318 - oe-selftest - INFO -  ... FAIL
> > >> >> 
> > >> >> ...
> > >> >> 
> > >> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_checkuri, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
> > >> >> ERROR: The following commands may help:
> > >> >> ERROR: $ bitbake test -cdo_checkuri -Snone
> > >> >> ERROR: Then:
> > >> >> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
> > >> >> 
> > >> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_fetch, the basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9cfba7cf. The metadata is not deterministic and this needs to be fixed.
> > >> >> ERROR: The following commands may help:
> > >> >> ERROR: $ bitbake test -cdo_fetch -Snone
> > >> >> ERROR: Then:
> > >> >> ERROR: $ bitbake test -cdo_fetch -Sprintdiff
> > >> >> 
> > >> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_unpack, the basehash value changed from ae9d94aafc721d891f8754df82ed90da8191357178f3db64221a49d5c1de3bcd to 1ac8f87a71db151b8eb2ae8d13f9a6ea1a0c884ef98555d61d2c2fe07a476a8a. The metadata is not deterministic and this needs to be fixed.
> > >> >> ERROR: The following commands may help:
> > >> >> ERROR: $ bitbake test -cdo_unpack -Snone
> > >> >> ERROR: Then:
> > >> >> ERROR: $ bitbake test -cdo_unpack -Sprintdiff
> > >> >> 
> > >> >> ...
> > >> >> 
> > >> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1391
> > >> >> 
> > >> >> Can you have a look at this please?
> > >> >
> > >> > I can have a look but how can these patches change the basehash'es when testing?
> > >> >
> > >> > I've seen some of the wic selftets failing on x86_64 build machine with zfs
> > >> > but changes to fix this was rejected multiple times.
> > >> >
> > >> > Then I've seen some of these failing with odd pseudo failures on aarch64
> > >> > build machine.
> > >> >
> > >> > With my patches the end result was the same.
> > >> >
> > >> > I ran wic and uki selftests on x86_64 and aarch64 build machines for targets qemuarm64,
> > >> > qemuarm and genericx86-64.
> > >> >
> > >> > The wic patches have actually nothing to do with this series except I ran into bugs
> > >> > in wic which resulted in unbootable images, e.g. the UEFI bootloader binaries
> > >> > missing from ESP partition. These were impacting some builds but not all
> > >> > which was really troubling.
> > >> >
> > >> > Cheers,
> > >> >
> > >> > -Mikko
> > >> 
> > >> Ok, I am running some git bisect locally anyway, I will keep you updated
> > >> a bit later today.
> > >
> > > I ran wic.Wic.test_permissions and it passed without this series
> > > on aarch64 build machine and genericarm64 target machine:
> > >
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Retrying server connection (#1)... (08:13:45.320086)
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Retrying server connection (#1)... (08:13:45.320086)
> > > NOTE: Retrying server connection (#1)... (08:13:45.320086)
> > > NOTE: Starting bitbake server...
> > > hint: Using 'master' as the name for the initial branch. This default branch name
> > > hint: is subject to change. To configure the initial branch name to use in all
> > > hint: of your new repositories, which will suppress this warning, call:
> > > hint: 
> > > hint:   git config --global init.defaultBranch <name>
> > > hint: 
> > > hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> > > hint: 'development'. The just-created branch can be renamed via this command:
> > > hint: 
> > > hint:   git branch -m <name>
> > > 2025-04-07 08:13:46,418 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/mcfrisk/src/base/poky/build_genericarm64-st/conf/local.conf
> > > 2025-04-07 08:13:46,418 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > > 2025-04-07 08:13:46,418 - oe-selftest - INFO - test_permissions (wic.Wic.test_permissions)
> > > 2025-04-07 08:24:47,941 - oe-selftest - INFO -  ... ok
> > > 2025-04-07 08:24:54,376 - oe-selftest - INFO - ----------------------------------------------------------------------
> > > 2025-04-07 08:24:54,376 - oe-selftest - INFO - Ran 1 test in 668.167s
> > > 2025-04-07 08:24:54,376 - oe-selftest - INFO - OK
> > > 2025-04-07 08:25:00,978 - oe-selftest - INFO - RESULTS:
> > > 2025-04-07 08:25:00,978 - oe-selftest - INFO - RESULTS - wic.Wic.test_permissions: PASSED (661.52s)
> > > 2025-04-07 08:25:00,979 - oe-selftest - INFO - SUMMARY:
> > > 2025-04-07 08:25:00,979 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 668.168s
> > > 2025-04-07 08:25:00,979 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
> > >
> > > Then with patches from this series (and a few more which I sent out separately,
> > > should be unrelated) it failed with pseudo errors:
> > >
> > > 2025-04-07 08:32:12,107 - oe-selftest - INFO - Changing cwd to /home/mcfrisk/src/base/poky/build_genericarm64
> > > 2025-04-07 08:32:12,107 - oe-selftest - INFO - Adding layer libraries:
> > > 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/poky/meta/lib
> > > 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/poky/meta-yocto-bsp/lib
> > > 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/poky/meta-selftest/lib
> > > 2025-04-07 08:32:12,108 - oe-selftest - INFO - Checking base configuration is valid/parsable
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Retrying server connection (#1)... (08:32:12.728357)
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Reconnecting to bitbake server...
> > > NOTE: Retrying server connection (#1)... (08:32:12.728357)
> > > NOTE: Retrying server connection (#1)... (08:32:12.728357)
> > > NOTE: Starting bitbake server...
> > > hint: Using 'master' as the name for the initial branch. This default branch name
> > > hint: is subject to change. To configure the initial branch name to use in all
> > > hint: of your new repositories, which will suppress this warning, call:
> > > hint: 
> > > hint:   git config --global init.defaultBranch <name>
> > > hint: 
> > > hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> > > hint: 'development'. The just-created branch can be renamed via this command:
> > > hint: 
> > > hint:   git branch -m <name>
> > > 2025-04-07 08:32:13,824 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/mcfrisk/src/base/poky/build_genericarm64-st/conf/local.conf
> > > 2025-04-07 08:32:13,824 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > > 2025-04-07 08:32:13,824 - oe-selftest - INFO - test_permissions (wic.Wic.test_permissions)
> > > 2025-04-07 09:10:05,405 - oe-selftest - INFO -  ... FAIL
> > > 2025-04-07 09:10:05,488 - oe-selftest - INFO - Traceback (most recent call last):
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/selftest/cases/wic.py", line 677, in test_permissions
> > >     bitbake('core-image-minimal')
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
> > >     return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
> > >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> > >     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> > > AssertionError: Command 'bitbake  core-image-minimal' returned non-zero exit status 1:
> > > Loading cache...done.
> > > Loaded 1976 entries from dependency cache.
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION           = "2.12.0"
> > > BUILD_SYS            = "aarch64-linux"
> > > NATIVELSBSTRING      = "universal"
> > > TARGET_SYS           = "aarch64-poky-linux"
> > > MACHINE              = "genericarm64"
> > > DISTRO               = "poky-altcfg"
> > > DISTRO_VERSION       = "5.2"
> > > TUNE_FEATURES        = "aarch64 armv8a crc"
> > > TARGET_FPU           = ""
> > > meta                 
> > > meta-poky            
> > > meta-yocto-bsp       = "HEAD:a75117f79e4771927b89125e464e38acdc9c556e"
> > > meta-selftest        = "master:fd26cf3cc0e6e590b56e331971cdf884d1b881b9"
> > >
> > > Initialising tasks...Sstate summary: Wanted 539 Local 536 Mirrors 0 Missed 3 Current 1968 (99% match, 99% complete)
> > > Removing 3 stale sstate objects for arch genericarm64...done.
> > > NOTE: Executing Tasks
> > > NOTE: Running task 5157 of 5259 (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic)
> > > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Started
> > > ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/run.do_image_wic.117565' failed with exit code 134
> > > ERROR: Logfile of failure stored in: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> > > Log data follows:
> > > | DEBUG: Executing python function extend_recipe_sysroot
> > > | NOTE: Direct dependencies are ['/home/mcfrisk/src/base/poky/meta/recipes-bsp/grub/grub-efi_2.12.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/gli
> > > bc/cross-localedef-native_2.41.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/systemd/systemd-boot_257.4.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_popu
> > > late_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/btrfs-tools
> > > /btrfs-tools_6.14.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/er
> > > ofs-utils/erofs-utils_1.8.5.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/mtools/mtools_4.0.48.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', 'virtua
> > > l:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg/opkg_0.7.0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:nat
> > > ive:/home/mcfrisk/src/base/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-extended/pigz/pigz_
> > > 2.8.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_sysroot']
> > > | NOTE: Installed into sysroot: []
> > > | NOTE: Skipping as already exists in sysroot: ['grub-efi', 'gettext-minimal-native', 'cross-localedef-native', 'glibc', 'ldconfig-native', 'libxcrypt', 'ncurses', 'systemd-
> > > boot', 'systemd-systemctl-native', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-aarch64', 'cdrtools-native', 'cmake-native', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-helper-native', 'qemu-native', 'qemu-system-native', 'qemuwrapper-cross', 'libpam', 'texinfo-dummy-native', 'depmodwrapper-cross', 'linux-libc-headers', 'bash-completion', 'libcap-ng', 'libcap', 'sqlite3', 'openssl-native', 'libslirp-native', 'coreutils-native', 'expat-native', 'gettext-native', 'glib-
> > > 2.0-native', 'libxml2-native', 'ncurses-native', 'readline-native', 'update-rc.d-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'btrfs-tools-nativ
> > > e', 'chrpath-native', 'dosfstools-native', 'e2fsprogs-native', 'elfutils-native', 'erofs-utils-native', 'gptfdisk-native', 'flex-native', 'gnu-config-native', 'json-c-native
> > > ', 'libedit-native', 'llvm-native', 'make-native', 'makedevs-native', 'mtools-native', 'opkg-utils-native', 'opkg-native', 'perl-native', 'pseudo-native', 'python3-build-native', 'python3-calver-native', 'python3-editables-native', 'python3-flit-core-native', 'python3-hatchling-native', 'python3-installer-native', 'python3-jinja2-native', 'pyth
> > > on3-mako-native', 'python3-markupsafe-native', 'python3-packaging-native', 'python3-pathspec-native', 'python3-pip-native', 'python3-pluggy-native', 'python3-pygments-native
> > > ', 'python3-pyparsing-native', 'python3-pyproject-hooks-native', 'python3-setuptools-scm-native', 'python3-setuptools-native', 'python3-six-native', 'python3-trove-classifiers-native', 'python3-typing-extensions-native', 'python3-wheel-native', 'python3-native', 'squashfs-tools-native', 'unfs3-native', 'bzip2-native', 'cpio-native', 'diffutils-
> > > native', 'libarchive-native', 'libidn2-native', 'libnsl2-native', 'libsolv-native', 'libtirpc-native', 'parted-native', 'pigz-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'libdrm-native', 'libepoxy-native', 'libsdl2-native', 'mesa-native', 'virglrenderer-native', 'wayland-protocols-native', 'wayland-native', 'xrandr-nat
> > > ive', 'libpciaccess-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxrandr-native', 'libxrender-native', 'libxshmfence-native', 'libxxf86vm-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'makedepend-native', 'util-macros-native', 'dtc-native', 'kmod-native', 'alsa-lib-native', 'libpng-native', 'acl-native', 'attr-native', 'bmaptool-native', 'curl-native', 'deb
> > > ianutils-native', 'gdbm-native', 'gmp-native', 'gnutls-native', 'libtasn1-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libgcrypt-native', 'libgpg-error-native', 'libmd-native', 'libmicrohttpd-native', 'libpcre2-native', 'libunistring-native', 'lz4-native', 'lzo-native', 'nettle-native', 'popt-native', 'shared
> > > -mime-info-native', 'sqlite3-native']
> > > | DEBUG: Python function extend_recipe_sysroot finished
> > > | DEBUG: Executing python function set_image_size
> > > | DEBUG: 159546.400000 = 122728 * 1.300000
> > > | DEBUG: 163642.400000 = max(159546.400000, 8192)[159546.400000] + 4096
> > > | DEBUG: 163643.000000 = int(163642.400000)
> > > | DEBUG: 163643 = aligned(163643)
> > > | DEBUG: returning 163643
> > > | DEBUG: Python function set_image_size finished
> > > | DEBUG: Executing shell function do_image_wic
> > > | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > > | Check logfile: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> > > | WARNING: exit code 134 from a shell command.
> > > | Aborted
> > > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> > > ERROR: Task (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1' 
> > > Pseudo log:
> > > path mismatch [2 links]: ino 43965780 db '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/rootfs/boot/loader/loader.conf' req '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/boot/loader/loader.conf'.
> > > Setup complete, sending SIGUSR1 to pid 117389.
> > >
> > > NOTE: Tasks Summary: Attempted 5254 tasks of which 5253 didn't need to be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic
> > >     log: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> > > Summary: There was 1 ERROR message, returning a non-zero exit code.
> > >
> > > 2025-04-07 09:10:05,488 - oe-selftest - INFO - ======================================================================
> > > 2025-04-07 09:10:05,488 - oe-selftest - INFO - FAIL: test_permissions (wic.Wic.test_permissions)
> > > 2025-04-07 09:10:05,489 - oe-selftest - INFO - ----------------------------------------------------------------------
> > > 2025-04-07 09:10:05,489 - oe-selftest - INFO - Traceback (most recent call last):
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/selftest/cases/wic.py", line 677, in test_permissions
> > >     bitbake('core-image-minimal')
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
> > >     return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
> > >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> > >     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> > > AssertionError: Command 'bitbake  core-image-minimal' returned non-zero exit status 1:
> > > Loading cache...done.
> > > Loaded 1976 entries from dependency cache.
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION           = "2.12.0"
> > > BUILD_SYS            = "aarch64-linux"
> > > NATIVELSBSTRING      = "universal"
> > > TARGET_SYS           = "aarch64-poky-linux"
> > > MACHINE              = "genericarm64"
> > > DISTRO               = "poky-altcfg"
> > > DISTRO_VERSION       = "5.2"
> > > TUNE_FEATURES        = "aarch64 armv8a crc"
> > > TARGET_FPU           = ""
> > > meta                 
> > > meta-poky            
> > > meta-yocto-bsp       = "HEAD:a75117f79e4771927b89125e464e38acdc9c556e"
> > > meta-selftest        = "master:fd26cf3cc0e6e590b56e331971cdf884d1b881b9"
> > >
> > > Initialising tasks...Sstate summary: Wanted 539 Local 536 Mirrors 0 Missed 3 Current 1968 (99% match, 99% complete)
> > > Removing 3 stale sstate objects for arch genericarm64...done.
> > > NOTE: Executing Tasks
> > > NOTE: Running task 5157 of 5259 (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic)
> > > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Started
> > > ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/r
> > > un.do_image_wic.117565' failed with exit code 134
> > > ERROR: Logfile of failure stored in: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> > > Log data follows:
> > > | DEBUG: Executing python function extend_recipe_sysroot
> > > | NOTE: Direct dependencies are ['/home/mcfrisk/src/base/poky/meta/recipes-bsp/grub/grub-efi_2.12.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb:do_populate_sysroot', '/home/mcfrisk/s
> > > rc/base/poky/meta/recipes-core/systemd/systemd-boot_257.4.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:native:/ho
> > > me/mcfrisk/src/base/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_populate_sysroot', 'virtual:nati
> > > ve:/home/mcfrisk/src/base/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/mtools/mtools_4.0.48.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', 'virtua
> > > l:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg/opkg_0.7.0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/pseudo/
> > > pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_sysroot']
> > > | NOTE: Installed into sysroot: []
> > > | NOTE: Skipping as already exists in sysroot: ['grub-efi', 'gettext-minimal-native', 'cross-localedef-native', 'glibc', 'ldconfig-native', 'libxcrypt', 'ncurses', 'systemd-boot', 'systemd-systemctl-native', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-aarch64', 'cdrtools-native', 'cmake-native', 'gcc-runtime', 'libgcc', 'libtool
> > > -native', 'm4-native', 'opkg-utils', 'qemu-helper-native', 'qemu-native', 'qemu-system-native', 'qemuwrapper-cross', 'libpam', 'texinfo-dummy-native', 'depmodwrapper-cross', 'linux-libc-headers', 'bash-completion', 'libcap-ng', 'libcap', 'sqlite3', 'openssl-native', 'libslirp-native', 'coreutils-native', 'expat-native', 'gettext-native', 'glib-
> > > 2.0-native', 'libxml2-native', 'ncurses-native', 'readline-native', 'update-rc.d-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'btrfs-tools-native', 'chrpath-native', 'dosfstools-native', 'e2fsprogs-native', 'elfutils-native', 'erofs-utils-native', 'gptfdisk-native', 'flex-native', 'gnu-config-native', 'json-c-native', 'libedit-native', 'llvm-native', 'make-native', 'makedevs-native', 'mtools-native', 'opkg-utils-native', 'opkg-native', 'perl-native', 'pseudo-native', 'python3-build-nat
> > > ive', 'python3-calver-native', 'python3-editables-native', 'python3-flit-core-native', 'python3-hatchling-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-mako-native', 'python3-markupsafe-native', 'python3-packaging-native', 'python3-pathspec-native', 'python3-pip-native', 'python3-pluggy-native', 'python3-pygments-native
> > > ', 'python3-pyparsing-native', 'python3-pyproject-hooks-native', 'python3-setuptools-scm-native', 'python3-setuptools-native', 'python3-six-native', 'python3-trove-classifiers-native', 'python3-typing-extensions-native', 'python3-wheel-native', 'python3-native', 'squashfs-tools-native', 'unfs3-native', 'bzip2-native', 'cpio-native', 'diffutils-native', 'libarchive-native', 'libidn2-native', 'libnsl2-native', 'libsolv-native', 'libtirpc-native', 'parted-native', 'pigz-native', 'shadow-native', 'unzip-native', 'xz-n
> > > ative', 'zstd-native', 'libdrm-native', 'libepoxy-native', 'libsdl2-native', 'mesa-native', 'virglrenderer-native', 'wayland-protocols-native', 'wayland-native', 'xrandr-native', 'libpciaccess-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfix
> > > es-native', 'libxrandr-native', 'libxrender-native', 'libxshmfence-native', 'libxxf86vm-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'makedepend-native', 'util-macros-native', 'dtc-native', 'kmod-native', 'alsa-lib-native', 'libpng-native', 'acl-native', 'attr-native', 'bmaptool-native', 'curl-native', 'debianutils-native', 'gdbm-native', 'gmp-native', 'gnutls-native', 'libtasn1-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libgcrypt-native',
> > >  'libgpg-error-native', 'libmd-native', 'libmicrohttpd-native', 'libpcre2-native', 'libunistring-native', 'lz4-native', 'lzo-native', 'nettle-native', 'popt-native', 'shared-mime-info-native', 'sqlite3-native']
> > > | DEBUG: Python function extend_recipe_sysroot finished
> > > | DEBUG: Executing python function set_image_size
> > > | DEBUG: 159546.400000 = 122728 * 1.300000
> > > | DEBUG: 163642.400000 = max(159546.400000, 8192)[159546.400000] + 4096
> > > | DEBUG: 163643.000000 = int(163642.400000)
> > > | DEBUG: 163643 = aligned(163643)
> > > | DEBUG: returning 163643
> > > | DEBUG: Python function set_image_size finished
> > > | DEBUG: Executing shell function do_image_wic
> > > | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > > | Check logfile: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> > > | WARNING: exit code 134 from a shell command.
> > > | Aborted
> > > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> > > ERROR: Task (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1' 
> > > Pseudo log:
> > > path mismatch [2 links]: ino 43965780 db '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/rootfs/boot/loader/loader.conf' req '/home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/boot/loader/loader.conf'.
> > > Setup complete, sending SIGUSR1 to pid 117389.
> > >
> > > NOTE: Tasks Summary: Attempted 5254 tasks of which 5253 didn't need to be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic
> > >     log: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> > > Summary: There was 1 ERROR message, returning a non-zero exit code.
> > > ----------------------------------------------------------------------
> > > 2025-04-07 09:10:05,489 - oe-selftest - INFO - Ran 1 test in 2271.863s
> > > 2025-04-07 09:10:05,489 - oe-selftest - INFO - FAILED
> > > 2025-04-07 09:10:05,489 - oe-selftest - INFO -  (failures=1)
> > > 2025-04-07 09:10:11,706 - oe-selftest - INFO - RESULTS:
> > > 2025-04-07 09:10:11,706 - oe-selftest - INFO - RESULTS - wic.Wic.test_permissions: FAILED (2271.66s)
> > > 2025-04-07 09:10:11,708 - oe-selftest - INFO - SUMMARY:
> > > 2025-04-07 09:10:11,708 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 2271.863s
> > > 2025-04-07 09:10:11,708 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)
> > >
> > > I think something in this test is faulty. For example building an image
> > > in yocto do_image with fakeroot/pseudo and then modifying it outside of build
> > > env with wic is likely going to fail like this.
> > >
> > > I will try with other machine targets and cleaner local.conf
> > > but I suspect I will run into this same issue again.
> > >
> > > And the error from your CI buidl was completely different... :/
> > >
> > > Cheers,
> > >
> > > -Mikko
> > 
> > I confirm, localally I see the same thing as you do: just some pseudo
> > errors. They seem to come from "image_types_wic.bbclass: capture verbose
> > wic output by default" patch.
> > 
> > So yes, different than on the autobuilder, but yet if I drop the series,
> > autobuilder builds do succeed :(
> > 
> > So we can hope there is an obscure link between both failures, but
> > that's all I've got so far.
> 
> With:
> 
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -674,6 +674,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
>  
>                  config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
>                  self.append_config(config)
> +                bitbake('-c clean core-image-minimal')
>                  bitbake('core-image-minimal')
>                  tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
>  
> 
> the test is passing for me now without pseudo errors.
> 
> The debug logging patch is IMO unrelated. It's just capturing logs from wic by default.
> It could trigger rebuilds vs sstate cache if testing is done without and then with
> the patch applied. Is full world build done with this patch applied before
> selftests are run? I think this may impact the test as well.

Sent this out as "oeqa wic.py: clean image build dir before rebuild in test_permissions()"
separately. I think this test failure is unrelated to the changes but related to the
way tests are executed. I think tests behave different depending if sstate has the
image recipe output or not.

Cheers,

-Mikko

