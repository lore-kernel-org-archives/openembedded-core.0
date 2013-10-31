Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9A97C6D3C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 18:59:52 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c1so1566638eek.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vgTd3XqHT9Y8/M8VLotUVmNp47hKZDaH1GdC+fcAJ7E=;
	b=RbdeQvX7eBo8z1CFjDQBEKOhawiqcad9PjmhGyF2Cy+vrHLaQh4WQfZaqY/oIo1ceo
	XTWgYT0Uyo8ir3xSBJg+KSIqo4TyZKQGtD6Zg1UBSILg6gMoTd7fEkYXLCC/ILVtTfkW
	duNipK/J0CPBPH7XPDCYWHLnJMEv6R3F+04iWsOfHo+iHhnttVhKYjNE4NG0v9RKnbfh
	7v7F9+v/woxEHSSp8iCxdNY4ZsAmsas7EdCNqe6CrjHvs5yNE9UShlVHLyKt8EU9EKW4
	W4pUk/f5aSvEZdrq1phT4LCiTgq44dmiDZNqPi3RmMUvFpacf5kDcDyreXi4j4sMendg
	CKFA==
X-Received: by 10.15.95.9 with SMTP id bc9mr725807eeb.97.1383245993732;
	Thu, 31 Oct 2013 11:59:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm12156566eeu.4.2013.10.31.11.59.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 11:59:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 19:59:54 +0100
Message-Id: <1383245994-12878-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] db: Fix build with high PARALLEL_MAKE
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
X-List-Received-Date: Thu, 31 Oct 2013 18:59:53 -0000

* sometimes it fails with:
  libtool: link: `util_log.lo' is not a valid libtool object
  make: *** [db_replicate] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/db/db/fix-parallel-build.patch | 19 +++++++++++++++++++
 meta/recipes-support/db/db_5.3.21.bb                |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/db/db/fix-parallel-build.patch

diff --git a/meta/recipes-support/db/db/fix-parallel-build.patch b/meta/recipes-support/db/db/fix-parallel-build.patch
new file mode 100644
index 0000000..2c7f1e1
--- /dev/null
+++ b/meta/recipes-support/db/db/fix-parallel-build.patch
@@ -0,0 +1,19 @@
+With higher paralelism it sometimes fails with:
+libtool: link: `util_log.lo' is not a valid libtool object
+make: *** [db_replicate] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- dist.orig/Makefile.in	2012-05-11 19:57:48.000000000 +0200
++++ dist/Makefile.in	2013-10-31 18:17:11.875532522 +0100
+@@ -1034,7 +1034,7 @@
+ 	    db_recover@o@ util_sig@o@ $(DEF_LIB) $(LIBS)
+ 	$(POSTLINK) $@
+ 
+-db_replicate: db_replicate@o@ util_sig@o@ $(DEF_LIB)
++db_replicate: db_replicate@o@ util_log@o@ util_sig@o@ $(DEF_LIB)
+ 	$(CCLINK) -o $@ $(LDFLAGS) \
+ 	    db_replicate@o@ util_log@o@ util_sig@o@ $(DEF_LIB) $(LIBS)
+ 	$(POSTLINK) $@
diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
index 2265a9c..328f9db 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -16,7 +16,8 @@ VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
+SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
+            file://fix-parallel-build.patch"
 
 SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
 SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
-- 
1.8.4.2


