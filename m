Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPDvt-0000gT-H4
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:24:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 08:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291767442"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 08:06:46 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 18:06:41 +0300
Message-Id: <1365433601-24194-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
References: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] gtk-update-icon-cache-native: create wrapper script
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
X-List-Received-Date: Mon, 08 Apr 2013 15:24:43 -0000

When using the sstate from another build machine, the path to the pixbuf
loader's cache points to a path on the remote machine. Hence, the update
of the icon cache fails on host.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
index 93c30a7..73b7644 100644
--- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
@@ -40,4 +40,8 @@ do_compile() {
 do_install() {
 	install -d ${D}${bindir}
         install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
+
+	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
+
 }
-- 
1.7.9.5



