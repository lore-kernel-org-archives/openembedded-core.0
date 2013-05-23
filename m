Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3CC6A413
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 17:33:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 10:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,729,1363158000"; d="scan'208";a="318512004"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.172])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2013 10:33:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 10:33:49 -0700
Message-Id: <1369330429-14169-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] binutils: the cat should always succeed when building config.cache
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
X-List-Received-Date: Thu, 23 May 2013 17:33:49 -0000

There is a race condition between when the CONFIG_SITE list is generated and
then used here via the cat to create the config.cache and in *all* configure
scripts when reading from CONFIG_SITE.

The race in this case is that the sstate setscene task runs on a package that
contains a site config file (ncurses in this case) and then bitbake decides
that it needs to rebuild and cleans out the site config file, so it existed
for siteinfo_get_files() to find in SITECONFIG_SYSROOTCACHE and then was removed
for the rebuild. When bintuils tried to run the do_configure() task which creates
the binutil's version of config.cache it reads from CONFIG_SITE which now contains
the non-existant site config file. (confused yet ;-)?

Currently the configure script does a test -r to ensure the file is readable
before using it, therefore having the cat succeed regardless of the file being
available is consistent behaviour.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 1e59296..5e78dc0 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -90,7 +90,7 @@ do_configure () {
 #
 	mkdir -p ${B}/build-${BUILD_SYS}
 	for i in ${CONFIG_SITE}; do
-		cat $i >> ${B}/build-${BUILD_SYS}/config.cache
+		cat $i >> ${B}/build-${BUILD_SYS}/config.cache || true
 	done
 }
 
-- 
1.8.1.4


