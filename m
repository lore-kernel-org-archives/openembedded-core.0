Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4E2FD8FE8
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:50:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76077.1772128235000621881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TGuz2KEK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D6B2A4E41221
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AFAA5FDE9;
	Thu, 26 Feb 2026 17:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A56010368060;
	Thu, 26 Feb 2026 18:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772128232; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BgkFIxU4leyEYtQ6z4RABO5KdAlmG5D2oZZk8lOcp1o=;
	b=TGuz2KEKC/jFea6I0hji4YY/qai4AqXceQ3QNIV0ygfVNfQvsOGt8uIzA1Cwmzx+gd29o9
	XeUoh+PeK8hcidPG/PIS5tMBZ4o98938cKXLZ8zkiDlz5B7ZFFxI+tkSTSEZ2qPFHqjzm7
	dxtfyENHt19AKKrb4xbX43iWpY4dCfq8duKfQGH7TINvhnvLFCbNjIJv4hmR2inIyGOMGh
	0yoRZpA5W1a2UX7lpM65XzATLX7RoAuTV3v2tZ58TDMDi/xG901dVHz17+khM2IZMQv3DE
	7fp7dKRZU2/IRXwT1H/H+UKe6CSwbll6lgFY9aLCVLkTrCAi6bZ6gEh9Dzpygw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 18:50:30 +0100
Message-Id: <DGP3122TZMY8.3OLQCJG5TBRCF@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 0/9] standalone wic
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260225074931.1661345-1-twoerner@gmail.com>
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232055

On Wed Feb 25, 2026 at 8:49 AM CET, Trevor Woerner via lists.openembedded.o=
rg wrote:
> This series of patches splits wic out from oe-core into its own=20
> standalone utility. The wic utility will continue to be under The Yocto
> Project umbrella, but will no longer be integrated into the project
> as part of oe-core. The ultimate goal is to make wic a completely
> independent tool, hosted on PyPI, with its own tests, development
> roadmap, and releases.
>
> Some benefits include:
> - relieving the oe-core maintainers from having to review wic patches
> - allow the tool to be used outside of The Yocto Project
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc=20
>
> These changes have been tested with oe-selftest as follows:
>         $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <=
my numeric group id> 4
>         $ oe-selftest -v -r wic=20
>
> Previously, I had two separate patch sets for wic on oe-core: one=20
> to create a standalone utility, and one to re-implement variable
> sector-size handling. Both these were combined to create a combined "v5"
> patch set.
>
> In v6 the major changes are:
> - code cleanups to remove cases of "if sector_size and sector_size =3D
>   512" in places where we can guarantee sector_size will exist
> - cleanups to replace "getattr(var, 'sector_size', 512) or 512" since
>   the 3rd arg to getattr() is already setting a default if the variable
>   name is not found
> - many comment and commit comment improvements
> - error out if extraopts includes options to set the sector-size in wks
>   files
> - patch 2 (add ufs class) was dropped
> - patches 3 and 4 were reversed (move/save wks files before removing the
>   rest of wic from oe-core)
>
> For the patch sets up to and including v5:
> For the standalone patch set:
> v1: an RFC patchset was sent out, split up into small patches for easy
>     review
> v2: add wic utility to list of native dependencies of
>     image_types_wic.bbclass
> v3: squash all commits together to apply atomically
> v4: (does not exist)
> v5: rebase on latest master
>     split commits back out acknowledging any bisection that lands
>     between them will fail
>     combine with sector-size patch
>
> For the sector-size patch:
> v1: initial patch set=20
> v2: add Mark as co-author of ufs class
>     try to fix a build warning when not using wic=20
> v3: actually fix warning when not using wic=20
> v4: deprecate, but allow, WIC_SECTOR_SIZE to continue to be used to set=
=20
>     the sector-size both from config files and the environment
>     warn when both are used, but prefer cmdline value
>     change partition type of sample wks to gpt=20
> v5: fix a bug where WIC_SECTOR_SIZE is not given anywhere
>     combine with standalone patch set=20
>

Hi Trevor,

I have another one, a bit more tricky. Two errors:

2026-02-26 15:48:07,027 - oe-selftest - INFO - wic.ModifyTests.test_wic_cp_=
ext (subunit.RemotedTestCase)
2026-02-26 15:48:07,027 - oe-selftest - INFO -  ... FAIL
...
2026-02-26 15:48:07,032 - oe-selftest - INFO - 9: 73/77 513/669 (24.92s) (0=
 failed) (wic.ModifyTests.test_wic_cp_ext)
2026-02-26 15:48:07,032 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/wic.py", line 2127, in test_wic_cp_=
ext
    self.assertNotIn("Ext2 inode is not a directory", result.output,
  File "/usr/lib64/python3.12/unittest/case.py", line 1159, in assertNotIn
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib64/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: 'Ext2 inode is not a directory' unexpectedly found in 'debu=
gfs 1.47.3 (8-Jul-2025)\n-l: Ext2 inode is not a directory' : Regression de=
tected (inode not a directory). Output:
debugfs 1.47.3 (8-Jul-2025)
-l: Ext2 inode is not a directory
...
2026-02-26 16:03:49,379 - oe-selftest - INFO - wic.Wic2.test_expand_mbr_ima=
ge (subunit.RemotedTestCase)
2026-02-26 16:03:49,380 - oe-selftest - INFO -  ... FAIL
...
2026-02-26 16:03:49,380 - oe-selftest - INFO - 11: 31/52 617/669 (80.30s) (=
0 failed) (wic.Wic2.test_expand_mbr_image)
2026-02-26 16:03:49,380 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/wic.py", line 1830, in test_expand_=
mbr_image
    runCmd(cmd)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'wic write -n /srv/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.=
0/recipe-sysroot-native --expand 1:0 /srv/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/build-st-2592824/tmp/deploy/images/qemux86-64/core-image-min=
imal-qemux86-64.rootfs.wic /srv/pokybuild/yocto-worker/oe-selftest-fedora/b=
uild/build-st-2592824/tmp/deploy/images/qemux86-64/tmpwiadp9sz.wic.exp' ret=
urned non-zero exit status 1:
[engine.py:589] INFO: copying unchanged partition 1
[engine.py:602] INFO: resizing ext partition 2
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bi=
n/wic", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/cli.py", line 631, in main
    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcomma=
nds)
           ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/help.py", line 83, in invoke_subcommand
    subcmd[0](args, usage)
    ~~~~~~~~~^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/cli.py", line 298, in wic_write_subcommand
    engine.wic_write(args, args.native_sysroot)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/engine.py", line 686, in wic_write
    disk.write(args.target, args.expand)
    ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/engine.py", line 605, in write
    exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
    ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/misc.py", line 116, in exec_cmd
    return _exec_cmd(cmd_and_args, as_shell)[1]
           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-25928=
24/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/li=
b/python3.14/site-packages/wic/misc.py", line 103, in _exec_cmd
    raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" %=
 \
                   (cmd_and_args, ret, out))
wic.WicError: _exec_cmd: /srv/pokybuild/yocto-worker/oe-selftest-fedora/bui=
ld/build-st-2592824/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysr=
oot-native/sbin/e2fsck -pf /tmp/wic-part2-44outsk3 returned '1' instead of =
0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3161
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3170
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3164
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3166
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3165
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3169

Now the tricky part: this only seems happen on Fedora. I did test on
various versions, and it looks like all version from 39 to 43 show the
issue on the autobuilder. This was never seen in any oe-selftest-debian
build.

I tried another build without this series and I confirm the issue is
gone.

Can you have a look at what is wrong here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


