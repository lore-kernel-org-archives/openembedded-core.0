Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52094C3ABAF
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.8209.1745981650081017636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ogvmpn1x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so6221949a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981649; x=1746586449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZWRdMQFALM0SGInq8/+ihs9XpdSePPRkVAFSYjABow=;
        b=Ogvmpn1xn4isRe4W4ga6rVyrJfpmwaWtcsqz2tE56mIP3gWQYIEF0bp5TRIjIbsFGl
         44H4rf1RQqp6oOlzSYBfER+84gF746TOeTrYiNwcRVuRZ3kKt0KUbr1/G4JUuDwyoMYF
         hpwm5b1u/7OZbBjHuPzMdNWWF3xxrrRMQSNyIDt7TxePLmq0g2CNhr0rlsFI4+ll0puE
         MQnvssB7UHMYHAtFm/ZVAIiUHu1gDoCcL2yrgsKx0JGmDrvco4WZaj+e9k9puiiMBhI5
         PuQq3OvoZkVQI/1alMuV+cnR/yUGQc4cUkTVFejNxroRDC7skyR6V/HRP9CnHxLZI/Ma
         d0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981649; x=1746586449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZWRdMQFALM0SGInq8/+ihs9XpdSePPRkVAFSYjABow=;
        b=ewTa9tWp4En2ccPm9IqxRIivY1HzZvN8WpS8yWLz3rfaJdeTd22W3nNTCYJxP6wMf+
         i89rdJBoq7KMTrO+dZt5U4HUu+IEX9MuScmqGNTdAVxTFGgLIn1ivuqWC/BMrIfD7/p2
         6JlI6ST+tSqMGI8xOv7NRXkIxIjGIyhJeyoxdZODBRROxBOcOVJhO6z5h6i06NEGu0cC
         LIIfFzN5+pfoicEvbLhzkxyEuz0EFlGVeS1OyW6PKjUtzTNPceqoMjGzAodR6Tejnw4Y
         1nhSOjUo47J9mJtjhUv5cJR/FHu5d+XB+70XZdSjpCRx/APnqUYUQ1spSPpbyFdp8huC
         Kytw==
X-Gm-Message-State: AOJu0YyQvbKoH914qOV6LgkkAbsKWUyCp6gAmxbsZaFmg4sX3v2RuX/h
	5IohFE44B9wahHVblaNbFHVGOcgE1DKzyBBzxscUiBUmXdMJOt8PiciZpIG5ofRem6IuL6D+HTD
	R
X-Gm-Gg: ASbGnct0PoSKzNXBO3MZOEsxn9qBkM0V8FUXIhkucaWHTtb1cBvo9ZXoValf+FqDjeR
	BO65dbc9j6g1WTktN2DKmeK31F6c6XYiCyeKwTgcHPKfEuW/M0x042vyTIftH9GX70Pox4DqRBt
	IHmZG60vMV7+3GrkKaKStG8SBS3selNCGkzdAwEMyPwXrka0xf6UNuhxdDnTh2XEq1v1LoglskH
	jb+7JiZBZ9XJmiXtRInb0gMfW/JvU9mbh9o8EFEapePkgdvgPepGPeXbV71PDf0BBmrIjERgh7d
	tiljI331EZuzSLfQtF1KmeKvG6CHkv4=
X-Google-Smtp-Source: AGHT+IFH7ZpQ/D4SWB4kEdXUtlUWegiMx7dx89ZCsY0Qa8qd2i0v2Bwmt7H9OtH8BgPlfIuz4rhMeA==
X-Received: by 2002:a17:90b:2812:b0:309:e195:59d4 with SMTP id 98e67ed59e1d1-30a332e99ccmr2649966a91.12.1745981649188;
        Tue, 29 Apr 2025 19:54:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] libxml2: patch CVE-2025-32415
Date: Tue, 29 Apr 2025 19:53:32 -0700
Message-ID: <7777cd6b28988a0981b990d9da9d448dcdfe7b8b.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215698

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.13 branch as 2.9 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-32415.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
new file mode 100644
index 0000000000..4f39bb824b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
@@ -0,0 +1,39 @@
+From 384cc7c182fc00c6d5e2ab4b5e3671b2e3f93c84 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 6 Apr 2025 12:41:11 +0200
+Subject: [PATCH] [CVE-2025-32415] schemas: Fix heap buffer overflow in
+ xmlSchemaIDCFillNodeTables
+
+Don't use local variable which could contain a stale value.
+
+Fixes #890.
+
+CVE: CVE-2025-32415
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/384cc7c182fc00c6d5e2ab4b5e3671b2e3f93c84]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ xmlschemas.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index 28b14bd4..428e3c82 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -23607,7 +23607,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			j++;
+ 		    } while (j < nbDupls);
+ 		}
+-		if (nbNodeTable) {
++		if (bind->nbNodes) {
+ 		    j = 0;
+ 		    do {
+ 			if (nbFields == 1) {
+@@ -23657,7 +23657,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 
+ next_node_table_entry:
+ 			j++;
+-		    } while (j < nbNodeTable);
++		    } while (j < bind->nbNodes);
+ 		}
+ 		/*
+ 		* If everything is fine, then add the IDC target-node to
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index e281a39fd4..bd6dd88dee 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -38,6 +38,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-56171.patch \
            file://CVE-2025-24928.patch \
            file://CVE-2025-32414.patch \
+           file://CVE-2025-32415.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


