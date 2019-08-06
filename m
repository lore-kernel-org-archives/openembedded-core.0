Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB647F220
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 17:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x76HVDpe018555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2019 10:31:24 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 10:31:03 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 472ECAA4816;
	Tue,  6 Aug 2019 10:31:02 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 10:31:01 -0700
Message-ID: <20190806173101.28671-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] sqlite3: Always build sqlite3-native with zlib
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
X-List-Received-Date: Tue, 06 Aug 2019 17:31:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The build of sqlite3-native is not fully deterministic.  There is some
corner case as shown with the recent pseudo commit where the sqlite3
will sometimes link against zlib.  It is possible that in a build with
sstate that since the zlib is not listed, that pseudo-native will fail
to build because it calls the pkg-config to get the link arguments for
sqlite3 and will ultimately try to link against zlib.

===  As observed on the YP Autobuilder ===
/pseudo-native/1.9.0+gitAUTOINC+060058bb29-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=TOPDIR/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 TOPDIR/tmp/work/x86_64-linux/pseudo-native/1.9.0+gitAUTOINC+060058bb29-r0/recipe-sysroot-native/usr/lib/libsqlite3.a -lz -lm -ldl -lpthread -lpthread -ldl -lpthread
TOPDIR//tmp/home/hosttoolspokybuild//yoctold-:worker/ qemuarmcannot/build /buildfind/ tmp/-hosttoolslz/ld
: cannot find -lz
======

The simple fix is to depend to the zlib-native which will only impact
the sqlite3-native build, and then deterministically complete all the
dependencies for pseudo-native.  For a target build the host native
library is ignored as usual.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index daf3db5e9f..2e48f303ee 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -2,6 +2,8 @@ SUMMARY = "Embeddable SQL database engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 
+DEPENDS = "zlib-native"
+
 PE = "3"
 
 def sqlite_download_version(d):
-- 
2.21.0


