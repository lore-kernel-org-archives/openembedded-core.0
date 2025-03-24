Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3A4C3600D
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:05 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.48750.1742845023072388582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yaWqwnN1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227a8cdd241so15126685ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845022; x=1743449822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbOEYI2Lp5ZGG1wj/WiG4zjRBK+lGG2wFKkxJmYfwqs=;
        b=yaWqwnN1679VQnZVL//i0RuabBLe97rukyMUz8idAeYP8NCN9OqVmLlC8rq9PF2/Zu
         W11RZymIRsqIweqsbt9YHQXckz7MV5C5/VUf2igLRHhJFGgj35hIdvl3hgWpB82Hq0IT
         0eqIEc910YWpu4AwZZeSwfW+Bd9bbpyPLjZeZOSZniS9A3rrx3dDXe+O6TqYXwYRSgUl
         jypX6HKBEvD70twzIvmsf39WGk5FCkeLg8V2bNoGbPYVjHdt1BdWN/oTyu5gckmW/pXK
         S4oGfVjFtaSywYJAR7/+JmQDnHCxuM6ZPqLOUbk1DJueUVm/+MRmRL2vwVoxQDNPftLp
         pE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845022; x=1743449822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbOEYI2Lp5ZGG1wj/WiG4zjRBK+lGG2wFKkxJmYfwqs=;
        b=vN9/3HYjCKhaW42AIh5ruS6B+81A2LstQEUa/+cs144oauGlrJqGaSwwjlbEqW866X
         Trv42U9sIul/PdVgnT+bhmKoA9LrBwImM9EBQhWwRItcJ+BY5Ny2Hk1804HhePe+oORe
         S7+2ClOKP6oOU6Xon5eFxWNALknHmK88a7Mu+TaXDybymUfF7mm4t98/qvQyaH1sPDdY
         roDWA+b/gMFZCrtRF9cg0KWArzwVFqpswXYXjfopCh9/NpR5hxf6TUQHRGwKrYG4m/da
         Dzs0/TUOklK0vVbJC0KpfglBSoJPq4Mnk2w7a4i+GbB8hqXh3zb5BQQehuK/IfsK85EL
         tgXQ==
X-Gm-Message-State: AOJu0YzuliQnxOblRvapzCXwHidiEXDYMOrvD2TMu0fKKeGnICFBOAd9
	AelnADXfBMvU4GsVY+uSL+TDFVQHW4cvpmP3+HQ1WG0WJ1ALUDy4sF+3iXg5oS3Vie+1SePkhvP
	+
X-Gm-Gg: ASbGncvh9PWmbExWXPPDZ0MVqir8JvaZkNDrcEB531w4k0QsNuwRjMjUSXXCSbZV97q
	vU5h9kKMHrz3ftH0mrD2kmf7rzHD5FeYHp4kWvNpOT0Y4/vz1jjqaFB0Ujx2MvLpL/HpTQPwW21
	WZzFqZYPUzbvwRUT2jYfgvZ9fUSdA67oRYyqubAVjYG9JBPz4scLB080qOPpzOgz13PyywHAYV5
	Uo/jyl3lC9KT74sOvrBEV3wEjbyst+Et0CTpiaG9x4Bb18/iu1vdeU8PLiwXDuLjmPIufPAl8W+
	9u4QCkoXBQZWHbhwB+0oUJ4pPkBOvfv0SmhX
X-Google-Smtp-Source: AGHT+IHOXdP8Y+55m4vZbLWinwVvv/j0j5AF/ESjoio65wUipy0RefbJrqumTLV2lbg1UE/6oIGmog==
X-Received: by 2002:a17:902:f70c:b0:224:c76:5e57 with SMTP id d9443c01a7336-22780e02a4emr252225915ad.39.1742845022109;
        Mon, 24 Mar 2025 12:37:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:37:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] libxslt: Fix for CVE-2024-55549
Date: Mon, 24 Mar 2025 12:36:49 -0700
Message-ID: <eae0c33539f302124544373b74bd6883467ff549.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742844907.git.steve@sakoman.com>
References: <cover.1742844907.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213574

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.gnome.org/GNOME/libxslt/-/commit/46041b65f2fbddf5c284ee1a1332fa2c515c0515

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/libxslt/CVE-2024-55549.patch      | 49 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch b/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch
new file mode 100644
index 0000000000..88a17a4d0c
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch
@@ -0,0 +1,49 @@
+From 46041b65f2fbddf5c284ee1a1332fa2c515c0515 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 5 Dec 2024 12:43:19 +0100
+Subject: [PATCH] [CVE-2024-55549] Fix UAF related to excluded namespaces
+
+Definitions of excluded namespaces could be deleted in
+xsltParseTemplateContent. Store excluded namespace URIs in the
+stylesheet's dictionary instead of referencing the namespace definition.
+
+Thanks to Ivan Fratric for the report!
+
+Fixes #127.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/46041b65f2fbddf5c284ee1a1332fa2c515c0515]
+CVE: CVE-2024-55549
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libxslt/xslt.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/libxslt/xslt.c b/libxslt/xslt.c
+index 69116f2..02c2e3a 100644
+--- a/libxslt/xslt.c
++++ b/libxslt/xslt.c
+@@ -153,10 +153,20 @@ xsltParseContentError(xsltStylesheetPtr style,
+  * in case of error
+  */
+ static int
+-exclPrefixPush(xsltStylesheetPtr style, xmlChar * value)
++exclPrefixPush(xsltStylesheetPtr style, xmlChar * orig)
+ {
++    xmlChar *value;
+     int i;
+ 
++    /*
++     * orig can come from a namespace definition on a node which
++     * could be deleted later, for example in xsltParseTemplateContent.
++     * Store the string in stylesheet's dict to avoid use after free.
++     */
++    value = (xmlChar *) xmlDictLookup(style->dict, orig, -1);
++    if (value == NULL)
++	return(-1);
++
+     if (style->exclPrefixMax == 0) {
+         style->exclPrefixMax = 4;
+         style->exclPrefixTab =
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 2fd777766c..1f0d845421 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
+           file://CVE-2024-55549.patch \
+          "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
 
-- 
2.43.0


