Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF07C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 10:13:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.3518.1745575983816277276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 03:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=myNEmyPl;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-317f68d0dffso19212801fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745575982; x=1746180782; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81hdXodePSq/EQJxK1tYnTgrKJ85E64it9QEh8Tvdt4=;
        b=myNEmyPlLsrJs4560LYRf9S/l4yGnFOHudyooNaWBA5IjSsaxsqWNuYZBUcTLmC4Dk
         vZFPNZbBi2pXRxQLsHdTkxeeFV6c/k3hmd8jMjUoDsDkzsG7KKKE3DXGhcWWLK6zdpCq
         LvoMuYsO2xpFepLXiKjh/E8MTEW8VzQ9By7lKnMUdVCEaeUMhCtiyaeDyfK57zIWEvyX
         LvxI1qD3yzkLLvEjRmK0AJq0Sk8pxO6p1FZYsPJvJZZycUPwJtxxZ098gd0WUaiNSlXF
         0AWiCyQFzsCbRjFxcucupnYX9+z8p2Ti5Y3seE7vrJc0Ica/I/XDxcWYFTOAWtQLE/4F
         vXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575982; x=1746180782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81hdXodePSq/EQJxK1tYnTgrKJ85E64it9QEh8Tvdt4=;
        b=Z/303oVaNYka0TokPiXolgvo/yRItN+QchazoxHAevZnI6hj/JHjYTg9gtz8gSVE4t
         NjX4oamaSEzasQoLjSJzlHiXexjRhjToSdXIpb0R11lHqK2KpxjnofQNz+PcNIhw2Mm2
         XrKlSR5+ViGZxtmNAG85HOoLsVLKWnVB/q6+i/OeSr3EO4CKjq1JiV7gWgAVLgRIhcXm
         omheb2murr9kdtZWWzSUHyoGesvAXJWlPPTu9DliZ2znd8Pk2MolkcmS+XjLFMhf521L
         8uV+wjT2JhvfUGl41Mq5krpy1CyVIm35qjDbyCMCRe1damdgz/slhIoxePAvWODAzViO
         Pfgw==
X-Forwarded-Encrypted: i=1; AJvYcCXjjJ6UM1WzNYy00L64rAX60pnzTk6WgSge7TTkx4yyDJSgyN5aEVpPfxlcE/jStkr8EFsdxzmRMNIAIMUcWVGlcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywf9HZgwXNM1XPJpMhi/HNZwg/JqWoAzNGnglOeCud6wxXJYWI9
	4lk0xUspYZCvwg3e3DNKsxfEVh/opkjXmxdCI5SS10A0f0a979Sn769ICi1sgY0=
X-Gm-Gg: ASbGncuYD5lS2VV8EF8ue/dS10UxcmuKU9/w9idsl7w/VLpR2ad2nTdeooWakIGjkNS
	JyJGqn6Vxy7n8qA/yfg/+qIjexePgc1yVVfb7yc/0LJy1Sh4ybWDW7xAbmZvJA1QO3qaEY0LlO2
	QMkJ0NrlV9oz6eHC60dLCZevmj9oh6xlO237FJX8tOMkKWh5c2bXqqoIKkUnQryn3TnCYcG46eK
	VmeGPEO+SIBCMvmIgC+85f9WlYfNcLZ4GuBFG7QSDvwssOI//dq6XpcU+zQDZUOQ74c1ynGy/Lx
	supVPAaTJ9L89haFICr++IqkX2k+OGLj0uIqIodsfHWwTDpDHrXdz8VAiphgtvcc5FLEnd/bSQ=
	=
X-Google-Smtp-Source: AGHT+IEWV24J6jYkgulLme3k0qMGerriBlFBsmbSPwqkb/I37ImBpi+xj0IcK+alK9OFS9yUeoayuQ==
X-Received: by 2002:a2e:9e53:0:b0:30d:e104:b794 with SMTP id 38308e7fff4ca-319086bb599mr3468791fa.38.1745575981514;
        Fri, 25 Apr 2025 03:13:01 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b95f4csm6972701fa.88.2025.04.25.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:13:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:12:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Subject: pseudo aborts on aarch64 ( Re: [OE-core] [PATCH v4 7/9]
 image_types_wic.bbclass: capture verbose wic output by default )
Message-ID: <aAtgKxKRUsuQr4c0@nuoska>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
 <20250422143501.99565-8-mikko.rapeli@linaro.org>
 <D9FLKMJI0UMB.23SHVQV5YOL2R@bootlin.com>
 <18398604A566E972.8275@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18398604A566E972.8275@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215450

Hi,

On Fri, Apr 25, 2025 at 12:34:40PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Fri, Apr 25, 2025 at 11:03:54AM +0200, Mathieu Dubois-Briand wrote:
> > On Tue Apr 22, 2025 at 4:34 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > > Call wic with --debug to capture logs from wic internals
> > > so that it's clear which partitions get created and which
> > > files get copied where. wic plugins contain for example
> > > race conditions which don't install files at all and thus
> > > images fail to boot and it's not possible to debug these without
> > > something in wic task logs.
> > >
> > > For example core-image-initramfs-boot do_image_wic
> > > log is now 576 lines which is not excessive but very
> > > important when debugging problems, especially race
> > > conditions which are only hit in some builds in CI.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/classes-recipe/image_types_wic.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > > index 1b422b6280..10888bc12b 100644
> > > --- a/meta/classes-recipe/image_types_wic.bbclass
> > > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > > @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
> > >  	if [ -z "$wks" ]; then
> > >  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > >  	fi
> > > -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > > +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > >  
> > >  	# look to see if the user specifies a custom imager
> > >  	IMAGER=direct
> > 
> > Hi Mikko,
> > 
> > As we dropped the "oeqa wic.py: clean image build dir before rebuild in
> > test_permissions" patch, we again have an issue with this one.
> > 
> > 2025-04-24 16:54:36,535 - oe-selftest - INFO - wic.Wic.test_permissions (subunit.RemotedTestCase)
> > 2025-04-24 16:54:36,536 - oe-selftest - INFO -  ... FAIL
> > ...
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing python function set_image_size
> > | DEBUG: 23394.800000 = 17996 * 1.300000
> > | DEBUG: 23394.800000 = max(23394.800000, 8192)[23394.800000] + 0
> > | DEBUG: 23395.000000 = int(23394.800000)
> > | DEBUG: 23395 = aligned(23395)
> > | DEBUG: returning 23395
> > | DEBUG: Python function set_image_size finished
> > | DEBUG: Executing shell function do_image_wic
> > | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > | Check logfile: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> > | Aborted (core dumped)
> > | WARNING: exit code 134 from a shell command.
> > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> > ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1'
> > Pseudo log:
> > path mismatch [2 links]: ino 157047752 db '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs/var/log' req '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/var/log'.
> > Setup complete, sending SIGUSR1 to pid 346075.
> > 
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1507
> > 
> > This can be reproduced locally:
> > 
> > Get https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=autobuilder.yoctoproject.org/valkyrie/a-full-1456
> > and run 'oe-selftest -r wic.Wic.test_permissions'
> 
> Yes. This pseudo issue needs to be root caused and fixed. Will need to get
> into that.
> 
> FWIW, on aarch64 build host in bitbake devshell I see vim sometimes crashing with
> pseudo aborts when opening files, sometimes also when closing, and sometimes
> it works. These may be related.
> 
> $ bitbake -c devshell lttng-modules
> ...
> root@ledge:~/src/base/repo/poky/build_test/tmp/work/genericarm64-poky-linux/lttng-modules/2.13.18/lttng-modules-2.13.18# vi ../../../../../work/genericarm64-poky-linux/linux-yocto/6.12.23+git/linux-genericarm64-standard-build/.config
> Vim: Caught deadly signal ABRT
> Vim: Finished.
> Aborted

# tail -1 ../pseudo/pseudo.log
path mismatch [1 link]: ino 36752721 db '/home/mcfrisk/src/base/repo/poky/build_test/tmp/work-shared/genericarm64/kernel-source/.Makefile.swp' req '/home/mcfrisk/src/base/repo/poky/build_test/tmp/work/genericarm64-poky-linux/linux-yocto/6.12.23+git/linux-genericarm64-standard-build/.config.swp'.

So these swap files opened and closed by vim confuse pseudo. Disabling
them with 'vi -n' fixes this.

Richard mention yesterday in the patch review call that the fast opening
and closing of files and inode reuse is triggering this. The accounting
done by pseudo breaks somehow on arm64/aarch64 but works on x86_64
build hosts.

Cheers,

-Mikko

> $ uname -a
> Linux ledge 6.8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Apr 20 02:32:42 UTC 2024 aarch64 aarch64 aarch64 GNU/Linux
> 
> $ head -4 /etc/os-release 
> PRETTY_NAME="Ubuntu 24.04 LTS"
> NAME="Ubuntu"
> VERSION_ID="24.04"
> VERSION="24.04 LTS (Noble Numbat)"
> 
> Cheers,
> 
> -Mikko

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215449): https://lists.openembedded.org/g/openembedded-core/message/215449
> Mute This Topic: https://lists.openembedded.org/mt/112395861/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


