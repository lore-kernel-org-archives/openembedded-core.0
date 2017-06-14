Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 231B1783A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so490805pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ES51+tqDI22jKbjSd1tPMCrs5skYT03TWt3wZVFhvEg=;
	b=Rqe5ThC6H7h6lEsXRRvz/0H+bYKmEiMSbGJfMEpCGuDdr9oQ97mpsGx4jH/W2pZCBf
	a3lQzZLIsQWxdi+NpJ2KekD3ti8kErc/BoOv4Qlut+Op+bYd1fN7EdFrJSxeiwnx2uED
	QKYiNaBToNFw6/E0jTpi4q4q2NDK7nJRdhJWTd4eSirey0VMnVeGujnvBjm3bcVmMwWc
	LCfCVzehpW+/CW4/snwf6Le5XUrUHXSGWoAPTRuJlA6TighCEyD82pkuUBf7Hx3Oeosf
	KBt4dx/HbBkrb8HYKak6xLB1C02pm4ZD2pV4gePV7n5h4rFksCti1pvUfBJeXdgAQf+9
	AvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ES51+tqDI22jKbjSd1tPMCrs5skYT03TWt3wZVFhvEg=;
	b=p6xnCwhGTcqgMgnFOdVTuSW93tQjXyvYj9iFMxbptAAPZ7fZc9NIIlRs7yU7ZNorKC
	ONdbzYB7oayO+Rid9SU9pk7a/SRUOA164Efa+w4xf8SY7j0BjDi0o7vs2JkvqnQ7bBP5
	2SwEr3Vh0FJG6sPNOcjd75O3YDJwq0E3jCdMR5tuwDJEjHBp2kqZzePClp0VpEOn2Eex
	TRVBHsetLxd+nl+Mk3ByfNYF7PLs7Ww+cFHPp9NP0xrLY3hiSiiPihwiD1gPNDcfnFnW
	OCs7HGIg/W+LfiTBY6t9W2na4/o+DU+0GpoogO/u1RdRCFdiCDKwc6L5vkTo5wlMEyuO
	LiVA==
X-Gm-Message-State: AKS2vOwq9Ylfuc1J5+I8jSf7wtqmCY79PrvLoNC9EZFcn8oarmpMd+6L
	2RlGdRNKEgOjm0K7
X-Received: by 10.84.224.14 with SMTP id r14mr635224plj.285.1497453806802;
	Wed, 14 Jun 2017 08:23:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id 62sm521898pfz.39.2017.06.14.08.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:10 -0700
Message-Id: <cover.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH 00/10] Add GCCPIE knob to configure gcc with --enable-default-pie
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:26 -0000

* This patchset add a switch to configure gcc driver with PIE defaults
* Add support for generating static PIE in gcc
* Gets rid of lot of bandaids from distro security flags file
* Adjust recipes for new way of specifying pie
* Upgrade and Fix mips build for ffmpeg along the way

The following changes since commit 059846662f1ea1c82804cfce5f91afcb2980ec8a:

  mtools-native: fix Upstream-Status (2017-06-14 14:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/hardening-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/hardening-fixes

Khem Raj (10):
  gcc: Introduce a knob to configure gcc to default to PIE
  security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
  distutils,setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
  ffmpeg: Upgrade to 3.3.2 stable
  gobject-introspection: Disable generating static lbraries
  zlib: Pass pre-calculate uname enable re-entrant flags
  gcc-sanitizer: Fix build with glibc 2.26
  gcc7: Enable static PIE
  libunwind: We set -fPIE in security flags now if gcc is not configured
    for default PIE
  valgrind: Remove -no-pie from cflags

 meta/classes/distutils-common-base.bbclass         |   2 -
 meta/classes/setuptools.bbclass                    |   2 -
 meta/conf/distro/include/security_flags.inc        |  85 ++++-------
 meta/recipes-core/zlib/zlib_1.2.11.bb              |  12 +-
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   2 +
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++++++++++
 .../gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch   |  37 +++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   1 -
 .../gobject-introspection_1.50.0.bb                |   1 +
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 ++++++
 .../ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb}      |   5 +-
 meta/recipes-support/libunwind/libunwind_1.2.bb    |   4 -
 13 files changed, 281 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb} (97%)

-- 
2.13.1


