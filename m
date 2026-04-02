Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79559CC6B2B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:14:07 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10995.1775117642069988213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 01:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hSTh3UeC;
 spf=pass (domain: mvista.com, ip: 74.125.82.175, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c160cb021cso735150eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775117641; x=1775722441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7h6Dg7l4KCDpQ+2ke4MYDBmemo5PYbkHaKNrlufIqXk=;
        b=hSTh3UeCsvJhnVP5fbyt/vAmAPdCMVCBN8h4kNlEFDRZ0paVr+3JoBVSdDVFF8QECt
         BcxfofOLZ6/8SdZ/nqIiWQ5tmtGCHDVE2am7odMuaFz265Y/0nYDdnSlsMHn9I7oBJJs
         OFleyehYouhJ3FBNO1WGwpIIA/uovY2aqCSBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117641; x=1775722441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h6Dg7l4KCDpQ+2ke4MYDBmemo5PYbkHaKNrlufIqXk=;
        b=icEk86f/2s3XqJ4mL4Ft1ja8MDxjhjM9Iy6hyf9XKXE31fz0UdC+T0dbNGGxZjh1H5
         v5nQhFSxQaJgzO27ksKbWgZ3GQCHvcGl5vGbWRg43MREhFhbEuFoyBZBq645ZCo5Lfom
         ixvg5hAkVzQsNvEQZp5YIyOzCM+QRQCTrWDutsg60VVjX2wycLHuVnH7RU28gL8h3c79
         LfziLQ78PRRoqch9o7nh8z4A3KNto/hUl2IY8/x/jWEVqmTnEguRZ9LIhUaRKiftJW08
         QeqFM/tKTkjdGycH8xdZd4RCaQOKa2iSxTQdt97AX/63ct/9CRQccmGVGnPT9GhY4XbE
         R4Vw==
X-Gm-Message-State: AOJu0YyEV1j9E+lQR5TxWKQnQ9z+LwxuTu54cA1Mpp6ffOGUUYSSvQSA
	And+v7/sCLyTN0ZCo/sBp3M3H83eHeIVDSkR6n4cH+l29WnAFKv+LwZS6qZvquBA1Kn0tlcKcVc
	wjDx/nQY=
X-Gm-Gg: ATEYQzw5Mv8RINXRcRiGBw7HAuvnmtMkay3iP0BvwD0A4l3LQKqgzRncLF4dA8PjO+U
	spBqmv8YYjs6Jq6nvwvNFmPq1qUoJEJCO5pW+2iEnm3mgMFfMXwLib7sCkPGNwd4JTYrNR+WGsH
	HJ22EKEACoho2tTUlhve0XZnNmTiSsRqXmlYfJj5yfqep6JWRj/CxB7QRhgC4LI/1V4hUp4vS6g
	qYIXJt0Gz6tGNbNWubpQ1HpF24/FUdE2SSBZzi+UFvZf7NLSvH0A+JieBfr46ChxipSu996u0Z2
	VG/tBbpqEvQ88vLCh5Fz//Drbd+xqKi1/Gu+4ryrOQ2cy59e1NpyH1yEl6taJCz+ErZW2gNXXtl
	n9kGniAMROdpCM+twq53rMgyBaQ9Ma7b8sTy3Na8y4zWIVDEgBO6S8CUz+Y0RoxGDRe5gK3h0+2
	rkGdYhciF85ffDgNiOQnfzzUOPWfNCjwG9KMvvPtk=
X-Received: by 2002:a05:7300:2391:b0:2c1:27c:75cd with SMTP id 5a478bee46e88-2c9311779d8mr3732568eec.13.1775117640974;
        Thu, 02 Apr 2026 01:14:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:1ab6:137a:d6ee:8373:3de6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm1841144eec.16.2026.04.02.01.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:14:00 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] sqlite3: Fix CVE-2025-70873
Date: Thu,  2 Apr 2026 13:43:49 +0530
Message-ID: <20260402081349.270763-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234505

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sqlite/sqlite3/CVE-2025-70873.patch       | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch
new file mode 100644
index 0000000000..2125110f6a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch
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
+index ecace5a..8c3740c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -10277,7 +10277,7 @@ static void zipfileInflate(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 05bfaac1af..1b3ac83b58 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
            file://CVE-2025-7709.patch \
+           file://CVE-2025-70873.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.43.0


