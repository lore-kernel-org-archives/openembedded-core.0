Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 834BD796D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C9bPNO008144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:37:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 02:37:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2018 17:37:23 +0800
Message-ID: <1536745043-80175-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] apr-util: fix ptest fail problem
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
X-List-Received-Date: Wed, 12 Sep 2018 09:37:24 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

test_dbm test suite failed since upgrade of gdbm,
from gdbm 13.1, return value changed for some function.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apr-util/0001-apr-util-fix-ptest-fail.patch    | 44 ++++++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.1.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch

diff --git a/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch b/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch
new file mode 100644
index 0000000..316d54c
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch
@@ -0,0 +1,44 @@
+From 665ac3c36247218da7b61b977b3aeede5d6ec9a2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 12 Sep 2018 15:30:41 +0800
+Subject: [PATCH] apr-util: fix ptest fail
+
+Test suite test_dbm failed when gdbm is tested. From gdbm 13.1, have below
+change:
+
+  * gdbm_fetch, gdbm_firstkey, and gdbm_nextkey behavior
+
+  If the requested key was not found, these functions return datum with
+  dptr pointing to NULL and set gdbm_errno to GDBM_ITEM_NOT_FOUND (in 
+  prior releases, gdbm_errno was set to GDBM_NO_ERROR)
+
+in this place, we don't take GDBM_ITEM_NOT_FOUND as error, still should
+return success, so make this patch.
+
+Upstream-Status: Inappropriate
+- This patch is not appropriate for upstream, checked 1.6.x development
+  branch, this part have changed to take dbm_said directly. so after apr-util
+  is upgraded in the future, maybe this patch need to dropped.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dbm/apr_dbm_gdbm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dbm/apr_dbm_gdbm.c b/dbm/apr_dbm_gdbm.c
+index 749447a..94e3a86 100644
+--- a/dbm/apr_dbm_gdbm.c
++++ b/dbm/apr_dbm_gdbm.c
+@@ -57,7 +57,8 @@ static apr_status_t set_error(apr_dbm_t *dbm, apr_status_t dbm_said)
+ 
+     /* ### ignore whatever the DBM said (dbm_said); ask it explicitly */
+ 
+-    if ((dbm->errcode = gdbm_errno) == GDBM_NO_ERROR) {
++    dbm->errcode = gdbm_errno;
++    if (dbm->errcode == GDBM_NO_ERROR || dbm->errcode == GDBM_ITEM_NOT_FOUND) {
+         dbm->errmsg = NULL;
+     }
+     else {
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 88b4300..98f9db6 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://run-ptest \
+           file://0001-apr-util-fix-ptest-fail.patch \
 "
 
 SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
-- 
2.7.4


