Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40339C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:26:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.44019.1745832415599704528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qv4oqW7r;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e98f73850so639729e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745832414; x=1746437214; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6KJVNBhBGvjTGITtAJAKtBGWRdrAdYwcVbjo5neUBs=;
        b=qv4oqW7raWmt43XCtapQ7gDCVBBEVkRXhHELoISpYBDg1lSd0gN9YWAGEms+qjD+vF
         FFHN4ckLEZQHPpw3AF+g9CurHTiR/tu39BFdH8sqh+tNoWBscWrS7UgoKa8U+fxiN/qX
         9d5w1pPFCZnNdh8qY5SxjjwFNen4pTevqbCvt9b3xuFH8cNXMnK58s8J2PEDr2bfUO0f
         T0Puz14BAU4SRFwRF2WTiXxlVj3szBSnvYstX6yrm/SPANWUWViJEoinwBU09tQlc2q5
         BjIdhCJ+BRGf0XiIAKoDJCqYzaacOkrqPwVQZXcW9gG82kt/bbPeXKUj+eBMXsWq1SHM
         H1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832414; x=1746437214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6KJVNBhBGvjTGITtAJAKtBGWRdrAdYwcVbjo5neUBs=;
        b=PAo/laiHqFf+HN0yIunc99tx9WXPgvGs4FBcX+mPcoD/q5I2a/e3dgA+TuETSUb85V
         c6QMyYAc69xWIa5GJipLx98RAtmPStmmO8+K+85LLAFgRRrc6x2BhiNrfxE8WvoDvJCG
         MBIdWLXHIah0Q65R/3QMGI9BW1XJ3WVbhHuG3t+fyFO4D/m64vvtVL8oN+ZtLYe1jB7p
         O/eqoaEbQK9HT8VaX9x6ITy7ld1rpuraPcXrd/0WdfSrsayqM32mJcW72Ex1qPZLuri0
         QYbN7dqP0C8JZxCaqdtzFsHpZnLZ2fwyCVJn0a7xcYJT1fLgQ62NqaEKVLsbICA5TcLU
         kUbg==
X-Forwarded-Encrypted: i=1; AJvYcCWtyz//m1WTmPS/Qe9+go95lJA+DnW/8jwJHf9PY+dvL0TuOOC9UhwLW1W8F4OKr5udCyqnrijv+n+EYHohbXl+Hw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykPYKqNhbWvfixwhuQAbNMGwfv5b7DQZhLFwRFnbrSq56fcWtG
	n92UWw+YiqDNhC107mUCX5knvu9AO0wkQ5Sxp6x36TRhXItH6aVR4fwTf6vmoFY=
X-Gm-Gg: ASbGncunlfJSlXI+rTgZcvps3+hurLRG4fHMj0M3CIbe8zpruaG7p7i24yXIlmB2Bz+
	jxrNT/5EOX9bcW6/rUO+Wbah2DE1x1MHAuuQTdJqGNNFjeOdYW1wtx9vZ6ddiUHwB+5l081MGuV
	OkD0c5VltCC1Ei5hODW8bI7GS4i98uR+uu48CRR6wy4o9MRPwe1KME4WloMzB1MJC/XtvoCVOz3
	DfdLefVsuJkc4UrYZlcH/FAg0NjlFEnO38tVDCbwyriYxa1RahJbe7I1X9Bba/MnZ7YYsOa0B/V
	oy2J9sdUk9Ugi559MEDFx60x+NWSqeBdBq9+nc7IQxApMfaptIPzW5jIZ8iLTpKAS+cvtfzJuQ=
	=
X-Google-Smtp-Source: AGHT+IGPt/c0xSGMb5mn3GbszXYH21UdXvcgXZOnMsuHTs0jilyj2dgeHdsnzNWP8ibNd9jNI3wg2w==
X-Received: by 2002:a05:6512:691:b0:549:8963:eb04 with SMTP id 2adb3069b0e04-54e8cc0521bmr3184689e87.40.1745832413529;
        Mon, 28 Apr 2025 02:26:53 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83e9sm1634226e87.246.2025.04.28.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:26:53 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:26:51 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: pseudo aborts on aarch64 ( Re: [OE-core] [PATCH v4 7/9]
 image_types_wic.bbclass: capture verbose wic output by default )
Message-ID: <aA9J25K043YATV4K@nuoska>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
 <20250422143501.99565-8-mikko.rapeli@linaro.org>
 <D9FLKMJI0UMB.23SHVQV5YOL2R@bootlin.com>
 <18398604A566E972.8275@lists.openembedded.org>
 <1839881BF86B7FC2.2292@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1839881BF86B7FC2.2292@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215585

Hi,

On Fri, Apr 25, 2025 at 01:12:59PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Fri, Apr 25, 2025 at 12:34:40PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > On Fri, Apr 25, 2025 at 11:03:54AM +0200, Mathieu Dubois-Briand wrote:
> > > On Tue Apr 22, 2025 at 4:34 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > > > Call wic with --debug to capture logs from wic internals
> > > > so that it's clear which partitions get created and which
> > > > files get copied where. wic plugins contain for example
> > > > race conditions which don't install files at all and thus
> > > > images fail to boot and it's not possible to debug these without
> > > > something in wic task logs.
> > > >
> > > > For example core-image-initramfs-boot do_image_wic
> > > > log is now 576 lines which is not excessive but very
> > > > important when debugging problems, especially race
> > > > conditions which are only hit in some builds in CI.
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  meta/classes-recipe/image_types_wic.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > > > index 1b422b6280..10888bc12b 100644
> > > > --- a/meta/classes-recipe/image_types_wic.bbclass
> > > > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > > > @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
> > > >  	if [ -z "$wks" ]; then
> > > >  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > > >  	fi
> > > > -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > > > +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > > >  
> > > >  	# look to see if the user specifies a custom imager
> > > >  	IMAGER=direct
> > > 
> > > Hi Mikko,
> > > 
> > > As we dropped the "oeqa wic.py: clean image build dir before rebuild in
> > > test_permissions" patch, we again have an issue with this one.
> > > 
> > > 2025-04-24 16:54:36,535 - oe-selftest - INFO - wic.Wic.test_permissions (subunit.RemotedTestCase)
> > > 2025-04-24 16:54:36,536 - oe-selftest - INFO -  ... FAIL
> > > ...
> > > | DEBUG: Python function extend_recipe_sysroot finished
> > > | DEBUG: Executing python function set_image_size
> > > | DEBUG: 23394.800000 = 17996 * 1.300000
> > > | DEBUG: 23394.800000 = max(23394.800000, 8192)[23394.800000] + 0
> > > | DEBUG: 23395.000000 = int(23394.800000)
> > > | DEBUG: 23395 = aligned(23395)
> > > | DEBUG: returning 23395
> > > | DEBUG: Python function set_image_size finished
> > > | DEBUG: Executing shell function do_image_wic
> > > | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > > | Check logfile: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> > > | Aborted (core dumped)
> > > | WARNING: exit code 134 from a shell command.
> > > NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> > > ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1'
> > > Pseudo log:
> > > path mismatch [2 links]: ino 157047752 db '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs/var/log' req '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/var/log'.
> > > Setup complete, sending SIGUSR1 to pid 346075.
> > > 
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1507
> > > 
> > > This can be reproduced locally:
> > > 
> > > Get https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=autobuilder.yoctoproject.org/valkyrie/a-full-1456
> > > and run 'oe-selftest -r wic.Wic.test_permissions'
> > 
> > Yes. This pseudo issue needs to be root caused and fixed. Will need to get
> > into that.
> > 
> > FWIW, on aarch64 build host in bitbake devshell I see vim sometimes crashing with
> > pseudo aborts when opening files, sometimes also when closing, and sometimes
> > it works. These may be related.
> > 
> > $ bitbake -c devshell lttng-modules
> > ...
> > root@ledge:~/src/base/repo/poky/build_test/tmp/work/genericarm64-poky-linux/lttng-modules/2.13.18/lttng-modules-2.13.18# vi ../../../../../work/genericarm64-poky-linux/linux-yocto/6.12.23+git/linux-genericarm64-standard-build/.config
> > Vim: Caught deadly signal ABRT
> > Vim: Finished.
> > Aborted
> 
> # tail -1 ../pseudo/pseudo.log
> path mismatch [1 link]: ino 36752721 db '/home/mcfrisk/src/base/repo/poky/build_test/tmp/work-shared/genericarm64/kernel-source/.Makefile.swp' req '/home/mcfrisk/src/base/repo/poky/build_test/tmp/work/genericarm64-poky-linux/linux-yocto/6.12.23+git/linux-genericarm64-standard-build/.config.swp'.
> 
> So these swap files opened and closed by vim confuse pseudo. Disabling
> them with 'vi -n' fixes this.
> 
> Richard mention yesterday in the patch review call that the fast opening
> and closing of files and inode reuse is triggering this. The accounting
> done by pseudo breaks somehow on arm64/aarch64 but works on x86_64
> build hosts.

Re-reading https://wiki.yoctoproject.org/wiki/Pseudo_Abort and
I don't think this is a bug. Just a very annoying thing. User can't use
vim editor inside and outside of pseudo/"bitbake -c devshell". The process
will open temp files in various locations and possibly delete them and
pseudo will get confused and start aborting.

I don't think this can be fixed. Workarounds, well, don't edit anything
under devshell. I need to find new ways to create patches to various
recipes. I'm used to opening devshell after do_install to test applying
patches and then manually running do_configure, do_compile and do_install
tasks to test things out before doing full recipe and image builds.
Would be nice if the pseudo checks only applied to files inside
recipe workspace, but I guess that filtering is tricky.

Then this wic selftest regression, since there was opposition to enabling
more verbose logs so I will just drop this. There are real bugs
in wic which for some reason only get exposed by this verbose flag.

The bootloader config files generated by wic are done without pseudo
and thus wic and bitbake builds differ. This is true for systemd-boot,
this failing case, and also with grub when EFI_LOADER = "grub-efi"
which aborts with:

path mismatch [2 links]: ino 33909680 db '/home/mcfrisk/src/base/repo/poky/build_test-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/rootfs/boot/Image' req '/home/mcfrisk/src/base/repo/poky/build_test-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs1/boot/Image'.

To me the difference is calling "wic" as normal user vs calling
"wic" under pseudo fakeroot shell as root inside bitbake env.

I don't think the output of both can ever be the same.

The failing sequence is:

 * modify wks file
 * call "wic" to build the image
 * build the same image with bitbake

The failure happens at bitbake image build. If bitbake image is built before
wic then the test passes. Same with cleaning the sysroot and pseudo databases
before building the image.

A lot of the wic plugins call "cp" and write directly to config files
without passing through pseudo. All of these break pseudo.
Fix in wic would always need to use pseudo when creating
files, directores and when copying files. This is currently not
the case and a lot of code would need to be refactored.
I'm not willing to do this now, sorry.

Cheers,

-Mikko

