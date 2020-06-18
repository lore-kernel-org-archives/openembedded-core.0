Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.10606.1592495003354583214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sB+UifLm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id d67so5470115oig.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JcbHZNEGRCcBRmlqPBoye5qrdJ0WN/bFiw9GkB2257A=;
        b=sB+UifLmHzrCN2d70GsjnhnFuc1ubLnfEnLmGw2NQVJklBT9wOgKBUjWdIdYq8ahcc
         PyBc6f+JO1V7z2sdfVdF8WF+SGIW6X90ueuCiGD6QNOIYd/lIt5MiImMq6CncGiqa+N4
         RSTlclpvuOJ392Zz0Wa2oRJzDV01oaox0c9IR+XAx8SnUeDE2NWpQaIKeo/DVISZS4u0
         1IkneZ5iQXrl/rSjqzanGNik690txQbU9hJ/id/FB+RhjP7lTi3fbHZb80gQ0lwprHDn
         qhY9WZJPXIQkCq1qaXwRGWfolEXydrbFKANEPg1e5ZZu8T3TlcIM+7D/SUBNY0aau+vo
         AyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JcbHZNEGRCcBRmlqPBoye5qrdJ0WN/bFiw9GkB2257A=;
        b=Ndg/hxTetz+jS9jJs6p2Vv2FjOWtNv8+4mAk3UGzjTRkgdM97Y0ta1lMv0CpkPNYh8
         IN/2udazWtsPt6qsfZmTN7D0I/E4kQsua52BYn6jwFCH43tMUOnbxdtwXSYHLXLIzJGg
         PgeLXSSqL0E//2gk+R38TYbzBdSzNR+SsPDmj3RWtIeyWTCVmoMDDrE833fD4qX5vGdJ
         6CsXJgRaoyhi+GhncUfIxkTh2NTtc+6HXxqboqZQuMajwelJAlSXuI6R2WkJ/6q0IyzL
         FOMeotS8N9beLBB6DE/vRfd/NbEd7XubamYkidkq5iLKqRLY2hmca12ifviZzdaXuWHu
         8+iw==
X-Gm-Message-State: AOAM533ADDBkLwhaR4Jvi+eE4V9x6mSF9D6Q584Oe/yMiOWoSji2zIhu
	SKb5lM3kSilL3diPWcEu293N73Y17FY+bg==
X-Google-Smtp-Source: ABdhPJx6NzvcedzKqEc8yJLsZLEDJ715ortI+FN6xZMvUFOtQwzteRugAjkXXAcJqmuMVOAkbHn6uQ==
X-Received: by 2002:aca:aa4b:: with SMTP id t72mr3244539oie.99.1592495002107;
        Thu, 18 Jun 2020 08:43:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.43.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:43:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/21] u-boot-tools: backport patch from upstream to fix gcc 10 builds
Date: Thu, 18 Jun 2020 05:40:51 -1000
Message-Id: <6372f78c2456a9b57ef5f8ff9b975426bd1a46be.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

---
 .../remove-redundant-yyloc-global.patch       | 27 +++++++++++++++++++
 .../u-boot/u-boot-tools_2020.01.bb            |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch b/meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch
new file mode 100644
index 0000000000..2a184e57e2
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch
@@ -0,0 +1,27 @@
+From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index fd825ebba6..24af549977 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.26.2
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
index 7eaf721ca8..ca8876ff98 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+SRC_URI += "file://remove-redundant-yyloc-global.patch"
-- 
2.17.1

