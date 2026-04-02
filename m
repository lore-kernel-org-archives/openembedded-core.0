Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5804CC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:16:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10422.1775114168677086381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jfh6QFKt;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad617d5b80so2828365ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775114168; x=1775718968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1ocG87Tb5hLD6NKht4U0PmyAz9D3z2hpfyW1EMtcsE=;
        b=jfh6QFKtlYOGqLN2crMz8Adjq3eDuzdMNzQU4vPDYh9kNuXBZwe3WJNJpQmaHNRCV4
         B7/fuTOqk4EkqwgxxBwlqTVmOyuFTCtIz0GLm+UO6MEOCZxOdUviEsn6Ixa38AwKf+Ul
         T/tEjMj1jlETe6IlnobEvS9v6OmPfomJ89JbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114168; x=1775718968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1ocG87Tb5hLD6NKht4U0PmyAz9D3z2hpfyW1EMtcsE=;
        b=SFIqmFlmDajxBf9vT9aT+scwPs27Ha3UNw5TysCenyWnQsBCH8dU75YRByGpEOI6xk
         Wvatzy9zNs/7g1hOyWQ6WQO6IR8UBtzA+dT7sHXHMD2q97RtoWDcyuDm2kHbHU13wdT7
         bJ6pQS5qy3cqXVrKmdwB1eI12VAp1qgafqQGbx75WqE5t+aN3BsR+G6o8PBItCb27A65
         Qf/Md5y3gMKJ6gQpWaErh+L69VzSpbDv7Zsk98245g7dOUeuVJrczZzDmNfeIWt0n0rc
         n9qhM5x32pefapV8V9jV5GJAE0XW8XIB8ausDe9zROcrQzak59RgdgG1n7Y+HehbG0/U
         pDnQ==
X-Gm-Message-State: AOJu0YzedRkoIeE9iujQ0bA7+SWOf/7TFjm9gCy0/Ahc/ovOW5/20qhJ
	OO3XvB5BBVrrP+BAEbEKFJN6K9ayB5hzeO82ad0bkL5SLRMGQwE/yPBPuA5PCi92KtOBRU6sGLk
	fMOe/1yU=
X-Gm-Gg: AeBDietiQ1OKvIjTn/InXZ0vvH+nz1qeb5D3b92F+90P7bdUgTG0chQjdoJMZg7zGCd
	65JZfctNuYR/vcpKLV1t06MkFPRc1pCEyGYCuM7Krq+f6fvSzCv0hq+bq0TdUzMyycIB77Y4KA+
	1/XtfyA9XbsjVRhAfCXT2MRe9zoom5l0ipjyER9GBb+0ShmxMltnsL4prke7F7rSm4vzuVUYqJe
	SiAU1fcBevFTUPdm4NK0osNsQObvpz+1uswDctwChkbAE8nIIkjWBVpoNABzz6JchYWrNG83B14
	+jZUpHqYT+qPfLJGvtm8mBdCrrfRSLNxsTlYiNzGujyiDwNyGeAWW8PvY0PKKDqnR4L6HovQWQe
	rqMuQ/hlFPz8Kkj5IG9Fz/PKXLfMGIpGkgDsYQUoQRh8HWiWph1dYotEdcOpZlA8ZtP88N8lRvY
	jEZ/QSzZbEqRFMRVFYXDmMW5kHKOYmrns+gnxF2nc=
X-Received: by 2002:a17:902:f605:b0:2b2:5a5a:4f2d with SMTP id d9443c01a7336-2b269c57f9cmr65422885ad.31.1775114167647;
        Thu, 02 Apr 2026 00:16:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:1ab6:9597:7786:a64f:e7e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm18750455ad.3.2026.04.02.00.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:16:07 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
Date: Thu,  2 Apr 2026 12:45:59 +0530
Message-Id: <20260402071559.292708-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234496

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 0000000000..86004c0b74
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
+index fa45d40..3c4902c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -7668,7 +7668,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index acdd80022e..9e10caa399 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.25.1


