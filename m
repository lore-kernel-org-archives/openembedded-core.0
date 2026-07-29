Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B58C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:15:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6586.1785312941483688101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0RFqvw+3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42E8C4E40FD9;
	Wed, 29 Jul 2026 08:15:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 078236039A;
	Wed, 29 Jul 2026 08:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39EC511C14AB8;
	Wed, 29 Jul 2026 10:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785312938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+hbKXqlBQqFLNAWp4DELRAmHlD3tpoorGeQ4Zl7euz8=;
	b=0RFqvw+3uDPkwXJXENyVZM3L6TBjk6Cm7DN9LfeqnVgsWTK8e8hbg7XefWus7nAzIq/Ngd
	4mUKlda/LlVwk4EWOf5GuV5ssK18ix3FqNZ/40oGVOz8d59qh1qlbxlH8Lr4/I9yqeaC3u
	qh5knsUuByXS5BJnVRnbErcgMUChK6IT3WfjxL1kpAYVbnbJc/WSnwws9mfWFOBo4h4p+j
	fFVypd4q/lvhAj330IhWBeN7LsB7x/yB6Y8JOSP7nGNmvnHOc49Z3hWrmFBxeiC77OUZiu
	uwi9zV3N+fwRDMuLRTj9jfEYFhEmjBnxMSznlwFS5Hd5cL4147xhwmCXseB9QA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 10:15:33 +0200
Message-Id: <DKAWM782ZCSI.BDB91NBOUN57@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242257

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
> -----------------------------------------------------------------------
>

Hi,

I have to report an additional failure, during reproducibility tests.
This one only occurred once, on Richard's branch. We are not fully
certain about how this did happen, and maybe it won't happen again. I'm
still documenting this here.

No specific action required on your side so far, but maybe it rings a
bell?

AssertionError: The following rpm packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/iptables-dev-1.8.13-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/kmod-dev-34.2-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libcap-ng-dev-0.9.3-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libidn2-dev-2.3.8-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libpsl-dev-0.23.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libsqlite3-dev-3.53.4-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libtasn1-dev-4.21.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libuuid-dev-2.42.2-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4526

Diffoscope output can be found here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260728-_rch7kvf/=
packages/diff-html/

We can see some pkgconfig differences in RPM header:

202 	PROVIDES:=C2=B7			202 	PROVIDES:=C2=B7
203 	=C2=B7-=C2=B7iptables-dev			203 	=C2=B7-=C2=B7iptables-dev
204 	=C2=B7-=C2=B7iptables-dev(x86-64)		204 	=C2=B7-=C2=B7iptables-dev(x86-=
64)
205 	=C2=B7-=C2=B7pkgconfig(libip4tc)
206 	=C2=B7-=C2=B7pkgconfig(libip6tc)
207 	=C2=B7-=C2=B7pkgconfig(libiptc)
208 	=C2=B7-=C2=B7pkgconfig(xtables)

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


