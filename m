Return-Path: <kristian@klausen.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B23C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 07:13:51 +0000 (UTC)
Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.4900.1633072428726904681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 00:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=HB6QdMmi;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29,
 mailfrom: kristian@klausen.dk)
Date: Fri, 1 Oct 2021 09:13:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1633072424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmFy3IWs+dNPrLzvZ8bOo1/3jgyWbiYqzUCq3WtP3NU=;
	b=HB6QdMmiRSqh7f09O5+wmoJjdiGUmnegz5TBYy21AnRpXo/ytuScwM/AV2wlTHh/w7GdrO
	iHhyoy9N9SDjHfIyfNyvTcWIQJNGfNBfEa2C6yuiXHnNprmUQs0GVJcgAdehfy2YBhKQN9
	dvv85GJSSMKsJkyA0Y2DbukXxlnsOQI=
From: Kristian Klausen <kristian@klausen.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Kristian Klausen <kristian@klausen.dk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic/bootimg-efi: Add Unified Kernel Image option
Message-ID: <YVa1Jr29QAgfhqqo@bob>
References: <20210913081304.10799-1-kristian@klausen.dk>
 <YVGooo7LiUG3JQ0h@bob>
 <0c89091d931bd81497bb81df47f1dfb559f2fffe.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <0c89091d931bd81497bb81df47f1dfb559f2fffe.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 07:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156512

Den Thu, Sep 30, 2021 at 23:46:00 +0100 skrev Richard Purdie:
> On Mon, 2021-09-27 at 13:18 +0200, Kristian Klausen wrote:
> > Den Mon, Sep 13, 2021 at 10:13:04 +0200 skrev Kristian Klausen:
> > > "A unified kernel image is a single EFI PE executable combining an EFI
> > > stub loader, a kernel image, an initramfs image, and the kernel command
> > > line.
> > > 
> > > [...]
> > > 
> > > Images of this type have the advantage that all metadata and payload
> > > that makes up the boot entry is monopolized in a single PE file that can
> > > be signed cryptographically as one for the purpose of EFI
> > > SecureBoot."[1]
> > > 
> > > This commit adds a create-unified-kernel-image=true option to the
> > > bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
> > > it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
> > > Specification[1][2]. This is useful for implementing Secure Boot.
> > > 
> > > systemd-boot is the only mainstream bootloader implementing the
> > > specification, but GRUB should be able to boot the EFI binary, this
> > > commit however doesn't implement the necessary changes to the GRUB
> > > config generation logic to boot the Unified Kernel Image.
> > > 
> > > [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> > > [2] https://systemd.io/BOOT_LOADER_SPECIFICATION/
> > > 
> > > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > 
> > Any update on getting this merged?
> > 
> > Cheers,
> > Kristian
> > 
> > > ---
> > > V2:
> > > Add os-release as dependency
> > > Pull os-release file from STAGING_DIR_HOST, so it doesn't need to be
> > > installed into the rootfs
> > > Add selftest
> > > 
> > >  meta-selftest/wic/test_efi_plugin.wks         |  6 ++
> > >  meta/classes/image_types_wic.bbclass          |  5 +-
> > >  meta/lib/oeqa/selftest/cases/wic.py           | 29 ++++++++
> > >  scripts/lib/wic/plugins/source/bootimg-efi.py | 71 ++++++++++++++++---
> > >  4 files changed, 99 insertions(+), 12 deletions(-)
> > >  create mode 100644 meta-selftest/wic/test_efi_plugin.wks
> > > 
> > > diff --git a/meta-selftest/wic/test_efi_plugin.wks b/meta-selftest/wic/test_efi_plugin.wks
> > > new file mode 100644
> > > index 0000000000..1603d6c4bb
> > > --- /dev/null
> > > +++ b/meta-selftest/wic/test_efi_plugin.wks
> > > @@ -0,0 +1,6 @@
> > > +# short-description: This file is used in oe-selftest wic module to test efi plugin
> > > +
> > > +part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,create-unified-kernel-image=true,initrd=${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --active --align 1024 --use-uuid
> > > +part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
> > > +
> > > +bootloader  --timeout=0 --append="console=ttyS0,115200n8"
> > > diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> > > index d561fb2636..e3863c88a9 100644
> > > --- a/meta/classes/image_types_wic.bbclass
> > > +++ b/meta/classes/image_types_wic.bbclass
> > > @@ -27,6 +27,7 @@ WICVARS ?= "\
> > >  	ROOTFS_SIZE \
> > >  	STAGING_DATADIR \
> > >  	STAGING_DIR \
> > > +	STAGING_DIR_HOST \
> > >  	STAGING_LIBDIR \
> > >  	TARGET_SYS \
> > >  "
> > > @@ -84,8 +85,8 @@ do_image_wic[deptask] += "do_image_complete"
> > >  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> > >  WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> > >  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> > > -WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
> > > -WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
> > > +WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> > > +WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
> > >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
> > >  
> 
> Sadly this fails during testing on several machines:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2676
> 
> which is probably from the os-release dependency. I need to remove this patch
> and retest but given it is wic failures, I suspect this patch...
> 
> Cheers,
> 
> Richard
> 

Hi Richard

That is unfortunate. I just had a quick look at the failed no-x11 
build[1] and failed wic build[3]. According to the error logs[2][4] the 
"postinstall intercept hook 'update_gio_module_cache'" is failing due 
to:
TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/libexec/gio-querymodules: /lib64/libc.so.6: version `GLIBC_2.34' not found (required by TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/libexec/gio-querymodules)

So I'm not sure it is related to my patch, please let me know how it 
goes with the retest and I can investigate further if my patch is to 
blame.

For the record, the tested patch wasn't this (v2) but the v3[5].

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/4084
[2] https://errors.yoctoproject.org/Errors/Build/131891/
[3] https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/4049
[4] https://errors.yoctoproject.org/Errors/Build/131857/
[5] https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_wic_bootimg_efi/85923375

Cheers,
Kristian

