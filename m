Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6210177FC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:18 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f127so8704728pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WU7foQef7K952bniHph17K+OO1LTXuEnQg+E4vPSml8=;
	b=nqhLvKXm8caT95k7pIDfjla3DKxFuY6NUhfZW/znPGf8btHVfO85Ag5cOFznjHGU9f
	2urpIz2mKlcyvW+BojxHPwv6vxKLmzzsOrI3r8thU2NtLeZ79Ie/JgKMrUZrYKH7GsYI
	PI8EBfcqDr783S+gKVEbO0/63mcrJ8Pgdx11b4vudioxloyqLHI6tnxYnJDAJVKK9UZG
	iTGd6Rck71wU1G6afYutgHGXzeIrru+n7nrq5w4U7Ojg5m/e4PavsqhzeNqzpXjtkliX
	1X2YyqMTBoGVzv6cZI8wtwqu+rxKHBrcIO3Ouu3D/RupBZC7MGsKwjbbLoFFjqO7J42E
	R8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WU7foQef7K952bniHph17K+OO1LTXuEnQg+E4vPSml8=;
	b=GZKQcBnkDXV712gCWFBQs7qygdFRdXmldUUyKw3XCEjJoqMJ6OPZAWlnlgTInTtHq1
	VFpfW/Dxct2WYhj1CJ5kHCPnfqZ8KLx0lUMayizBc15dlTzZ11s6gU/02WacyipCRrqq
	ov1hww7T+LSq1tONWvXkHEd+JtQFh86fgLMQ3h9wsWWGdB39IlyLTztUIfgMCz23ZJRZ
	bQF44XNGNNN2Ss1TngUO3HX3M/s3oRQaKskIybLmal/L+IK1vOSLY6q/Z3WdrYtL1hbU
	dX7BiXJeLBgKZCK1wYIDPpoWFZutTRo0/S2I5vxJjglfMAqxpm8HP8bz4PPV/bGSOhzf
	GQKA==
X-Gm-Message-State: AKS2vOxvo0Y3DQIiznqUtfpgWaGB5KO1pieZs+6yCcO6G95qSD3WzGaH
	kn3NCdo3xuh1h4Gv
X-Received: by 10.99.170.15 with SMTP id e15mr11257043pgf.239.1498665859999;
	Wed, 28 Jun 2017 09:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	g184sm6397080pfb.3.2017.06.28.09.04.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:05 -0700
Message-Id: <cover.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 00/10] Rework GCC PIE and security flags (take 2)
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:20 -0000

* This patchset add a switch to configure gcc driver with PIE defaults
* Add support for generating static PIE in gcc
* Gets rid of lot of bandaids from distro security flags file
* Adjust recipes for new way of specifying pie

v1->v2:

* apply linking spec changes libssp_nonshared.a to musl alone
* icu/iptable/gstreamer1.0-plugins-bad fixes are done on top not really depend on pie rework

The following changes since commit 179b7ae2511974173ae4aa72dfb49384ff69c2e5:

  meta/conf/layer.conf: bump layer version for LSB changes (2017-06-28 15:52:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/hardening-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/hardening-fixes

Khem Raj (10):
  gcc: Introduce a knob to configure gcc to default to PIE
  security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
  distutils,setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
  gcc7: Enable static PIE
  gcc: Link libssp_nonshared.a only on musl targets
  libunwind: We set -fPIE in security flags now if gcc is not configured
    for default PIE
  valgrind: Remove -no-pie from cflags
  iptables: Apply 0001-fix-build-with-musl.patch unconditionally
  icu: Fix build with glibc 2.26
  gstreamer1.0-plugins-bad: Fix missing library with bcm egl

 meta/classes/distutils-common-base.bbclass         |  2 -
 meta/classes/setuptools.bbclass                    |  2 -
 meta/conf/distro/include/security_flags.inc        | 83 ++++++----------------
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  3 +-
 ...shared-to-link-commandline-for-musl-targe.patch | 42 +++++++++++
 .../gcc/gcc-7.1/0040-ssp_nonshared.patch           | 28 --------
 .../gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch   | 37 ++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  3 +
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  2 -
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |  4 +-
 .../link-with-libvchostif.patch                    | 35 +++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch | 31 ++++++++
 meta/recipes-support/icu/icu_58.2.bb               |  3 +-
 meta/recipes-support/libunwind/libunwind_1.2.bb    |  4 --
 15 files changed, 177 insertions(+), 103 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch

-- 
2.13.2


