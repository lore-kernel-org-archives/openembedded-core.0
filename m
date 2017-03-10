Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 718E27768A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:40:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2017 02:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="942807407"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Mar 2017 02:40:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 12:39:19 +0200
Message-Id: <20170310103919.24744-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] base-files: do not write the current date into /etc/issue and /etc/issue.net
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
X-List-Received-Date: Fri, 10 Mar 2017 10:40:21 -0000

This is causing a problem in multilib where base-files and lib64/32-base-files
clash because they may have different dates. Also, if the package is coming
from sstate it has an incorrect date anyway.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d1380053115..c7a9e803cb1 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -145,8 +145,9 @@ do_install_basefilesissue () {
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
 		if [ -n "${DISTRO_VERSION}" ]; then
-			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
-			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
+			distro_version_nodate=${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}
+			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue
+			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue.net
 		fi
 		printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
 		echo >> ${D}${sysconfdir}/issue
-- 
2.11.0


