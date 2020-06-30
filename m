Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.4097.1593541845870703887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 11:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qmkZCq6w;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id j19so3470090pgm.11
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JWbzM+zVwsRcZQyUZ8PeDzlV4L5Aep5+LK+1apzFPI8=;
        b=qmkZCq6w/a+Y3k4xlwwUbIVrlkC2d58yWpI/37E8ngKA1KDSnnZJREz4cx2AJ9sIaI
         L1Hdq1Yr0usfIyVfyDk+vrP3jIlU8O+2VqjIfY/8rg1+mE9Ec3JdVPnNePA8mfeFCxwd
         tzTR1bO23oEyEp95CVo6KH6PRYvP3InsYQC9u5dHyfZd8Rfns3YNYzUOBrWo+bqP3W6f
         jBfphJhPdO+nvrUkhsq6IOsXRdo5wIV8PgaDdj2tMp1kWKuDWR3ZyBxl2B03njAhGm8d
         TVWlSFnXwfvL7ULfqNdBc9PvgmVLsAsGc1bNteHYAPLJBde0i6ZC5s8yCsdczx0UxF9k
         C+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JWbzM+zVwsRcZQyUZ8PeDzlV4L5Aep5+LK+1apzFPI8=;
        b=dzuILONxV+8Z4acR7RB9F+tA6V6HZDSOCLEpeOoPwcwahEG6xZyAQQiWi/uUnAxAAP
         OIomdrLyHPxRkC8xzCgpzJfuQZsXQmLfkDn5xQ1Gya+G9YNvbKjyphD7PIFc7RTt3fe7
         ogl73Cv/GqGUM51utL6OPgj9WaHITk9fpIdFb/g9PUrQ+xh44QFBwuR5K0+iw88otmzy
         vpIHoiwMPTJyKQI0FPtMvvjNG5Tau8SPaUlOtgToeecXOg5upmjK6yvGUxz6qWT8yiY9
         7cE94DuA+72KcSXZueVXOuz+zcnpsO7Xge8B5n3sMqMejv4E2BD3dk0h6GLNUbPKnUJm
         +26A==
X-Gm-Message-State: AOAM531eugz+0lkNMlfE5gIjsVEHVDwEXjvRWmgCzXKIHfTa8CUSDrPy
	kyPPOhAHlJBy1PUC1PO1AOQhn2Q/GPQ=
X-Google-Smtp-Source: ABdhPJyVlin26vx0FaCFKBLeVnTIN14mr2rv+H74vD5R4iBmHeyJ0rqxYnVdxppWFfgYCnME098xPw==
X-Received: by 2002:a62:2702:: with SMTP id n2mr21192649pfn.189.1593541845042;
        Tue, 30 Jun 2020 11:30:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id v62sm3300525pfb.119.2020.06.30.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 11:30:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][v2][PATCH] sqlite3: Security fix for CVE-2020-15358
Date: Tue, 30 Jun 2020 11:30:42 -0700
Message-Id: <20200630183042.3073-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: sqlite.org
MR: 104526
Type: Security Fix
Disposition: Backport from https://www.sqlite.org/src/vinfo/10fa79d00f8091e5?diff=1
ChangeID: a1c012b8c8aecd4970f3ae16686bf25f2376f542
Description:

Affects sqlite < 3.32.3

Fixes CVE CVE-2020-15358

Signed-off-by: Armin Kuster <akuster@mvista.com>

---
v2: Fix patch format
---
 .../sqlite/files/CVE-2020-15358.patch         | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-15358.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-15358.patch b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
new file mode 100644
index 0000000000..086f6ef913
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
@@ -0,0 +1,47 @@
+Fix a defect in the query-flattener optimization identified by ticket [8f157e8010b22af0]. 
+
+Upstream-Status: Backport
+https://www.sqlite.org/src/info/10fa79d00f8091e5
+CVE: CVE-2020-15358
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: sqlite-autoconf-3310100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -18349,6 +18349,7 @@ struct Select {
+ #define SF_WhereBegin    0x0080000 /* Really a WhereBegin() call.  Debug Only */
+ #define SF_WinRewrite    0x0100000 /* Window function rewrite accomplished */
+ #define SF_View          0x0200000 /* SELECT statement is a view */
++#define SF_NoopOrderBy   0x0400000 /* ORDER BY is ignored for this query */
+ 
+ /*
+ ** The results of a SELECT can be distributed in several ways, as defined
+@@ -130607,9 +130608,7 @@ static int multiSelect(
+                           selectOpName(p->op)));
+         rc = sqlite3Select(pParse, p, &uniondest);
+         testcase( rc!=SQLITE_OK );
+-        /* Query flattening in sqlite3Select() might refill p->pOrderBy.
+-        ** Be sure to delete p->pOrderBy, therefore, to avoid a memory leak. */
+-        sqlite3ExprListDelete(db, p->pOrderBy);
++        assert( p->pOrderBy==0 );
+         pDelete = p->pPrior;
+         p->pPrior = pPrior;
+         p->pOrderBy = 0;
+@@ -131958,7 +131957,7 @@ static int flattenSubquery(
+     ** We look at every expression in the outer query and every place we see
+     ** "a" we substitute "x*3" and every place we see "b" we substitute "y+10".
+     */
+-    if( pSub->pOrderBy ){
++    if( pSub->pOrderBy && (pParent->selFlags & SF_NoopOrderBy)==0 ){
+       /* At this point, any non-zero iOrderByCol values indicate that the
+       ** ORDER BY column expression is identical to the iOrderByCol'th
+       ** expression returned by SELECT statement pSub. Since these values
+@@ -133659,6 +133658,7 @@ SQLITE_PRIVATE int sqlite3Select(
+     sqlite3ExprListDelete(db, p->pOrderBy);
+     p->pOrderBy = 0;
+     p->selFlags &= ~SF_Distinct;
++    p->selFlags |= SF_NoopOrderBy;
+   }
+   sqlite3SelectPrep(pParse, p, 0);
+   if( pParse->nErr || db->mallocFailed ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 57a791385c..e5071b48bb 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-9327.patch \
            file://CVE-2020-11656.patch \
            file://CVE-2020-11655.patch \
+           file://CVE-2020-15358.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1

