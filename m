Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98C2B60DF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:48:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAI1mWAw001998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:48:32 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 17 Nov 2015 17:48:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Nov 2015 17:48:31 -0800
Message-ID: <e757274a723b3a0a255ab8dc19d7d6ee1f054cfc.1447811273.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447811273.git.liezhi.yang@windriver.com>
References: <cover.1447811273.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] db: fix race issue for libdb-6.0.la
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
X-List-Received-Date: Wed, 18 Nov 2015 01:48:32 -0000
Content-Type: text/plain

Fixed:
libtool: link: `os_map.lo' is not a valid libtool object
Makefile:867: recipe for target 'libdb-6.0.la' failed
---
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   32 ++++++++++++++++++++
 meta/recipes-support/db/db_6.0.30.bb               |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch

diff --git a/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch b/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
new file mode 100644
index 0000000..d4c6bb8
--- /dev/null
+++ b/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
@@ -0,0 +1,32 @@
+From 2902dda6e3f7b2cd5796a96af20deece610e2eb9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 16 Nov 2015 22:20:49 -0800
+Subject: [PATCH] build_unix/Makefile: let libdb-6.0.la depend os_map.lo
+
+Fixed parallel issue:
+libtool: link: `os_map.lo' is not a valid libtool object
+Makefile:867: recipe for target 'libdb-6.0.la' failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ dist/Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dist/Makefile.in b/dist/Makefile.in
+index 0a42375..d9e05b9 100644
+--- a/dist/Makefile.in
++++ b/dist/Makefile.in
+@@ -863,7 +863,7 @@ $(libdb_version): $(C_OBJS)
+ 	$(LN) -s $(libdb_version) $(libdb)
+ 
+ # Shared C library.
+-$(libso_target): $(C_OBJS) bt_rec@o@
++$(libso_target): $(C_OBJS) bt_rec@o@ os_map@o@
+ 	$(SOLINK) $(SOFLAGS) $(LDFLAGS) -o $@ $(C_OBJS) \
+ 		$(LIBCSO_LIBS)
+ 	$(RM) $(libdb)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index d49df62..ccdb6bd 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://fix-parallel-build.patch \
             file://Makefile-let-libso_target-depend-on-bt_rec.patch \
+            file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch;patchdir=.. \
            "
 
 SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
-- 
1.7.9.5


