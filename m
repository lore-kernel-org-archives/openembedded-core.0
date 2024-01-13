Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C57C4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 18:55:12 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.25163.1705172105639271560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 10:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GFyEqdtI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202401131855027b704a2917db1f4f60-x4wl0i@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202401131855027b704a2917db1f4f60
        for <openembedded-core@lists.openembedded.org>;
        Sat, 13 Jan 2024 19:55:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=i4SrrjhUrMrVFUcAFnN1k4xaM+BbJA1fR1nh0bN4GCY=;
 b=GFyEqdtI1wMFZk7w5nduWBjxSFcfhwP7ehaOlS9RJ3ZwUkTOWyd5I3hBk4jBy/iji0rgUH
 pB8ydObA6YOoLjGMdPEKhBWK+ls9YU5/RPtCKXtFRnKH0TlXRlV1btfUCAimY7IIl2pwLiDt
 1J04QhztCZRKUJBQeH5K40aXTnPi8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: backport patch for CVE-2023-7104
Date: Sat, 13 Jan 2024 19:54:12 +0100
Message-Id: <20240113185412.1309346-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 18:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193607

From: Peter Marko <peter.marko@siemens.com>

Backport https://sqlite.org/src/info/0e4e7a05c4204b47

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/files/CVE-2023-7104.patch          | 44 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-7104.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
new file mode 100644
index 0000000000..25c6ba017c
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
@@ -0,0 +1,44 @@
+From 09f1652f36c5c4e8a6a640ce887f9ea0f48a7958 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 7 Sep 2023 13:53:09 +0000
+Subject: [PATCH] Fix a buffer overread in the sessions extension that could
+ occur when processing a corrupt changeset.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/0e4e7a05c4204b47]
+CVE: CVE-2022-46908
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/ext/session/sqlite3session.c b/ext/session/sqlite3session.c
+index 9f862f2465..0491549231 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -213482,15 +213482,19 @@ static int sessionReadRecord(
+         }
+       }
+       if( eType==SQLITE_INTEGER || eType==SQLITE_FLOAT ){
+-        sqlite3_int64 v = sessionGetI64(aVal);
+-        if( eType==SQLITE_INTEGER ){
+-          sqlite3VdbeMemSetInt64(apOut[i], v);
++        if( (pIn->nData-pIn->iNext)<8 ){
++          rc = SQLITE_CORRUPT_BKPT;
+         }else{
+-          double d;
+-          memcpy(&d, &v, 8);
+-          sqlite3VdbeMemSetDouble(apOut[i], d);
++          sqlite3_int64 v = sessionGetI64(aVal);
++          if( eType==SQLITE_INTEGER ){
++            sqlite3VdbeMemSetInt64(apOut[i], v);
++          }else{
++            double d;
++            memcpy(&d, &v, 8);
++            sqlite3VdbeMemSetDouble(apOut[i], d);
++          }
++          pIn->iNext += 8;
+         }
+-        pIn->iNext += 8;
+       }
+     }
+   }
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 55cc514412..cece207eae 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
+           file://CVE-2023-7104.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.30.2


