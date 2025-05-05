Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129DBC3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:17 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.48974.1746447667595036679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 05:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KVHDYBmU;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so5063480e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746447665; x=1747052465; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ3pGU75NPrRCK65QMe1Yh4cP47EDxu5QIC3tvw2J8E=;
        b=KVHDYBmUXeirg/UvPj10l37Vwa66I4LUenBS2O4l3fDOGQyNGVEzHlz9MxSD0VDpuP
         VYre1RtnuDRgNO5BgcGsIsAbvLMffvkbt9GWQnWdnnrujRNV7f6fuLYhiMZgk9fR9HvQ
         IjJoyOp9PF2rEKwEmsVSy5dbgpNAl3Z2cff8fP5QWDFPwFlhFV5ZOfBMJUr8TKP+8/j0
         x/7ogN/8KxyBx+AfPAY9GmxspX5747Qu+Bbolq2x+M4wuIOP5zY9naLviCxZej81TPbY
         jrmYFUWAwr92wdRAhqU7vPv+Ty3QDauooKnK3piY7pPUsiEGHhgENeQfKe3/ic3QH9xU
         lvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447665; x=1747052465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ3pGU75NPrRCK65QMe1Yh4cP47EDxu5QIC3tvw2J8E=;
        b=JZFy5eWqqO/zJhiHkl36V4Pk+leTGDCLPPW4hAHwONqmSmn1aTQkAt/O7LYDudf8pa
         BLyQOf9i+CYh+p0gSTlS7OaHK6Vc2fGfZiF9EXCgPSTLVi8fN5NhuJuugQntHb0lVVmk
         Sb6w/tfJ733JqDkISZlDJlUyyiUsGLLEXntMKLZ/k7KH3QaHHmR6Tzohz38f/6sxCbDb
         rbQZcz9NvhfiNN0qBsHWAul9E4LboLiqIgc2YV9IqgWNKhskq2CNI6tKZ6/qX9pJVsEc
         okhtzu90n2q73EY2lDspdwXb5rplchHEKNLXLvNgvTBmJfrPs0bnbodG3kmJARuuFgQB
         09+Q==
X-Gm-Message-State: AOJu0Yw6LQcUro7RVvtuihYZPaYpJAtGKGHNQ6Ql6YUglH7Gae+CK10z
	jXINGMHq4PWXcgWVRH2bdn+L7hHyLR1VV3bdEFaMaqrFZ6dKVcwKgmDP7uHVbfY=
X-Gm-Gg: ASbGncs29wTskjPPmFifeEBk7tdju3sJJzld8DB4OgW3+IXGDTbtimsMvelR8IxW6N6
	goejiOLWFcFbVFxAnOXfKmtXfDOk1d4/x7pTTjvhpui0sBG3v5YveDbAwlCMe3NNBRD+DYP/shq
	VXrJnrR/6wM92Zj9/rSZSvPF6CXmwS55oUKOyEQu/SUmeW1ejJhXYXmX9UOROz/gVYT5PtFRvqS
	zjt0iLLI5gf0BXmGTRjay69c7aPgoDelth10i8Of2G26BKLsWoJRlX7FTW1JP4ahv+nfEL/r4FL
	k4MFNF0122qgvGOmYoSDSbqLB3dGsGLdk2+GXvun0aSO8zDIdnrd9nqcP7liyh8cXMSo7CyVlQ=
	=
X-Google-Smtp-Source: AGHT+IFgLVJBXuhJ/cf6HAbTyzADkEBLYjQ0nSVw/hC0vRxalhceMGY9m77JHCOyckSKJqA00TfC/A==
X-Received: by 2002:a05:6512:2356:b0:549:8f15:db36 with SMTP id 2adb3069b0e04-54fa4fa10d4mr1687873e87.51.1746447665372;
        Mon, 05 May 2025 05:21:05 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b18a1sm1727909e87.42.2025.05.05.05.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:21:05 -0700 (PDT)
Date: Mon, 5 May 2025 15:21:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: ignore ${HOME}/. files in
 pseudo
Message-ID: <aBitL511kNQzaKBR@nuoska>
References: <20250505074031.920194-1-mikko.rapeli@linaro.org>
 <DB5PR02MB10213D88EE092C43451F3CC47EF8E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB5PR02MB10213D88EE092C43451F3CC47EF8E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216008

Hi,

On Mon, May 05, 2025 at 10:43:34AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli via lists.openembedded.org
> > Sent: den 5 maj 2025 09:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > Subject: [OE-core] [PATCH v2] bitbake.conf: ignore ${HOME}/. files in pseudo
> > 
> > vim and less always write to these files in users home directory.
> > Using vim and less via pseudo in "bitbake -c devshell recipe" and
> > outside of pseudo triggers pseudo aborts which makes interactive
> > use of devshell difficult. Fixes vim and less crashes and related
> > pseudo log entries:
> > 
> > inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
> > inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.
> > 
> > Ignoring all files with ${HOME}/. in path since many tools
> > with e.g. GNU readline support will write files there.
> > Hopefully no-one compiles in such paths.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/conf/bitbake.conf | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > v2: ignore all files from ${HOME}/. instead of just ${HOME}/.vim and ${HOME}/.less
> > 
> > v1: https://lists.openembedded.org/g/openembedded-core/message/215986
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index b1dae17267..8d71c8f50c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS =
> > "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
> >  PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
> >  PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
> >  PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
> 
> Please add a comment here because it would be all too easy to mistake 
> that for something that can be simplified to just "${HOME}" (by expecting 
> normal path rules). E.g.:
> 
> # Ignore all files and directories starting with a . in the ${HOME} directory

Yes, I can add a comment.

Unfortunatetly I already run into problems with full ${HOME}/. filter
in trusted-firmware-a from meta-arm. Looks like the dtb etc tooling
does not work correctly and files end up without root owner:

ERROR: trusted-firmware-a-2.12.1+git-r0 do_package_qa: QA Issue: trusted-firmware-a: /optee_ffa_spmc_manifest.dtb is owned by uid 1004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
ERROR: trusted-firmware-a-2.12.1+git-r0 do_package_qa: QA Issue: trusted-firmware-a: /optee_ffa_spmc_manifest.dtb is owned by gid 1004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
ERROR: trusted-firmware-a-2.12.1+git-r0 do_package_qa: QA Issue: trusted-firmware-a: /firmware/bl31.bin is owned by uid 1004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
ERROR: trusted-firmware-a-2.12.1+git-r0 do_package_qa: QA Issue: trusted-firmware-a: /firmware/bl31.bin is owned by gid 1004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
ERROR: trusted-firmware-a-2.12.1+git-r0 do_package_qa: QA Issue: trusted-firmware-a: /firmware/bl31-zynqmp.bin is owned by uid 1004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Since pseudo uses strncmp() quoting the dot etc should not have any effect.

I will revert to v1 of this with a comment. That I tested for a few days
without any issues. I used vim and less extensively when rebasing
a number of patches in tf-a, edk2, u-boot, optee etc. As I feared
lots of tools are using ${HOME}/. paths in various ways.


Cheers,

-Mikko

> > +PSEUDO_IGNORE_PATHS .= ",${HOME}/."
> > 
> >  export PSEUDO_DISABLED = "1"
> >  #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
> > --
> > 2.43.0
> 
> //Peter
> 

