Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirNd-00058U-3F
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:17:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2012 11:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="184323367"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2012 11:06:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:06:58 -0700
Message-Id: <1340561218-6934-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] kconfig-frontends: Fix for recent packaging changes
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
X-List-Received-Date: Sun, 24 Jun 2012 18:17:49 -0000

kconfig-frontends names it's shared library as -3.4.0.so instead of .so.3.4.0,
this causes the -dev package to grab it since it matches on *.so. This error
would also have shown up with the old PACKAGE order.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
index d95d3e8..4f95371 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
@@ -25,4 +25,10 @@ do_configure_prepend () {
 	mkdir -p scripts/.autostuff/m4
 }
 EXTRA_OECONF += "--disable-gconf --disable-qconf"
+
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+SOLIBS = "-${PV}.so"
+FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.7.6



