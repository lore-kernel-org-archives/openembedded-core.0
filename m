Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 61BC378038
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:57:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 05:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="991630995"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Jul 2017 05:57:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 517DA5808DD;
	Tue, 11 Jul 2017 05:57:51 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:58:10 +0300
Message-Id: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: joshua.g.lock@intel.com, stanley.cheong.kwan.phoong@intel.com
Subject: [PATCH 0/3] pkgconf: consider pkgconf as a replacement for pkg-config
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
X-List-Received-Date: Tue, 11 Jul 2017 12:57:52 -0000

pkgconf is a better replacement for pkg-config. Fedora 26 replaces the
system pkg-config implementation with pkgconf because it "provides better
support for handling .pc files and a stable library ABI/API for integrating
into applications." and is actively maintained, unlike pkg-config.

pkgconf aims to offer many improvements over pkg-config such as faster/more
efficient dependency resolver which "allows for the user to more conservatively
link their binaries -- which may be helpful in some environments, such as when
prelink(1) is being used.

pkgconf also aims to provide a more complete implementation of pkg-config.
The features most likely to benefit the Yocto Project build system are the
faster/more efficient dependency resolution and linker flag optimisation.

To test this, after applying these patches, update "local.conf" as below:

PREFERRED_PROVIDER_pkgconfig = "pkgconf"
PREFERRED_PROVIDER_pkgconfig-native = "pkgconf-native"
PREFERRED_PROVIDER_nativesdk-pkgconfig = "nativesdk-pkgconf"

Links:
1. http://pkgconf.org
2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation
3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=11308

Maxin B. John (3):
  pkgconf: add recipe
  libx11: fix build error
  libxt: fix build failure

 meta/files/common-licenses/pkgconf                 | 10 ++++
 .../pkgconf/pkgconf/pkg-config-native.in           |  6 +++
 .../pkgconf/pkgconf/pkg-config-wrapper             | 16 +++++++
 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb     | 55 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |  3 ++
 ...il-don-t-link-makestrs-with-target-cflags.patch | 33 +++++++++++++
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |  4 +-
 7 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/pkgconf
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
 create mode 100755 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch

-- 
2.4.0


