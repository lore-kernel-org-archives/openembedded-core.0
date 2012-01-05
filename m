Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ribae-0005n3-Kd
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 01:53:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2012 16:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103612007"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2012 16:46:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 16:46:26 -0800
Message-Id: <6095c22a0d0eb05296fe8f1a7052dd90ba478bfe.1325724295.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325724295.git.sgw@linux.intel.com>
References: <cover.1325724295.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325724295.git.sgw@linux.intel.com>
References: <cover.1325724295.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] glib-2.0: ensure dtrace is diabled for all distro options and fix packaging
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
X-List-Received-Date: Thu, 05 Jan 2012 00:53:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index 9b7c229..bdf92aa 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6c8bd68..b1033ea 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,11 +27,14 @@ S = "${WORKDIR}/glib-${PV}"
 
 EXTRA_OECONF = "--disable-debug --enable-included-printf=no --disable-dtrace"
 EXTRA_OECONF_virtclass-native = "--disable-dtrace --disable-systemtap"
-EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no"
+EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no --disbale-dtrace"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
-FILES_${PN}-dev += "${libdir}/glib-2.0/include"
-FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
+FILES_${PN}-dev += "${libdir}/glib-2.0/include \
+                    ${libdir}/gio/modules/lib*${SOLIBSDEV} \
+                    ${libdir}/gio/modules/*.la"
+FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
+                    ${libdir}/gio/modules/.debug"
 
 ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
-- 
1.7.6.4



