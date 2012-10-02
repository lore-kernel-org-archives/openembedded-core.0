Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TJ9sk-0003Db-Uh
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 23:19:59 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q92L2jjp019619
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 16:02:46 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q92L2iMB013735
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2012 02:32:45 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Oct 2012 02:32:44 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q92L2fWu030395;
	Wed, 3 Oct 2012 02:32:43 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Oct 2012 16:30:10 -0500
Message-ID: <1349213410-14141-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [for-denzil][PATCH] libtool: Add missing DEPENDS on libtool-cross
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
X-List-Received-Date: Tue, 02 Oct 2012 21:19:59 -0000
Content-Type: text/plain

* When building with 24 bitbake threads on my system I observed
  errors like the following:
    | configure.ac:199: error: LT_LANG: unsupported language: "Go"
    | <tmpdir>/work/armv7a-vfp-neon-oe-linux-gnueabi/libtool-2.4.2-r3.0/libtool-2.4.2/aclocal-copy/libtool.m4:768: LT_LANG is expanded from...
    | configure.ac:199: the top level
    | autom4te: m4 failed with exit status: 1
* This could be found by doing a clean build.  If a build had
  already been performed then often just cleaning the libtool
  package and rebuilding it would resolve the issue.
* Adding a DEPENDS on libtool-cross resolves this issue with a
  clean build.
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.2.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
index a2eb4ea..f376b67 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -1,6 +1,8 @@
 require libtool-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+DEPENDS += "libtool-cross"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
-- 
1.7.0.4



