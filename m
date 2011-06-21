Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZ4pH-000161-GA
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:33:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jun 2011 10:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="18918959"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.54])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2011 10:29:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 18:29:30 +0100
Message-Id: <1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308677220.git.paul.eggleton@linux.intel.com>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308677220.git.paul.eggleton@linux.intel.com>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 17:33:23 -0000

If we use a tag here then bitbake has to connect to the repository to find
out the corresponding revision (so it can expand SRCPV which is part of PV,
which amongst other things is needed to determine whether or not the
package has to be rebuilt.) This occurs at parse time; on machines behind a
firewall or with no network access this can be a problem.

We wish to avoid unnecessary network accesses and network access in our
default configuration during parse time is even worse. Substituting the
git revision corresponding to the tag prevents bitbake from having to
contact the remote repository in order to expand PV.

Addresses [YOCTO #1186]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/uboot/u-boot_2011.03.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
index 07f0609..25af69b 100644
--- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
 
-SRCREV = "v2011.03"
+SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 PV = "v2011.03+git${SRCPV}"
-PR="r4"
+PR = "r5"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.4.1



