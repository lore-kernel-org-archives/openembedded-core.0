Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4087C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 17:05:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13665.1742058326581243799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 10:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9kM45xq;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225e3002dffso22254565ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742058326; x=1742663126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKcKA5ZA/k57xW3oQ/w/9P4f/dIWcIySio8WzE8FUnk=;
        b=Z9kM45xq2GUataZDcZjPc6WVMora2BWveS/3TNrqcL0MrkamkCl1OCOae0HikxTqGN
         vl8O7BPML2TrXVYIGExie75Qt40LAeJpIV+G74Lpso1k474nXI5LDaoLQblE6K/eskXI
         tC4PRlViho8KzhT0htArRuxU/lc84DZkBr8vkoJvFVcZuXDSSNR9YdDh30oJyZyxIbaq
         qJKRbkml1wowYu7GMjhY15PpZ9fBiO2TinU5COWDE4fxZQW8ak+Xd/wK+0yHZpq3WFOv
         rU0guRGmFtpdXUYquPYftz7kCPhGbnRYwXsTZSfKIRaoEp1lXBwbRSRlBHn7XoN6jt7M
         Ki8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742058326; x=1742663126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKcKA5ZA/k57xW3oQ/w/9P4f/dIWcIySio8WzE8FUnk=;
        b=DLbUPR2BU2ubYbiTDFa3pzxc15gjqlmYZq1FgVuTZnyznWF1x9W/4M+NU6lYMXMtTg
         VOTdfw/m/qDWlcjiFHZPi0sqczZui6Mof1O0NtE6/kmmdPvpGpV7sYIDrschJTOeAH/W
         CvbyEJhI/b1FfPsW+rGsrj3kvy+RzsuPH8O2mMTJ0vW3bREp0bexiOLHB5/hLP8jAigu
         8jyxkH6IUVryYUkw6vd10Ln4HayvXik6JBBw6L8iK1eFp3J7MaXcYrpMXsDb6yY1MA8n
         Yhilc8cKOpxHqfszM0cP89Q2RYcaA/JpqoHP7Dy4k32fWaT/nkXIDrRo8DugeZyQiHdx
         JsZg==
X-Gm-Message-State: AOJu0YxhgVzQOxyV0ZpvpOIFIf1jtRwsIV0WQkKjFim+GdDoktVQYZDS
	o2HMX1X8agNcZ9biH2v6PhtrHI0onvK9Hw6PeXxIpgrqOl8+SbDzhJlE63PC
X-Gm-Gg: ASbGncu+WTHLtw3i9M1I/SKUeOy81n7RmD8xDW0YKRskxveFeuFMBzLJS/xt5vMRiu5
	GID+Z0G5xLsEGf4L3xm4/gDzbm7LKlLPngReUjmxXJr0AVHD2uKEqr5Ood9UKImIwOT9uval66T
	i/PubstY8CP9DVKHqPDhwsA2niAoDsRWyyu/2Pt1dfvE1mStq1buGtgGsYPloBl/qUqBvdSsLuq
	rpTO+WunvLbkCwDgYF5gkGGY4rOLYSqy26IY8zIjjq6ypOAcYANG1oeQpTtc/jBwd9VB45NsEhC
	D4vdvq1zC/R1tXZAmGIFUsl8HujuZqdg62BB
X-Google-Smtp-Source: AGHT+IHYEF+XLX3JVLEgYM6UHLBvRHurgF+F+qn2e4WWbf+Loll+8llsrwVhGCg2ETyI433loT2GBw==
X-Received: by 2002:a05:6a00:1a87:b0:736:46b4:beef with SMTP id d2e1a72fcca58-73722366e5fmr8207640b3a.3.1742058325580;
        Sat, 15 Mar 2025 10:05:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b36f7sm4784777b3a.178.2025.03.15.10.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 10:05:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gmp: Fix build with GCC15/C23
Date: Sat, 15 Mar 2025 10:05:21 -0700
Message-ID: <20250315170523.2522104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 17:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212982

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Fix build with older gcc e.g. GCC-10

 ...n-prototype-in-acinclude.m4-for-C23-.patch | 25 ++++++++++
 ...d-parameter-names-in-prototype-for-g.patch | 50 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  2 +
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
 create mode 100644 meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch

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
diff --git a/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch b/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
new file mode 100644
index 00000000000..ae2411fd1b9
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
@@ -0,0 +1,50 @@
+From 1744e433a16fb39a55c4c771b8ecb02246aa5b99 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Mar 2025 09:40:06 -0700
+Subject: [PATCH] acinclude.m4: Add parameter names in prototype for g().
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows it to compile with older gcc e.g. gcc-10
+which does not have allow parameter name omission, it results
+in
+
+a.c: In function ‘g’:
+a.c:3:8: error: parameter name omitted
+    3 | void g(int,t1 const*,t1,t2,t1 const*,int){}
+      |        ^~~
+
+this was added to gcc via [1] thats why it is supported in
+newer gcc.
+
+Adding the parameter names make it compatible with
+old and new gcc
+
+[1] https://gcc.gnu.org/pipermail/gcc-cvs/2020-October/336068.html
+
+Upstream-Status: Submitted [https://gmplib.org/list-archives/gmp-devel/2025-March/006294.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ChangeLog
+
+2025-03-15  Khem Raj <raj.khem@gmail.com>
+
+   * acinclude.m4: Add parameter names to function prototype.
+
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 4fca12de2..b9d1eacfe 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -609,7 +609,7 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 1],
+ 
+ #if defined (__GNUC__) && ! defined (__cplusplus)
+ typedef unsigned long long t1;typedef t1*t2;
+-void g(int,t1 const*,t1,t2,t1 const*,int){}
++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
+ void h(){}
+ static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index 2ce8ae385c0..8f18bdca1b5 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
+           file://0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 

