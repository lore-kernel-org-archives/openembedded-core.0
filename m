Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr7l-0000fY-Iz
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:42:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:39:06 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:39:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:38:04 -0700
Message-Id: <92c28973316e62fd2e4054fe3bab85685c5acc3e.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
Subject: [PATCH 8/8] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 18:42:05 -0000

From: Khem Raj <raj.khem@gmail.com>

We enable gtk/gnome in distcc that code uses loadavg()
a function unimplemented in uclibc. Therefore for uclibc
we disable gnome and gtk+ features in distcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index 1f5c2af..34b04a5 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -6,7 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r6"
 
-DEPENDS = "avahi gtk+"
+DEPENDS = "avahi ${GTKDEP}"
+GTKDEP_libc-uclibc = ""
+GTKDEP = "gtk+"
+
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
@@ -24,17 +27,21 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = " --with-gtk "
-
+EXTRA_OECONF_libc-glibc = " --with-gtk "
+EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
+    ${DESKTOPINSTALL}
+}
+DESKTOPINSTALL = ""
+DESKTOPINSTALL_libc-glibc () {
+    install -d ${D}${datadir}/distcc/
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
-
-PACKAGES += "distcc-distmon-gnome"
+PACKAGES_append_libc-glibc = " distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-- 
1.7.3.4



