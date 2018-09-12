Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50C18796E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:40:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C9enJO008153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:40:49 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 02:40:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2018 17:40:47 +0800
Message-ID: <1536745247-187023-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] apr-util: fix ptest fail problem
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
X-List-Received-Date: Wed, 12 Sep 2018 09:40:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Test suite test_dbm failed after gdbm upgrtade to 13.1,
from 13.1, return value of some function are changed.

* gdbm_fetch, gdbm_firstkey, and gdbm_nextkey behavior

If the requested key was not found, these functions return datum with
dptr pointing to NULL and set gdbm_errno to GDBM_ITEM_NOT_FOUND (in
prior releases, gdbm_errno was set to GDBM_NO_ERROR),

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apr-util/0001-Fix-error-handling-in-gdbm.patch | 135 +++++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.1.bb         |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch

diff --git a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
new file mode 100644
index 0000000..5d4855d
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
@@ -0,0 +1,135 @@
+From 6b638fa9afbeb54dfa19378e391465a5284ce1ad Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 12 Sep 2018 17:16:36 +0800
+Subject: [PATCH] Fix error handling in gdbm
+
+Only check for gdbm_errno if the return value of the called gdbm_*
+function says so. This fixes apr-util with gdbm 1.14, which does not
+seem to always reset gdbm_errno.
+
+Also make the gdbm driver return error codes starting with
+APR_OS_START_USEERR instead of always returning APR_EGENERAL. This is
+what the berkleydb driver already does.
+
+Also ensure that dsize is 0 if dptr == NULL.
+
+Upstream-Stauts: Backport[https://svn.apache.org/viewvc?
+view=revision&amp;revision=1825311]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dbm/apr_dbm_gdbm.c | 47 +++++++++++++++++++++++++++++------------------
+ 1 file changed, 29 insertions(+), 18 deletions(-)
+
+diff --git a/dbm/apr_dbm_gdbm.c b/dbm/apr_dbm_gdbm.c
+index 749447a..1c86327 100644
+--- a/dbm/apr_dbm_gdbm.c
++++ b/dbm/apr_dbm_gdbm.c
+@@ -36,13 +36,25 @@
+ static apr_status_t g2s(int gerr)
+ {
+     if (gerr == -1) {
+-        /* ### need to fix this */
+-        return APR_EGENERAL;
++        if (gdbm_errno == GDBM_NO_ERROR)
++           return APR_SUCCESS;
++        return APR_OS_START_USEERR + gdbm_errno;
+     }
+ 
+     return APR_SUCCESS;
+ }
+ 
++static apr_status_t gdat2s(datum d)
++{
++    if (d.dptr == NULL) {
++        if (gdbm_errno == GDBM_NO_ERROR || gdbm_errno == GDBM_ITEM_NOT_FOUND)
++           return APR_SUCCESS;
++        return APR_OS_START_USEERR + gdbm_errno;
++   }
++
++    return APR_SUCCESS;
++}
++
+ static apr_status_t datum_cleanup(void *dptr)
+ {
+     if (dptr)
+@@ -53,22 +65,15 @@ static apr_status_t datum_cleanup(void *dptr)
+ 
+ static apr_status_t set_error(apr_dbm_t *dbm, apr_status_t dbm_said)
+ {
+-    apr_status_t rv = APR_SUCCESS;
+ 
+-    /* ### ignore whatever the DBM said (dbm_said); ask it explicitly */
++    dbm->errcode = dbm_said;  
+ 
+-    if ((dbm->errcode = gdbm_errno) == GDBM_NO_ERROR) {
++    if (dbm_said == APR_SUCCESS)
+         dbm->errmsg = NULL;
+-    }
+-    else {
+-        dbm->errmsg = gdbm_strerror(gdbm_errno);
+-        rv = APR_EGENERAL;        /* ### need something better */
+-    }
+-
+-    /* captured it. clear it now. */
+-    gdbm_errno = GDBM_NO_ERROR;
++    else
++        dbm->errmsg = gdbm_strerror(dbm_said - APR_OS_START_USEERR);
+ 
+-    return rv;
++    return dbm_said;
+ }
+ 
+ /* --------------------------------------------------------------------------
+@@ -107,7 +112,7 @@ static apr_status_t vt_gdbm_open(apr_dbm_t **pdb, const char *pathname,
+                      NULL);
+ 
+     if (file == NULL)
+-        return APR_EGENERAL;      /* ### need a better error */
++        return APR_OS_START_USEERR + gdbm_errno;   /* ### need a better error */
+ 
+     /* we have an open database... return it */
+     *pdb = apr_pcalloc(pool, sizeof(**pdb));
+@@ -141,10 +146,12 @@ static apr_status_t vt_gdbm_fetch(apr_dbm_t *dbm, apr_datum_t key,
+     if (pvalue->dptr)
+         apr_pool_cleanup_register(dbm->pool, pvalue->dptr, datum_cleanup,
+                                   apr_pool_cleanup_null);
++    else
++       pvalue->dsize = 0;
+ 
+     /* store the error info into DBM, and return a status code. Also, note
+        that *pvalue should have been cleared on error. */
+-    return set_error(dbm, APR_SUCCESS);
++    return set_error(dbm, gdat2s(rd));
+ }
+ 
+ static apr_status_t vt_gdbm_store(apr_dbm_t *dbm, apr_datum_t key,
+@@ -201,9 +208,11 @@ static apr_status_t vt_gdbm_firstkey(apr_dbm_t *dbm, apr_datum_t *pkey)
+     if (pkey->dptr)
+         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
+                                   apr_pool_cleanup_null);
++    else
++        pkey->dsize = 0;
+ 
+     /* store any error info into DBM, and return a status code. */
+-    return set_error(dbm, APR_SUCCESS);
++    return set_error(dbm, gdat2s(rd));
+ }
+ 
+ static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
+@@ -221,9 +230,11 @@ static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
+     if (pkey->dptr)
+         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
+                                   apr_pool_cleanup_null);
++    else
++       pkey->dsize = 0;
+ 
+     /* store any error info into DBM, and return a status code. */
+-    return set_error(dbm, APR_SUCCESS);
++    return set_error(dbm, gdat2s(rd));
+ }
+ 
+ static void vt_gdbm_freedatum(apr_dbm_t *dbm, apr_datum_t data)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 88b4300..12d71cb 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://run-ptest \
+           file://0001-Fix-error-handling-in-gdbm.patch \
 "
 
 SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
-- 
2.7.4


