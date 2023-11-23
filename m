Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60018C61D9D
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 03:10:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.83758.1700709027373369524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 19:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XdN8M4uy;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2806cbd43b8so401558a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 19:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700709026; x=1701313826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3mwu+EUlDk0y6mzh+kaBkfY8GLUSj+uIeup/CE072U=;
        b=XdN8M4uy9eqSyCVYAUlwlj/xHYR57EB1eT+lVx83sY89vZx6m6HA5Jvlsex5CF6G0+
         5LUiJ9G/YpsM6GXE8E3klWeLQaFAqmK0bf1jGhvhy07azjl3sknDQ4wVsNciFTn03gJJ
         r7z4G5xbbGllPtGTxNX0DZT/1+kI7vknRi5rOoC9CscRH5duBMcnq987jJQ7ujKztLl7
         0QXxTZSBRwZKV+4i4565gq5dOif+7xQPzHeUyP9MVmkhCk637WkFP0RsMwmWJFljRlaQ
         7zMDAgXbRu64CR+tsBawa7ONFv7Utai2SUG8fVvv3XmNM6G/iwx0+Ypu4jrlHAUrvr/H
         iaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700709026; x=1701313826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3mwu+EUlDk0y6mzh+kaBkfY8GLUSj+uIeup/CE072U=;
        b=j7wYrmZSWyRKXqnrBeesRBeznktU5pAETxDhlbPXEMWXAiblAAIYdW2d5FUxNn63y/
         0gI43wDykwgOYJ466ZeWRjKIjl9fkvZ2AH12itSEisvLGuPoz6aL128Gy7X2KvEJ3JJ5
         p3lzA/C56JR5hh5SbqmdRySzIlpvrGJxExlIuCtSMd/6w6skkVjPe/zOAjOL8UqKiuid
         thTNOZn9miXb51W+R/yzP5hiuew5NK/6akKsVwUKZ+1gubzeWkN2wlMjhsmtATIz3Qsx
         PZHE6PnazWINIDLgn+NXI/4hzwDn1OJt3bleKru8te322xqYztnCsmmNWQW8JN1wG8fj
         DGIA==
X-Gm-Message-State: AOJu0YzGcT0Lu2davKUNjP6AZ89kW7PlCx2jdQz7eNZ1H6D/4CHs4rRj
	fqzmp8c7L55oyALFe6+dSnIDPbNoPIhh/g==
X-Google-Smtp-Source: AGHT+IFbCTrpQlm3CjICmvmrjSr2P4BMgoqZhPwhHYN2tfLeZcHPD0xnEuceplvPkG8YBfnzJ69Zvg==
X-Received: by 2002:a17:90b:4c88:b0:27d:a0e5:2a67 with SMTP id my8-20020a17090b4c8800b0027da0e52a67mr4898100pjb.18.1700709026143;
        Wed, 22 Nov 2023 19:10:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id v8-20020a170902b7c800b001bc5dc0cd75sm149060plz.180.2023.11.22.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 19:10:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libsoup-2.4: Fix build with clang-17 and libxml2-2.12
Date: Wed, 22 Nov 2023 19:10:22 -0800
Message-ID: <20231123031022.2885472-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123031022.2885472-1-raj.khem@gmail.com>
References: <20231123031022.2885472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 03:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191131

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ild-with-libxml2-2.12.0-and-clang-17.patch | 44 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
new file mode 100644
index 00000000000..d867e5bc176
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
@@ -0,0 +1,44 @@
+From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Nov 2023 18:49:10 -0800
+Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
+
+Fixes build errors about missing function prototypes with clang-17
+
+Fixes
+| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libsoup/soup-xmlrpc-old.c | 1 +
+ libsoup/soup-xmlrpc.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
+index c57086b6..527e3b23 100644
+--- a/libsoup/soup-xmlrpc-old.c
++++ b/libsoup/soup-xmlrpc-old.c
+@@ -11,6 +11,7 @@
+ 
+ #include <string.h>
+ 
++#include <libxml/parser.h>
+ #include <libxml/tree.h>
+ 
+ #include "soup-xmlrpc-old.h"
+diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
+index 42dcda9c..e991cbf0 100644
+--- a/libsoup/soup-xmlrpc.c
++++ b/libsoup/soup-xmlrpc.c
+@@ -17,6 +17,7 @@
+ 
+ #include <string.h>
+ #include <errno.h>
++#include <libxml/parser.h>
+ #include <libxml/tree.h>
+ #include "soup-xmlrpc.h"
+ #include "soup.h"
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index a605857c609..ee20530b644 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -11,7 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.43.0


