Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sowlj-0000cG-Gw
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 15:15:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2012 06:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164251548"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.253])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2012 06:04:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 14:04:31 +0100
Message-Id: <cover.1342011575.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] rootfs generation improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 13:15:51 -0000

Fix up handling of "complementary" package installation (dev, dbg, doc,
etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.

I've tested this with all backends using buildhistory to examine the
changes to the image contents, and compared the lists of files in the
SDK-from-image output with the rpm backend. Unfortunately it does
increase the do_rootfs time slightly; one of my next tasks will be to
try to do some optimisation here.


The following changes since commit b76a7bc8dcb7aed7d6f026e77a226837004c50af:

  libgomp: add libgomp (openmp) library, and build for powerpc targets by default (2012-07-11 11:35:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/rootfs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs

Paul Eggleton (3):
  classes/rootfs_deb: use more reliable check for package existence
  Rework installation of dev, dbg, doc, and locale packages
  classes/image: add staticdev-pkgs IMAGE_FEATURES feature

 meta/classes/image.bbclass            |   89 ++++++++++++++++++++++-----------
 meta/classes/package_rpm.bbclass      |   74 ++++++++++++++++-----------
 meta/classes/populate_sdk_deb.bbclass |    2 +
 meta/classes/populate_sdk_ipk.bbclass |    2 +
 meta/classes/populate_sdk_rpm.bbclass |    3 ++
 meta/classes/rootfs_deb.bbclass       |   14 +++---
 meta/classes/rootfs_ipk.bbclass       |   16 +++---
 meta/classes/rootfs_rpm.bbclass       |   29 ++++++-----
 8 files changed, 144 insertions(+), 85 deletions(-)

-- 
1.7.9.5



