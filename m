Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1AC60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 06:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="776729538"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 06:03:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:05:24 +0300
Message-Id: <cover.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Bring back LGPLv2 gmp, upgrade gnutls stack
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:21 -0000

This patch set is the result of gnutls/nettle/gmp license discussion
on the mailing list. The end result is that gnutls stack is available
as LGPLv2.1 and also as the newest versions (where nettle and gmp are
LGPLv3 | GPLv2).

In more detail:
 * Re-introduce an older LGPLv2 version of gmp
 * Fix nettle binary package license
 * Upgrade gnutls and nettle (keep LGPLv2 nettle as well)

gmp 4.2.1 was in better shape than I expected but it's still
software that was last updated 9 years ago and is used in a crypto
context... If there are other solutions to this problem I'll be
happy to hear them out.

Most of the commits depend on the ones before them either via version
incompatibilities or via applying on top of each other. I've smoke
tested two combinations of versions:
 * everything upgraded to newest
 * everything at LGPLv2.1 versions


Cheers,
 Jussi



The following changes since commit 778fc612cb584d17da02ecc115c4e6edba995602:

  libnotify: update to version 0.7.6 (2015-08-26 07:36:15 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/lgpl-all-the-things
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/lgpl-all-the-things

Jussi Kukkonen (6):
  nettle: Fix binary license to LGPLv2.1+
  gmp: Bring back version 4.2.1 (LGPL 2.1+)
  nettle: Add (LGPLv3) version 3.1.1
  nettle: Add ptests
  gnutls: Upgrade 3.3.14 -> 3.3.17.1
  mirrors.bbclass: Update gnutls mirrors

 meta/classes/mirrors.bbclass                       |  5 +-
 .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 +++++++++++++++
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  | 56 ++++++++++++++++++++++
 .../gmp/{gmp => gmp-6.0.0}/amd64.patch             |  0
 .../append_user_provided_flags.patch               |  0
 .../gmp/{gmp => gmp-6.0.0}/configure.patch         |  0
 .../gmp/{gmp => gmp-6.0.0}/gmp-6.0.0-ppc64.patch   |  0
 .../gmp/{gmp => gmp-6.0.0}/use-includedir.patch    |  0
 meta/recipes-support/gmp/gmp.inc                   | 19 +-------
 meta/recipes-support/gmp/gmp_4.2.1.bb              | 15 ++++++
 meta/recipes-support/gmp/gmp_6.0.0.bb              | 33 ++++++++++---
 .../{gnutls_3.3.14.bb => gnutls_3.3.17.1.bb}       |  4 +-
 ...d-target-to-only-build-tests-not-run-them.patch | 43 +++++++++++++++++
 meta/recipes-support/nettle/files/run-ptest        | 36 ++++++++++++++
 meta/recipes-support/nettle/nettle.inc             | 43 +++++++++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb        | 29 ++---------
 meta/recipes-support/nettle/nettle_3.1.1.bb        | 11 +++++
 17 files changed, 276 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/append_user_provided_flags.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/configure.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/gmp-6.0.0-ppc64.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/use-includedir.patch (100%)
 create mode 100644 meta/recipes-support/gmp/gmp_4.2.1.bb
 rename meta/recipes-support/gnutls/{gnutls_3.3.14.bb => gnutls_3.3.17.1.bb} (59%)
 create mode 100644 meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
 create mode 100644 meta/recipes-support/nettle/files/run-ptest
 create mode 100644 meta/recipes-support/nettle/nettle.inc
 create mode 100644 meta/recipes-support/nettle/nettle_3.1.1.bb

-- 
2.1.4


