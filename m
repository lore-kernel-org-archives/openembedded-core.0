Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UHot1-0007CH-Ad
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 06:15:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Mar 2013 21:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,870,1355126400"; d="scan'208";a="216234587"
Received: from unknown (HELO localhost) ([10.255.13.116])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Mar 2013 21:58:08 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 23:58:07 -0500
Message-Id: <131e09450668ef93c4d886ccc93edd0eb77cf860.1363668929.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1363668929.git.tom.zanussi@linux.intel.com>
References: <cover.1363668929.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] perf: make PKGV match kernel version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 05:15:14 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Have perf grab and use the kernel version it's built from for PKGV,
rather than the default perf recipe version, so the final packages get
the kernel version instead of the default 1.0, which represents a
backwards value from the previous recipe.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3c49922..182dd25 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -32,7 +32,7 @@ RDEPENDS_${PN} += "elfutils bash ${SCRIPTING_RDEPENDS}"
 
 PROVIDES = "virtual/perf"
 
-inherit kernel-arch pythonnative
+inherit linux-kernel-base kernel-arch pythonnative
 
 # needed for building the tools/perf Python bindings
 inherit python-dir
@@ -104,6 +104,10 @@ do_configure_prepend () {
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
 }
 
+python do_package_prepend() {
+    bb.data.setVar('PKGV', '${@get_kernelversion('${S}').split("-")[0]}', d)
+}
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} += "${libexecdir}/perf-core"
-- 
1.7.11.4



