Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D27826010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:57:56 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so151496114wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3vaINluVxHDDkcxT1asIrgbsx+Nv18V3c0AJIcRk/mI=;
	b=BKq3lUbWgFEzDq0KWSqincQiBD3yG67Fi+YXujPwESp8pbr8bvuy177ylBa31AJ6BD
	pyeTcIiY0o+myT6ER68bSHvww6dsLfc68LaYa5amyQCF9lkJD1Amc1wpcLqOv3fdbQKs
	6/FZmcKQGLZwyKcJ1j3NTwnsy1unydcNsbckh+zHFu17qApwE544R1OH0ykoKxl4Oatj
	QCiXbwo0MMPY1DDOu8VCAV3TTSGoekkeoLAzvdCc1vQF2Xcv9TRSM0WavpnUnYV45M55
	Vy+jFLfYSiv6xfFP/o2BFtPvbfsSGZ3zIq+i4d0ICvODz9j4KWD2xiV72GwI0OZSQeee
	Dkmw==
X-Received: by 10.28.51.135 with SMTP id z129mr2211903wmz.19.1447761476773;
	Tue, 17 Nov 2015 03:57:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v4sm30038941wjx.18.2015.11.17.03.57.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:57:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:52 +0100
Message-Id: <cover.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCHv2 00/16] Various fixes from LGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 11:57:57 -0000

Trying to re-submit with company name in subject in hope it won't be
ignored forever.

These changes (except tune changes) are needed to get clean build
results in "bitbake world". And all except tune are needed in jethro
as well. 

All changes were sent weeks or months ago, but there was no (or almost
no) feedback.

For gstreamer related changes for jethro you need to use the original
version I've sent last week, this version is quite different, because
gstreamber was upgraded to 1.6 in master in the meantime.

The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/master-submitted
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/master-submitted

Joe Slater (1):
  libsecret: add dependency on intltool-native

Martin Jansa (14):
  icu: force arm mode
  guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
    thumb where it fails for qemuarm
  directfb: add fPIC to CFLAGS
  libunwind: fix build for qemuarm
  gstreamer1.0-plugins-base: add PACKAGECONFIG for libvisual
  gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
  gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for
    v4l2 and libv4l2
  gst-plugins-bad: improve FILES variables
  cortexa{7,15,17}: add VFPv4 tunes
  tune-*: use mcpu instead of mtune for ARM tunes
  arch-armv7ve: add tune include for armv7ve and use it from cortexa7
    and cortexa15
  feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and
    ARMPKGSFX_EABI
  feature-arm-vfp.inc: add -mfpu=vfpv4 when vfpv4 is in TUNE_FEATURES
  rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude

Ross Burton (1):
  libsdl2: require GLES when building Wayland support

 meta/classes/rootfs_deb.bbclass                    |   1 -
 meta/classes/rootfs_ipk.bbclass                    |   1 -
 meta/classes/rootfs_rpm.bbclass                    |   1 -
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 123 +++++++++++++++++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |   5 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  20 ++--
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   2 +-
 meta/conf/machine/include/tune-arm920t.inc         |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  56 ++++++----
 meta/conf/machine/include/tune-cortexa17.inc       |  20 +++-
 meta/conf/machine/include/tune-cortexa5.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |  56 +++++-----
 meta/conf/machine/include/tune-cortexa8.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |   2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |   2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |   2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |   2 +-
 meta/conf/machine/include/tune-ep9312.inc          |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |   2 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |   2 +-
 meta/conf/machine/include/tune-xscale.inc          |   2 +-
 meta/recipes-devtools/gcc/gcc_4.9.bb               |   5 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |   4 +
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |   4 +
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |   5 +
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |   2 +-
 meta/recipes-graphics/directfb/directfb.inc        |   3 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |   2 +-
 .../gstreamer/gstreamer1.0-libav_1.6.1.bb          |   3 +
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  10 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   5 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   9 +-
 meta/recipes-support/icu/icu_55.1.bb               |   4 +
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |  61 ++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |   5 +
 38 files changed, 338 insertions(+), 96 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch

-- 
2.6.3


