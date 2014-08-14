Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id A726470BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:02 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j62Hg; Thu, 14 Aug 2014 12:06:04 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:50 -0500
Message-Id: <1408043159-8108-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH v2 0/9] recipes-devtools/gcc accumulated patches
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:05 -0000

The first five patches have the same content as the previous version,
but the commit messages have been tweaked.

There's a new cleanup patch to change the name of a function from the
name of a gcc configuration option it doesn't affect to the name of the
gcc configuration option it does affect.

Khem's patch http://patches.openembedded.org/patch/78131/ is here,
rebased on the whitespace cleanup that starts this series.

Then we have the backport of the patch required to fix problems with gcc
4.9 building some Linux kernels.  The affected kernels have been patched
but may not be in OE yet; the same patch is also relevant to 4.8 and has
been added there for completeness.

Finally, the C++11 ABI issue that got me started on this has been fixed,
in a slightly different way than previously discussed: this one follows
the precedent of mips64 in specifying ABI-related configuration flags in
gcc-configure-common.inc, but following Khem's suggestion of adding the
necessary --with-arch flags.  I've included armv6 for completeness;
AFAICT armv7a covers all the other affected ARM platforms.

Feedback welcome; I have no additional gcc patches pending, so if there
are no concerns these should be ready for integration testing.

Peter

Khem Raj (1):
  gcc: Abstract long double configuration into python function

Peter A. Bigot (8):
  gcc: recipe whitespace changes
  gcc: remove inappropriate patch
  gcc-4.9: Ensure c++ includes are in /usr/include/c++/${BINV}
  gcc: remove outdated configuration option
  gcc-target: make --enable-clocale consistent with gcc-runtime
  sdk: change EXTRA_OECONF_FPU to EXTRA_OECONF_GCC_FLOAT
  gcc: backport patch affecting Linux kernel builds
  gcc: update compiler architecture to match gcc-runtime (armv6, armv7a)

 meta/classes/crosssdk.bbclass                      |   2 +-
 meta/classes/nativesdk.bbclass                     |   2 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              | 186 +++++++++++----------
 .../gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch         |  66 --------
 .../gcc-4.8/0052-PR-rtl-optimization-61801.patch   |  36 ++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              | 180 ++++++++++----------
 .../gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch         |  66 --------
 .../gcc-4.9/0055-PR-rtl-optimization-61801.patch   |  36 ++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   9 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  60 ++++---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  25 +--
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |  32 ++--
 meta/recipes-devtools/gcc/gcc-cross.inc            |  27 +--
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 154 ++++++++---------
 meta/recipes-devtools/gcc/gcc-target.inc           | 110 ++++++------
 meta/recipes-devtools/gcc/libgcc.inc               |  35 ++--
 meta/recipes-devtools/gcc/libgfortran.inc          |  29 ++--
 17 files changed, 521 insertions(+), 534 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0055-PR-rtl-optimization-61801.patch

-- 
1.8.5.5


