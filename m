Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1D756C8B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 09:34:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8M9YOpM003710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 02:34:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 22 Sep 2013 02:34:22 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Sep 2013 17:34:18 +0800
Message-ID: <943f0f04862b212f3641528f4c03385e092bc99b.1379842366.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379842366.git.Qi.Chen@windriver.com>
References: <cover.1379842366.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: uninstall package only if it's already installed
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
X-List-Received-Date: Sun, 22 Sep 2013 09:34:20 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Remove a package from rootfs only if it's already installed. Also,
if a package is uninstalled, remove it from installed_pkgs.txt.

[YOCTO #5169]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 889547a..b4be509 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -510,7 +510,17 @@ rootfs_uninstall_unneeded () {
 			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
 				remove_run_postinsts=true
 			fi
-			rootfs_uninstall_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
+
+			# Remove package only if it's installed
+			pkgs_to_remove="update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+			for pkg in $pkgs_to_remove; do
+			    # regexp for pkg, to be used in grep and sed
+			    pkg_regexp="^`echo $pkg | sed 's/\./\\\./'` "
+			    if grep -q "$pkg_regexp" ${WORKDIR}/installed_pkgs.txt; then
+				rootfs_uninstall_packages $pkg
+				sed -i "/$pkg_regexp/d" ${WORKDIR}/installed_pkgs.txt
+			    fi
+			done
 
 			# Need to remove rc.d files for run-postinsts by hand since opkg won't
 			# call postrm scripts in offline root mode.
-- 
1.7.9.5


