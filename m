Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F6ECA0FE7
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2519.1755816206224886783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ctdebxlz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78e70c5so225962766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816204; x=1756421004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bneBybsTx17V485lvpqQq70Pj3k6+sFDwfOdWT61grg=;
        b=ctdebxlzAi8kl/txsNqXjhm4tGKZ7qzzhdRNeqE4ie4QCJK1iDvR6AKRqc8ewK7eC/
         sGiAlDcRotWY2TYaR4ev/fGLWttSEFTSQqtelJR+izFywN5DXJWb6Mg7QwvD8zlWUhQy
         DXVcfAbQeW3Z38p0Ez/fgpZZsSFYo7PNwy5pnIK2BBlaFew+PjSthm69A3aRlWKFvqDf
         JOIj5YnyHG4ChtoLdoUBV76Gq3s/ctMXm/LnOc1p6+eEYuPYdzdBSTj1RQ8seAQlubUu
         WyD54dvHxMXEWn6RSelauCMKfO5VRSQKhUkCXwV1XiLCwSw71+urSuGO++OHk6TVLuNL
         y+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816204; x=1756421004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bneBybsTx17V485lvpqQq70Pj3k6+sFDwfOdWT61grg=;
        b=DAlWNIA2/ygeNcflsqsofIkHARXuDxmGstcXrE5a1pcp7xcmfBS7/JeK6lMUCly55y
         qquBHFloXtRJxkEq6Hkrp1SdxgF2UWBh1GM2GqDuGuC3Cu9XM612h64H2cvHKqYGxb0k
         rHhef0+X+LOT2E+3/Sxr43VcJn/N/jvSOIah/nX+8BFvBPAA+fJyuE26ca/zW3SVkUT3
         SWhp5gKst/bF1We9p4GzHdikq1iGHW4GqnmD/H1d4LbkAjNla14JVORuVKullQh610Dr
         gX7kv8Pt+SroU8cBXglIu68ETn5FdqA+g7b/LB8KOwhfEjkhb6wv9BvVKj2GZGeqInzv
         eAGQ==
X-Gm-Message-State: AOJu0YxJddV/1gxYfvRgmjvKtJqrQo8Z5UEYI3vFTsU9CKaAUHBIo0qw
	0V8f50dG9gKH7MY+yJDrMnV8MdsPGpV98t0iPfBz1si2ZclYRb/AL4LpM5Y8dQ==
X-Gm-Gg: ASbGnctg2VZk5/JUsl+6aSqmzsmY/lSSXQ329XZoWtgEEdKmGukUtz/0xsZmbTCI7bN
	x45QURxfFyP/eMNoYX18/z928Hm/nG/a03yFh5c4Ui7MUnOFq5QQO7B+YpOnD5rBPSFAbSmqbSh
	bCwNEGJUsvg54G/6H70My1oOuRKkI+8C63h8fXIpjbZVFfEcGx92XaxfTECflGjGErtCjcYv7oS
	qkpSGdd+Nl3DqAUxMuMHgtdS7jwvdVHIS3e5rKIX0H8Aq8q4YUvbd72S26TEQy42kXO1bhFI2v3
	2WXcrmfF+M1rjfR0jh1w6/PNwmIKpLmn/o8pVHqNW5aGfoN8IWwF5TAtY1TRc0EAO6srrd0oxVS
	OznGlRvDZesZlm9yLwui4yj6stqPzhsX65RC4qois67pS8e7jaq3gCP8V
X-Google-Smtp-Source: AGHT+IExBfe97XdsLpUT1RAeUUPKd0dyA/7RdBFg2m8BF67dANA5w3zri/WK2qTLC3yVVIPNFBKObQ==
X-Received: by 2002:a17:907:3cd5:b0:afc:d054:1706 with SMTP id a640c23a62f3a-afe297497b8mr65902666b.49.1755816204413;
        Thu, 21 Aug 2025 15:43:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded4ca695sm465776266b.90.2025.08.21.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 04/15] gmp: Fix build with older gcc versions
Date: Fri, 22 Aug 2025 00:42:58 +0200
Message-ID: <20250821224314.1690103-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222289

From: Khem Raj <raj.khem@gmail.com>

The fix to make this work with GCC15/C23 caused problems with older gcc versions.
Add a fix for that.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...d-parameter-names-in-prototype-for-g.patch | 50 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch

diff --git a/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch b/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
new file mode 100644
index 0000000000..ae2411fd1b
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
index fd810a264d..1508744ef1 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
+           file://0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 

