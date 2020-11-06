Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.12515.1604673435897037831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UuCJQRLH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id 13so1508084pfy.4
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Nz4Wh7dDOSvTaQiJOjB7bapBU4y1/78gMeExv6Ho8R0=;
        b=UuCJQRLHDfimDHpgfWcFeN9p8sZsFw9eRfKfQeqSD05KxJC/YvAldu0GN04tHt0ecC
         KB6KNUtdTWFxLswEZxupRPme99KtNdG61RbNbtaLw9C321SPFONTwjjGpaiTXD61Su0K
         cOW0N+70EaHeb3FOQyA2wQSkUlOpcVAuYQsXdRT1lz0g5UHVHCG0oUPF1cTzwSMubsDl
         0GwCOQaMby2Csp037zMQPVvJEL4PdfWsBiQYy/WX7PXLZF9TJqzSzkpKPEop7otBV6WD
         voUGwmB/hmVipO9MxcUpjq6kpWHmXGbG7/LtPBs0GUU/e88BTzOEmjNKgJY3XA4EZ9yT
         o8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Nz4Wh7dDOSvTaQiJOjB7bapBU4y1/78gMeExv6Ho8R0=;
        b=pYBUCFgCxvlrL0nBrhdq7WJQ5swuQfpkoWY67ccOZ93KJ0cStuAE+o+j7R2620WSUL
         8ED/JxTZthVlXuo1axdFt05wxIg/3H/jpC9f+fguOEiK7/ogCemWA+GtnjiH4TvhuzGb
         2Jd1n7eT9O/WQJUFrGr1vlyvgUxXm7jBUvgZ+bJdNG+P2Ol7qyC2PB5KAnP1QiBZwyxq
         tI8zaeAxUPJchEtEhDSQuHMmoLflQsFygYvfCA052AxWlJLxpUIHkU1qAilI8+iJIHt4
         JP5GKS+CCAY+wkFFpEGb9ALlTi4zlwF15eKu1YCm/UeFRskGO4D7C7Mgiesft2QZEqMc
         nvdg==
X-Gm-Message-State: AOAM533JAuLKFgp2wcd+CQ3XQLJO0cExvJrqP6yyqBvlrzKOF3ncNHgx
	ty2K0sC3fUtpi0GKeySKB6vySeD8N6FuLgqg
X-Google-Smtp-Source: ABdhPJwVKROmtpOqDz6dtUyb3lYgBC952JbKKI5EcmYtpRAxPEkZfBNE/kv/jhFthlUdyes8/oOezA==
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id 64-20020a6203430000b029015ce33cfaffmr2112529pfd.7.1604673434983;
        Fri, 06 Nov 2020 06:37:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.37.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:37:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/20] sqlite3: fix CVE-2020-13632
Date: Fri,  6 Nov 2020 04:35:35 -1000
Message-Id: <8d54034bb8e522f9827ec6422b32cbd4e5bf1346.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

CVE: CVE-2020-13632

Reference: https://nvd.nist.gov/vuln/detail/CVE-2020-13632

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-13632.patch         | 34 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13632.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-13632.patch b/meta/recipes-support/sqlite/files/CVE-2020-13632.patch
new file mode 100644
index 0000000000..c28bf10e37
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-13632.patch
@@ -0,0 +1,34 @@
+From 219b8e7e7587df8669d96ce867cdd61ca1c05730 Mon Sep 17 00:00:00 2001
+From: drh <drh@noemail.net>
+Date: Thu, 14 May 2020 23:59:24 +0000
+Subject: [PATCH] Fix a null pointer deference that can occur on a strange
+ matchinfo() query.
+
+FossilOrigin-Name: a4dd148928ea65bd4e1654dfacc3d8057d1f85b8c9939416991d50722e5a720e
+
+Upstream-Status: Backport
+CVE: CVE-2020-13632
+
+Reference to upstream patch:
+https://github.com/sqlite/sqlite/commit/219b8e7e7587df8669d96ce867cdd61ca1c05730
+
+Patch converted to amalgamation format
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 282e106..5ae8c8b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -181820,7 +181820,7 @@ static int fts3ExprLHits(
+     iStart = pExpr->iPhrase * ((p->nCol + 31) / 32);
+   }
+ 
+-  while( 1 ){
++  if( pIter ) while( 1 ){
+     int nHit = fts3ColumnlistCount(&pIter);
+     if( (pPhrase->iColumn>=pTab->nColumn || pPhrase->iColumn==iCol) ){
+       if( p->flag==FTS3_MATCHINFO_LHITS ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 5d45d1f1ab..c289affd60 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-13435.patch \
            file://CVE-2020-13630.patch \
            file://CVE-2020-13631.patch \
+           file://CVE-2020-13632.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1

