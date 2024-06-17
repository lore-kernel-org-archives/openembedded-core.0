Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38801C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:30:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.59942.1718638241113945942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FsSC+H8t;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f44b5b9de6so35174805ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718638240; x=1719243040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE5DwkJQR4+fPgGIM/oXovtcmIErZRGzUdwNkrPEAgc=;
        b=FsSC+H8tTKnY1/IefBL17fNFewCw9fgLX7NV6l6NyrwVCTPx17uLYUSbuWb4j1O1iv
         jlreHf8ShZOQg/340lv2L5L6BRAHO/oQZE14Nr+6TLYL52NTbRuaxskNfnGv0rEeeeyS
         svU1YIYdbQKHIWGALuODIZY5s0omdw0cMu0Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638240; x=1719243040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE5DwkJQR4+fPgGIM/oXovtcmIErZRGzUdwNkrPEAgc=;
        b=L2WPE47iAhVv6xHNhwq0s5Oq42s1BJ4umTSk66L0kaWvjJRkh28t8I+tNITXYzpip1
         mQk6eT80RveNrlWLBS9CGZmk7ry9iQldJ2k/bJPiz38v4PKXB7Jk+Ecq7XbdaMYg6L+U
         xAHJEZ+nPJUMDiGZnxSCFljUMlRoqJgTYJSgO5tBueB3SJAR/IeoX7EBes7ift0XxOxO
         wwq927xHqs0jBBMQPBV6TMtC+StBcOvnqX8rU+qWsYrK5+JpxfE3MbMhxQLiD+qQm93c
         c+xVXjxWFBIiNxq3Hei8F9HvBJ0iZa25pY5PYaee+RrHv6FOTfJAlxPhZUN3DMbHoZZF
         JKmQ==
X-Gm-Message-State: AOJu0Yy0gGWlmfC0fcmbfPouQ451abJUnPefUCbqrBDY/iIp1Vmh/Gd2
	MLZvsUckuMuT265xSLLxHic9mfh/O4s72IjHehNe0FrVhm00aMobDTPRqQhmqSp/WGDjh8QnllE
	Y
X-Google-Smtp-Source: AGHT+IG7HFIUgKnMpRG6N7L6jNn/ADoS2ziQoTT90hKB7ojVjTLy+JxC4Z14ImVTpMS6af3IEjqmUg==
X-Received: by 2002:a17:902:d50f:b0:1f7:2ba:4c1f with SMTP id d9443c01a7336-1f8627ceff0mr130502925ad.22.1718638240042;
        Mon, 17 Jun 2024 08:30:40 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([117.228.116.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55ca1sm80303825ad.49.2024.06.17.08.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:30:39 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: Security fix for CVE-2024-34459
Date: Mon, 17 Jun 2024 21:00:27 +0530
Message-Id: <20240617153027.8822-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 15:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200844

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2876ac5392a4e891b81e40e592c3ac6cb46016ce]

CVE's Fixed:
CVE-2024-34459 libxml2: buffer over-read in xmlHTMLPrintFileContext in xmllint.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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


