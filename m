Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D21AC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3128.1675840911843332213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ppSfVu0x;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so731102wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aCw/CPOtBFP4YLJ/1rl2pCX1p4h566KCrx48S2TR14=;
        b=ppSfVu0xIAChTv1jbkC3LLqoYzqL7utBdN50R3vWoJG811l91CH4lj5cEX2UsY1qeB
         /3KgObtcX8cxsc3m+IdoVD7QtXZX7zay6SkmGOKzMDkFVxIvLt0HAW0plYJuQlauNs8i
         7wFPuC4FtHHuzCxPAGfTZUF7UeSOZqXZAoh615ZsVGHoI3QqlPCXVyhmdlYeufjSz6zu
         rSgMz2I5kyYql/C6ghzGI8Xi4fuTgtb3NDLhqZfM2f0B4WOXdE/9eqqODnNIRBmGkFYi
         qc8oWWzYfSnAl69XOI/+dYIFM5j1V/ZeKiE1iMlRVKNc93AkarVxM3RFMbCbvIbl7rNs
         DwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aCw/CPOtBFP4YLJ/1rl2pCX1p4h566KCrx48S2TR14=;
        b=MGkm6TXcgchuakyoL91jhnx5hKj2NOtfdkRP7V2uvMr+Qb/S5OF3BKeLR/r7uF47N2
         BKLzB5H/PGcrmSR7MVsyIhlRlAwXiyp8dHN0pFntw8erep8zfSuig4kIKUvlZXzDs3pJ
         OqQrg3tYIsqv3B4zfeKSMDubMJ6Py7bvYxPcBphtZmYCZupAP9/RCCMNtrfMTSBjSf6u
         JdCXd+o1Rgci0kpp70Kc6fMiut8TGKizW79HHdyZWduDklBgaX8oQW3ziYbTdSgHO6xM
         2cvR1/b+vP4e67ehFyReiX/YxwzTSTWf8pZDHlSx+QRKTXxswDdrsXp6IG1dMMqXqgSt
         gdYQ==
X-Gm-Message-State: AO0yUKU347Hv0PB2oiezeEe/o0M4XEJXc/Dx7jm98u2+D2W2DMg175jb
	2jaiCCWypvPhM6vC43T65P08jjoA95A=
X-Google-Smtp-Source: AK7set+1A+tqt5DaHioJ1SgwIkrCf9dp3YWJfzZzmaYTuXI2C9RdA+xRwr86hdGpbrQ7cFlYkxDgww==
X-Received: by 2002:a05:600c:a295:b0:3da:1e35:dfec with SMTP id hu21-20020a05600ca29500b003da1e35dfecmr5499753wmb.4.1675840912644;
        Tue, 07 Feb 2023 23:21:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/52] apr-util: update 1.6.1 -> 1.6.3
Date: Wed,  8 Feb 2023 08:21:00 +0100
Message-Id: <20230208072143.2930292-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176848

Drop backport.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-error-handling-in-gdbm.patch     | 134 ------------------
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   6 +-
 2 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
 rename meta/recipes-support/apr/{apr-util_1.6.1.bb => apr-util_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
deleted file mode 100644
index 6f27876a7f..0000000000
--- a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 6b638fa9afbeb54dfa19378e391465a5284ce1ad Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 12 Sep 2018 17:16:36 +0800
-Subject: [PATCH] Fix error handling in gdbm
-
-Only check for gdbm_errno if the return value of the called gdbm_*
-function says so. This fixes apr-util with gdbm 1.14, which does not
-seem to always reset gdbm_errno.
-
-Also make the gdbm driver return error codes starting with
-APR_OS_START_USEERR instead of always returning APR_EGENERAL. This is
-what the berkleydb driver already does.
-
-Also ensure that dsize is 0 if dptr == NULL.
-
-Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&amp;revision=1825311]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dbm/apr_dbm_gdbm.c | 47 +++++++++++++++++++++++++++++------------------
- 1 file changed, 29 insertions(+), 18 deletions(-)
-
-diff --git a/dbm/apr_dbm_gdbm.c b/dbm/apr_dbm_gdbm.c
-index 749447a..1c86327 100644
---- a/dbm/apr_dbm_gdbm.c
-+++ b/dbm/apr_dbm_gdbm.c
-@@ -36,13 +36,25 @@
- static apr_status_t g2s(int gerr)
- {
-     if (gerr == -1) {
--        /* ### need to fix this */
--        return APR_EGENERAL;
-+        if (gdbm_errno == GDBM_NO_ERROR)
-+           return APR_SUCCESS;
-+        return APR_OS_START_USEERR + gdbm_errno;
-     }
- 
-     return APR_SUCCESS;
- }
- 
-+static apr_status_t gdat2s(datum d)
-+{
-+    if (d.dptr == NULL) {
-+        if (gdbm_errno == GDBM_NO_ERROR || gdbm_errno == GDBM_ITEM_NOT_FOUND)
-+           return APR_SUCCESS;
-+        return APR_OS_START_USEERR + gdbm_errno;
-+   }
-+
-+    return APR_SUCCESS;
-+}
-+
- static apr_status_t datum_cleanup(void *dptr)
- {
-     if (dptr)
-@@ -53,22 +65,15 @@ static apr_status_t datum_cleanup(void *dptr)
- 
- static apr_status_t set_error(apr_dbm_t *dbm, apr_status_t dbm_said)
- {
--    apr_status_t rv = APR_SUCCESS;
- 
--    /* ### ignore whatever the DBM said (dbm_said); ask it explicitly */
-+    dbm->errcode = dbm_said;  
- 
--    if ((dbm->errcode = gdbm_errno) == GDBM_NO_ERROR) {
-+    if (dbm_said == APR_SUCCESS)
-         dbm->errmsg = NULL;
--    }
--    else {
--        dbm->errmsg = gdbm_strerror(gdbm_errno);
--        rv = APR_EGENERAL;        /* ### need something better */
--    }
--
--    /* captured it. clear it now. */
--    gdbm_errno = GDBM_NO_ERROR;
-+    else
-+        dbm->errmsg = gdbm_strerror(dbm_said - APR_OS_START_USEERR);
- 
--    return rv;
-+    return dbm_said;
- }
- 
- /* --------------------------------------------------------------------------
-@@ -107,7 +112,7 @@ static apr_status_t vt_gdbm_open(apr_dbm_t **pdb, const char *pathname,
-                      NULL);
- 
-     if (file == NULL)
--        return APR_EGENERAL;      /* ### need a better error */
-+        return APR_OS_START_USEERR + gdbm_errno;   /* ### need a better error */
- 
-     /* we have an open database... return it */
-     *pdb = apr_pcalloc(pool, sizeof(**pdb));
-@@ -141,10 +146,12 @@ static apr_status_t vt_gdbm_fetch(apr_dbm_t *dbm, apr_datum_t key,
-     if (pvalue->dptr)
-         apr_pool_cleanup_register(dbm->pool, pvalue->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+       pvalue->dsize = 0;
- 
-     /* store the error info into DBM, and return a status code. Also, note
-        that *pvalue should have been cleared on error. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static apr_status_t vt_gdbm_store(apr_dbm_t *dbm, apr_datum_t key,
-@@ -201,9 +208,11 @@ static apr_status_t vt_gdbm_firstkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-     if (pkey->dptr)
-         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+        pkey->dsize = 0;
- 
-     /* store any error info into DBM, and return a status code. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-@@ -221,9 +230,11 @@ static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-     if (pkey->dptr)
-         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+       pkey->dsize = 0;
- 
-     /* store any error info into DBM, and return a status code. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static void vt_gdbm_freedatum(apr_dbm_t *dbm, apr_datum_t data)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/apr/apr-util_1.6.1.bb
rename to meta/recipes-support/apr/apr-util_1.6.3.bb
index b851d46351..7c6fcc699b 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -13,11 +13,9 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://run-ptest \
-           file://0001-Fix-error-handling-in-gdbm.patch \
-"
+           "
 
-SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
-SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
+SRC_URI[sha256sum] = "2b74d8932703826862ca305b094eef2983c27b39d5c9414442e9976a9acf1983"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
-- 
2.30.2


