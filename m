Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55957C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 15:18:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13906.1785251891158715427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 08:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k46TB64q;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D79B51A12B1;
	Tue, 28 Jul 2026 15:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AAA9D601BF;
	Tue, 28 Jul 2026 15:18:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A40EB11C1426A;
	Tue, 28 Jul 2026 17:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785251888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZkkNJOvgtLdVNpZ30JwEqOj2FUginv3ErrgFbCBbLog=;
	b=k46TB64qfGouByoWkW8uJdGO47jwI9VZKDJsrdWfUwwRA0dG27RTTAVaLVlzuRvVTJccJO
	mpQslxihPHgU6ywvuH0APOPRycWkbOZtDZ4+M5j39F0TbsfnWdSBZQ1m84NftYV9zJVodB
	Lh9tAPdiPaHErcn7Si1BwkbItO6RSdvij1rmWkcWU9pcFOYFOWYsKIPOwUm084Ryk4ObAJ
	5BSQNv6xBtVySaE3aeZXL3MRtYzqk3jbVLS3S+hQH1bRYXlMHFuO6D6w8A4gCTG+eVRAtH
	nU7G6mdv0dyOdeles2S11MFSGI+n6rAOF7AWrofCVstejNSasTt/OHZh8mfnzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 17:18:04 +0200
Message-Id: <DKAAZ5IAJSBB.1KM0W7EA9ARM8@bootlin.com>
Subject: Re: [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242197

On Tue Jul 28, 2026 at 12:55 AM CEST, Sumanth Gavini wrote:
> * v10:
>   - The ARCHIVE_FILTER_RPM macro was commented out in a previous
>     libarchive change, causing do_compile_ptest_base to fail with:
>     error: 'ARCHIVE_FILTER_RPM' undeclared
>     Restore the macro definition. The ptest now compiles and passes
>     successfully.
>
> * V9:
>   - Updated SRCREV to the 6.0.2 tag.
>   - Incorporated all V8 changes and updated them as needed for 6.0.2.
>   - Dropped
>     0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
>     from V8, as it is no longer needed. After filtering out the
>     /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
>     populate_sdk" completes successfully without the patch.
>   - Fixed the filtering of the /usr/bin/pkg-config file dependency.
>     pkg-config is a build-time tool, not a runtime dependency. Filtered
>     the /usr/bin/pkg-config dependency automatically detected by
>     pkgconfig.attr for packages containing .pc files, preventing
>     unnecessary hard runtime dependencies in -dev packages.
>   - Removed v8 libarchive-related changes since the latest version
>    (3.8.8) already includes the required updates.
>   - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_nativ=
e"
>     failure observed after upgrading to 6.0.2.
>   - Verified that previously reported Autobuilder issues are no longer ob=
served.
>     The following builds/tests were successfully completed:
>      "bitbake core-image-minimal"
>      "bitbake core-image-full-cmdline"
>      "bitbake core-image-sato"
>      "bitbake core-image-sato world"
>      "bitbake core-image-full-cmdline:do_testimage"
>      "bitbake core-image-minimal:do_rootfs"
>      "bitbake core-image-sato -c populate_sdk"
>
> * V8:
>   - Fix build with systemd (Check patch 7 for detailes)
>   - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgcon=
fig=20
>     (Check patch 7 for detailes)
>   - Backport a PULL from git/libarchive to fix oe-selftest failures.
>
> * V7:
>   - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>     To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04=
 when
>     pkg-config is installed on host, now the host contamination has been =
fixed,
>     and the patch has been submitted to upstream:
>     https://github.com/rpm-software-management/rpm/pull/4127
>
> * V6
>   - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>
> * V5
>   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencie=
s
>     between /bin/sh and libc.so.=20
>
> * V4
>   - Fix loop dependencies issues for libc6 and busybox
>   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>
> * V3
>   - Fix Alexender's comments
>     a) Suppot rpm 6
>     b) Move rpm-setup-autosign to rpm-build
>     c) Remove -DLIBELF_FOUND=3DFalse
>
>   - Fix build for nativesdk-rpm
>
>   - Drop patch for createrepo-c since it has been upgraded (rev:
>     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>
> * V1 & V2
>   - Initial version
>
>
> --
> # Sumanth Gavini
> # Wind River Linux=20
>

Hi Sumanth,

Thanks for taking care of this series.

So we do have a few fails here:

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. Command =
...
...
Last metadata expiration check: 0:03:07 ago on Tue 28 Jul 2026 11:03:02 AM =
UTC.
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_64 fr=
om oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev-0.1.24-r0=
.core2_64 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.co=
re2_64 from oe-repo
 Problem 4: package libsndfile-dev-1.2.2-r0.core2_64 from oe-repo requires =
flac-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_64 fr=
om oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

It does happen with a few different packages.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4248
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4228
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4210
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4211

Also, we do have selftest failures:

2026-07-28 10:37:28,088 - oe-selftest - INFO - runtime_test.Postinst.test_f=
ailing_postinst (subunit.RemotedTestCase)
2026-07-28 10:37:28,093 - oe-selftest - INFO -  ... FAIL
...
2026-07-28 10:37:28,094 - oe-selftest - INFO - 5: 27/36 299/763 (127.74s) (=
0 failed) (runtime_test.Postinst.test_failing_postinst)
2026-07-28 10:37:28,094 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 409, in test=
_failing_postinst
    self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets o=
f ['postinst-rootfs-failing'] have failed."), 0,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        "Warning about a failed scriptlet not found in bitbake output: %s" =
%(bb_result.output))
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 1297,=
 in assertGreaterEqual
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 732, =
in fail
    raise self.failureException(msg)
AssertionError: -1 not greater than or equal to 0 : Warning about a failed =
scriptlet not found in bitbake output: NOTE: Reconnecting to bitbake server=
...
...
ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-71494/tmp/wor=
k/qemux86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/bi=
n/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/build-st-71494/tmp/work/qemux86_64-poky-linux/core-image-min=
imal/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto=
-worker/oe-selftest-fedora/build/build-st-71494/tmp/work/qemux86_64-poky-li=
nux/core-image-minimal/1.0/rootfs/etc/yum.repos.d --installroot=3D/srv/poky=
build/yocto-worker/oe-selftest-fedora/build/build-st-71494/tmp/work/qemux86=
_64-poky-linux/core-image-minimal/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokyb=
uild/yocto-worker/oe-selftest-fedora/build/build-st-71494/tmp/work/qemux86_=
64-poky-linux/core-image-minimal/1.0/temp --repofrompath=3Doe-repo,/srv/pok=
ybuild/yocto-worker/oe-selftest-fedora/build/build-st-71494/tmp/work/qemux8=
6_64-poky-linux/core-image-minimal/1.0/oe-rootfs-repo --nogpgcheck install =
packagegroup-core-boot postinst-rootfs-failing run-postinsts ssh-pregen-hos=
tkeys' returned 1:
...
Error in POSTIN scriptlet in rpm package postinst-rootfs-failing
  Installing       : update-rc.d-0.8+git0+b8f9501050-r0.noarch            3=
7/40
  Installing       : ldconfig-2.44+git0+7cba77790f-r0.x86_64_v3           3=
8/40
  Installing       : ssh-pregen-hostkeys-1.0-r0.x86_64_v3                 3=
9/40
  Installing       : openssl-conf-3.5.7-r0.x86_64_v3                      4=
0/40Error: Could not run transaction.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4394
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4213
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4458

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


