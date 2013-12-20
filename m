Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 427B160D39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 06:58:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2013 22:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,518,1384329600"; d="scan'208";a="447440391"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2013 22:58:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 22:58:03 -0800
Message-Id: <cover.1387522493.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/21] Currently finishing on AB
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
X-List-Received-Date: Fri, 20 Dec 2013 06:58:03 -0000

Richard,

here is a set of mostly your patches alone with a few others, I actually built
a few more patches which I dropped, notably Valentin's weston patch since I think
Koen's suggestion from May would make a more flexible solution.

I verified the openssl change via buildhistory (thanks Paul!)


Thanks	
 	Sau!


The following changes since commit cd94dd3d9bba32c3fd55959586128b236d1d4e34:

  security_flags: more relocation issues (2013-12-18 17:23:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Corneliu Stoicescu (3):
  oe-selftest: New BuildhistoryBase object for buildhistory testing.
  oe-selftest: New test module for OE scripts.
  oe-selftest: added buildhistory buildtime tests in module
    buildoptions.py

Cristian Iorga (1):
  libtirpc: upgrade to 0.2.4

Richard Purdie (8):
  native: Use deltask to remove tasks which have no purpose
  externalsrc: Use deltask API
  ptest: Fix dependency/ordering issue
  ptest: Disable for native recipes
  sstatesig: Ensure we return all matches for find_sigdata
  sstatesig: Allow the BB_HASHFILENAME to be passed in for comparision
    purposes
  sstatesig: Update for the removal of sstate-name
  sstatesig: Correctly handle matches spanning stamps and sstatedir

Saul Wold (5):
  conf-notes: remove meta-toolchain-sdk references
  harfbuzz: Allow PACKAGECONFIG to be overridden
  beecrypt: Allow PACKAGECONFIG to be overridden
  openssl: use PACKAGECONFIG to disable perl bits
  util-linux: remove non PN based -dev packages

Stefan Stanacar (2):
  lib/oeqa/runtime: rewrite the systemd test module
  testimage: include traceback when loading a test fails

Valentin Popa (1):
  runqemu: Allow user to set -vga option with qemuparams

Zhang Xiao (1):
  nfs-utils: modify the boot sequence of the init script

 meta/classes/externalsrc.bbclass                   | 21 +----
 meta/classes/native.bbclass                        | 11 +--
 meta/classes/ptest.bbclass                         |  3 +-
 meta/classes/testimage.bbclass                     |  3 +-
 meta/conf/conf-notes.txt                           |  1 -
 meta/lib/oe/sstatesig.py                           | 15 ++--
 meta/lib/oeqa/runtime/systemd.py                   | 93 +++++++++++-----------
 meta/lib/oeqa/selftest/buildhistory.py             | 45 +++++++++++
 meta/lib/oeqa/selftest/buildoptions.py             | 20 +++++
 meta/lib/oeqa/selftest/oescripts.py                | 60 ++++++++++++++
 .../nfs-utils/nfs-utils_1.2.9.bb                   |  5 +-
 meta/recipes-connectivity/openssl/openssl.inc      | 16 ++--
 meta/recipes-core/util-linux/util-linux.inc        | 10 +--
 .../libtirpc-0.2.3/obsolete_automake_macros.patch  | 15 ----
 .../libtirpc-0.2.1-fortify.patch                   |  0
 .../remove-des-uclibc.patch                        |  0
 .../{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb}       |  8 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb  |  2 +-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  2 +-
 scripts/runqemu                                    |  1 +
 scripts/runqemu-internal                           | 12 ++-
 21 files changed, 228 insertions(+), 115 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/buildhistory.py
 create mode 100644 meta/lib/oeqa/selftest/oescripts.py
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb} (84%)

-- 
1.8.3.1


