Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F75C76FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:54:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2015 15:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,589,1437462000"; d="scan'208";a="797537932"
Received: from afshjern.zpn.intel.com ([10.219.128.51])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2015 15:54:50 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 17:54:11 -0500
Message-Id: <1443221651-7364-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
Cc: randy.e.witt@intel.com
Subject: [PATCH] AB random failure: libpcre-native split_and_strip
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
X-List-Received-Date: Fri, 25 Sep 2015 22:54:53 -0000

Error handling: adding file-native as a dependency to libpre recipe
should guarantee a consistent, and more importantly POSIX-compliant
version of the "file" command is always used when checking the file
"pcre-config" within the isELF function in staging.bbclass.

Following the POSIX behavior, file returns 0 and continues, when an
error is found while checking a file.

Debug: in cases where file may still fail, the resulting error will
now be logged along with the split_and_strip_files failure.

[YOCTO #8144]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/staging.bbclass                 | 2 +-
 meta/recipes-support/libpcre/libpcre_8.37.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 967eddd..554c2e4 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -77,7 +77,7 @@ python sysroot_strip () {
         ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            bb.error("split_and_strip_files: 'file %s' failed\nError: %s" % (path, result))
             return type
 
         # Not stripped
diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
index bcfc9e9..1a2024d 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260ee
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES += "pcre"
-DEPENDS += "bzip2 zlib"
+DEPENDS += "bzip2 zlib file-native"
 
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 
-- 
2.5.3


