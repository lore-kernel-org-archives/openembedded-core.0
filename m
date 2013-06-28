Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F2F3961A45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:25:34 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 12:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,961,1363158000"; d="scan'208";a="261518939"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.119])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2013 12:23:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 12:23:46 -0700
Message-Id: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 19:25:35 -0000

This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
defined in the security_flags.inc and override the empty default.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62a3936..72e1a78 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -493,7 +493,8 @@ export TARGET_CPPFLAGS = ""
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
-export CFLAGS = "${TARGET_CFLAGS}"
+SECURITY_CFLAGS ?= ""
+export CFLAGS = "${TARGET_CFLAGS} ${SECURITY_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
@@ -523,7 +524,8 @@ LINKER_HASH_STYLE_mips64 = "sysv"
 LINKER_HASH_STYLE_mips64el = "sysv"
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
-export LDFLAGS = "${TARGET_LDFLAGS}"
+SECURITY_LDFLAGS ?= ""
+export LDFLAGS = "${TARGET_LDFLAGS} ${SECURITY_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
-- 
1.8.1.4


