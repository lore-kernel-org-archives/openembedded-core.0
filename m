Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6BCCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.2496.1755816205310766568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cru69+Vt;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78ead12so215474366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816204; x=1756421004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcXqTR6th3Dz/++1J/IytDc0NbJI/YCpVRK6p/dK0Rg=;
        b=Cru69+VtOflLXglprBm5lzxDIE2JGc7f2NwDkKIR9SP0Zks2hnwXVWKBDdU+Tjg05S
         p+F83ysDNIxVhEQYtAtJo3yu0M++iqqryooVKKp4iPlmt8374BiVx7ZWhzeFHT3t+0fN
         d/a59yqvnzE3lmN068xMSHUQF79T/ijCmb/v9WtQYBEMb6kRbGUvqFi+DCP84WHv2VH5
         MEv/ij+xGGrfvKGRY5H0xap8Sjtj8bV8QxYPAJOaSgpubn3shyEq6WJFgIjBfVv+hXq8
         FVMkHlCKBasw05jfFg+M6G2pPb+rhELcIiT5nZX/SPXM2iMLiWUvG+IqFW6P9ZLxOiCy
         HpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816204; x=1756421004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcXqTR6th3Dz/++1J/IytDc0NbJI/YCpVRK6p/dK0Rg=;
        b=YZngSn6zcma+fB1ZPdP96U4DEPsytxtvb1pkGlJEnmQs+bKcN34x51sducPSLWJr3e
         p72fsZaESrr7KxQAf5FgCShpnjJ8qKsEsmQ0VMq5408zH4Lkx1ANlPyUaC0+D2R3GTWy
         QNOGa3ReqycBSDmnnCw8rr09WUGqLW0FnlnmivQ3OBle4K8PTnPCj1KHyiDxTvK1rpdD
         KFIrzJ+bUQADtRcwxLDjDz09twxc68J6K/wYeywHhOe3xqkgiTSvSLs39KpuW9nWcNEl
         rrVmG7Ohb3anSLif/9pwbDLe+wnJEry1MPIRWnEeKsdnwFkQ8+IHNI3vC+N/623u+HDN
         tz7Q==
X-Gm-Message-State: AOJu0YwLd72txbaNwyua0JCUUHtabJwauTzHKg6hnpPszcMjGEFAq9Th
	zerI/i+zC7xC4rJtcaPKpA51lePedVu1L1YW+ESMr+D5vIdHNY/uanuIe02V7A==
X-Gm-Gg: ASbGncv6413RYvKtBpi7WGt5orfH1MuSv/zcD5yBcwGoTN9fwJ32NbzH7wTFZdMM1SE
	PhGzLhjZbmSsfFPczngFFU/U3xEh1agDd38CyYnW2zubnWGtsW1Zn2A/IpmESf62+/E7diGNfwR
	MuE84Xt+t2cVtUef6v0W69bckjiTOMjToMabZtBUMBavtaKDwWzS16e10s0o9V4ukJ3R1UA3fkp
	l+hIvPDOKoxrDUpc6swBui7M/PPv3IP4mygOBB+/bX9Or9qKg8ELX9ySkmRnwHv98vsi6kLIw1B
	bLnT7vhP2GiYM3YubIvb3ovtWYkKwwqEl7rFdqPT6AWZkorzyecPQOlNrp1Kqv2GzElE56mLxrL
	tPEptGla9QVpnzT10l3aBKWt3QU93eyqprhPs3ZRrlgaQcNfi+7fvsqIC
X-Google-Smtp-Source: AGHT+IHKnvoVwXvQ6vuCQd3rrpFHHyRWTktK9qk1iQ3DS9JYCRTXs537inRSRrMsuTtTpO7f9kaaPg==
X-Received: by 2002:a17:907:7e9c:b0:af9:8c1f:b290 with SMTP id a640c23a62f3a-afe28f6a866mr68219766b.29.1755816203562;
        Thu, 21 Aug 2025 15:43:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded2bc305sm467784766b.18.2025.08.21.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:23 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 03/15] gmp: Fix build with GCC15/C23
Date: Fri, 22 Aug 2025 00:42:57 +0200
Message-ID: <20250821224314.1690103-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222288

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...n-prototype-in-acinclude.m4-for-C23-.patch | 25 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch

diff --git a/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch b/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
new file mode 100644
index 0000000000..ee199a8373
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
index fd4aec92fd..fd810a264d 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 

