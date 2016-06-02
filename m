Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD2E677399
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:49:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2016 03:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="712744183"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2016 03:49:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:49:02 +0300
Message-Id: <cover.1464863090.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] dosfstools upgrade + image gen. fixes
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
X-List-Received-Date: Thu, 02 Jun 2016 10:49:15 -0000

A new approach to the dosfstools upgrade: Fix the sanity check in
mtools and remove workarounds we have in image generation scripts.

I ended up at this after I realised that:
 * dosfstools < 4.0 uses 32 sectors-per-track 
 * dosfstools 4.0 uses 63 sectors-per-track
 * dosfstools git master uses variable sectors-per-track
Creating a filesystem with a size that's divisible by sectors-per-track
with multiple different dosfstools (we have two versions) was going
to be very tricky.

On the other hand, making the sanity check in mtools non-fatal seems to
work just fine and let's us simplify the scripts.

 - Jussi



The following changes since commit 5a9745dd631eb697c30cd49e1dd065f4f57e7393:

  distro_check.py: Don't mix tabs and spaces (2016-06-02 08:36:29 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/dosfstools
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/dosfstools

Jussi Kukkonen (3):
  mtools: Patch out a useless sanity check
  image-live, image-vm, wic: Remove fs size workaround
  dosfstools: Upgrade 3.0.28 -> 4.0

 meta/classes/image-live.bbclass                    |  6 ---
 meta/classes/image-vm.bbclass                      |  6 ---
 .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 46 ----------------------
 .../dosfstools/dosfstools/largefile.patch          | 19 ---------
 .../{dosfstools_3.0.28.bb => dosfstools_4.0.bb}    | 18 +++------
 ...en-if-fs-size-is-not-divisible-by-sectors.patch | 34 ++++++++++++++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |  4 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  4 +-
 scripts/lib/wic/partition.py                       |  8 ----
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  6 ---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  6 ---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  6 ---
 12 files changed, 46 insertions(+), 117 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
 rename meta/recipes-devtools/dosfstools/{dosfstools_3.0.28.bb => dosfstools_4.0.bb} (60%)
 create mode 100644 meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch

-- 
2.1.4


