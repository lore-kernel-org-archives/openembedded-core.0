Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLOfp-0003OV-0s
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:27:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="69498962"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 17:21:08 -0700
Message-Id: <d8848c7c7d57e08c6234c34b5deabfe525df3b61.1320191934.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
Subject: [Pull v3 3/4] connman: Use useradd to add the xuser for DBus
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
X-List-Received-Date: Wed, 02 Nov 2011 00:27:21 -0000

Connmand needs to start as the xuser as defined in the dbus
configuration and needs to share this with rootless X. Since
it's possible for connmand to run on a sytem without rootless
X we still need to create the user here.

Useradd will fail gracefully if the user already exists.

Fixes: [YOCTO #1699]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     |    7 ++++++-
 meta/recipes-connectivity/connman/connman_0.75.bb |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ae1b725..480b59c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -18,7 +18,12 @@ DEPENDS  = "libgdbus dbus glib-2.0 iptables"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-inherit autotools pkgconfig update-rc.d
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home \
+                       --shell /bin/false --groups video,tty,audio \
+                       --user-group xuser"
+
+inherit autotools pkgconfig update-rc.d useradd
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
index 8a02753..78f2199 100644
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF += "\
   ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
-- 
1.7.6.4



