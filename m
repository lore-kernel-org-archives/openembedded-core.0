Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3C186E7CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470375687"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 14:34:04 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:40:00 -0800
Message-Id: <cover.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Richard Purdie <richard.purdie@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 00/15] Update x86 tune files
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:21 -0000

All,

The following lays the groundwork for some rethinking of support for x86
platforms. In particular, the meta-intel layer will undergo some major
refactoring once this is merged. We believe it is of value to keep as much
of the tune files available in oe-core as possible, rather than isolating
them all in meta-intel.

This series renames the x86-related tune files, documents best practices,
updates the core2 tune file, adds a corei7 tune file, and updates the dependent
machine configs. This spans oe-core and poky and I feel is best viewed as a
whole. Please forgive the cross-post.

The new corei7 tune file applies to Nehalem and Silvermont (Bay Trail) CPUs
which support up to SSE4.2. This provides an appropriate demarcation line while
maximizing compatibility as well as including optimal support for the current
generation of the embedded CPUs (Bay Trail) by including it in the new tune. AVX
(Sandy Bridge and beyond) is not included as that would not apply to Bay Trail,
although it can easily be added in a corei7-avx tune file as an additional
patch for users who care more about the last few percent of performance over
compatibility and consolidation.

An important note and likely a point of contention: The core2 update changes the
core2 arch to core2-32, making the 32 bit explicit rather than implied in order
to provide a consistent naming scheme going forward with newer tunes where
64 bit would be logical assumption if not explicitly stated. See patch 5/15 for
details on this bit.

Finally, update the machines dependent on these tune files to use the new names.
As we remove x86_64, the 64b x86 machines now build as core2-64 for maximum
compatibility.

For reference, the corei7-64 tune defines:
    TARGET_CC_ARCH=" -m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2"

While the corei2-32 tune defines:
    TARGET_CC_ARCH=" -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse"

The following changes since commit 6e7047434fc1570146ebc94254412b99b1c4cab4:

  poky.ent: Fixed broken OE_LISTS_URL. (2014-01-21 21:58:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/intel-tune-ng-v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/intel-tune-ng-v3

Darren Hart (15):
  x86: Replace ia32 with x86 when referring to the generic architecture
  i586: Only add the current tune to PACKAGE_EXTRA_ARCHS
  tune-core2: Replace -mtune=generic with -mtune=core2
  tune-core2: Only add the current ARCH to PACKAGE_EXTRA_ARCHS
  tune: Make 32b or 64b explicit in tune name for core2
  tune-corei7: Add support for cpu-type corei7
  tune: Remove tune-x86_64.inc
  tune: README: Whitespace cleanup
  tune: README: Document best practice
  tune: README: Typographical corrections
  qemux86_64: Use the core2-64 tune
  genericx86: Use the core2 tune file
  genericx86-64: Use the core2-64 tune
  genericx86: Use new x86 tune files
  generixx86: Use require instead of include

 meta-yocto-bsp/conf/machine/genericx86-64.conf     |    5 +-
 meta-yocto-bsp/conf/machine/genericx86.conf        |    5 +-
 .../conf/machine/include/genericx86-common.inc     |    2 +-
 meta/conf/machine/include/README                   |  109 ++++++++++++--------
 meta/conf/machine/include/tune-c3.inc              |    2 +-
 meta/conf/machine/include/tune-core2.inc           |   23 +++--
 meta/conf/machine/include/tune-corei7.inc          |   35 +++++++
 meta/conf/machine/include/tune-i586.inc            |    4 +-
 meta/conf/machine/include/tune-x86_64.inc          |    4 -
 .../include/{ia32-base.inc => x86-base.inc}        |   16 +--
 meta/conf/machine/include/{ia32 => x86}/README     |    6 +-
 .../{ia32/arch-ia32.inc => x86/arch-x86.inc}       |    2 +-
 meta/conf/machine/qemux86-64.conf                  |    3 +-
 13 files changed, 139 insertions(+), 77 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc
 delete mode 100644 meta/conf/machine/include/tune-x86_64.inc
 rename meta/conf/machine/include/{ia32-base.inc => x86-base.inc} (75%)
 rename meta/conf/machine/include/{ia32 => x86}/README (81%)
 rename meta/conf/machine/include/{ia32/arch-ia32.inc => x86/arch-x86.inc} (97%)

-- 
1.7.9.5


