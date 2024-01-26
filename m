Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C4C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:12 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17137.1706278864714268669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jn1MyGdR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso219962a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278864; x=1706883664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXv+SJNZjml8jyto5WletHgvZTiUKCX8ZQ/kISssg2o=;
        b=Jn1MyGdRk4dUf5LyMeuY4J6W222AU3UiI5YmrNOlRNJEm1y36my1jiWKLZ68gs3Xks
         fIzEd1DRhjdb5HZnBZZVRaYKRkprBAn3f5DB8+J+HO5+YkFw27k7xcC46vhsF9gIdOdt
         n7Rq2KqJz+imIMKVSqOYIpvUZeNNPUGWW2PH/N/qkmuOXzBpprfoGCubsQmnLq8jfVHS
         FaLZPBXFnXoKYMxW3FXsPXoMTzvtRgRu61o3GjHmAJ4ehN8fOGKV/MPk5EdJZRfTY7so
         9AcmNVB7iqAEWMe3pK88iGdaV3txuwtaA4KFJvJYItw+uIFIvuVab8iZpY1/M8Am9MKJ
         mGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278864; x=1706883664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXv+SJNZjml8jyto5WletHgvZTiUKCX8ZQ/kISssg2o=;
        b=aASdYPMajuEEJrrT1f5jhmJHktcalORgc7U2Jh3vAYticyhRB22IhQd7USy7es/n20
         Ptl2Bq1Isyi2//qC1BtMBWZz9fiIXYDlnF7vJ8j/9bDZjTgglyDXMHvL7a1SdQ/oRP+F
         QGnS3U/rfwAUoKYekhUulnEIBPAKZcdBl+V4+tHAqNvIp2SFBqomUdXR/BfaYM0l1Fnm
         XF570tj3DLbUmYxzelBahFNPQKhdpsMvuplih1N0hD/TIq6etk+drS+kpZKxL/5ED42G
         TbIkkA3KFi+Wfkzsskz/GFZn0yRWZFiiDTEeyHi4eAdzjkDer39Vb4OkFkK12I34t2K3
         qyIw==
X-Gm-Message-State: AOJu0YyTsAOtUD5NZ2Vx2vyPN711+/MesHC4JY40O5OAcQvTkZ6VpadD
	s1lnwpQOaSU6L4reIxZ0Hbbgf3DfZ3PPlskwhD4vLIC3qR4idFV6TRZai51SuDi7zLqsmnvP9Qb
	2rck=
X-Google-Smtp-Source: AGHT+IE7W2UiAZcoWu7IjHZ9atRMFNJ//hS9BfpewCgUnsScfe22f1qEZZgot4ckWM2+Ir4Zk3S6mQ==
X-Received: by 2002:a17:90b:4396:b0:28c:b654:ad4f with SMTP id in22-20020a17090b439600b0028cb654ad4fmr1641763pjb.17.1706278863678;
        Fri, 26 Jan 2024 06:21:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] sqlite3: Backport fix for CVE-2023-7104
Date: Fri, 26 Jan 2024 04:20:35 -1000
Message-Id: <2a418c0a55d0d4e9a70a41c9a7cfea97ec0edee9.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194376

From: Vijay Anusuri <vanusuri@mvista.com>

Backport https://sqlite.org/src/info/0e4e7a05c4204b47

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2023-7104.patch          | 46 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-7104.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
new file mode 100644
index 0000000000..01ff29ff5e
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
@@ -0,0 +1,46 @@
+From eab426c5fba69d2c77023939f72b4ad446834e3c Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 7 Sep 2023 13:53:09 +0000
+Subject: [PATCH] Fix a buffer overread in the sessions extension that could occur when processing a corrupt changeset.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/0e4e7a05c4204b47]
+CVE: CVE-2023-7104
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 972ef18..c645ac8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -203301,15 +203301,19 @@ static int sessionReadRecord(
+         }
+       }
+       if( eType==SQLITE_INTEGER || eType==SQLITE_FLOAT ){
+-        sqlite3_int64 v = sessionGetI64(aVal);
+-        if( eType==SQLITE_INTEGER ){
+-          sqlite3VdbeMemSetInt64(apOut[i], v);
++	if( (pIn->nData-pIn->iNext)<8 ){
++	  rc = SQLITE_CORRUPT_BKPT;
+         }else{
+-          double d;
+-          memcpy(&d, &v, 8);
+-          sqlite3VdbeMemSetDouble(apOut[i], d);
++	  sqlite3_int64 v = sessionGetI64(aVal);
++	  if( eType==SQLITE_INTEGER ){
++	    sqlite3VdbeMemSetInt64(apOut[i], v);
++	  }else{
++	    double d;
++	    memcpy(&d, &v, 8);
++	    sqlite3VdbeMemSetDouble(apOut[i], d);
++	  }
++	  pIn->iNext += 8;
+         }
+-        pIn->iNext += 8;
+       }
+     }
+   }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index ef12ef0db2..0e7bcfa5a7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-35525.patch \
            file://CVE-2020-35527.patch \
            file://CVE-2021-20223.patch \
+           file://CVE-2023-7104.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.34.1


