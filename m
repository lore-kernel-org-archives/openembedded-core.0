Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B015173171
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:10 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id w144so24573615wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1cFN5qCOnK+zyAy21C8FS0fp99554GslYg6HBeqANxQ=;
	b=LbbNUYrO90bq7kqIer/l4hitAqHGEmrhnDQazejFe0xVXD66MESir5cpAayB2gNz1N
	k8IaSPmf/ruo6b9pee197kWCd594+TwIQorV7PlNWMg5Kk4n81kLFvHBulDA61EmCxmS
	deibhyf/rccfggCwsCK0S2G/dOwb5kC3faPkWEI3igb+d0rgXBazo3bcM+eAOgiYvaMV
	JdaedSpYR5a9zctS0BAPwkmmLpQVOgFh69thSkVjEXF7nnm7+p6AEpO+hd4AiVgcxxhL
	k16RAfaK0IhBxMYzpR+B1zlhID31zke28fLfbN0Uy2q9MYXyLnspjRxNG3vNS70qUwHZ
	oQ8w==
X-Received: by 10.28.3.133 with SMTP id 127mr43982286wmd.101.1449755231310;
	Thu, 10 Dec 2015 05:47:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wh10sm12431404wjb.45.2015.12.10.05.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:37 +0100
Message-Id: <cover.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][master][RESEND 00/15] ARM tune fixes and improvements
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:11 -0000

You can see the test script and results in various stages of this patch
series in jansa/tune2-test branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
I'll add more test results here a bit later (running full test for all tunes again)

The following changes since commit 192da885e92d3b163b9c4e6b8151c9ecc6062b14:

  build-appliance-image: Update to master head revision (2015-12-09 08:49:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/master-submitted
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/master-submitted

Martin Jansa (15):
  sanity.bbclass: add more information to error message about
    TUNE_PKGARCH missing in PACKAGE_ARCHS
  tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
  arch-armv7a: add missing space before ?=
  arch-armv7a, tune-cortexa*: improve comment VFP -> HF
  arch-armv7a, tune-cortexa*: improve indentation
  arm/arch-arm*, tune-cortexa*, tune-thunderx.inc,
    powerpac/arch-powerpc64.inc: Use normal assignment
  arch-armv[456]*.inc: improve indentation like armv7a
  arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and
    PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
  arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3,
    tune-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
  arch-armv7a.inc: add vfpv4 support also to softfp and big endiand
    tunes
  feature-arm-{neon,vfp}.inc: refactor and fix issues
  feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
  cortexa{7,15,17}: add VFPv4 tunes
  arch-armv7ve: add tune include for armv7ve and use it from cortexa7
    and cortexa15
  tune-*: use mcpu instead of mtune for ARM tunes

 meta/classes/sanity.bbclass                        |   3 +-
 meta/conf/machine/include/arm/arch-arm.inc         |   3 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   6 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |  16 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  56 ++---
 meta/conf/machine/include/arm/arch-armv5.inc       |  61 +++---
 meta/conf/machine/include/arm/arch-armv6.inc       |  64 +++---
 meta/conf/machine/include/arm/arch-armv7a.inc      | 230 +++++++++++----------
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 +++++++++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |  19 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  23 +--
 .../machine/include/powerpc/arch-powerpc64.inc     |   2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   2 +-
 meta/conf/machine/include/tune-arm920t.inc         |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  72 ++++---
 meta/conf/machine/include/tune-cortexa17.inc       |  68 +++---
 meta/conf/machine/include/tune-cortexa5.inc        |  52 ++---
 meta/conf/machine/include/tune-cortexa7.inc        |  74 ++++---
 meta/conf/machine/include/tune-cortexa8.inc        |  52 ++---
 meta/conf/machine/include/tune-cortexa9.inc        |  52 ++---
 meta/conf/machine/include/tune-cortexm1.inc        |   2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |   2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |   4 +-
 meta/conf/machine/include/tune-ep9312.inc          |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |   2 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |   2 +-
 meta/conf/machine/include/tune-thunderx.inc        |   4 +-
 meta/conf/machine/include/tune-xscale.inc          |   2 +-
 31 files changed, 611 insertions(+), 412 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc

-- 
2.6.3


