Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5C2A6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m24so12824771wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c2mv2O2pxIlzbHQYo5BX5lUBHsJhepRMCkkY5npyXTo=;
	b=uCIIXthY4gB0E71ErJX9Lhsqe05tVtb0iPq04qy+953DUwYdyKsorgbzuXv3/jxluC
	cmg0KFq2TSBI8RjK1X14HLWGF4FXRvL5duD2xZcKCSGh77uX7ebUT9NLKOpKQzN7KNLP
	arCKp5yFl0VI+/IFwY1lM9kwfz/JSedlXSlb0PdL1ttpCxSdlseQbHleNrEub8mY7gVq
	Ottcjm+m3wIhquKbybTzSmxa0JF+RGdI9/fQQT1KcDJra9xn1/3dhh+6/TB2b03/JZfV
	ddMuBJ6CxE/MOsiKwjD4D9M7J++YU0/FgYV0zXr8fI8PnlPKWcDlNRhWFDnagtnGUs3W
	v6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c2mv2O2pxIlzbHQYo5BX5lUBHsJhepRMCkkY5npyXTo=;
	b=PzTGuNwufZd/H0LJc+o4vOZ+CkaLvHJfckCZsaIKuVRsYW+iIF+NsVAFnrFYzPB1un
	lBDUhpcSuq8sSXo1sCJJKPF9EFQp3nOf6FpkOcXI9MkzWJQhkr/9izAxIjgXqetN5m2t
	4cRAPfhIb/WeVlPuOkof9+K9bUf/EjtZBm1avpNqnNq/NBcRxf3OQSCsYJcUyPeThv9J
	tRIov/TxSvGETQ0DTWYE83fTBT/yjT4288LcmHsBoUhk/Q9y4yx7WqKRfJ4FJUB38aZp
	iSgLZZoEtLhZItAwYcUEJ7J2wXO0nRYGIBW00KLYVbu98kj7cySyaqkxsVkEEgcnpavJ
	60IQ==
X-Gm-Message-State: APjAAAXko/1CRYQIvZ/MJL5ZqmCOawFfq1uloOAfiybEDtMHniCcwatt
	xY9JPS209TinSHfkQqtfSGkljFPrjV8=
X-Google-Smtp-Source: APXvYqwnzfREJJ5Rub5AmzZxG1eFxgrzriabcEEABQ76JP9L9FgJkq7mbmyTijysxKgVOx78fXrvbg==
X-Received: by 2002:a1c:960c:: with SMTP id y12mr14220925wmd.9.1578993155752; 
	Tue, 14 Jan 2020 01:12:35 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	l15sm17958674wrv.39.2020.01.14.01.12.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:19 +0100
Message-Id: <cover.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv5 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:36 -0000
Content-Transfer-Encoding: 8bit

Let me explain a bit what these changes do for us in LGE.

We have jenkins jobs for CI as well for official releases.

All built artifacts are moved from jenkins builder to fileserver after
the build.

Each jobs have some identifier which is then included in the filenames
of all relevant build artifacts, e.g. CI jobs will add e.g. lgsvl-verf-12
to show where it was created and what build created it (12 is
BUILD_NUMBER from jenkins, verf is type of build, lgsvl is location).

To do this you can already use IMAGE_VERSION_SUFFIX variable and add
this as a suffix to current artifact names. But that has some bad
limitations.

A) If you keep IMAGE_VERSION_SUFFIX in do_deploy signatures, then
the artifacts will be rebuilt even when the deploy sstate archive in
cache is identical except tha filename. We had this for a while, but
all CI jobs were slow, because of rebuilding kernel every single time.

B) If you vardepexclude IMAGE_VERSION_SUFFIX from the tasks which use
it, you get faster CI builds, but with inconsistent artifact names when
kernel deploy sstate is reused, e.g. image will have lgsvl-verf-12
but all kernel artifacts will end with lgsvl-verf-11, when the kernel
do_deploy was reused from previously built sstate-cache

It gets even worse with B) when you have some other tooling (like
runtime testing farm) which is tasked to flash image and kernel from
lgsvl-verf-12 and it fails to find kernel image to flash, because it's
named differently.

C) Using version-less artifacts and just storing them in different
directories might work better, but then it would make sense to include
IMAGE_VERSION_SUFFIX in DEPLOY_DIR_IMAGE and remove it from the actual
files inside (with version-less symlinks pointing to them). But this is
a bit problematic when the individual images are usually downloaded by
BFUs over http (and they end with various identically named files for
which they don't remember from where they came).

So this was the motivation why we have this in webOS.

The difference for you (most people shouldn't even notice):

1) hard links instead of symlinks in DEPLOY_DIR_IMAGE, because now the
   version is in the *_LINK_* variables and you don't want symlink with
   version release-1 pointing to file created with release-2 build.

2) do_deploy, do_rootfs can still be reused from sstate, it will restore
   the version-less artifact and then just quicky add another hardlink with
   new filename (do_deploy_links task).

3) we're using this for couple years (badly hacked into OE, because we didn't
   want to overlay all relevant .bbclasses, but still needed to inject do_deploy_links
   task dependency in multiple places) and the only issue I've noticed was with
   one our proprietary IMAGE_FSTYPE format which was appending to image file in
   DEPLOY_DIR_IMAGE if it existed before, instead of overwritting it from scratch -
   to fix that I've just changed fstype function to remove the file before creating
   it again.

4) Examples:
   All show "ls -laih DEPLOY_DIR_IMAGE | sort" to show the symlinks and hardlinks

   TMPDIR is removed between each example, except the e) and f), but sstate-cache
   is kept in all cases and reused where possible

   MODULE_TARBALL_DEPLOY = "1" is added to local.conf to have more than just 1
   kernel image as artifact from kernel (e.g. rpi MACHINEs have a lot of them with
   all the dtds).

a) Current master with default values:

$ ls -laih qemux86-64-master-default/  | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735788 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735796 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 14:23 .
50741892 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
52067796 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 14:22 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067797 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067798 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.bin
52067799 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 14:22 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
52068116 lrwxrwxrwx  1 bitbake bitbake   78 Aug 16 14:22 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.17-qemux86-64-20190816141126.tgz
52068127 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
52068128 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-20190816141126.qemuboot.conf
52068136 -rw-r--r--  1 bitbake bitbake 162K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.testdata.json
52068137 lrwxrwxrwx  1 bitbake bitbake   58 Aug 16 14:23 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-20190816141126.testdata.json
52068153 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
52068154 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-20190816141126.rootfs.manifest
52068264 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 14:23 core-image-minimal.env
52068265 -rw-r--r--  1 bitbake bitbake  61M Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
52068271 lrwxrwxrwx  1 bitbake bitbake   56 Aug 16 14:23 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-20190816141126.rootfs.ext4
52068272 -rw-r--r--  1 bitbake bitbake  49M Aug 16 14:23 core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk
52068273 lrwxrwxrwx  1 bitbake bitbake   60 Aug 16 14:23 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-20190816141126.rootfs.wic.vmdk

b) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":

$ ls -laih qemux86-64-master-release-1/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735791 -rw-r--r--  2 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735798 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 16:12 .
50741895 -rwxr-xr-x  2 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
52068085 -rw-r--r--  2 bitbake bitbake 7.6M Aug 16 16:11 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068086 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068087 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.bin
52068088 -rw-r--r--  2 bitbake bitbake 7.0M Aug 16 16:11 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
52068443 lrwxrwxrwx  2 bitbake bitbake   73 Aug 16 16:11 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.19-qemux86-64-release-1.tgz
52068450 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.qemuboot.conf
52068451 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-release-1.qemuboot.conf
52068471 -rw-r--r--  2 bitbake bitbake 161K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.testdata.json
52068472 lrwxrwxrwx  2 bitbake bitbake   53 Aug 16 16:11 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-release-1.testdata.json
52068507 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 16:11 core-image-minimal-qemux86-64-release-1.rootfs.manifest
52068508 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:11 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-release-1.rootfs.manifest
52068583 -rw-r--r--  2 bitbake bitbake 1.1K Aug 16 16:11 core-image-minimal.env
52068584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 16:11 core-image-minimal-qemux86-64-release-1.rootfs.ext4
52068585 lrwxrwxrwx  2 bitbake bitbake   51 Aug 16 16:11 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-release-1.rootfs.ext4
52068586 -rw-r--r--  2 bitbake bitbake  49M Aug 16 16:12 core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk
52068596 lrwxrwxrwx  2 bitbake bitbake   55 Aug 16 16:12 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-release-1.rootfs.wic.vmdk

c) Current master with IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
   and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
   while kernel is still reused from sstate

$ ls -laih qemux86-64-master-release-2/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735847 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735855 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:25 .
50742058 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50886339 -rw-r--r--  1 bitbake bitbake 7.6M Aug 16 13:23 bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886340 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 bzImage-qemux86-64.bin -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886341 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 bzImage -> bzImage--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.bin
50886342 -rw-r--r--  1 bitbake bitbake 7.0M Aug 16 13:23 modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
50886345 lrwxrwxrwx  1 bitbake bitbake   73 Aug 16 13:23 modules-qemux86-64.tgz -> modules--5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.15-qemux86-64-release-2.tgz
51125060 -rw-r--r--  1 bitbake bitbake 161K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.testdata.json
51125068 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25 core-image-minimal-qemux86-64.testdata.json -> core-image-minimal-qemux86-64-release-2.testdata.json
51125069 -rw-r--r--  1 bitbake bitbake 2.2K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.manifest
51125070 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25 core-image-minimal-qemux86-64.manifest -> core-image-minimal-qemux86-64-release-2.rootfs.manifest
51125072 -rw-r--r--  1 bitbake bitbake 1.3K Aug 16 13:25 core-image-minimal-qemux86-64-release-2.qemuboot.conf
51125073 lrwxrwxrwx  1 bitbake bitbake   53 Aug 16 13:25 core-image-minimal-qemux86-64.qemuboot.conf -> core-image-minimal-qemux86-64-release-2.qemuboot.conf
51125075 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:25 core-image-minimal.env
51125076 -rw-r--r--  1 bitbake bitbake  61M Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.ext4
51125077 lrwxrwxrwx  1 bitbake bitbake   51 Aug 16 13:25 core-image-minimal-qemux86-64.ext4 -> core-image-minimal-qemux86-64-release-2.rootfs.ext4
51125078 -rw-r--r--  1 bitbake bitbake  49M Aug 16 13:25 core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk
51125079 lrwxrwxrwx  1 bitbake bitbake   55 Aug 16 13:25 core-image-minimal-qemux86-64.wic.vmdk -> core-image-minimal-qemux86-64-release-2.rootfs.wic.vmdk

d) With this PR and default values:

$ ls -laih qemux86-64-YOCTO-12937-default/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735787 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735794 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:45 .
50741889 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.tgz
50878232 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-5.0.19+git2+c2e34d9ab2_00638cdd8f-r0.10-20190816124241.bin
50878233 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
50878239 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin
51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.qemuboot.conf
51663342 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:45 core-image-minimal-qemux86-64.qemuboot.conf
51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.testdata.json
51663368 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:45 core-image-minimal-qemux86-64.testdata.json
51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.manifest
51663370 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.manifest
51663546 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:45 core-image-minimal.env
51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.ext4
51663555 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.ext4
51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45 core-image-minimal-qemux86-64-1.0-r0-20190816124241.wic.vmdk
51663557 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:45 core-image-minimal-qemux86-64.rootfs.wic.vmdk

e) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-1":

$ ls -laih qemux86-64-YOCTO-12937-release-1/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
50735846 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
50735852 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 12:59 .
50742055 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-1.tgz
50878352 -rw-r--r--  2 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
50878353 -rw-r--r--  2 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-1.bin
50878359 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin
51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58 core-image-minimal-qemux86-64.qemuboot.conf
51665406 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.qemuboot.conf
51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.testdata.json
51665432 -rw-r--r--  2 bitbake bitbake 161K Aug 16 12:58 core-image-minimal-qemux86-64.testdata.json
51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58 core-image-minimal-qemux86-64-release-1.manifest
51665434 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 12:58 core-image-minimal-qemux86-64.rootfs.manifest
51665606 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 12:58 core-image-minimal.env
51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59 core-image-minimal-qemux86-64-release-1.ext4
51665615 -rw-r--r--  2 bitbake bitbake  61M Aug 16 12:59 core-image-minimal-qemux86-64.rootfs.ext4
51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59 core-image-minimal-qemux86-64-release-1.wic.vmdk
51665617 -rw-r--r--  2 bitbake bitbake  49M Aug 16 12:59 core-image-minimal-qemux86-64.rootfs.wic.vmdk

f) With this PR and IMAGE_VERSION_SUFFIX_forcevariable = "-release-2"
   and IMAGE_INSTALL_append = " zlib" added to force image to be recreated
   while kernel is still reused from sstate
   In this case I haven't removed TMPDIR between e) and f) to show
   that kernel artifacts are identical from previous build release-1 and just
   added another hardlink to the same inode.

$ ls -laih qemux86-64-YOCTO-12937-release-2/ | sort
47054849 drwxr-xr-x 13 bitbake bitbake 4.0K Aug 16 16:37 ..
51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07 core-image-minimal-qemux86-64.qemuboot.conf
51665409 -rw-r--r--  2 bitbake bitbake 1.3K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.qemuboot.conf
51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.testdata.json
51665420 -rw-r--r--  2 bitbake bitbake 161K Aug 16 13:07 core-image-minimal-qemux86-64.testdata.json
51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07 core-image-minimal-qemux86-64-release-2.manifest
51665422 -rw-r--r--  2 bitbake bitbake 2.2K Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.manifest
51665583 -rw-r--r--  1 bitbake bitbake 1.1K Aug 16 13:07 core-image-minimal.env
51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07 core-image-minimal-qemux86-64-release-2.ext4
51665584 -rw-r--r--  2 bitbake bitbake  61M Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.ext4
51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07 core-image-minimal-qemux86-64-release-2.wic.vmdk
51665585 -rw-r--r--  2 bitbake bitbake  49M Aug 16 13:07 core-image-minimal-qemux86-64.rootfs.wic.vmdk
51666546 drwxr-xr-x  2 bitbake bitbake 4.0K Aug 16 13:07 .
51666553 -rw-r--r--  1 bitbake bitbake 612K Aug 15 17:16 grub-efi-bootx64.efi
51666554 -rwxr-xr-x  1 bitbake bitbake  95K Aug 15 17:16 systemd-bootx64.efi
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-1.tgz
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64-release-2.tgz
51666555 -rw-r--r--  3 bitbake bitbake 7.0M Aug 15 18:44 modules-qemux86-64.tgz
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64.bin
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-1.bin
51666556 -rw-r--r--  3 bitbake bitbake 7.6M Aug 15 18:44 bzImage-qemux86-64-release-2.bin
51666557 lrwxrwxrwx  1 bitbake bitbake   22 Aug 15 18:44 bzImage -> bzImage-qemux86-64.bin

The following changes since commit b6d4150f9c74f25a4022a3fa0bd489a8e85deb77:

  gettext: fix typo in Upstream-Status (2020-01-13 13:07:32 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/artifacts
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts

Martin Jansa (8):
  image-artifact-names: introduce new bbclass and move some variables
    into it
  bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
    the _LINK_NAME variables and change it to hard link
  kernel-artifact-names.bbclass: use PR instead of PKGR in
    KERNEL_ARTIFACT_NAME
  kernel.bbclass: imageType without {}
  kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
  *-artifact-names: include version only in the artifact links
  *-initramfs: don't use .rootfs IMAGE_NAME_SUFFIX
  images: respect IMAGE_NAME_SUFFIX also for *-testdata.json and
    *-qemuboot.conf files

 meta/classes/buildhistory.bbclass             |  2 +
 meta/classes/cve-check.bbclass                |  4 +-
 meta/classes/image-artifact-names.bbclass     | 15 ++++++
 meta/classes/image-live.bbclass               | 12 ++---
 meta/classes/image.bbclass                    | 10 ++--
 meta/classes/image_types.bbclass              |  9 +---
 meta/classes/kernel-artifact-names.bbclass    | 12 ++++-
 meta/classes/kernel-devicetree.bbclass        | 21 ++++++--
 meta/classes/kernel.bbclass                   | 49 +++++++++++++------
 meta/classes/qemuboot.bbclass                 |  6 ++-
 meta/classes/rootfs-postcommands.bbclass      |  8 +--
 meta/classes/syslinux.bbclass                 |  2 +-
 meta/classes/testexport.bbclass               | 10 ++--
 meta/classes/testimage.bbclass                |  7 ++-
 meta/conf/bitbake.conf                        |  5 --
 .../images/core-image-minimal-initramfs.bb    |  1 +
 .../images/core-image-tiny-initramfs.bb       |  1 +
 .../images/core-image-testmaster-initramfs.bb |  1 +
 18 files changed, 117 insertions(+), 58 deletions(-)
 create mode 100644 meta/classes/image-artifact-names.bbclass

-- 
2.20.1


