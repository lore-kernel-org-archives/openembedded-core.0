Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.2574.1593538718337663397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bdRlEOc1;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id i4so9785686pjd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+ciztog5Z77n6RurBhajgoAw6GrQAj5lJdsnVkUr8EM=;
        b=bdRlEOc18EK0T0v930kWGZvQcA8PmJIDC2ocXo5D080++hpDSSz4ttiwMHO41ZJ2gp
         /kf/yuyiICRohZrrtn+FZ/B96cEDOieoQ2w+TnAfrFNGnFG7/jR7veAHlVlvrlm+NZjh
         uiXngEx7AH2HdFVwEdB0rJGVEwBVz6WkCky78TXDyht4PaqDTsihFOCrOUXEHtHFXkS3
         DnJ31IUFh/s6eQLGOogtN7Kciw7SboZvbvO+qL7JK3M1334xrOO68qAunTKbzA/rAJEc
         GRMkr7yt2jsUs1E8aL9VYENC7phz7xFMhRQlnSkKbVxeh6uncyibmLBP8PCf0opGg3JF
         2sQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+ciztog5Z77n6RurBhajgoAw6GrQAj5lJdsnVkUr8EM=;
        b=nwM15Yk8PLfW6ce5HsL6WMa94aB03lSB8Hxg9d0in2vV1x6bdLwARVs3/EqKSrnGCI
         lzVUMsJbzD6q7JuDSDm21EeyMfw2Qxt98WS3NcipDmxTMq/WEsk4cv/ULlTFAL4RVHZ9
         W31PcH62zjlQqNf6pbJmAU2mG18lxgCIWGXT8DHG7kemYJoRkMMWJ0mo7rO3GW7ne6EM
         n+XdHA99w138dYv4pecxcxsTTbnFAtyM/U5Ok1voH+m9TtpmG+Bh0u/gdxntHfXrmqv1
         UtWqtDfR/CM84RWVRY4ho1ZOGaWx2PANBihg698Vey3EXbewu9ejsOY9rKWXr9t7dTSf
         aM+Q==
X-Gm-Message-State: AOAM532LTFiWzt2r7N1wMUOjJJ9uwVfTePeuwLdQV6zXAE+u0MkXa3wj
	CJeWLe/PwRjsSy5gpO3qznPlsDKvl5c=
X-Google-Smtp-Source: ABdhPJyvKor/dgVbDX7hSDOFTFa5U7TAr83qzhfXemMktPoJUibkmpyhSNZ+yLsW++v6Khkqtgxb4w==
X-Received: by 2002:a17:902:aa84:: with SMTP id d4mr18380186plr.208.1593538717337;
        Tue, 30 Jun 2020 10:38:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id v28sm3261690pgc.44.2020.06.30.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:38:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] sqlite3: Security fix for CVE-2020-15358
Date: Tue, 30 Jun 2020 10:38:35 -0700
Message-Id: <20200630173835.14484-1-akuster808@gmail.com>
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
 .../sqlite/files/CVE-2020-15358.patch         | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-15358.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-15358.patch b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
new file mode 100644
index 0000000000..f4cd6ba4b5
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
@@ -0,0 +1,47 @@
+Fix a defect in the query-flattener optimization identified by ticket [8f157e8010b22af0]. 
+
+Upstream Status: Backport
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

