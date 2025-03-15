Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECADC28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 05:55:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5109.1742018136006504262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 22:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azvtE/9q;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2243803b776so76878525ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742018135; x=1742622935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb+hQLLsFr7tGsNZaD36JE386FQ6XMKvdLi/jF/xYqQ=;
        b=azvtE/9qImWx1lFCod5IGCwMC/hRLz8uMfU7ekAQRqgXd/LfbrmUCklFPtt71pCkTO
         KJOCIiFij5wBR26EQ6XGpZwvNLPVQbXAr+Wz/qt+BRiiBobm67rd82mV7Hlv1lHV+V+4
         Yt5uKMI1coCQabfaGm9mVxXg1S/GCv0VLjV4gI5fbVEOyMLXaS474lNL6SqJz55Yz4gW
         SqTlS9xw7XAxWlDSBhgA6vVnW2LGNlTcAxi4jV75n4YYRfVcFcu8Ya4hyudhjJDgTp8+
         3JQ42aGW6HrDIwvfWVhzWytRJ3wsJk2GgEIvfFq3hT9cxm6G603ZAMdRXOYlyAy0/0qN
         WJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742018135; x=1742622935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb+hQLLsFr7tGsNZaD36JE386FQ6XMKvdLi/jF/xYqQ=;
        b=rdgF3I3i4+3dcujUBQYmJqRKy8cSWw4UBGDQgCqxG/cf5T6fjAqu4N06a2OrsIbM1v
         DSsVYoR2iOX20Zri1CKnuyBmeIfC0bdyENirvT4xCbBURdyoPtCbfnIYKOljnTveDABx
         6t0A/KOkELrEQq1WXo1eomH+F88yHc6omjBmpWzG51lL7i4Er1Uai6l7uLiYZR0KAZIr
         7Q/ZMant3x4JuzuBSMocZMBdgZgZRigRaB5JDh71sh5ifc2RFzHfGMcfk63RqQit/gjs
         TS68d67ptp2n4nUtUcudH6PAaTMhkxs2VAxgPIyGp9D4Qk6hG6h/75QqDxIHJJelfJxf
         EQXg==
X-Gm-Message-State: AOJu0YwvSo2Y5K9T8mTkSC3LLz4kRLmatOMwPs7iAtsXoiDzUkONUZqF
	5nWmhfnP3HZRhzL/bZKCckm0Rhs2eZfWyGCaumK1WVi80ID22Y1i1/UXpyO5
X-Gm-Gg: ASbGncvnjyJJaKJ8e9/3X14pc/tWQbeovfqyo4tsLed+6ALlx9VC+8pBVyB0Ia/1XQn
	gfJ9QYpJSX1jULljN4SgmGjbIfdZHUQr8BX5E71nv6fH/N8liSSlNfsZgVlGsn/41sWUdAa8EFw
	OJGzYOtdy/27ACf2bAe4Epvgp7GFEXt0bLwnSAbVOHyfTFoqROMG4c65n/sYqj1O/Y5neOxH++X
	oYYEc8onUPoIDkvQVvact69Xb0O+sXI43lS24W2ZIrglM8R8oJVODW6Yv3MBym+gxo/isPVhrw8
	OBnPKr/85WumsAGMJD3JbknsxJU0oPZceJx9
X-Google-Smtp-Source: AGHT+IEv2fU+ZfuZSugInIYZfBM5piwA5pDhSmiJH9QZrKBnNQ3AiioI/EuqwKKpnziEqlP5So3oVg==
X-Received: by 2002:a17:902:db09:b0:224:7a4:b2a with SMTP id d9443c01a7336-225e0a1d3d0mr72640275ad.11.1742018134953;
        Fri, 14 Mar 2025 22:55:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6a13sm37878485ad.118.2025.03.14.22.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 22:55:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gmp: Fix build with GCC15/C23
Date: Fri, 14 Mar 2025 22:55:32 -0700
Message-ID: <20250315055532.104188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 05:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212866

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-prototype-in-acinclude.m4-for-C23-.patch | 25 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch

diff --git a/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch b/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
new file mode 100644
index 00000000000..ee199a83735
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
@@ -0,0 +1,25 @@
+From 51a657c827422d2bc284d752dfbcfd2b1311a5bf Mon Sep 17 00:00:00 2001
+From: Marc Glisse <marc.glisse@inria.fr>
+Date: Wed, 29 Jan 2025 22:38:02 +0100
+Subject: [PATCH] Complete function prototype in acinclude.m4 for C23
+ compatibility
+
+Upstream-Status: Backport [https://gmplib.org/repo/gmp/rev/8e7bb4ae7a18]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 9cf9483..787511f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -609,7 +609,7 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 1],
+ 
+ #if defined (__GNUC__) && ! defined (__cplusplus)
+ typedef unsigned long long t1;typedef t1*t2;
+-void g(){}
++void g(int,t1 const*,t1,t2,t1 const*,int){}
+ void h(){}
+ static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index 2ce8ae385c0..10b9c205044 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 

