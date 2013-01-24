Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyN6o-00018j-CW
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 14:44:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2013 05:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="247905677"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 24 Jan 2013 05:29:15 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 15:36:02 +0200
Message-Id: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 13:44:50 -0000

this fixes a service dependency issue;
while graphical.target is the default mode, systemd
will try to start display-manager.service which is not
available.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../systemd/set_default_target_to_multi-user.patch |   13 +++++++++++++
 meta/recipes-core/systemd/systemd_196.bb           |    1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch

diff --git a/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch b/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
new file mode 100644
index 0000000..d29471c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
@@ -0,0 +1,13 @@
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -3873,7 +3873,7 @@ systemd-install-data-hook:
+ 		$(LN_S) reboot.target runlevel6.target )
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f default.target ctrl-alt-del.target autovt@.service && \
+-		$(LN_S) graphical.target default.target && \
++		$(LN_S) multi-user.target default.target && \
+ 		$(LN_S) reboot.target ctrl-alt-del.target && \
+ 		$(LN_S) getty@.service autovt@.service )
+ 	( cd $(DESTDIR)$(systemunitdir)/multi-user.target.wants && \
diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index a78a8a6..c6798fc 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
+           file://set_default_target_to_multi-user.patch \
           "
 SRC_URI[md5sum] = "05ebd7f108e420e2b4e4810ea4b3c810"
 SRC_URI[sha256sum] = "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcffdfc6f058b55e4bf"
-- 
1.7.9.5



