Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxz-0001EP-NM
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663914"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:41 -0800
Message-Id: <9e88de502e60ffab47739d10a72cf5a1c8a90a48.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/28] glib-2.0: ensure dtrace is diabled for all distro options and fix packaging
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:24 -0000

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



