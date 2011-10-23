Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RHzjj-0001K1-VJ
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 17:13:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2011 08:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,394,1315206000"; d="scan'208";a="80904500"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2011 08:07:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 16:07:15 +0100
Message-Id: <385ddc74283a32019ca44a28c2f75404257f22d0.1319382376.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] dbus: remove unused initscript
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
X-List-Received-Date: Sun, 23 Oct 2011 15:13:20 -0000

We already install an appropriate init script to /etc/init.d, we do not
need an additional one in /etc/init.d/rc.d as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dbus/dbus.inc       |    3 +++
 meta/recipes-core/dbus/dbus_1.4.12.bb |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a8ecda8..339bedf 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -92,6 +92,9 @@ do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
 
+	# Remove Red Hat initscript
+	rm -rf ${D}${sysconfdir}/rc.d
+
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
diff --git a/meta/recipes-core/dbus/dbus_1.4.12.bb b/meta/recipes-core/dbus/dbus_1.4.12.bb
index ada53c9..9324af7 100644
--- a/meta/recipes-core/dbus/dbus_1.4.12.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.12.bb
@@ -1,4 +1,7 @@
 include dbus.inc
+
+PR = "r1"
+
 SRC_URI[md5sum] = "104f2ea94c10a896dfb1edecb5714cb1"
 SRC_URI[sha256sum] = "da3c97fd546610558d588799e27c4fa81101e754acbcd34747a42c131f30dbe7"
 
-- 
1.7.4.1



