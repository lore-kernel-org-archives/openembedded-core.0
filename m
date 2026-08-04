Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB71C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:18:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17525.1785853111145139571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pjgGehMl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F23A14E410DB;
	Tue,  4 Aug 2026 14:18:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB3BB6029E;
	Tue,  4 Aug 2026 14:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1D3311C32DD8;
	Tue,  4 Aug 2026 16:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785853104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qSw1qqOg0w8b2lTA671egVxkLu2RvFBDoVH5adLTjEw=;
	b=pjgGehMlcUm/2gDQYARKc+ekYtq6HNxuxkJUmCYYlRTgStymLiOd1e08SCe3sWmWgBg8Ch
	T3jMHe88+9x8vPv315CT6feq8ad1LcDVfTyn2lwK67j2myXglAmzPK0qiMBVpq7nHIdXc7
	Z70RwA+KseXY0QYe+bOscU+9UgDuS3dixgy1J6NDODOpgPqYCCrTLD0UJgfESc7MMFNko/
	SkWwbg98Ydq1LxDshxZDCG6VEBl2GHH19UKh6h1gQRegXYfJVFj1+gEJPGa5cKhO0oJH0D
	z1agQi/qMD4W0bMIQrtfbupP0gL01lsuP0Cj7EeCpOo7a0+b5BAA9S25s2QoMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 16:18:20 +0200
Message-Id: <DKG838IZIDKF.1IBQ7TAPXMF9E@bootlin.com>
Subject: Re: [PATCH v12 0/8] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242773

On Tue Aug 4, 2026 at 6:08 AM CEST, Sumanth Gavini wrote:
> * V12:
>   - The previous libarchive-related changes for 3.8.8 are no longer
>     applicable because libarchive has been upgraded to 3.8.9. Updated the
>     implementation to work with libarchive 3.8.9 and applied the upstream
>     fix for "attach filter to correct bidder".
>     Upstream patch: Upstream patch:
>     https://github.com/libarchive/libarchive/pull/3346/
> =20
>  -  Dropped the following changes:
>     rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependenc=
y
>     rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
>  =20
>     Why drop the old change:
>    The filedeprunner() fix runs at OE's external scanning stage
>    (do_package), but RPM 6's internal dependency generator runs later,
>    inside rpmbuild itself. It re-adds Requires:
>    /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
>    operates at the wrong layer it's like closing a door that RPM 6 walks
>    around.
>
>    Why the new changes:
>    It operates at the same layer where the problem originates, inside
>    rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
>    %{nil}, we tell RPM 6's internal
>    scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
>    equivalent of what _use_internal_dependency_generator 0 did in RPM 4
>    just scoped to pkgconfig specifically rather than globally.
>  =20
>   With these changes, the previously observed test failures have been res=
olved:
>   - bitbake core-image-sato:do_populate_sdk=20
>   - bitbake core-image-sato-sdk: do_rootfs=20
>   - bitbake core-image-ptest-glib-2.0=20
>   - bitbake core-image-ptest-libarchive
>   - bitbake core-image-ptest-libarchive:do_testimage
>

Hi Sumanth,

Thanks for going further with this series.

It looks like we still have errors here. Fore reference, here is a full
build of master + this series: https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/29/builds/4386

Basically we have again two kind of errors: some dnf issues, and some
failed selftests.

The first kind of errors:

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.
...
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

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4318
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4327
https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4337
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/4336
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4299
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4279
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4293
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4280
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/4297
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/4138

I do note sometimes we have an error a little bit different:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf.
...
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(dbus-1) needed by connman-dev-2.0-r0.cortexa=
8t2hf_neon from oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.cortexa8t2h=
f_neon from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(vulkan) needed by gstreamer1.0-plugins-bad-d=
ev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(xkbcommon) needed by gstreamer1.0-plugins-ba=
d-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(xkbcommon-x11) needed by gstreamer1.0-plugin=
s-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-1.0) >=3D 1.28.0 needed by gstream=
er1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-allocators-1.0) >=3D 1.28.0 needed=
 by gstreamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-app-1.0) >=3D 1.28.0 needed by gst=
reamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-audio-1.0) >=3D 1.28.0 needed by g=
streamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-base-1.0) >=3D 1.28.0 needed by gs=
treamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-gl-prototypes-1.0) >=3D 1.28.0 nee=
ded by gstreamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-rep=
o
  - nothing provides pkgconfig(gstreamer-pbutils-1.0) >=3D 1.28.0 needed by=
 gstreamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-sdp-1.0) >=3D 1.28.0 needed by gst=
reamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-tag-1.0) >=3D 1.28.0 needed by gst=
reamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gstreamer-video-1.0) >=3D 1.28.0 needed by g=
streamer1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(libdrm) >=3D 2.4.50 needed by gstreamer1.0-p=
lugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(wayland-client) >=3D 1.4 needed by gstreamer=
1.0-plugins-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(xcb) >=3D 1.10 needed by gstreamer1.0-plugin=
s-bad-dev-1.28.5-r0.cortexa8t2hf_neon from oe-repo
 Problem 4: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev-0.1.24-r0=
.cortexa8t2hf_neon from oe-repo
 Problem 5: conflicting requests
  - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.co=
rtexa8t2hf_neon from oe-repo
 Problem 6: conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.18.0 needed by librsvg-2-dev-2=
.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(cairo-gobject) >=3D 1.18.0 needed by librsvg=
-2-dev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(cairo-png) >=3D 1.18.0 needed by librsvg-2-d=
ev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(freetype2) >=3D 20.0.14 needed by librsvg-2-=
dev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(gdk-pixbuf-2.0) >=3D 2.20 needed by librsvg-=
2-dev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(harfbuzz) >=3D 2.0.0 needed by librsvg-2-dev=
-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(libxml-2.0) >=3D 2.9.0 needed by librsvg-2-d=
ev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(pangocairo) >=3D 1.50.0 needed by librsvg-2-=
dev-2.62.3-r0.cortexa8t2hf_neon from oe-repo
  - nothing provides pkgconfig(pangoft2) >=3D 1.50.0 needed by librsvg-2-de=
v-2.62.3-r0.cortexa8t2hf_neon from oe-repo
 Problem 7: conflicting requests
  - nothing provides pkgconfig(dbus-1) needed by ofono-dev-2.19-r0.cortexa8=
t2hf_neon from oe-repo
 Problem 8: package libsndfile-dev-1.2.2-r0.cortexa8t2hf_neon from oe-repo =
requires flac-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.cortexa8t2h=
f_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4310
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4363
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2030
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/4321


The second kind of errors. One during the
debuginfod.Debuginfod.test_debuginfod_qemu selftest:

2026-08-04 10:31:42,489 - oe-selftest - INFO - debuginfod.Debuginfod.test_d=
ebuginfod_qemu (subunit.RemotedTestCase)
2026-08-04 10:31:42,490 - oe-selftest - INFO -  ... FAIL
...
2026-08-04 10:31:42,643 - oe-selftest - INFO - 6: 15/69 123/758 (134.48s) (=
0 failed) (debuginfod.Debuginfod.test_debuginfod_qemu)
2026-08-04 10:31:42,664 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/debuginfod.py", line 158, in test_d=
ebuginfod_qemu
    self.assertIn("/.cache/debuginfod_client/", output)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 1174,=
 in assertIn
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 732, =
in fail
    raise self.failureException(msg)
AssertionError: '/.cache/debuginfod_client/' not found in 'Server query fai=
led: No such file or directory'

And another one during runtime_test.Postinst.test_failing_postinst:

2026-08-04 10:42:26,209 - oe-selftest - INFO - runtime_test.Postinst.test_f=
ailing_postinst (subunit.RemotedTestCase)
2026-08-04 10:42:26,212 - oe-selftest - INFO -  ... FAIL
...

2026-08-04 10:42:26,212 - oe-selftest - INFO - 5: 27/36 237/758 (99.84s) (0=
 failed) (runtime_test.Postinst.test_failing_postinst)
2026-08-04 10:42:26,213 - oe-selftest - INFO - testtools.testresult.real._S=
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
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 1039 .bb files complete (0 cached, 1039 parsed). 2089 targets, 5=
3 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4283
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4465
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4529

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


