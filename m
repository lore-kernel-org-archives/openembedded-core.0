Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E18C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:09:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.1034.1685124582583907576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 11:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SZKMziY8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685124580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=29aLDS/gc+UdDKtQNPyvzFIfE62GIzfJu1OIOcvHKcI=;
	b=SZKMziY8+hpTSuCCdqiqppRANL/iZnItI3A0FmQDDeZN5Q0jCjAfPncmpS0jVyKQRMS5hE
	3ZwlURKDckEQ7fGJ4jTj37PuTzV9RBgGlZN+zZOhFhhEHdC/nDaUW7TXtQJMY9Z6ZRWevq
	GzP8/WX4I1YhT7rBZAdGannTZOCV3JOQTGw8jE6ru1Kn8v6dZUnx2SalS5L54u3/DZJbLh
	pSkbkpdHkNIqbaE374nJ5SmvHwB4gobJ7Yrf+jE6n+xSRSBnH4d7HJtdQTukBO/WxliRWA
	lHqWoT3q4LE1CiFh5saYiqjFU5o8WQuY7KDlQQfskOgB3YI/DyDHodlaQnG4Xw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62C58FF806;
	Fri, 26 May 2023 18:09:40 +0000 (UTC)
Date: Fri, 26 May 2023 20:09:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
Message-ID: <20230526180939464ac2f2@mail.local>
References: <20230525102218.1613298-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525102218.1613298-1-Martin.Jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 18:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181778

Hello,

The series causes oe-selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/steps/14/logs/stdio

2023-05-25 17:24:13,622 - oe-selftest - INFO - FAIL: wic.Wic2.test_gpt_partition_name (subunit.RemotedTestCase)
2023-05-25 17:24:13,622 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-05-25 17:24:13,623 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/wic.py", line 1362, in test_gpt_partition_name
    self.assertTrue(os.path.exists(image_path))
  File "/usr/lib64/python3.10/unittest/case.py", line 687, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true

On 25/05/2023 12:22:17+0200, Martin Jansa wrote:
> * ${IMAGE_NAME}${IMAGE_NAME_SUFFIX} is almost always used together already
>   and when they aren't it's usually because of hardcoded '.rootfs' suffix
> 
> * it's a bit strange, because ${IMAGE_NAME_SUFFIX} is applied after the
>   version from ${IMAGE_VERSION_SUFFIX}, if we move it to ${IMAGE_LINK_NAME}
>   then it will be applied before the version and ${IMAGE_LINK_NAME}
>   will be just the version-less symlink to latest built version.
> 
> * it's not added to INITRAMFS_IMAGE_NAME as it assumes that all
>   images used as initramfs will set IMAGE_NAME_SUFFIX to empty.
>   Many already do as shown bellow, but you might need to extend
>   this list in your layer.
> 
> * this also allows to drop support for imgsuffix varflag, recipes which
>   don't want to have .rootfs suffix can just set IMAGE_NAME_SUFFIX to
>   empty and it will be consistently respected by both IMAGE_NAME and IMAGE_LINK_NAME
> 
> * imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix') or d.expand("${IMAGE_NAME_SUFFIX}.")
>   is kind of terrible, notice trailing '.' after ${IMAGE_NAME_SUFFIX}
>   while this dot was in imgsuffix in:
>   do_bootimg[imgsuffix] = "."
> 
>   but in both cases it's not really part of the imgsuffix, but the
>   "extension" type separator as in dst variable:
> 
>          dst = os.path.join(deploy_dir, link_name + "." + type)
> -        src = img_name + imgsuffix + type
> +        src = img_name + "." + type
> 
> * for ubifs volumes move vname after IMAGE_NAME_SUFFIX
> 
> * to better document these changes here is an example with default poky
>   configuration with just:
>   IMAGE_FSTYPES:append:pn-core-image-minimal = " live wic wic.vmdk ubi"
>   MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
>   UBINIZE_ARGS = "-m 2048 -p 131072 -s 512"
>   added in local.conf, so that deploy_dir has also some initramfs and more
>   IMAGE_FSTYPES
> 
> * "ls -lahi tmp/deploy/images/qemux86-64/"
>   output after "bitbake core-image-minimal"
> 
>   And deploy-dir is cleaned between runs with:
>   bitbake -c clean core-image-minimal core-image-minimal-initramfs virtual/kernel grub-efi systemd-boot
> 
>   The output confirms that the only change is ".rootfs" added not only
>   in ext4 and manifest files, but also for hddimg, iso, qemuboot.conf
>   testdata.json for both the actual artifacts as well as the symlinks
>   while core-image-minimal-initramfs doesn't have them as IMAGE_NAME_SUFFIX
>   was already set to empty there:
> meta/classes-recipe/baremetal-image.bbclass:IMAGE_NAME_SUFFIX ?= ""
> meta/recipes-core/images/core-image-minimal-initramfs.bb:IMAGE_NAME_SUFFIX ?= ""
> meta/recipes-core/images/core-image-tiny-initramfs.bb:IMAGE_NAME_SUFFIX ?= ""
> meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:IMAGE_NAME_SUFFIX ?= ""
> meta/recipes-extended/images/core-image-testcontroller-initramfs.bb:IMAGE_NAME_SUFFIX ?= ""
> 
>   before these changes:
> total 297M
> 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:19 .
> 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> 35845703 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage -> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 35845704 -rw-r--r-- 2 martin martin  11M Mar  7 12:27 bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 35845702 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage-qemux86-64.bin -> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 40236967 -rw-r--r-- 2 martin martin  13M Mar  7 19:19 core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> 40203232 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:19 core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> 40212700 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19 core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> 40211556 -rw-r--r-- 2 martin martin 211K Mar  7 19:19 core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> 40236964 lrwxrwxrwx 2 martin martin   62 Mar  7 19:19 core-image-minimal-initramfs-qemux86-64.cpio.gz -> core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> 40203235 lrwxrwxrwx 2 martin martin   63 Mar  7 19:19 core-image-minimal-initramfs-qemux86-64.manifest -> core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> 40212690 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19 core-image-minimal-initramfs-qemux86-64.qemuboot.conf -> core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> 40211560 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19 core-image-minimal-initramfs-qemux86-64.testdata.json -> core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> 40237307 -rw-r--r-- 2 martin martin  57M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.hddimg
> 40237329 -rw-r--r-- 2 martin martin  56M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.iso
> 40220347 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> 40236942 -rw-r--r-- 2 martin martin  34M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> 40211563 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> 40237206 -rw-r--r-- 2 martin martin  16M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> 40237216 -rw-r--r-- 2 martin martin  20M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> 40224358 -rw-r--r-- 2 martin martin  19M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> 40360386 -rw-r--r-- 2 martin martin  73M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> 40237285 -rw-r--r-- 2 martin martin  35M Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> 40209866 -rw-r--r-- 2 martin martin 206K Mar  7 19:19 core-image-minimal-qemux86-64-20230307181808.testdata.json
> 40236946 lrwxrwxrwx 2 martin martin   56 Mar  7 19:19 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> 40237336 lrwxrwxrwx 2 martin martin   51 Mar  7 19:19 core-image-minimal-qemux86-64.hddimg -> core-image-minimal-qemux86-64-20230307181808.hddimg
> 40237337 lrwxrwxrwx 2 martin martin   48 Mar  7 19:19 core-image-minimal-qemux86-64.iso -> core-image-minimal-qemux86-64-20230307181808.iso
> 40211564 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> 40220348 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> 40237205 lrwxrwxrwx 2 martin martin   59 Mar  7 19:19 core-image-minimal-qemux86-64.tar.bz2 -> core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> 40209873 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-20230307181808.testdata.json
> 40237217 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19 core-image-minimal-qemux86-64.ubi -> core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> 40236771 lrwxrwxrwx 2 martin martin   57 Mar  7 19:19 core-image-minimal-qemux86-64.ubifs -> core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> 40237287 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19 core-image-minimal-qemux86-64.wic -> core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> 40237286 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> 40237192 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:19 core-image-minimal.env
> 34458377 -rw-r--r-- 2 martin martin 616K Mar  7 17:55 grub-efi-bootx64.efi
> 34963606 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> 35845662 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27 modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz
> 35845701 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 modules-qemux86-64.tgz -> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz
> 34963605 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.efi
> 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:19 ubinize-core-image-minimal-qemux86-64-20230307181808.cfg
> 
>   after these changes:
> total 297M
> 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:16 .
> 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> 39479266 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage -> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 39479267 -rw-r--r-- 2 martin martin  11M Mar  7 12:27 bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 39479264 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage-qemux86-64.bin -> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin
> 39648810 -rw-r--r-- 2 martin martin  13M Mar  7 19:15 core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> 39638400 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:15 core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> 39644650 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15 core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> 39637657 -rw-r--r-- 2 martin martin 211K Mar  7 19:15 core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> 39648091 lrwxrwxrwx 2 martin martin   62 Mar  7 19:15 core-image-minimal-initramfs-qemux86-64.cpio.gz -> core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> 39638401 lrwxrwxrwx 2 martin martin   63 Mar  7 19:15 core-image-minimal-initramfs-qemux86-64.manifest -> core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> 39644651 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15 core-image-minimal-initramfs-qemux86-64.qemuboot.conf -> core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> 39637662 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15 core-image-minimal-initramfs-qemux86-64.testdata.json -> core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> 39654281 -rw-r--r-- 2 martin martin  34M Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> 39656710 -rw-r--r-- 2 martin martin  57M Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> 39657112 -rw-r--r-- 2 martin martin  56M Mar  7 19:16 core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> 39645313 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> 39646013 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> 39656336 -rw-r--r-- 2 martin martin  16M Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> 39644408 -rw-r--r-- 2 martin martin 206K Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> 39656583 -rw-r--r-- 2 martin martin  20M Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> 39654124 -rw-r--r-- 2 martin martin  19M Mar  7 19:15 core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> 39802371 -rw-r--r-- 2 martin martin  73M Mar  7 19:16 core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> 39657113 -rw-r--r-- 2 martin martin  35M Mar  7 19:16 core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> 39654412 lrwxrwxrwx 2 martin martin   56 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.ext4 -> core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> 39657167 lrwxrwxrwx 2 martin martin   58 Mar  7 19:16 core-image-minimal-qemux86-64.rootfs.hddimg -> core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> 39657168 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16 core-image-minimal-qemux86-64.rootfs.iso -> core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> 39645316 lrwxrwxrwx 2 martin martin   60 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.manifest -> core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> 39646014 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.qemuboot.conf -> core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> 39656315 lrwxrwxrwx 2 martin martin   59 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.tar.bz2 -> core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> 39644406 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.testdata.json -> core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> 39656584 lrwxrwxrwx 2 martin martin   55 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.ubi -> core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> 39654775 lrwxrwxrwx 2 martin martin   57 Mar  7 19:15 core-image-minimal-qemux86-64.rootfs.ubifs -> core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> 39657126 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16 core-image-minimal-qemux86-64.rootfs.wic -> core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> 39657088 lrwxrwxrwx 2 martin martin   60 Mar  7 19:16 core-image-minimal-qemux86-64.rootfs.wic.vmdk -> core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> 39654418 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:15 core-image-minimal.env
> 39475732 -rw-r--r-- 2 martin martin 616K Mar  7 17:55 grub-efi-bootx64.efi
> 31507074 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> 39479261 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27 modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz
> 39479263 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 modules-qemux86-64.tgz -> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz
> 31507058 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.efi
> 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:15 ubinize-core-image-minimal-qemux86-64.rootfs-20230307181456.cfg
> 
> [YOCTO #12937]
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../image-artifact-names.bbclass              |   3 +-
>  meta/classes-recipe/image-live.bbclass        |   1 -
>  meta/classes-recipe/image.bbclass             |   7 +-
>  meta/classes-recipe/image_types.bbclass       | 108 +++++++++---------
>  meta/classes-recipe/image_types_wic.bbclass   |   2 +-
>  .../rootfs-postcommands.bbclass               |   2 +-
>  meta/classes/cve-check.bbclass                |   4 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py      |   2 +
>  .../images/build-appliance-image_15.0.0.bb    |   6 +-
>  9 files changed, 68 insertions(+), 67 deletions(-)
> 
> diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
> index ac2376d59a..bc76ff0e16 100644
> --- a/meta/classes-recipe/image-artifact-names.bbclass
> +++ b/meta/classes-recipe/image-artifact-names.bbclass
> @@ -12,9 +12,10 @@ IMAGE_BASENAME ?= "${PN}"
>  IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
>  IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
>  IMAGE_NAME ?= "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> -IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
> +IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
>  
>  # This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS_IMAGE instead of IMAGE_BASENAME
> +# and without ${IMAGE_NAME_SUFFIX} which all initramfs images should set to empty
>  INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
>  
>  # The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:
> diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
> index 168774a464..95dd44a8c0 100644
> --- a/meta/classes-recipe/image-live.bbclass
> +++ b/meta/classes-recipe/image-live.bbclass
> @@ -260,6 +260,5 @@ python do_bootimg() {
>      bb.build.exec_func('create_symlinks', d)
>  }
>  do_bootimg[subimages] = "hddimg iso"
> -do_bootimg[imgsuffix] = "."
>  
>  addtask bootimg before do_image_complete after do_rootfs
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> index e0dfba4a42..21b220a28d 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -480,14 +480,14 @@ python () {
>                      if subimage not in subimages:
>                          subimages.append(subimage)
>                      if type not in alltypes:
> -                        rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
> +                        rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>  
>          for bt in basetypes[t]:
>              gen_conversion_cmds(bt)
>  
>          localdata.setVar('type', realt)
>          if t not in alltypes:
> -            rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
> +            rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>          else:
>              subimages.append(realt)
>  
> @@ -594,13 +594,12 @@ python create_symlinks() {
>      manifest_name = d.getVar('IMAGE_MANIFEST')
>      taskname = d.getVar("BB_CURRENTTASK")
>      subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
> -    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix') or d.expand("${IMAGE_NAME_SUFFIX}.")
>  
>      if not link_name:
>          return
>      for type in subimages:
>          dst = os.path.join(deploy_dir, link_name + "." + type)
> -        src = img_name + imgsuffix + type
> +        src = img_name + "." + type
>          if os.path.exists(os.path.join(deploy_dir, src)):
>              bb.note("Creating symlink: %s -> %s" % (dst, src))
>              if os.path.islink(dst):
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index bbddfaf272..16e9aef40e 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -66,9 +66,9 @@ ZIP_COMPRESSION_LEVEL ?= "-9"
>  ZSTD_COMPRESSION_LEVEL ?= "-3"
>  
>  JFFS2_SUM_EXTRA_ARGS ?= ""
> -IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}"
>  
> -IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}"
> +IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.cramfs ${EXTRA_IMAGECMD}"
>  
>  oe_mkext234fs () {
>  	fstype=$1
> @@ -88,14 +88,14 @@ oe_mkext234fs () {
>  		eval COUNT=\"$MIN_COUNT\"
>  	fi
>  	# Create a sparse image block
> -	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
> -	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
> +	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
> +	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
>  	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> -	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> -	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
> -	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
> +	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
> +	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
> +	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}
>  	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
> -	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
> +	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $? -le 3 ]
>  }
>  
>  IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
> @@ -109,8 +109,8 @@ IMAGE_CMD:btrfs () {
>  		size=${MIN_BTRFS_SIZE}
>  		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
>  	fi
> -	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs seek=${size} count=0 bs=1024
> -	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
> +	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs seek=${size} count=0 bs=1024
> +	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs
>  }
>  
>  oe_mksquashfs () {
> @@ -119,7 +119,7 @@ oe_mksquashfs () {
>  
>      # Use the bitbake reproducible timestamp instead of the hardcoded squashfs one
>      export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
> -    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
> +    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
>  }
>  IMAGE_CMD:squashfs = "oe_mksquashfs"
>  IMAGE_CMD:squashfs-xz = "oe_mksquashfs xz"
> @@ -127,18 +127,18 @@ IMAGE_CMD:squashfs-lzo = "oe_mksquashfs lzo"
>  IMAGE_CMD:squashfs-lz4 = "oe_mksquashfs lz4"
>  IMAGE_CMD:squashfs-zst = "oe_mksquashfs zstd zst"
>  
> -IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
> -IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}"
> -IMAGE_CMD:erofs-lz4hc = "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4hc ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs-lz4hc = "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}"
>  
>  
>  IMAGE_CMD_TAR ?= "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
> -IMAGE_CMD:tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
> +IMAGE_CMD:tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>  
>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>  IMAGE_CMD:cpio () {
> -	(cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +	(cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
>  	# We only need the /init symlink if we're building the real
>  	# image. The -dbg image doesn't need it! By being clever
>  	# about this we also avoid 'touch' below failing, as it
> @@ -151,7 +151,7 @@ IMAGE_CMD:cpio () {
>  			else
>  				touch ${WORKDIR}/cpio_append/init
>  			fi
> -			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
>  		fi
>  	fi
>  }
> @@ -166,7 +166,7 @@ write_ubi_config() {
>  	cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
>  [ubifs]
>  mode=ubi
> -image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_IMGTYPE}
> +image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${UBI_IMGTYPE}
>  vol_id=0
>  vol_type=${UBI_VOLTYPE}
>  vol_name=${UBI_VOLNAME}
> @@ -191,9 +191,9 @@ multiubi_mkfs() {
>  	write_ubi_config "${vname}"
>  
>  	if [ -n "$vname" ]; then
> -		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
> +		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubifs ${mkubifs_args}
>  	fi
> -	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> +	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
>  
>  	# Cleanup cfg file
>  	mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
> @@ -201,12 +201,12 @@ multiubi_mkfs() {
>  	# Create own symlinks for 'named' volumes
>  	if [ -n "$vname" ]; then
>  		cd ${IMGDEPLOYDIR}
> -		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then
> -			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
> +		if [ -e ${IMAGE_NAME}${vname}.ubifs ]; then
> +			ln -sf ${IMAGE_NAME}${vname}.ubifs \
>  			${IMAGE_LINK_NAME}${vname}.ubifs
>  		fi
> -		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then
> -			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
> +		if [ -e ${IMAGE_NAME}${vname}.ubi ]; then
> +			ln -sf ${IMAGE_NAME}${vname}.ubi \
>  			${IMAGE_LINK_NAME}${vname}.ubi
>  		fi
>  		cd -
> @@ -231,7 +231,7 @@ IMAGE_CMD:ubi () {
>  }
>  IMAGE_TYPEDEP:ubi = "${UBI_IMGTYPE}"
>  
> -IMAGE_CMD:ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
> +IMAGE_CMD:ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.ubifs ${MKUBIFS_ARGS}"
>  
>  MIN_F2FS_SIZE ?= "524288"
>  IMAGE_CMD:f2fs () {
> @@ -245,9 +245,9 @@ IMAGE_CMD:f2fs () {
>  		size=${MIN_F2FS_SIZE}
>  		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
>  	fi
> -	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs seek=${size} count=0 bs=1024
> -	mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> -	sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> +	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs seek=${size} count=0 bs=1024
> +	mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
> +	sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
>  }
>  
>  EXTRA_IMAGECMD = ""
> @@ -313,32 +313,32 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
>  COMPRESSIONTYPES ?= ""
>  
>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
> -CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> -CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> -CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> -CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
> -CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> -CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> -CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> -CONVERSION_CMD:sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> -CONVERSION_CMD:sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> -CONVERSION_CMD:sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> -CONVERSION_CMD:sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> -CONVERSION_CMD:bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> -CONVERSION_CMD:u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
> -CONVERSION_CMD:vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
> -CONVERSION_CMD:vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
> -CONVERSION_CMD:vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
> -CONVERSION_CMD:vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
> -CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
> -CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
> -CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
> +CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.xz"
> +CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.lz4"
> +CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> +CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> +CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.md5sum"
> +CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha1sum"
> +CONVERSION_CMD:sha224sum = "sha224sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha224sum"
> +CONVERSION_CMD:sha256sum = "sha256sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha256sum"
> +CONVERSION_CMD:sha384sum = "sha384sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha384sum"
> +CONVERSION_CMD:sha512sum = "sha512sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha512sum"
> +CONVERSION_CMD:bmap = "bmaptool create ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.bmap"
> +CONVERSION_CMD:u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.u-boot"
> +CONVERSION_CMD:vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vmdk"
> +CONVERSION_CMD:vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx"
> +CONVERSION_CMD:vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd"
> +CONVERSION_CMD:vdi = "qemu-img convert -O vdi ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vdi"
> +CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.qcow2"
> +CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.base64"
> +CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
>  CONVERSION_DEPENDS_lzma = "xz-native"
>  CONVERSION_DEPENDS_gz = "pigz-native"
>  CONVERSION_DEPENDS_bz2 = "pbzip2-native"
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index be31fbf94f..669606da75 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -71,7 +71,7 @@ IMAGE_CMD:wic () {
>  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
>  	fi
>  	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> -	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
> +	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out.wic"
>  }
>  IMAGE_CMD:wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
>  do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
> index 690fa976aa..efc7c9562c 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -37,7 +37,7 @@ APPEND:append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro
>  ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
>  
>  # Write manifest
> -IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
> +IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest"
>  ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
>  # Set default postinst log file
>  POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index bd9e7e7445..f7abaf4f0c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
>  CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
>  CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
>  CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
> -CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
> -CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
> +CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
> +CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
>  CVE_CHECK_COPY_FILES ??= "1"
>  CVE_CHECK_CREATE_MANIFEST ??= "1"
>  
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 7bc171e02d..9383d0c4db 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -33,6 +33,8 @@ KERNEL_CLASSES = " kernel-fitimage "
>  # RAM disk variables including load address and entrypoint for kernel and RAM disk
>  IMAGE_FSTYPES += "cpio.gz"
>  INITRAMFS_IMAGE = "core-image-minimal"
> +# core-image-minimal is used as initramfs here, drop the rootfs suffix
> +IMAGE_NAME_SUFFIX:pn-core-image-minimal = ""
>  UBOOT_RD_LOADADDRESS = "0x88000000"
>  UBOOT_RD_ENTRYPOINT = "0x88000000"
>  UBOOT_LOADADDRESS = "0x80080000"
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index c68a57e1db..06605507c3 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -133,9 +133,9 @@ create_bundle_files () {
>  	cd ${WORKDIR}
>  	mkdir -p Yocto_Build_Appliance
>  	cp *.vmx* Yocto_Build_Appliance
> -	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> -	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> -	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
> +	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> +	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> +	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
>  	zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
>  	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
>  }
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181708): https://lists.openembedded.org/g/openembedded-core/message/181708
> Mute This Topic: https://lists.openembedded.org/mt/99127017/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

