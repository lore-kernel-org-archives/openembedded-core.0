Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQ1m4-0005Hw-7p
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 20:00:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2011 10:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75377425"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 10:54:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 18:54:19 +0000
Message-Id: <2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321296476.git.paul.eggleton@linux.intel.com>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1321296476.git.paul.eggleton@linux.intel.com>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Mon, 14 Nov 2011 19:00:56 -0000

Most people building distcc will not need the distccmon-gnome GUI to be
built, so make it optional via the new PACKAGECONFIG functionality and
default it to disabled. (This also removes the need to disable it for
uclibc.)

Part of the fix for [YOCTO #1690].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index ec6ffb3..e15af5e 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -4,11 +4,12 @@ compilation of C/C++/ObjC code across machines on a network."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r7"
+PR = "r8"
 
-DEPENDS = "avahi ${GTKDEP}"
-GTKDEP_libc-uclibc = ""
-GTKDEP = "gtk+"
+DEPENDS = "avahi"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gui] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
@@ -28,20 +29,19 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = "--with-gtk"
-EXTRA_OECONF_libc-uclibc = "--without-gtk --without-gnome"
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
-    ${DESKTOPINSTALL}
+    ${@base_contains("PACKAGECONFIG", "gui", "desktop_install", "", d)}
 }
-DESKTOPINSTALL = ""
-DESKTOPINSTALL_libc-glibc () {
+
+desktop_install() {
     install -d ${D}${datadir}/distcc/
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
+
 PACKAGES += "distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
-- 
1.7.5.4



