Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RL9RE-0007l3-Ah
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 09:11:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Nov 2011 01:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="69903264"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2011 01:05:09 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 16:05:13 +0800
Message-Id: <ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1320134607.git.dexuan.cui@intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1320134607.git.dexuan.cui@intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] bash: make job control really work
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
X-List-Received-Date: Tue, 01 Nov 2011 08:11:16 -0000

It turns out 9393ff833f44570fd5f500bc9de6c72db94b0296 didn't really fix
the bug.

This patch is made and tested after I read the link below
http://www.mail-archive.com/bug-bash@gnu.org/msg03107.html

[YOCTO #487]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-extended/bash/bash.inc    |    1 +
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d55e517..d495538 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,6 +23,7 @@ ALTERNATIVE_LINK = "${base_bindir}/sh"
 ALTERNATIVE_PRIORITY = "100"
 
 do_configure () {
+	export bash_cv_job_control_missing=present
 	gnu-configize
 	oe_runconf
 }
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index a0f5e4e..8070918 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.6



