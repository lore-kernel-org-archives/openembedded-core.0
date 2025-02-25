Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496EDC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.9032.1740493826980717665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MwCYdggj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22185cddbffso114245185ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493826; x=1741098626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZPkKa9P7MVpCRyGnwiIPwCKo3yXObnBerk1S6SU+gU=;
        b=MwCYdggjDSFjFPR4vDgj3620VLtnfBmntJhOCKtDAUgtCdautvhFHISA1LMfIND1KZ
         a+sISIWOjqihM+20bH0S8st337ju75QVaMw4ngy0fQPrLD1lTh+oiJHC4of4b6t7huI7
         4AtltVx0EjDw9lfyeXAUpi3AM5EX8Z2VGdv1X8X2Nu9oPEH7UDfEEATW0dsCL7RXWD+U
         cksHPNP5Dd22eHiHwYYZHmBYqS3P/NlydNi/48UD+Hx0T7pd+PDYXmFS/PT3yFf/+3uV
         CEBRgJdZeuD8oTsPKL+Ihu2N9Oz0Oj+jGNnC+5QTBPbL9Ug3AKvTPPWROAAc2o2F/WyI
         sbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493826; x=1741098626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZPkKa9P7MVpCRyGnwiIPwCKo3yXObnBerk1S6SU+gU=;
        b=HY94Jgoagb+wERs3Kf9IJoSygKPrD7n9G7boI2N1kwus3m6OjDQGy0hASgq+IRtiTe
         CQB8kukCX9V8paEhtEG4xgtdqStnpUYvSgE3FD2ZNguuSckdiqYIrpJzyFWrSwpEeSUQ
         YzxW+KLeN/jTwMtaQCjy9l8Qd8u3/+c7y/lhXn13lV4L3JKzxQ9/ZnneBMR5rEW8DplY
         j1A72DWmZeDUCPACZqsEk1VemCVLLKxleTpgjt+ZSPQTC9iypRGA7JRvVO7WnO5xIH5N
         YC5Yf/u7SNRpBBv/D/lZjVVthF+I2+yLB1TNflzv6/V2Tzpz3g+SKv4SDYW3Ilx3ezDi
         54Yg==
X-Gm-Message-State: AOJu0YytvcLlhn+m0pUZnHt5BFuvVKxlXqZfmQMdiZlwjvXCa9IH3cAq
	P5b8NUFMQFNhPQlRkeqGwtraB230amWhCret70y66HnBZ7d5JN/+qg5vrxMLwBcQHUaC7yPmDdG
	t
X-Gm-Gg: ASbGncvloGbZoHnIgFFUh4HhE93Im2TqVWlr6DOzkwLdjDBWLgNApDKt0lJ3Y0quV57
	4NB/FZ/gpBKJErbXqlRZmRwaHOTK72DA3vOPd0JiwCtzKRyy+aX4+WfidziPdaF10v1gab7Onfw
	j9d+D9iTPAygpLF7pQDqKUy8cguq8bR4TbdUeS9BjSo/7zJcnXENM+o0pj67GrbqdOiAIMMduKR
	Fv4PUrJrCupY9tjs/zLWSxR1oqa1vFk+2CdioUoJrP0/9jbBSbRq/MCkScS7FvTivh3QJMQHDmc
	r9EP7iE2JkgPIi1jWg==
X-Google-Smtp-Source: AGHT+IERKW6x19LwXzHWvJMkrJBR5sGULuMhgV57u39g9Gdt8Xn1byEc6GqIHBGN+R6GyWU/1XnQpQ==
X-Received: by 2002:a05:6a00:2da3:b0:732:7471:aea6 with SMTP id d2e1a72fcca58-7341411d7e6mr41586520b3a.10.1740493825680;
        Tue, 25 Feb 2025 06:30:25 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/22] libxml2: patch CVE-2025-24928
Date: Tue, 25 Feb 2025 06:29:48 -0800
Message-ID: <3ccd936adb928612c9721768708534350aeee351.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211898

From: Peter Marko <peter.marko@siemens.com>

Pick commit fomr 2.12 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-24928.patch       | 58 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch
new file mode 100644
index 0000000000..6da43f81a5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-24928.patch
@@ -0,0 +1,58 @@
+From 858ca26c0689161a6b903a6682cc8a1cc10a0ea8 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 11 Feb 2025 17:30:40 +0100
+Subject: [PATCH] [CVE-2025-24928] Fix stack-buffer-overflow in
+ xmlSnprintfElements
+
+Fixes #847.
+
+CVE: CVE-2025-24928
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/858ca26c0689161a6b903a6682cc8a1cc10a0ea8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ valid.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ed3c8503..36a0435b 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5259,25 +5259,26 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	    return;
+ 	}
+         switch (cur->type) {
+-            case XML_ELEMENT_NODE:
++            case XML_ELEMENT_NODE: {
++                int qnameLen = xmlStrlen(cur->name);
++
++                if ((cur->ns != NULL) && (cur->ns->prefix != NULL))
++                    qnameLen += xmlStrlen(cur->ns->prefix) + 1;
++                if (size - len < qnameLen + 10) {
++                    if ((size - len > 4) && (buf[len - 1] != '.'))
++                        strcat(buf, " ...");
++                    return;
++                }
+ 		if ((cur->ns != NULL) && (cur->ns->prefix != NULL)) {
+-		    if (size - len < xmlStrlen(cur->ns->prefix) + 10) {
+-			if ((size - len > 4) && (buf[len - 1] != '.'))
+-			    strcat(buf, " ...");
+-			return;
+-		    }
+ 		    strcat(buf, (char *) cur->ns->prefix);
+ 		    strcat(buf, ":");
+ 		}
+-                if (size - len < xmlStrlen(cur->name) + 10) {
+-		    if ((size - len > 4) && (buf[len - 1] != '.'))
+-			strcat(buf, " ...");
+-		    return;
+-		}
+-	        strcat(buf, (char *) cur->name);
++                if (cur->name != NULL)
++	            strcat(buf, (char *) cur->name);
+ 		if (cur->next != NULL)
+ 		    strcat(buf, " ");
+ 		break;
++            }
+             case XML_TEXT_NODE:
+ 		if (xmlIsBlankNode(cur))
+ 		    break;
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index e9578ceb59..8f1d882505 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -36,6 +36,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2022-49043.patch \
            file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
            file://CVE-2024-56171.patch \
+           file://CVE-2025-24928.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


