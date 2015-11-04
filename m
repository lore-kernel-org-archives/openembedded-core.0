Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BE5E6770F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:02:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2015 08:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="843033858"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2015 08:01:52 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 07:50:47 +0000
Message-Id: <17737af01613e1fed9e6672b56c350c9f3575c5c.1446623061.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] rootfs.py: Stop using installed_pkgs.txt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Nov 2015 16:02:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The method _uninstall_unneeded uses the file installed_pkgs.txt,
this file is left after the build and can cause confusion. This
changes allow to get the installed packages using functions of
rootfs instead of the installed_pkgs.txt file. With this change
now is possible to remove the file without breaking anything.

[YOCTO #8444]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 18df22d..c004a5b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -243,25 +243,19 @@ class Rootfs(object):
             # Remove components that we don't need if we're not going to install
             # additional packages at runtime
             if delayed_postinsts is None:
-                installed_pkgs_dir = self.d.expand('${WORKDIR}/installed_pkgs.txt')
+                pkgs_installed = image_list_installed_packages(self.d)
                 pkgs_to_remove = list()
-                with open(installed_pkgs_dir, "r+") as installed_pkgs:
-                    pkgs_installed = installed_pkgs.read().splitlines()
-                    for pkg_installed in pkgs_installed[:]:
-                        pkg = pkg_installed.split()[0]
-                        if pkg in ["update-rc.d",
-                                "base-passwd",
-                                "shadow",
-                                "update-alternatives", pkg_to_remove,
-                                self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
-                                ]:
-                            pkgs_to_remove.append(pkg)
-                            pkgs_installed.remove(pkg_installed)
+                for pkg in pkgs_installed.split():
+                    if pkg in ["update-rc.d",
+                            "base-passwd",
+                            "shadow",
+                            "update-alternatives", pkg_to_remove,
+                            self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
+                            ]:
+                        pkgs_to_remove.append(pkg)
 
                 if len(pkgs_to_remove) > 0:
                     self.pm.remove(pkgs_to_remove, False)
-                    # Update installed_pkgs.txt
-                    open(installed_pkgs_dir, "w+").write('\n'.join(pkgs_installed))
 
             else:
                 self._save_postinsts()
-- 
1.8.4.5


