Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35CE773C73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 07:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t317r4Bh016902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Apr 2015 00:53:04 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Apr 2015 00:53:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Apr 2015 00:53:01 -0700
Message-ID: <1a276d38dbd006e61e734e2e26bee19923e1df12.1427874748.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427874748.git.liezhi.yang@windriver.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] db: fix parallel issue
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
X-List-Received-Date: Wed, 01 Apr 2015 07:53:03 -0000
Content-Type: text/plain

Fixed parallel issue:
libtool: link: `bt_rec.lo' is not a valid libtool object
Makefile:867: recipe for target 'libdb-6.0.la' failed
make: *** [libdb-6.0.la] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...akefile-let-libso_target-depend-on-bt_rec.patch |   30 ++++++++++++++++++++
 meta/recipes-support/db/db_6.0.30.bb               |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch

diff --git a/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch b/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
new file mode 100644
index 0000000..329bff5
--- /dev/null
+++ b/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
@@ -0,0 +1,30 @@
+From c640ff9340f358a00835816d0fea03d27a7be978 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 31 Mar 2015 00:56:44 -0700
+Subject: [PATCH] Makefile: let libso_target depend on bt_rec
+
+Fixed parallel issue:
+libtool: link: `bt_rec.lo' is not a valid libtool object
+Makefile:867: recipe for target 'libdb-6.0.la' failed
+make: *** [libdb-6.0.la] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e451f70..0a42375 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -863,7 +863,7 @@ $(libdb_version): $(C_OBJS)
+ 	$(LN) -s $(libdb_version) $(libdb)
+ 
+ # Shared C library.
+-$(libso_target): $(C_OBJS)
++$(libso_target): $(C_OBJS) bt_rec@o@
+ 	$(SOLINK) $(SOFLAGS) $(LDFLAGS) -o $@ $(C_OBJS) \
+ 		$(LIBCSO_LIBS)
+ 	$(RM) $(libdb)
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 47fb296..9eae5c7 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -18,6 +18,7 @@ RCONFLICTS_${PN} = "db3"
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://fix-parallel-build.patch \
+            file://Makefile-let-libso_target-depend-on-bt_rec.patch \
            "
 
 SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
-- 
1.7.9.5


