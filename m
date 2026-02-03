Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921AFE87841
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 15:37:46 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19556.1770133062594500590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 07:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A8K9EJ99;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8947e6ffd20so77579266d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770133061; x=1770737861; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMLApj4ekp08srAOHaVxVlg7DebpAKolyJlc5T3VBTI=;
        b=A8K9EJ99pFrFPXo5Qk8BRnztms/LoPg3qZn1NIccM5FAvIHhO/wZ0p9F1+VH9WLmEn
         +KLDt7+U64DJ9EjIcaZePslcvQj7DNsxLCMzhVEtOk+XcVOjvHFpAYBX8YK87JySWLqm
         iY1F4EJt7nnHiGT7+NqBKlRUGQwkauI0C1ijaL0N+OKrM5sveACkTU1oQrUnoA8bBJWx
         40gI/iFN0p7NdWHgd/rOXG5brYfqWO6K4cn5wvDeL+egZYtzhqVH8LNDwZeM3fhvMnsg
         rSlmt6aTjFeXozNGwjwc5iUuMSHruM5noEMPGQLuv8tkOBiGz7oz6NVr/7EeHkOJc3T1
         Rz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133061; x=1770737861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMLApj4ekp08srAOHaVxVlg7DebpAKolyJlc5T3VBTI=;
        b=CwHaCfYUQDTnT9xlWG6/p6sc+RxYI+lKsaeGrw4EIiyJeWFi90ZsFe8qaVxfgdzXaO
         DX181+/KA9DSKRrQ+nUXKLvmZMLnxwcfXnEV2ocfXlk3DnPxHRWjuKqoWBlXD0EjQ0zQ
         gOeWzBaOu8xU4gTApFqJs8q9+eVC1cOaQZFV5KPZR/eWsEHRncm6XNjQC//tgRKkvfdK
         +I5VzFh6h+k2AQd09LuH2ZPlVCnM+WQv3eq2O8soR28LC+s80MAedxSEhzKFPpN4er3Z
         Ydy6XLS5Yl/3Sm557x3Jeopmd8dwtoUpAitnQgDvzxfyx+B0owXYx7hFL/u3wWksU/69
         JXBQ==
X-Gm-Message-State: AOJu0YzlP38wxwcWKpIFZo+pAJHnwdAuqN4fj+fSSuhqzAnAwdhUz0+f
	oJFp+mXKGY80VefIvulaFirRKmGZGHBTqK0d6d8Xvw6mu+yW8im1QRaF
X-Gm-Gg: AZuq6aIu/5VvU3HAN5QbE8+uvzLDAUqNwF50MZOdKkawI6ucIZRFZ4aR2BRpS2q3dIr
	ZIhuyZItts5ufuIGpSb6NyF9XJBvVUA5wkngnqZ59gZ6EDXmixX6JX/TMN+rDQXWEZGLSV46USD
	G9NY7iPG2ghwODT/ET3HQnGIGmXmTEC0y1nH3CiRMjIEbNJSrLwcOW7IytKU3lzoxRz5AZ7A+5t
	MT744Q40Vtt6ZeBXebl9g1GlpBWTedxgNaffv2pBkIvA2DzTb0rtYggMwnzOUXfxsQzTLszC+KE
	XLCQD6mAnF8tSzEriPO1iOj4pn0e0UA3np0tAZdmVgHEIVY+YJpxaXPQsoJiPkjWBeJENjHBfbA
	pcEhjoGR4OxL3doGvOVOuV5FRi2aYAp7UgcoK4iF1od4td7eOyuHatplnsZA24MechbVp1WjW3S
	lmsHmweysf7jsYO243HeB+HcYRwmSauZzY6fjOovIoMj/KKhwdvmUkS+zcFrO1W/y2
X-Received: by 2002:ac8:5e53:0:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-505d22bb1a3mr200419271cf.78.1770133061494;
        Tue, 03 Feb 2026 07:37:41 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521bffb41sm17116d6.4.2026.02.03.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:37:40 -0800 (PST)
Date: Tue, 3 Feb 2026 10:37:37 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH v2 0/9] standalone wic
Message-ID: <aYIWQZ15R3L11w0F@localhost.localdomain>
References: <20260202170800.4172778-1-twoerner@gmail.com>
 <DG5DNB0A90R2.3TNBMJXIFZGJT@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DG5DNB0A90R2.3TNBMJXIFZGJT@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 15:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230460

Hi Mathieu,

Thanks for giving them a run on the AB.

On Tue 2026-02-03 @ 02:56:25 PM, Mathieu Dubois-Briand wrote:
> On Mon Feb 2, 2026 at 6:07 PM CET, Trevor Woerner via lists.openembedded.org wrote:
> > This series of patches explores the possibility of splitting wic out
> > from oe-core into its own standalone utility. The wic utility will
> > continue to fall under The Yocto Project umbrella, but will no longer
> > be integrated into the project as part of oe-core. The ultimate goal is
> > to make wic a completely independent tool, hosted on PyPI, with its own
> > tests, development roadmap, and releases.
> >
> > Some benefits include:
> > - relieving the oe-core maintainers from having to review, understand,
> >    merge, or reject wic patches
> > - allow the tool to be used outside of The Yocto Project for generating
> >   Linux images
> > - provide more flexibility to explore other features, libraries,
> >   mechanisms, etc
> >
> > The initial task of splitting wic out into its own repository was
> > performed with the help of AI. It was checked, and subsequent work was
> > done without AI.
> >
> > These changes have been tested with oe-selftest as follows:
> > 	$ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
> > 	$ oe-selftest -v -r wic
> >
> > On my machine my oe-selftest results for an unmodified oe-core give:
> > 	successes=93, skipped=1, failures=0, errors=1
> > with these patches I get:
> > 	successes=91, skipped=1, failures=2, errors=0
> >
> > There are 2 tests that need to be fixed, but it would be great to get
> > some feedback on this work, and to see what the AB thinks of it so far.
> > I have also done some adhoc testing with meta-rockchip and
> > meta-raspberrypi.
> >
> > Should this work eventually make its way to oe-core, it would need to
> > be squashed into a single commit otherwise builds will break when only
> > partially applied. They have been submitted here in this RFC series
> > separately to make review easier.
> >
> 
> Hi Trevor,
> 
> Thanks for this series. I ran it on the autobuilder, a few issues (maybe
> just a single one actually), but most tests succeed.
> 
> 
> So first, we have the wic tests, which try to invoke the wic tools
> directly. These one entirely failed because wic was not found in the
> path at all:
> 
> Running '. ./init-build-env; wic create directdisk -e core-image-sato -o ${BUILDDIR}/tmp/deploy/wic_images/qemux86/directdisk/core-image-sato/' with output to /srv/pokybuild/yocto-worker/wic/build/build/command-1-cmds.log in /srv/pokybuild/yocto-worker/wic/build/build
> /bin/bash: line 1: wic: command not found
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3076
> 
> So I still have to look in depth at your patches, but I suspect, as the
> tool is now in a separate git, it can no longer be used just by sourcing
> the environment file.
> 
> In the context of the test, this is probably not really an issue, we can
> just fix it to have wic tools. But thinking about users, this might be a
> bigger issue as it does change a bit the flow if they want to use wic
> directly.
> 
> 
> The second issue is similar: one of the selftests fails as the wic
> command was not found:
> 
> 2026-02-03 09:54:38,418 - oe-selftest - INFO - systemd_boot.Systemdboot.test_efi_systemdboot_images_can_be_built (subunit.RemotedTestCase)
> 2026-02-03 09:54:38,419 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError: Command 'wic cp /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1720620/tmp/deploy/images/genericx86-64/core-image-minimal-genericx86-64.rootfs.wic:1/EFI/BOOT/bootx64.efi /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1720620/tmp/deploy/images/genericx86-64/bootx64.efi -n /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1720620/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native' returned non-zero exit status 127:
> /bin/sh: 1: wic: not found
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3260
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3136
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3034
> 
> 
> And so far, that's all. So we might have other issues masked behind
> this, but overall it looks pretty good in term of tests.

Wow, this is excellent results!
	successes=619, skipped=43, failures=1, errors=0
	successes=642, skipped=20, failures=1, errors=0
	successes=644, skipped=18, failures=1, errors=0


In my testing, locally, I had 2 tests that were failing, but the AB only
has one :-) The one that is failing on the AB:
	systemd_boot.Systemdboot.test_efi_systemdboot_images_can_be_built

is not one I had tested.

Thanks!

