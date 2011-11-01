Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLLxf-0001z4-Pq
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:33:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 14:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="80205065"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2011 14:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 14:27:18 -0700
Message-Id: <068e36f414060ad3e09001f00c9dec404a9fae9a.1320182590.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320182590.git.sgw@linux.intel.com>
References: <cover.1320182590.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320182590.git.sgw@linux.intel.com>
References: <cover.1320182590.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] connman: create xuser
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
X-List-Received-Date: Tue, 01 Nov 2011 21:33:36 -0000

We create xuser here as a backup incase that xerver-nodm-init
is not on the system.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ae1b725..4dd4efc 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -18,7 +18,10 @@ DEPENDS  = "libgdbus dbus glib-2.0 iptables"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-inherit autotools pkgconfig update-rc.d
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --shell /bin/false --groups video,tty,audio --user-group xuser"
+
+inherit autotools pkgconfig update-rc.d useradd
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
-- 
1.7.6.4



