Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7039.1615473498700686948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 06:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T5HuFwGx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l11so2126713wrp.7
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=J46OCDCZXrxMusJljJs9Rzou6d/nhM7dj45pvVgzj8Q=;
        b=T5HuFwGxcKw8+3batjJUZ24Jvul9yDHtMf0dZRgxxJQs/bWupIWiDKU/5t0/oB2vF7
         kg7DeddFoG/BYUl+aAhdqUZjHekWfzJtrSZOKGcuVffICculCwF+y8reDqZhuDiHKjaW
         t1Ruh1iZ4AC8AJkFhtHInN/0WUE+4I8f5YEbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J46OCDCZXrxMusJljJs9Rzou6d/nhM7dj45pvVgzj8Q=;
        b=LeG97GyGSM1Adsu6ZBcUlR8LkAKSYbSbmVY0PK820wgDfozXty7C5w6UInSXgEtRP0
         Ns/YQQL4tj++AoRCPw7Mo8ehRtjwyi3RYB2rrdxgakAW3pCHleF9cGAqxBm4S+7wvw2q
         UaDwxfA0fudd5jeCKmFIlfPDICFZZiH4MT9eVW7yIzQdkD6dZ3Npsz4Da/DyQuXXk+sk
         fZC1DZqi7qhgAlW5btLFeM+GZP62cuuePJbdrlt3XY/7BMOfaSM55esCz/a0eJVyNNL3
         M75gt85VaZRhFJFrguU1Pdhr885Q6JpCqJ9rQu4dl5jqG22GCO0vV+x28gHCfd/qVvQo
         LWqw==
X-Gm-Message-State: AOAM5316h5OH61+73tPUM8sBWYkYMM8f7EdLepKSrs8E63S9OT2cHRSs
	vVBQdox1SFi/Ib+pKxuoowrg98K9sUIy4Q==
X-Google-Smtp-Source: ABdhPJyKg00g+mAipCp8gjHAv83D5BqOE50Phzp9Oy8Jljft/tAlpqx+qt8u9hDUBSNQpibHp2aSOw==
X-Received: by 2002:adf:e391:: with SMTP id e17mr8977347wrm.285.1615473497258;
        Thu, 11 Mar 2021 06:38:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id h20sm3799628wmp.38.2021.03.11.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 06:38:17 -0800 (PST)
Message-ID: <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Robert Yang
	 <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	anibal.limon@linaro.org
Date: Thu, 11 Mar 2021 14:38:16 +0000
In-Reply-To: <20210311090200.33p3mptsfwusspwa@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
	 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
	 <20210311090200.33p3mptsfwusspwa@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > This can fix a do_package error when compile with meta-secure-core layer:
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/
> > 
> > $ bitbake kernel-initramfs
> > [snip]
> > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
> > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?
> > [snip]
> > 
> > This is because kernel-initramfs wants to pack an initramfs image into
> > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to do this:
> > 
> > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > 
> > This causes kernel-initramfs' do_package depends on
> > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get the
> > error. Delete do_packagedata as other do_package relelated tasks for the image
> > recipe will fix the error.
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> I went a bit further and inheritted nopackages, but RP mentioned that it
> might be removing too much. Nothing failed with nopackages over night,
> but still this smaller version will be safer as this needs to got to
> gatesgarth and dunfell as well now.

This has side effects and there was a reason this wasn't done originally. The 
trouble is that nobody is testing for that, just wanting to fix the problem 
they see. To prove this isn't straightforward, I tested this locally, comparing
task-depends.dot from "bitbake core-image-sato -g" before and after this patch.

The differences were:

@@ -11036,7 +11036,6 @@
 "core-image-sato.do_build" -> "connman.do_build"
 "core-image-sato.do_build" -> "consolekit.do_build"
 "core-image-sato.do_build" -> "core-image-sato.do_image_complete"
-"core-image-sato.do_build" -> "core-image-sato.do_packagedata"
 "core-image-sato.do_build" -> "core-image-sato.do_populate_lic_deploy"
 "core-image-sato.do_build" -> "coreutils.do_build"
 "core-image-sato.do_build" -> "cross-localedef-native.do_build"
@@ -11459,14 +11458,6 @@
 "core-image-sato.do_build" -> "zip.do_build"
 "core-image-sato.do_build" -> "zlib-native.do_build"
 "core-image-sato.do_build" -> "zlib.do_build"
-"core-image-sato.do_compile" [label="core-image-sato do_compile\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_compile" -> "core-image-sato.do_configure"
-"core-image-sato.do_configure" [label="core-image-sato do_configure\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_configure" -> "core-image-sato.do_deploy_source_date_epoch"
-"core-image-sato.do_configure" -> "core-image-sato.do_patch"
-"core-image-sato.do_configure" -> "core-image-sato.do_prepare_recipe_sysroot"
-"core-image-sato.do_deploy_source_date_epoch" [label="core-image-sato do_deploy_source_date_epoch\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_deploy_source_date_epoch" -> "core-image-sato.do_patch"
 "core-image-sato.do_fetch" [label="core-image-sato do_fetch\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
 "core-image-sato.do_flush_pseudodb" [label="core-image-sato do_flush_pseudodb\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
 "core-image-sato.do_flush_pseudodb" -> "core-image-sato.do_rootfs"
@@ -11489,18 +11480,6 @@
 "core-image-sato.do_image_qa" -> "core-image-sato.do_rootfs"
 "core-image-sato.do_image_tar" [label="core-image-sato do_image_tar\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
 "core-image-sato.do_image_tar" -> "core-image-sato.do_image"
-"core-image-sato.do_install" [label="core-image-sato do_install\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_install" -> "core-image-sato.do_compile"
-"core-image-sato.do_install" -> "pseudo-native.do_populate_sysroot"
-"core-image-sato.do_package" [label="core-image-sato do_package\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_package" -> "core-image-sato.do_install"
-"core-image-sato.do_package" -> "pseudo-native.do_populate_sysroot"
-"core-image-sato.do_packagedata" [label="core-image-sato do_packagedata\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_packagedata" -> "core-image-sato.do_package"
-"core-image-sato.do_patch" [label="core-image-sato do_patch\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_patch" -> "core-image-sato.do_unpack"
-"core-image-sato.do_patch" -> "patch-native.do_populate_sysroot"
-"core-image-sato.do_patch" -> "quilt-native.do_populate_sysroot"
 "core-image-sato.do_populate_lic_deploy" [label="core-image-sato do_populate_lic_deploy\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
 "core-image-sato.do_populate_lic_deploy" -> "acl-native.do_populate_lic"
 "core-image-sato.do_populate_lic_deploy" -> "acl.do_populate_lic"
@@ -12036,7 +12015,6 @@
 "core-image-sato.do_rootfs" -> "consolekit.do_package_write_ipk"
 "core-image-sato.do_rootfs" -> "consolekit.do_packagedata"
 "core-image-sato.do_rootfs" -> "consolekit.do_populate_lic"
-"core-image-sato.do_rootfs" -> "core-image-sato.do_packagedata"
 "core-image-sato.do_rootfs" -> "core-image-sato.do_prepare_recipe_sysroot"
 "core-image-sato.do_rootfs" -> "coreutils.do_package_qa"
 "core-image-sato.do_rootfs" -> "coreutils.do_package_write_ipk"
@@ -13257,8 +13235,6 @@
 "core-image-sato.do_rootfs" -> "zlib.do_package_write_ipk"
 "core-image-sato.do_rootfs" -> "zlib.do_packagedata"
 "core-image-sato.do_rootfs" -> "zlib.do_populate_lic"
-"core-image-sato.do_unpack" [label="core-image-sato do_unpack\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
-"core-image-sato.do_unpack" -> "core-image-sato.do_fetch"
 "core-image-sato.do_write_qemuboot_conf" [label="core-image-sato do_write_qemuboot_conf\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
 "core-image-sato.do_write_qemuboot_conf" -> "core-image-sato.do_rootfs"
 "coreutils.do_build" [label="coreutils do_build\n:8.32-r0\n/media/build1/poky/meta/recipes-core/coreutils/coreutils_8.32.bb"]

i.e. it "disconnects" do_rootfs from the existing unpack/patch/configure/compile
/install/package tasks. I know last time we tried this I got several complaints
from users who use these tasks for things.

I'm not sure how we fix this but it isn't straightforward, particularly for
something which people are going to want backports into the LTS for.

Cheers,

Richard


