Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.12694.1626103968093800798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LfZpCTDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b12so6482355plh.10
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cWuMYMJwSywFtzi/Dvr6hxwswQTkPE+AjSXuFf7i4yQ=;
        b=LfZpCTDfKyA8VvMKSR1etMpa98TYYLGKWxEhZRZIEoKgwzxUOpyFc20BEFvPvfPrXf
         Lmo6vyG6KSNJkyJ3WeJRKAq7G/16u379QlIQR3gidhiVYLhF+I1wzeaGpL+W93Y7g5Vm
         aiNdN30T0Jl9REs4aqZ66gRMY03EYLtUqAI67lzjrmaAYZ+jNUQDfHZ0/oEZ1wMzwOjc
         BeIrXfn9TpnXTYfyvtmwG3sgwM+I6b/OjPtO1innG8vRwJCOQZiqpS1gk3B5T6LjLQMp
         gPBXpCfOeJVTxAbPPZN7vHDSkTyXe+cte/UzrrMwV4Z/Q/sWF5yxJ44vsVwYOeKpsWz9
         echg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cWuMYMJwSywFtzi/Dvr6hxwswQTkPE+AjSXuFf7i4yQ=;
        b=sYN7qdfC0tokcvsRCVVbL61RWIHPbl1FVVe9oHOeui+V9YjYaA2g1Q28DDfnDHlIgI
         lD4kYMk2FdRvDfNYlX31/KOlVqqB3VS+Zxz5X1XpZBsmCcj8XgKu2/6BzRoRCfA0Vlbj
         14Ny9BZbaqMbciUUOEMKzki1XmGgKuJ+T/XuFn5Evpi5EY3LzEDInwNpFt0PEbEaeAZT
         OaYxnM3P2F54Gi5BZ2t1EKQqMWuGasw+jESrgzeg42Z/RbCiK+2N7hWsl57LWfbFKTLk
         gHGNDErkrMz6F14G6lbKSNxCqtQQm4DH87M5FXQJNtw/VvBTbxWX5psDpKEk0eEvOY/D
         uMzw==
X-Gm-Message-State: AOAM532f4eU1MQh/mT48N2T5a39JF98XaI/YmfStuv1KOd1fZRHxxnia
	4ioBGEGTenpe9os2n6A4EFkY7mv36sKXtWxC
X-Google-Smtp-Source: ABdhPJxLulVaW6kT1gqW2j/gzv6QXjaHdWAwO9dlh5/aBdJuU8TYhRQhovPWI8YdKFezS8Ym9GRDSw==
X-Received: by 2002:a17:90a:66ca:: with SMTP id z10mr53027119pjl.78.1626103967246;
        Mon, 12 Jul 2021 08:32:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] dhcp: fix CVE-2021-25217
Date: Mon, 12 Jul 2021 05:32:00 -1000
Message-Id: <58fa175702f0cd8f00dc5e7938fb55108921d324.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

A buffer overrun in lease file parsing code
can be used to exploit a common vulnerability shared by dhcpd and dhclient.

reference:
https://www.openwall.com/lists/oss-security/2021/05/26/6
https://kb.isc.org/docs/cve-2021-25217
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcp/dhcp/CVE-2021-25217.patch            | 66 +++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
new file mode 100644
index 0000000000..91aaf83a77
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
@@ -0,0 +1,66 @@
+From 5a7344b05081d84343a1627e47478f3990b17700 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Thu, 8 Jul 2021 00:08:25 +0000
+Subject: [PATCH] ISC has disclosed a vulnerability in ISC DHCP
+ (CVE-2021-25217)
+
+On May 26, 2021, we (Internet Systems Consortium) disclosed a
+vulnerability affecting our ISC DHCP software:
+
+    CVE-2021-25217: A buffer overrun in lease file parsing code can be
+    used to exploit a common vulnerability shared by dhcpd and dhclient
+    https://kb.isc.org/docs/cve-2021-25217
+
+New versions of ISC DHCP are available from https://www.isc.org/downloads
+
+Operators and package maintainers who prefer to apply patches selectively can
+find individual vulnerability-specific patches in the "patches" subdirectory
+of the release directories for our two stable release branches (4.4 and 4.1-ESV)
+
+   https://downloads.isc.org/isc/dhcp/4.4.2-P1/patches
+   https://downloads.isc.org/isc/dhcp/4.1-ESV-R16-P1/patches
+
+With the public announcement of this vulnerability, the embargo
+period is ended and any updated software packages that have been
+prepared may be released.
+
+Upstream-Status: Accepted [https://www.openwall.com/lists/oss-security/2021/05/26/6]
+CVE: CVE-2021-25217
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ common/parse.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/common/parse.c b/common/parse.c
+index 386a632..fc7b39c 100644
+--- a/common/parse.c
++++ b/common/parse.c
+@@ -3,7 +3,7 @@
+    Common parser code for dhcpd and dhclient. */
+ 
+ /*
+- * Copyright (c) 2004-2019 by Internet Systems Consortium, Inc. ("ISC")
++ * Copyright (c) 2004-2021 by Internet Systems Consortium, Inc. ("ISC")
+  * Copyright (c) 1995-2003 by Internet Software Consortium
+  *
+  * This Source Code Form is subject to the terms of the Mozilla Public
+@@ -5556,13 +5556,14 @@ int parse_X (cfile, buf, max)
+ 				skip_to_semi (cfile);
+ 				return 0;
+ 			}
+-			convert_num (cfile, &buf [len], val, 16, 8);
+-			if (len++ > max) {
++			if (len >= max) {
+ 				parse_warn (cfile,
+ 					    "hexadecimal constant too long.");
+ 				skip_to_semi (cfile);
+ 				return 0;
+ 			}
++			convert_num (cfile, &buf [len], val, 16, 8);
++			len++;
+ 			token = peek_token (&val, (unsigned *)0, cfile);
+ 			if (token == COLON)
+ 				token = next_token (&val,
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index b56a204821..5609a350cc 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
             file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
+            file://CVE-2021-25217.patch \
 "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-- 
2.25.1

