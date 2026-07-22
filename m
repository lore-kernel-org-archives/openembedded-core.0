Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295F8C531CF
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5454.1784741041451461715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SsxhvL4r;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso21952075e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741040; x=1785345840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gYNKfQMvkxX8aHOGUOXE/vsrkWMY1rKLE2u2G9ghR/0=;
        b=SsxhvL4rcOr3LyPaJNMfeJUROQbVtDXm2C+xNM2xRM4Rs6dm/rvGzFVdtVXNFjC3E4
         KsjaucSBTmHB79P3A36MYlxaQtu5ZngxADCsX44QCmdXm1qnc4IkPiUVyz6KhvGFUDvJ
         rG2himhC+GAnSS1oz7PNBFBcQMfhHHIal09Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741040; x=1785345840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gYNKfQMvkxX8aHOGUOXE/vsrkWMY1rKLE2u2G9ghR/0=;
        b=GnsJvPeJlCF8XhQ8ALX/6g5ztaEon2NyS5e8TpmwBNtJT7JBXn/E/GmRcWpR0+Oeyj
         WzQwQVh1a/TVDSQjGY8R86aWIatMds49EHaWCEVzsvmxWriByJKkORSnTd/7klKWbb/Y
         ObjQOUGKXNAmUapoqMQY4QwxXEgPXFP6LigTUfz2xLLhqrT5nJqSikQBg9RCG1zUJKqy
         lBLTo0zkBt0q5hdp3an/LNn6uA5A4TDIrcudtDbOYt0oQyw/J4P46Zn3PkxIntj7UL3+
         zdg9mNJAUoOHzOmfhiWjl/wptzuSOVG8qemO+sQuDRww1yupo5OpbSv6fYlZpaP3mmeh
         88LA==
X-Gm-Message-State: AOJu0YxhzNWIZ0urP1zzrzOUY58i4oYleSFZv0kCJUqXqYM0E9pLqkjf
	SjAYkU9cWYEWLCJo5tTSyNpeh2CWQqZyA39ogABJs+Y2WEINQDi0aa/0fXciPjqTV+fESexhU61
	gZ0zs8XU=
X-Gm-Gg: AR+sD106gGDyHwZoQb3uJPDE8fjg8QJVTHG3bDEq8GSEyfcLpiSrwgwZwbLGQstcRe/
	sq2EJJG/IQAdI46TkQ90Z+p9IAsKF1dIFRRV6pCB5ANihfcsK7WU6BXYoSVkPy/8thQ37XMMdn9
	YKp09vaX4CSF/9jYbSjbmVxAOD21HlgGyPieyf8lckVQzwOnUT190k7yJ2ap0LiPa4r8iL/EMOY
	UmG3rxPeXxc9BJ4wlMem5y1ge4g8s/kUzg27KfG5unmvoX/uf4RPwtGCXdpXcNUEocsyvWVAhT+
	LDma5+bzVHxLkSVtMfC8NPGH5WNKuay0uQRP5SGsb4jqSEa2xIqdqRu8366P/ABaH42mHL2v6he
	yFoNfbiVGqI2Lrih7zkrqD4wQZWgTN9fzGq7ymJOpzB+bMWckR25W2loQM1JecDWHJ7tbmx7gvZ
	WwedAwwW7tPtsndVIxl92+c4ESf7ojctfgFcOKuaeqgnZrMN48012KLiJmbpDk1iU0y8GgOdLil
	dCgDpbx3vMSDp5fPdcOyfQ=
X-Received: by 2002:a05:600c:3b0a:b0:495:607e:5ed6 with SMTP id 5b1f17b1804b1-495608bdb42mr146787305e9.31.1784741039666;
        Wed, 22 Jul 2026 10:23:59 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/27] expat: fix CVE-2026-56405
Date: Wed, 22 Jul 2026 19:23:17 +0200
Message-ID: <280ff735d740a899926615d91ee4c344a6d5f0bb.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241714

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56405.patch          | 32 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 00000000000..c850801c1ac
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,32 @@
+From 73209f445f0265b203829fa7873caa78ca83cefe Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH] lib: Protect function getAttributeId from signed integer
+ overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 1b7e289f..ec707336 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7324,6 +7324,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index d15e0232077..789fd7e077b 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

