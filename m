Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.12497.1604673423206593797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jnOu3yzG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 62so1055780pgg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=U8B/OtwCY4pSGRL8vFzNW0NoG+qLjG732nuykt2eT+Y=;
        b=jnOu3yzGBLdl16cKhazgpLqAAB0Laio6rRzQH6d7Z6oQN4Et1DKrGQxajACC/lhvMd
         rxb53e3z1LnusBUa7aBVsrLR3h7j5hzHcNb+mBPU+/XI+adKzS/w+2p6Tv6GuhtXSOoE
         wYDnjbMcL+QNn0xdbJi3lpb4e8/Ljq6/kj/JJX6rs+nK6wr1fa2qZXafaQQx2RywI2D/
         LrSE9CsOxrkTx+2GPaL+7Y1c+f15BBsiGSLwrXAWpko26IKt3/Nf3K8rmgNd707d4+r1
         QFIOruRMs5RAbUS0mhQ/H3mDwctnTSpH/mOpiRaoqWJa38NfvMeLSPzysQe9i131DkP2
         2OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=U8B/OtwCY4pSGRL8vFzNW0NoG+qLjG732nuykt2eT+Y=;
        b=B65uDtAIBqa9to+c+90vU8O3V26yjdZcYCLgrqiyJBqG/UMWzcsKpavuZX46BRbH9Q
         2ag9gJCzJ7gUOTY4Lg3SYrvpo2As57EU2LB0rrdaaF2UbbAdGgeSrLCgn+heUCzMTOnK
         oxKbjNrpl8lLuhMJjidGNn8yAX6IUugKzUr47afrJQibZ0vxOzhhFwU4f968ubaRzrWF
         vozcFoMAVMtnUH34TqH71xv5F7v9bqNH/4NdUlUy2WOwSCD2rdhfRC5/xVTFarikwtrE
         fUTuh50nhr0UcLfXlX6OYusluNJ1YEi/stA3ap7dXuVPYkVbSovlJCU0goUE+tky0rFX
         mBWA==
X-Gm-Message-State: AOAM533RMsncXCSCsPSUUiXAFTTkWkVNydg1jBOZiD+w2UpFsOnpB4c2
	FL3idmEDSa5/yEGlv9hrZ5UzmWx/55up9bZu
X-Google-Smtp-Source: ABdhPJzFSsrdpSHG1r4NM/+nh2KxxCOyY+G5wK/DtIC+svr0ePUBRF1ERFC1Of8WKuTzzYftA6U/Fw==
X-Received: by 2002:aa7:9ece:0:b029:18b:ac4c:ac94 with SMTP id r14-20020aa79ece0000b029018bac4cac94mr2236166pfq.5.1604673422223;
        Fri, 06 Nov 2020 06:37:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:37:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/20] sqlite3: fix CVE-2020-13434
Date: Fri,  6 Nov 2020 04:35:31 -1000
Message-Id: <0338c2eb099532eb3b9a9de038f6b1a757348513.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

CVE: CVE-2020-13434

Reference: https://nvd.nist.gov/vuln/detail/CVE-2020-13434

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-13434.patch         | 48 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13434.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-13434.patch b/meta/recipes-support/sqlite/files/CVE-2020-13434.patch
new file mode 100644
index 0000000000..40c5e6f2ce
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-13434.patch
@@ -0,0 +1,48 @@
+From dd6c33d372f3b83f4fe57904c2bd5ebba5c38018 Mon Sep 17 00:00:00 2001
+From: drh <drh@noemail.net>
+Date: Sat, 23 May 2020 19:58:07 +0000
+Subject: [PATCH] Limit the "precision" of floating-point to text conversions
+ in the printf() function to 100,000,000.  Fix for ticket [23439ea582241138].
+
+FossilOrigin-Name: d08d3405878d394e08e5d3af281246edfbd81ca74cc8d16458808591512fb93d
+
+Upstream-Status: Backport
+CVE: CVE-2020-13434
+
+Reference to upstream patch:
+https://github.com/sqlite/sqlite/commit/dd6c33d372f3b83f4fe57904c2bd5ebba5c38018
+
+Patch converted to amalgamation format
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+diff --git a/sqlite3.c b/sqlite3.c
+index 55dc686..5ff2c14 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -28147,6 +28147,13 @@ static char *printfTempBuf(sqlite3_str *pAccum, sqlite3_int64 n){
+ #endif
+ #define etBUFSIZE SQLITE_PRINT_BUF_SIZE  /* Size of the output buffer */
+ 
++/*
++** Hard limit on the precision of floating-point conversions.
++*/
++#ifndef SQLITE_PRINTF_PRECISION_LIMIT
++# define SQLITE_FP_PRECISION_LIMIT 100000000
++#endif
++
+ /*
+ ** Render a string given by "fmt" into the StrAccum object.
+ */
+@@ -28468,6 +28475,11 @@ SQLITE_API void sqlite3_str_vappendf(
+         length = 0;
+ #else
+         if( precision<0 ) precision = 6;         /* Set default precision */
++#ifdef SQLITE_FP_PRECISION_LIMIT
++        if( precision>SQLITE_FP_PRECISION_LIMIT ){
++          precision = SQLITE_FP_PRECISION_LIMIT;
++        }
++#endif
+         if( realvalue<0.0 ){
+           realvalue = -realvalue;
+           prefix = '-';
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index e5071b48bb..c8225fff15 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-11656.patch \
            file://CVE-2020-11655.patch \
            file://CVE-2020-15358.patch \
+           file://CVE-2020-13434.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1

