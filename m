Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYBu-0002iM-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263223"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:31 +0200
Message-Id: <19f2690bd7fc9b4841f53b0efc7739439693d1e2.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/18] dbus: remove unused initscript
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:50 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

We already install an appropriate init script to /etc/init.d, we do not
need an additional one in /etc/init.d/rc.d as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dbus/dbus.inc       |    3 +++
 meta/recipes-core/dbus/dbus_1.4.12.bb |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a97c02..4c7d87a 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -86,6 +86,9 @@ do_install() {
 	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
 	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
 
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
1.7.6.4



