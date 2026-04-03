Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F93E8536E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 13:29:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11582.1775222966781998790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 06:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WRAQngVe;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2589c26e3so16409515ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775222965; x=1775827765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LpUNeDXv8KA44pQLJu+hs2DXj4Lh2qHUS9TFhPOuCVI=;
        b=WRAQngVeUJpMuw/v2rVEYCwTZ9HMy3v/RMjutpVWWR2s2aC3KMYC5rUc6raAllwJ4f
         uwHA79JENk9btaJHhAKL1p7/oYB61cAVOZHS3/DFJqSn90QDrCbb58/MHhnf7dJeq4qO
         0+hnS8hxDp6L8643VX2p577A1JxvRhk44TnA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222965; x=1775827765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpUNeDXv8KA44pQLJu+hs2DXj4Lh2qHUS9TFhPOuCVI=;
        b=iLgnj/TCcnRkkKTnYoU1DE8U9vlpmpRSOmmfW2Ck4I30PxptlTUhHXv8M/2FF2iCgk
         r8WjzOJ8LQsm+JoZQc4N0i7sT73SaR1kjyVyB1flHA7lDiymHFuWkrvCNotaXowMDUY1
         jen96DUM5K1gUdzLI6UFycCbvhOIvFy9XL6Nq57jTXc2toWUJPqclAoApSqcaK2UfLQj
         Pe0vTETOUg4HCa9g7iyzmaw/kbYyZhTm1xa/dUJsZR205s8rGmxHuA/osWm8jUPju3cl
         STBQSHAwpBkkQVvlrW1sQYUcFpgM7MnHLWca3RiGqdLjlcTDQNe96JyDI2kzplZ3t9FJ
         LFsg==
X-Gm-Message-State: AOJu0YwFww+JJKZ+ZZN1zqdazmz5VNh0ekTa+oEzLANnGPQDK+2Ke+OH
	BVLEsm9bgJUU+SpwjbdXRNLijeg6RiRNGIXP39zDvXOZly8Nb+1cxtfDPclg5ko4JcDbdgA2dGg
	vsgdQn8I=
X-Gm-Gg: AeBDieuw516oS5gRfTr1mVJwRKB+aV1nA8iZB+MsYSCgjWDcypihheYQTs29qYdg70v
	jFAJqV0GdgFpW+Sr9jgBBsMh4GtVpbRcPQS7ZoMQUWuhxOiwCYVrVoMjWlp06DLmvWaSv5/mI0X
	0ReTOn8k/db3xFx2ycy08LmCG1XSnPu82Zw00eZ5QN7wFExaynQrgepLDnaI9ejbCNmC36bk7pR
	S8hrJhmp38wqJRGN06m4Aje9OHHabqZIzOSY3+cokiv9Zeu1wFfZ8qMTzOn+3ac0wc32S8iF3SM
	u2qiIchWRNTodNbBswp36FdmKqGCzcOdMVZnzBBON/Y4zkAv2SgWGXtkRND2kqL3XkRXTB42sbt
	ylA7BZ/qbPXuyZsgggb+OcXuBXjdIl6aZlReI5ju1E6+12KpS38c+eq2hoxy/KjIZDac5RB1Tgk
	5pxESbFbuyofyICL+q4WrTAbbgoUHBPMGJRvdkK+w=
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr33951365ad.22.1775222965549;
        Fri, 03 Apr 2026 06:29:25 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:1ab6:efbb:f067:e189:bf59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d280sm62113845ad.17.2026.04.03.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:29:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] sqlite3: Fix CVE-2025-70873
Date: Fri,  3 Apr 2026 18:59:15 +0530
Message-ID: <20260403132915.316468-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 13:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234588

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 0000000000..5c8c429a15
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index ca26f8a..a3f7898 100644
+--- a/shell.c
++++ b/shell.c
+@@ -11141,7 +11141,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index c9ff062255..df261bdbf8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 
-- 
2.43.0


