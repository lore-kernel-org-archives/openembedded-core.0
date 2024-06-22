Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DC7C41513
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.95796.1719057482855867788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DO5M0sLE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-706642b4403so416256b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057482; x=1719662282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHLUaXTgyn7BSwtgzkJ+Ig2CvvHeNQpYEm76ULehYUA=;
        b=DO5M0sLEXNexVLKBrY385OAJvmhnOn6R0AuF/vp16B7l3D1HPsKpMe7mG7KtlJ+KRN
         w3xHuNWUxyGUWsH83EJN3+hM8LPl8W+LO3p7w+4E3FWE1TQzHn18ojzqoWu3Tub/2QVA
         so91wJh+gHojjaCYUqA8sz0EFTov1th73LyyB+42yImxZed1TWoc5DiNSQUsqUrynG0W
         9b8OvLMh7oQ3yZFx9i6dOVHy1bI6uOe+EqJifNtt2Ij3xYVbU1N0LlzS535i1BKFOECE
         FLzgNynwGOqmKo9L/GUfLPrbW7k3hr8TIisIHZmBNky5f+e6v0TRd3S0bBnfRfCaUucm
         TL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057482; x=1719662282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHLUaXTgyn7BSwtgzkJ+Ig2CvvHeNQpYEm76ULehYUA=;
        b=wPTLQ0aZolzSvxSqQd++Pj+vtU/ulaPZ8CrD985u28dDeLPD/UA5lJKTDnzZoJlufr
         XVXQYhKOaoDww0OdKwCzkhgia3XPmkZ3Uk1KBTlIH9RE86f0laIcHdcR/wgXwzHdBtCx
         5HU7HzGO00Ye7uY+BodXJGMMfRvnINMidfjxG0VU9izmLB/GaU2oRUtZ14umAR5a5t0J
         rZ+Gq3XznOyLbRY825GgE/JBm++Z0NOCr2tSTWtsLmIKlBlMhfubxbfv0qOLxPJOsde2
         Yd/YWdWv62y6jNYnWNkIUC5U/kIgBz9OjsjNtdUFyC888M12Fc8wgXLQA/2pI23DyD0d
         fLew==
X-Gm-Message-State: AOJu0YzQcaf1XJsB47vwkKkWZv2Ik2gE2yBv1ow1hYPJWrnMXHb1l0NF
	vPZ+4XI8CRNsca3K+J3sOAnElYDuIlMAC5cxmTDOIid95uwXPW4vH2A4K9EuBExHEli012NRioY
	g
X-Google-Smtp-Source: AGHT+IHzwzha8CJaynV0MOVvD9hF0eNrW4DH6bOnkOZpJjW7HHzyfDIzS/62sWtkcpBmo/tX/y7kzg==
X-Received: by 2002:a05:6a00:2fd0:b0:705:a9d9:62b1 with SMTP id d2e1a72fcca58-7066a0b783fmr1398191b3a.15.1719057481934;
        Sat, 22 Jun 2024 04:58:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] libxml2: Security fix for CVE-2024-34459
Date: Sat, 22 Jun 2024 04:57:29 -0700
Message-Id: <b9f46d058854c0a6104a928b7b0b30d65fb87c2e.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201039

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2876ac5392a4e891b81e40e592c3ac6cb46016ce]

CVE's Fixed:
CVE-2024-34459 libxml2: buffer over-read in xmlHTMLPrintFileContext in xmllint.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2024-34459.patch       | 30 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-34459.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-34459.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-34459.patch
new file mode 100644
index 0000000000..96e3d3cfaf
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-34459.patch
@@ -0,0 +1,30 @@
+From 78fce372041d53cfeaaf2c11c71d07eef55ecfd1 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 8 May 2024 11:49:31 +0200
+Subject: [PATCH] Fix buffer overread with `xmllint --htmlout`
+
+Add a missing bounds check.
+
+Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2876ac5392a4e891b81e40e592c3ac6cb46016ce]
+CVE: CVE-2024-34459
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ xmllint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmllint.c b/xmllint.c
+index ee6bfdc..2f792f1 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -602,7 +602,7 @@ xmlHTMLPrintFileContext(xmlParserInputPtr input) {
+     len = strlen(buffer);
+     snprintf(&buffer[len], sizeof(buffer) - len, "\n");
+     cur = input->cur;
+-    while ((*cur == '\n') || (*cur == '\r'))
++    while ((cur > base) && ((*cur == '\n') || (*cur == '\r')))
+ 	cur--;
+     n = 0;
+     while ((cur != base) && (n++ < 80)) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 2b7e9999d9..94b3b510ae 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -32,6 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-45322-1.patch \
            file://CVE-2023-45322-2.patch \
            file://CVE-2024-25062.patch \
+           file://CVE-2024-34459.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.34.1


