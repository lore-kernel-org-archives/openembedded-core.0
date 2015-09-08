Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9594460053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:07:52 +0000 (UTC)
Received: by qgx61 with SMTP id 61so96620666qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PuPcoMLA9ggGz6oXs7ghTNhohcmE5sj/bBvj/8lDhao=;
	b=ttadQAKkY8zlPGoHV4WD7H6iTRrX8Q6QPymaV5qtnGgL/x7SxjdKgQBZTn8CFy3JJS
	SUP/Q1geWa7AIRiTV0uWTFJn/BL3OsHaIFpnMCicNLlyC4+Q85Po1cCbgsykguPF3eoB
	boYvCHJfRLExYnqqYz9FtRMeW3YLdrOiUPI8a7minNc4IZT2LzQ+mDzLzab6LCPcdplW
	44uMW9wEjRi8gI14WJbFvOq0VMZekfcCgUdfX6kdF/gxknmWslSjC6vGR2tZBNTNAcdi
	HITGKeJ/FSwBvQdTfYdko3QeesolD5rB2vc9Lahw9RiSnjjsWk0g02LWLhYoZe+qO2M4
	l8qw==
X-Received: by 10.140.235.14 with SMTP id g14mr41400527qhc.5.1441753672189;
	Tue, 08 Sep 2015 16:07:52 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	186sm2766098qhf.16.2015.09.08.16.07.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:07:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:46 +0000
Message-Id: <cover.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH 00/16] Recipes fixes for clang
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
X-List-Received-Date: Tue, 08 Sep 2015 23:07:53 -0000

This patch series is about common fixes that came to fore due to clang compilation
some of the fixes are real bugs which were latent and has been submitted upstream,
some were backports and some are yet to be submitted

The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://github.com/kraj/openembedded-core clang
  https://github.com/kraj/openembedded-core/tree/clang

Khem Raj (16):
  irda-utils: Weak Define the build TARGETS
  slang: Fix namespace conflict vis-a-vis posix_close
  sudo: Include sys/types.h for id_t definition
  man: Use -DSYSV when builing for linux
  minicom: Fix build with musl
  bdwgc: Include signal.h instead of hard asm/sigcontext.h
  ccache: Dont add LDFLAGS to compiler flags
  latencytop: Fix build with clang
  alsa-tools: Fix compiling with clang
  kexec-tools: Pass -r directly to linker
  xorg-driver: Fix logical && with bitwise and operation
  puzzles: Fix build with clang
  sudo: Disable rsize_t deliberately
  webkit-gtk: Backport fix to remove FrameDestructionObserver
  mdadm: Fix bugs exposed by clang
  directfb: Avoid using VLAs and printf formats

 .../irda-utils/irda-utils_0.9.18.bb                |  11 ++-
 meta/recipes-devtools/ccache/ccache.inc            |   2 -
 meta/recipes-extended/man/man_1.6g.bb              |   2 +
 .../mdadm/files/0001-Fix-typo-in-comparision.patch |  86 +++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |   1 +
 ...0001-Fix-build-issus-surfaced-due-to-musl.patch |  47 +++++++++
 meta/recipes-extended/minicom/minicom_2.7.bb       |   1 +
 ...x-error-conflicting-types-for-posix_close.patch |  39 ++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |   1 +
 ...1-Include-sys-types.h-for-id_t-definition.patch |  34 +++++++
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |   2 +
 meta/recipes-graphics/directfb/directfb.inc        |   4 +-
 ...direct-Aboid-usng-VLAs-and-printf-formats.patch |  61 ++++++++++++
 ...put_dpms-Replace-logical-with-bitwise-ope.patch |  31 ++++++
 .../xorg-driver/xf86-video-omap_0.4.3.bb           |   2 +
 .../0001-purgatory-Pass-r-directly-to-linker.patch |  32 +++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb    |   1 +
 ...-function-signatures-to-fix-prototype-mis.patch |  64 +++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   6 +-
 ...s10k1-Make-output_tram_line-static-inline.patch |  31 ++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb  |   1 +
 .../files/0001-Use-labs-instead-of-abs.patch       |  46 +++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |   1 +
 ...ride-of-FrameDestructionObserver-willDeta.patch | 105 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   1 +
 .../bdwgc/bdwgc/0001-fix-build-with-musl.patch     |  35 +++++++
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |   4 +-
 27 files changed, 641 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
 create mode 100644 meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
 create mode 100644 meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Remove-override-of-FrameDestructionObserver-willDeta.patch
 create mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch

-- 
2.5.1


