Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0DCFD8FFE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 19:27:42 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78584.1772134055103648357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 11:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TN8zIppJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5069b3e0c66so32334621cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772134054; x=1772738854; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohy1vBTA4YgFwfp5J94d2GAneS0fxSZoe6P1sGhNqtQ=;
        b=TN8zIppJzyo8Gm/3etcweKDljWk1FkSNXJSS4e1ExmNfGVsF0x/rieS1XbYu6OnoPw
         kXBxqnhVjqcxsqV1N9cZUaHa45ZY1FlbsHkQ94fZvcjsFNJy43fOFZ1fCj47r5gh+Cvk
         8iqSQB29kuiEWMefiEflJGS1ga9KqTC1WUicXyp8hE168bzmMoQH1gOSvmRTuD3tffW/
         X5PaEC9xd8qVPpRhoO7mqzuN5VbbR1a6lVKtO0qgbzl06UVubixTtKZNwleCSo8w0aR1
         Orx7xLhS9ZK57gGVhU0Fe+ShhohP0lyiPA82UPI6J/GzyBRnz8UusBSCCjmosy64hTaZ
         OwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772134054; x=1772738854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohy1vBTA4YgFwfp5J94d2GAneS0fxSZoe6P1sGhNqtQ=;
        b=NSvljP+XPdo9DAXPSki9SaCXStYtxFmfVEP56GdYIauNRSrE97BH1SdIviyUXyjk/9
         0xTYAl5SJLfdaDqejVKBppBKpLirsM+FCyGZT3hXFLmGWqu/wzXzfDfFaOrRU1BkfPC1
         rbv4W2z6EvDpAfudESErajW2UXrZBcUElEH8K2aDYorTb2GL6/Sp0cXXF0WWGbvc8jtz
         YLoKTkKFuxlgpMF+/ajKRvUEbGPtK/Ht1oeqxBeF4T4xQOiTPnlgES9PoDCS1toDD/m3
         akb/sndzmAhV4Q7nJ2p89u6NQDRD6jFU1G6j5uVZobskf2EeOLrElxVmQpz7MHUGpEzZ
         kt4g==
X-Gm-Message-State: AOJu0YyldZKZyrdlOXXgymNpqpZqMj9IpHbasynAyLdpdQIAZVBdw7A1
	Kh8Qn3elJFm3cthjjP70uF6aXsJ3NiKcXZbsR3BRKj/O1K7GglooMHK0kf6MtnxH
X-Gm-Gg: ATEYQzwcKUQZnX/28DsP9friePo//ar2oicyz08xw+4wGDRhpPEDv0ur6mWDyVOsgQP
	o7BFnpvWgyqZ3c4je3qB8r3o7WaLLBPzZoAIHK9hjB4kAYBJba+WyzuKcgwNitt1IkJDXQJwVBk
	MRDbOiNGgWUDAC52+J4bkvxK/Kr09BvcxxYNUJgSyZ7yznQshUblJ7t8ue+9xQz2JAx1dYhil5S
	QrtqkkoZgBjCEeDxQo62H+et81aB3WiHHotrcFn2wWjujup6H7S8u9ANLcT8wxBHM63Ewgbr9ln
	ObZKn+Q6X76tbzkuiQAs8V9MGCdeNrVpfv7QMMXqkGrpkAdq4eB1I4qxMxYaj26VyL5oXK08ghH
	erR2qRPgvC/PMp4bxyIWRffsafstvtEeFiYR6syqXAdBmIjukDN8+UBeESrzqnhyQE1EFlFAAlA
	poFqkLPhz/HvDzxzQEutXzk+jfZ46L32F4SEQLOZYARs1UgXGX+UC5KVytIOK3u0v6QA==
X-Received: by 2002:a05:622a:1190:b0:4e7:4a3:ae88 with SMTP id d75a77b69052e-507522c2376mr3170391cf.7.1772134053866;
        Thu, 26 Feb 2026 11:27:33 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda23sm28183621cf.18.2026.02.26.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:27:33 -0800 (PST)
Date: Thu, 26 Feb 2026 14:27:30 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v6 0/9] standalone wic
Message-ID: <aaCeoiJE79w7pvER@localhost.localdomain>
References: <20260225074931.1661345-1-twoerner@gmail.com>
 <DGP3122TZMY8.3OLQCJG5TBRCF@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DGP3122TZMY8.3OLQCJG5TBRCF@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 19:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232060

On Thu 2026-02-26 @ 06:50:30 PM, Mathieu Dubois-Briand wrote:
> On Wed Feb 25, 2026 at 8:49 AM CET, Trevor Woerner via lists.openembedded.org wrote:
> > This series of patches splits wic out from oe-core into its own 
> > standalone utility. The wic utility will continue to be under The Yocto
> > Project umbrella, but will no longer be integrated into the project
> > as part of oe-core. The ultimate goal is to make wic a completely
> > independent tool, hosted on PyPI, with its own tests, development
> > roadmap, and releases.
> >
> > Some benefits include:
> > - relieving the oe-core maintainers from having to review wic patches
> > - allow the tool to be used outside of The Yocto Project
> > - provide more flexibility to explore other features, libraries,
> >   mechanisms, etc 
> >
> > These changes have been tested with oe-selftest as follows:
> >         $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
> >         $ oe-selftest -v -r wic 
> >
> > Previously, I had two separate patch sets for wic on oe-core: one 
> > to create a standalone utility, and one to re-implement variable
> > sector-size handling. Both these were combined to create a combined "v5"
> > patch set.
> >
> > In v6 the major changes are:
> > - code cleanups to remove cases of "if sector_size and sector_size =
> >   512" in places where we can guarantee sector_size will exist
> > - cleanups to replace "getattr(var, 'sector_size', 512) or 512" since
> >   the 3rd arg to getattr() is already setting a default if the variable
> >   name is not found
> > - many comment and commit comment improvements
> > - error out if extraopts includes options to set the sector-size in wks
> >   files
> > - patch 2 (add ufs class) was dropped
> > - patches 3 and 4 were reversed (move/save wks files before removing the
> >   rest of wic from oe-core)
> >
> > For the patch sets up to and including v5:
> > For the standalone patch set:
> > v1: an RFC patchset was sent out, split up into small patches for easy
> >     review
> > v2: add wic utility to list of native dependencies of
> >     image_types_wic.bbclass
> > v3: squash all commits together to apply atomically
> > v4: (does not exist)
> > v5: rebase on latest master
> >     split commits back out acknowledging any bisection that lands
> >     between them will fail
> >     combine with sector-size patch
> >
> > For the sector-size patch:
> > v1: initial patch set 
> > v2: add Mark as co-author of ufs class
> >     try to fix a build warning when not using wic 
> > v3: actually fix warning when not using wic 
> > v4: deprecate, but allow, WIC_SECTOR_SIZE to continue to be used to set 
> >     the sector-size both from config files and the environment
> >     warn when both are used, but prefer cmdline value
> >     change partition type of sample wks to gpt 
> > v5: fix a bug where WIC_SECTOR_SIZE is not given anywhere
> >     combine with standalone patch set 
> >
> 
> Hi Trevor,
> 
> I have another one, a bit more tricky. Two errors:
> 
> 2026-02-26 15:48:07,027 - oe-selftest - INFO - wic.ModifyTests.test_wic_cp_ext (subunit.RemotedTestCase)
> 2026-02-26 15:48:07,027 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-02-26 15:48:07,032 - oe-selftest - INFO - 9: 73/77 513/669 (24.92s) (0 failed) (wic.ModifyTests.test_wic_cp_ext)
> 2026-02-26 15:48:07,032 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/wic.py", line 2127, in test_wic_cp_ext
>     self.assertNotIn("Ext2 inode is not a directory", result.output,
>   File "/usr/lib64/python3.12/unittest/case.py", line 1159, in assertNotIn
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib64/python3.12/unittest/case.py", line 715, in fail
>     raise self.failureException(msg)
> AssertionError: 'Ext2 inode is not a directory' unexpectedly found in 'debugfs 1.47.3 (8-Jul-2025)\n-l: Ext2 inode is not a directory' : Regression detected (inode not a directory). Output:
> debugfs 1.47.3 (8-Jul-2025)
> -l: Ext2 inode is not a directory
> ...
> 2026-02-26 16:03:49,379 - oe-selftest - INFO - wic.Wic2.test_expand_mbr_image (subunit.RemotedTestCase)
> 2026-02-26 16:03:49,380 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-02-26 16:03:49,380 - oe-selftest - INFO - 11: 31/52 617/669 (80.30s) (0 failed) (wic.Wic2.test_expand_mbr_image)
> 2026-02-26 16:03:49,380 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/wic.py", line 1830, in test_expand_mbr_image
>     runCmd(cmd)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'wic write -n /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native --expand 1:0 /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.wic /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/deploy/images/qemux86-64/tmpwiadp9sz.wic.exp' returned non-zero exit status 1:
> [engine.py:589] INFO: copying unchanged partition 1
> [engine.py:602] INFO: resizing ext partition 2
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bin/wic", line 8, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/cli.py", line 631, in main
>     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
>            ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/help.py", line 83, in invoke_subcommand
>     subcmd[0](args, usage)
>     ~~~~~~~~~^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/cli.py", line 298, in wic_write_subcommand
>     engine.wic_write(args, args.native_sysroot)
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/engine.py", line 686, in wic_write
>     disk.write(args.target, args.expand)
>     ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/engine.py", line 605, in write
>     exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
>     ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/misc.py", line 116, in exec_cmd
>     return _exec_cmd(cmd_and_args, as_shell)[1]
>            ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/wic/misc.py", line 103, in _exec_cmd
>     raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
>                    (cmd_and_args, ret, out))
> wic.WicError: _exec_cmd: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/sbin/e2fsck -pf /tmp/wic-part2-44outsk3 returned '1' instead of 0
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3161
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3170
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3164
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3166
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3165
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3169
> 
> Now the tricky part: this only seems happen on Fedora. I did test on
> various versions, and it looks like all version from 39 to 43 show the
> issue on the autobuilder. This was never seen in any oe-selftest-debian
> build.
> 
> I tried another build without this series and I confirm the issue is
> gone.
> 
> Can you have a look at what is wrong here?

Yes, thanks. The good news is I see these exact same errors on my home
machine, OpenSUSE Leap 16.0. That's why I sent the RFC set a while back
to try to determine if these were general issues or something specific
to my machine. When the RFC set passed I assumed it was a problem on my
machine and didn't go further trying to debug.

The first test fails for me at home without any of my patches, so
there's probably something funny going on there.

The second failure (e2fsck) is interesting. wic assumes that any
non-zero return value from any external command it invokes is a
failure. But in the case of e2fsck a zero means success and no fixups
were needed, and a return value of 1 means success but there were
fixes that were needed (and the filesystem is now clean) for example:
deleted/unused inodes, fixed refcounts. For some reason, when I (and
Fedora too it seems) create the image, it seems to be in need of some
e2fsck fixups even though the filesystem is completely new and never
mounted. It could be related to host kernel filesystem handling, the
filesystem type on which the image is created, or perhaps the type of
disk that is used. In my case I'm generating these images on an nvme
drive, maybe that's significant?

In both cases the fixes should be straight-forward, now that I know
they're general bugs and not something specific to my setup at home.

Thanks!

