Return-Path: <joe.slater@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id CB2356B3B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 19:34:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7MJYBBe004282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:34:11 -0400 (EDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 12:34:10 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 12:34:04 -0700
Message-ID: <1377200044-16535-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] cronie: add PACKAGECONFIG data
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
X-List-Received-Date: Thu, 22 Aug 2013 19:34:14 -0000
Content-Type: text/plain

We add PACKAGECONFIG[] data for audit and move
the current pam related stuff into it's own entry.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/cronie/cronie_1.4.11.bb |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
index aa1ba39..9d2d30b 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
@@ -14,9 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 
 SECTION = "utils"
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
-PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://fix-out-of-tree-build.patch \
@@ -25,15 +22,21 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://crond_pam_config.patch"
-
+PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
 SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
 SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
 
 inherit autotools update-rc.d useradd
 
-EXTRA_OECONF += "\
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
+
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+
+# yes, no, depends, rdepends
+#
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
+
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
-- 
1.7.3.4


