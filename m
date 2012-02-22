Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1S01QD-0001ql-Tp
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 02:55:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119901755"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:46:43 -0800
Message-Id: <1a900bc54bca64ea4a28fbd6fcd2b9b4469c567f.1329875013.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
Subject: [PATCH 2/3] external-csl-toolchain: skip parsing if CSL_VER_MAIN isn't set
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
X-List-Received-Date: Wed, 22 Feb 2012 01:55:10 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index d15578b..07c3e30 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -150,3 +150,11 @@ FILES_linux-libc-headers = "${includedir}/asm* \
 "
 FILES_gdbserver = "${bindir}/gdbserver ${libdir}/bin/sysroot-gdbserver"
 FILES_gdbserver-dbg = "${bindir}/.debug/gdbserver"
+
+CSL_VER_MAIN ??= ""
+
+python () {
+    if not d.getVar("CSL_VER_MAIN"):
+	raise bb.parse.SkipPackage("External CSL toolchain not configured (CSL_VER_MAIN not set).")
+}
+
-- 
1.7.7.6



