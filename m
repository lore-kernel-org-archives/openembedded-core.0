Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB6817765F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 15:21:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GFLAHU010878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Mar 2017 08:21:11 -0700
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 08:21:10 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 11:20:58 -0400
Message-ID: <1489677658-10114-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] package_manager: fix "exlcude" vs. "exclude" typo
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
X-List-Received-Date: Thu, 16 Mar 2017 15:21:22 -0000
Content-Type: text/plain

Which results in:

 --------------------------------
      0557:        package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
  *** 0558:        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exlcude.split() if package_exclude else [])
      0559:
      0560:        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
      0561:                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
      0562:                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
 Exception: NameError: name 'package_exlcude' is not defined
 ERROR: cube-builder-initramfs-1.0-r0 do_rootfs: Function failed: do_rootfs
 ---------------------------------

Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d51609189d04..c92ed936c137 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -555,7 +555,7 @@ class RpmPM(PackageManager):
 
         bad_recommendations = self.d.getVar('BAD_RECOMMENDATIONS')
         package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
-        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exlcude.split() if package_exclude else [])
+        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exclude.split() if package_exclude else [])
 
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-- 
2.7.4


