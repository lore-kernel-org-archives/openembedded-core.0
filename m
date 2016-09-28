Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BAEE560079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:05:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2016 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,410,1470726000"; d="scan'208";a="1063509435"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2016 09:05:19 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 11:06:10 -0500
Message-Id: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: 00moses.alexander00@gmail.com
Subject: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 16:05:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SRC_URI was changed to point gentoo distfiles because now Oracle
request authorization for download the source code [1], there are no changes
in the LICENSE since version 6.0.20 when the LICENSE changes to AGPL-3
[2], also the md5sum was review to be sure that is the same.

This minor upgrade fix an issue related to multiple rpm instances querying
the database [3].

The bugfixes related are,

- Fixed a bug that may lead to a crash when opening multiple environments
in a multi-threaded program.
- Fixed a bug where closing a panic environment raised access violation
  and crashed the program.

For see the complete list of changes mostly bugfixes between 6.0.30 and 6.0.35 [4].

[1] http://download.oracle.com/otn/berkeley-db/db-6.0.35.tar.gz
[2] http://download.oracle.com/otndocs/products/berkeleydb/html/changelog_6_0.html#idp509784
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10157#c0
[4] http://download.oracle.com/otndocs/products/berkeleydb/html/changelog_6_0.html#idp503384

[YOCTO #10157]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-support/db/{db_6.0.30.bb => db_6.0.35.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/db/{db_6.0.30.bb => db_6.0.35.bb} (95%)

diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.35.bb
similarity index 95%
rename from meta/recipes-support/db/db_6.0.30.bb
rename to meta/recipes-support/db/db_6.0.35.bb
index 072cbdf..32afbe8 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.35.bb
@@ -18,16 +18,15 @@ RCONFLICTS_${PN} = "db3"
 PR = "r1"
 
 # Note, when upgraded to 6.1.x, a patch in RPM will need to be removed to activate db 6.1 support.
-
-SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz \
+SRC_URI = "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
            file://arm-thumb-mutex_db5.patch \
            file://fix-parallel-build.patch \
            file://Makefile-let-libso_target-depend-on-bt_rec.patch \
            file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
            "
 
-SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
-SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
+SRC_URI[md5sum] = "c65a4d3e930a116abaaf69edfc697f25"
+SRC_URI[sha256sum] = "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5ad6354a98eeedb825de55"
 
 # Exclude NC versions which lack AES encryption
 UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
-- 
2.1.4


