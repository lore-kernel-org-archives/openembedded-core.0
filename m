Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB4EC55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 15:39:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14604.1785425987205552064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aoN/n4ch;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BE121A131F;
	Thu, 30 Jul 2026 15:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B9F602B8;
	Thu, 30 Jul 2026 15:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DBC711C15D73;
	Thu, 30 Jul 2026 17:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785425980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+bPytEghvWfI4H8iYU3fZ3btpHSPBVwoFWP7ocEvOq0=;
	b=aoN/n4chbuo1g7UBEc55lxDxLZKTfseS6UqzpXLrq1eAGllx+y5qL3ThxYudMU71ewdNfu
	X3OGCZUdh/P/USGv6Zgl9TSSEIHinbKzKs3uBEt5mg5uyKtQv+UFjtHNZ6tg2QBM6itvaE
	i4eQNj2B9Vy/RWXilAL5VNR4SzUI2x0fVmY+nVSwAv53pFlWicveeFyZWdRa+8CPJRwleR
	AvGb9If1GDusrTPWxBsYEQ9wbG9Otwzbp0+3/oYNjBY4E12EsfvuCm8YEsU0gf15ALX/Ay
	Z1+FgxCAPXiZtCjd3Wypzb0irfYS4RSxufbNrGZDh1O8bBlUW5k5BW5aoriTsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 17:39:36 +0200
Message-Id: <DKC0OQ8NEVPS.2A0FULELCCRJH@bootlin.com>
Subject: Re: [PATCH v11 0/9] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 15:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242368

On Thu Jul 30, 2026 at 1:51 AM CEST, Sumanth Gavini wrote:
> * V11:=20
>  - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
>    To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command.=
..
>    pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
>    Requires for packages shipping .pc files. In OE/Yocto cross-compilatio=
n,
>    pkg-config is a host-only build tool not needed on the target rootfs,
>    causing failures with -dev packages.
>
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

Thanks for the new version.

It does look better, but we still have a lot of errors. First, another
dnf error on core-image-sato:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf
...
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(fontconfig) >=3D 2.13.0 needed by libcairo-d=
ev-1.18.4-r0.x86_64_v3 from oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-r0.x86_=
64_v3 from oe-repo
  - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-r0.x86_=
64_v3 from oe-repo
  - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75.0-r0.x=
86_64_v3 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.0-dev-1=
:2.88.2-r0.x86_64_v3 from oe-repo
 Problem 4: conflicting requests
  - nothing provides pkgconfig(libudev) >=3D 251 needed by libgudev-1.0-dev=
-238-r0.x86_64_v3 from oe-repo
 Problem 5: conflicting requests
  - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.3-r0.x8=
6_64_v3 from oe-repo
 Problem 6: conflicting requests
  - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.x8=
6_64_v3 from oe-repo
 Problem 7: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.20.0-r0.=
x86_64_v3 from oe-repo
  - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0-r0.x86=
_64_v3 from oe-repo
  - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0-r0.x86=
_64_v3 from oe-repo

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.
...
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(fontconfig) >=3D 2.13.0 needed by libcairo-d=
ev-1.18.4-r0.x86_64_v3 from oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-r0.x86_=
64_v3 from oe-repo
  - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-r0.x86_=
64_v3 from oe-repo
  - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75.0-r0.x=
86_64_v3 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.0-dev-1=
:2.88.2-r0.x86_64_v3 from oe-repo
 Problem 4: conflicting requests
  - nothing provides pkgconfig(libudev) >=3D 251 needed by libgudev-1.0-dev=
-238-r0.x86_64_v3 from oe-repo
 Problem 5: conflicting requests
  - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.3-r0.x8=
6_64_v3 from oe-repo
 Problem 6: conflicting requests
  - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.x8=
6_64_v3 from oe-repo
 Problem 7: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.20.0-r0.=
x86_64_v3 from oe-repo
  - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0-r0.x86=
_64_v3 from oe-repo
  - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0-r0.x86=
_64_v3 from oe-repo
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4362
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4253


Some ptest images are also failing:

ERROR: core-image-ptest-glib-2.0-1.0-r0 do_rootfs: Could not invoke dnf.
...
Error:=20
 Problem: package libglib-2.0-ptest-1:2.88.2-r0.x86_64_v3 from oe-repo requ=
ires glib-2.0-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.0-dev-1=
:2.88.2-r0.x86_64_v3 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/819
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4163


And also the libarchive ptest are failing:

AssertionError:
Failed ptests:
{'libarchive': ['libarchive_test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4145
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2031


Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


