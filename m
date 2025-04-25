Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68DEC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:34:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.3151.1745573684605243140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BEHE/Laa;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bc464dso20781301fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745573683; x=1746178483; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5o16cwQKMEhxmtdzfnNa7QJovah+q89UzICqxareZOU=;
        b=BEHE/LaakxyzEvLfPNMw8eE2ZKURERfSIzKr3dgHKuG9idVqwsx2BxSZzYpnATo2/V
         kRKwHhIAZHO1BwAW61guEljbzDZwHN7RX02uyBiMRve6vMm3cYeZCzQ7gUBXUf312BBO
         hkqufyCWy1bSTUejcvNPGRuH4gKRE+BIAghOAm4+Edf5FUHjLQRGQ5+Y3Z5NOJn2cHmq
         seC6XToTuhx1jW4OD4a3XluwzkOhZxlUUs6OWJ3uXwITUIz6kK6D5657Xj+o851M1c3z
         UFix51VgHMpIM9VeIZAFLpd/uANUlZwlET+W8b8ZNsEF/Mz+NB+v083+nN1yUK3sHTjO
         0FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573683; x=1746178483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o16cwQKMEhxmtdzfnNa7QJovah+q89UzICqxareZOU=;
        b=GxeKOIe8YdEJUGlodKDMgz4fzZuNXEdURolskI03n0zYFGf5DV9H0Yoakz1xa/dj99
         kwwATHnMIoAWTzNcjf6+8nNfuDtQBx4rnADK9c00vqO45eA8XbYh9HewaGQASyt8ZJiX
         6l+caabVBomAnoByBC4sH3Av8YX52PIZ1Myd2D5FmEM8P0M6xFHElwV42jj0bW64DJ++
         qfq5N5zp96Gju8J3+6BJkcdIdRhtUnfVlpAgUrJqFPOYIVtRSy+2vL4/3lHOaXa7fU4i
         UmTOTGVv6TRq7v7/PGlhtF56zFIvZoLzF4ZnwX9A0fNM3ARVyeBQEB09cCKjLGMTxtl9
         v4dA==
X-Gm-Message-State: AOJu0Yz8Jf4bW3fgEetsqBE2xBo+myrMZX0qMqdD95WUBX04qMif5uWy
	wzCE3QS7Ur5zTwdOP9vcETypDIeDLJh+ZR/0EBavFDaO8DGzvwUtdDSNQ9a5BRA=
X-Gm-Gg: ASbGnctj4VEZCNyhDWXYj3pVrSP8AskXZ09moUiqSdBlhriONw0JptbWXO167ZTphuu
	2wpMt63ibE06YBpvvdnYsfyWrLO0XhJtV+gCg7qKIDkL72HKbaFiVVVYNYFB/pOaij0pXiqf7ql
	blv/cX2oFtF8Z7SeCtV21M5TmNhlmCr03fMDyfF4M0HYWlcFLiorxPZtZ4c/AJgzrdUB7s0+V0B
	xopLkkTyOAaMz1wA03EWFOeDrrGVZGsMFbebchbg7zprdQ2a480iqNDl3/2ZAswJksYb7Yp7fUr
	PatjgAET4rVF9iC+ASKIsWTDEyBrlMScGiQIQSJc5bJAMD4RWKxH2UZxXnteng7GhTkbs/0lhA=
	=
X-Google-Smtp-Source: AGHT+IEAOBeLADwOWqsL2r1zQqVvmqaIzbNbpdp4eir2o/dHXBQJK2plj8Yc5oJ9Asf1n4G/fsR7cg==
X-Received: by 2002:a05:651c:1516:b0:309:1e89:8518 with SMTP id 38308e7fff4ca-319081d9d87mr4726911fa.27.1745573682484;
        Fri, 25 Apr 2025 02:34:42 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a8312sm6625631fa.86.2025.04.25.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:34:42 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:34:40 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 7/9] image_types_wic.bbclass: capture
 verbose wic output by default
Message-ID: <aAtXMJirjfXaNDyc@nuoska>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
 <20250422143501.99565-8-mikko.rapeli@linaro.org>
 <D9FLKMJI0UMB.23SHVQV5YOL2R@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9FLKMJI0UMB.23SHVQV5YOL2R@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 09:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215449

Hi,

On Fri, Apr 25, 2025 at 11:03:54AM +0200, Mathieu Dubois-Briand wrote:
> On Tue Apr 22, 2025 at 4:34 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > Call wic with --debug to capture logs from wic internals
> > so that it's clear which partitions get created and which
> > files get copied where. wic plugins contain for example
> > race conditions which don't install files at all and thus
> > images fail to boot and it's not possible to debug these without
> > something in wic task logs.
> >
> > For example core-image-initramfs-boot do_image_wic
> > log is now 576 lines which is not excessive but very
> > important when debugging problems, especially race
> > conditions which are only hit in some builds in CI.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > index 1b422b6280..10888bc12b 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
> >  	if [ -z "$wks" ]; then
> >  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> >  	fi
> > -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> >  
> >  	# look to see if the user specifies a custom imager
> >  	IMAGER=direct
> 
> Hi Mikko,
> 
> As we dropped the "oeqa wic.py: clean image build dir before rebuild in
> test_permissions" patch, we again have an issue with this one.
> 
> 2025-04-24 16:54:36,535 - oe-selftest - INFO - wic.Wic.test_permissions (subunit.RemotedTestCase)
> 2025-04-24 16:54:36,536 - oe-selftest - INFO -  ... FAIL
> ...
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function set_image_size
> | DEBUG: 23394.800000 = 17996 * 1.300000
> | DEBUG: 23394.800000 = max(23394.800000, 8192)[23394.800000] + 0
> | DEBUG: 23395.000000 = int(23394.800000)
> | DEBUG: 23395 = aligned(23395)
> | DEBUG: returning 23395
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> | Check logfile: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> | Aborted (core dumped)
> | WARNING: exit code 134 from a shell command.
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1'
> Pseudo log:
> path mismatch [2 links]: ino 157047752 db '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs/var/log' req '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/var/log'.
> Setup complete, sending SIGUSR1 to pid 346075.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1507
> 
> This can be reproduced locally:
> 
> Get https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=autobuilder.yoctoproject.org/valkyrie/a-full-1456
> and run 'oe-selftest -r wic.Wic.test_permissions'

Yes. This pseudo issue needs to be root caused and fixed. Will need to get
into that.

FWIW, on aarch64 build host in bitbake devshell I see vim sometimes crashing with
pseudo aborts when opening files, sometimes also when closing, and sometimes
it works. These may be related.

$ bitbake -c devshell lttng-modules
...
root@ledge:~/src/base/repo/poky/build_test/tmp/work/genericarm64-poky-linux/lttng-modules/2.13.18/lttng-modules-2.13.18# vi ../../../../../work/genericarm64-poky-linux/linux-yocto/6.12.23+git/linux-genericarm64-standard-build/.config
Vim: Caught deadly signal ABRT
Vim: Finished.
Aborted

$ uname -a
Linux ledge 6.8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Apr 20 02:32:42 UTC 2024 aarch64 aarch64 aarch64 GNU/Linux

$ head -4 /etc/os-release 
PRETTY_NAME="Ubuntu 24.04 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04 LTS (Noble Numbat)"

Cheers,

-Mikko

