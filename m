Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A027F77085
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:41:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 07 Sep 2016 14:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="165579058"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2016 14:41:29 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 14:42:39 -0700
Message-Id: <1473284559-187471-3-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
References: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
Subject: [PATCH 2/2][PROPOSED] libcap: remove dependency on attr
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
X-List-Received-Date: Wed, 07 Sep 2016 21:41:30 -0000

85f38a573fc47472ab792e813b6f6b6f0b1df112 in libcap drops
this dependency. Not seeing much necessity of using
EXTRA_OECONF (which doesn't seem effective) for the left,
we purge these code in libcap recipe.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
Limited test is performed by building this recipe individually.
Refer to the cover letter before merge.

 meta/recipes-support/libcap/libcap_2.25.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index bc29310..3b7876a 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -27,11 +27,8 @@ do_configure() {
 	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-native ??= ""
 
-PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
-
 EXTRA_OEMAKE = " \
   INDENT=  \
   lib=${@os.path.basename('${libdir}')} \
@@ -46,12 +43,11 @@ EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
 CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
 do_compile() {
-	oe_runmake ${EXTRA_OECONF}
+	oe_runmake
 }
 
 do_install() {
 	oe_runmake install \
-		${EXTRA_OECONF} \
 		DESTDIR="${D}" \
 		prefix="${prefix}" \
 		SBINDIR="${sbindir}"
-- 
2.7.4


