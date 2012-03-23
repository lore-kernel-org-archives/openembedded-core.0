Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL1-0006eA-53
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:42:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2012 21:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132281573"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2012 21:34:00 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:49 +0800
Message-Id: <88bccafb7e4f4593416a3d2fcbc70fde20ffd10e.1332474082.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
References: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
Subject: [PATCH 2/5] gdb-cross-canadian: not shipping libiberty.
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
X-List-Received-Date: Fri, 23 Mar 2012 04:42:55 -0000

Fixed package QA warnings.

WARNING: QA Issue: non -staticdev package contains static .a library:
gdb-cross-canadian-i586 path
'/work/x86_64-nativesdk-pokysdk-linux/gdb-cross-canadian-i586-7.4-r6.3/packages-split/gdb-cross-canadian-i586/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/lib/libiberty.a'

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    6 ++++++
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index a7cac61..47d7d28 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -23,3 +23,9 @@ exit 0
 EOF
         chmod +x ${WORKDIR}/python
 }
+
+# we don't want gdb to provide bfd/iberty/opcodes, which instead will override the
+# right bits installed by binutils.
+do_install_append() {
+	rm -rf ${D}${exec_prefix}/lib
+}
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index dbcffde..dfb7d81 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.0.4



