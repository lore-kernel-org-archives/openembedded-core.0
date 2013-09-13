Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCC861011
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 02:08:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D28NuH001362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 19:08:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 19:08:22 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 10:09:06 +0800
Message-ID: <5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379038097.git.Qi.Chen@windriver.com>
References: <cover.1379038097.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: do not automatically remove update-rc.d
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
X-List-Received-Date: Fri, 13 Sep 2013 02:08:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

In rootfs_uninstall_unneeded function, the update-rc.d package would
be removed if no 'package-management' and no delayed postinsts.

However, in update-rc.d.bbclass, the update-rc.d package is only
recommended. Thus, if NO_RECOMMENDATIONS is enabled or 'update-rc.d'
is added to BAD_RECOMMENDATIONS, the update-rc.d package will not
be installed at the first place. Tring to remove it will result in an
error.

Also this function assumes that update-rc.d is only used by postinsts.
This assumption isn't always true. Users may want to write their own
init scripts and use the update-rc.d tool to manage them.

[YOCTO #5169]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f1e62f14..f37cd90 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -505,12 +505,12 @@ rootfs_uninstall_unneeded () {
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
 		if [ -z "$(delayed_postinsts)" ]; then
 			# All packages were successfully configured.
-			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
+			# base-passwd, run-postinsts are no further use, remove them now
 			remove_run_postinsts=false
 			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
 				remove_run_postinsts=true
 			fi
-			rootfs_uninstall_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
+			rootfs_uninstall_packages base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
 
 			# Need to remove rc.d files for run-postinsts by hand since opkg won't
 			# call postrm scripts in offline root mode.
-- 
1.7.9.5


