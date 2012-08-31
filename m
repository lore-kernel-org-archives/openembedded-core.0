Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7Z6k-0002R9-V6
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:50:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2012 14:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,349,1344236400"; d="scan'208";a="216474176"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.251])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2012 14:38:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2012 14:38:12 -0700
Message-Id: <1346449092-22410-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] eglibc: remove duplicate rquota files
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
X-List-Received-Date: Fri, 31 Aug 2012 21:50:31 -0000

The /usr/include/rpcsvc/rquota* files are provided by both eglibc
and the quota package. Quota's version is newer and a superset of
eglibc's

[YOCTO #238]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    1 +
 meta/recipes-core/eglibc/eglibc_2.16.bb     |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index af78456..056ef23 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -86,6 +86,7 @@ do_install_append () {
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
 	fi
+	rm -rf ${D}${includedir}/rpcsvc/rquota*
 }
 
 do_install_locale () {
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 69803f7..c6fde6e 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native"
-PR = "r6"
+PR = "r7"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.7.6



