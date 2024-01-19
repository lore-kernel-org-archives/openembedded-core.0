Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A17C47422
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 02:27:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.12722.1705631258836536448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 18:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Hv4alV/+;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9cb95ddd1so275339b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 18:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705631257; x=1706236057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMTL7GAtAI1EyN3cu+mn0BCHxEMFyqJKbopRYX6yUio=;
        b=Hv4alV/+btOvepKW7MSiV7qiaWhIS3Qqwz/fUJcXpEbavLwTU676H8sH6HOI9E0KkN
         F0WmIOmjqnQZ+Y3CT/fKtvr1eO2QNNXrUT3jkfGss0FyaApCzAecWHsgrdpZ88dfxxUJ
         TGNz5O17GS2KvcyWph0s8iEZYM1n0X/UHpD94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705631257; x=1706236057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMTL7GAtAI1EyN3cu+mn0BCHxEMFyqJKbopRYX6yUio=;
        b=tjFq0/xJVptZeqpWfFRvHyYlgzKg6vqcHr1rYZMkRl+2PT4D45DxXmTsoh2l+JcSy1
         Twri/+pR/2oDDR6mGojZwogWYxpONEqg12dIUEuD5XbTlPtd20mRcAlLl41ZFMVq1t/r
         qqNjxFn5KW3uO0uEyK0fKHgn2CNu7FrcKaIEpLO/kx1/5NzCTzkTBfQI9VAgPdx/0Mlg
         5Qiz/xMYTHDuRBdbfgVuw/XEaJmLdUXZz1aIJujy5cb3spw1f4his0mjSM4YD26Sy2eJ
         pLb0urbUz9Yozy3rSkhvCdawd0jeXSiRNfmYS1Uj/JzYRQeEhJ0kXg2CxPmWUGetYfof
         ldXA==
X-Gm-Message-State: AOJu0YwqZKJpBiHAoJTFQmR+3ApS4TM36Xcv+GUIqmVXUmGHgrEu7aTY
	Y53XXc1PE+fNCH7VU8C2y1/KyIL7IBHWzo+B/aLymGUUw/xRB3WqN4NqccTcHIe4Np9ktAU6AIm
	M
X-Google-Smtp-Source: AGHT+IGXSBmKocPt0dRvfL89W/ODWtjceO9L8drd8Zwd/eaMrT4+5pzFtzUnRXb8zgN+RZ6Nokmngg==
X-Received: by 2002:a62:8416:0:b0:6d9:97f5:392e with SMTP id k22-20020a628416000000b006d997f5392emr2061837pfd.44.1705631257154;
        Thu, 18 Jan 2024 18:27:37 -0800 (PST)
Received: from MVIN00020.mvista.com ([106.212.247.212])
        by smtp.gmail.com with ESMTPSA id t15-20020a62d14f000000b006d9a6953f08sm4135255pfl.103.2024.01.18.18.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 18:27:36 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] sqlite3: Backport fix for CVE-2023-7104
Date: Fri, 19 Jan 2024 07:55:24 +0530
Message-Id: <20240119022524.4293-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 02:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194004

From: Vijay Anusuri <vanusuri@mvista.com>

Backport https://sqlite.org/src/info/0e4e7a05c4204b47

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


