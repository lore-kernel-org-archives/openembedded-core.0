Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76065C3ABAD
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.8387.1745982020717708014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oggoOm2X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso5361315ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982020; x=1746586820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UST1Mi40G/ZR+YlagOrkkhzk8x+c2G+x5uHDSWseps4=;
        b=oggoOm2XgRS3oxXpe0D/QgSDvhfbAPp+UZCGU2nHh7Ilb+SH8bSCzcWWdOh4GRZUZb
         40mcasNWmnRhXIYKDi0OM4P9RpBfk2qb45y0o4eGKxdS6dbnWZOR8zjXxK4odZ7dsVx3
         TULwY6mAXNl39ZC7Fg1LyghQEWFwAh1zUYobtS065hQWXp+zStAAnnAQohjrEqK8KXlA
         4z9gVXF+O85CJ4J5UkqF/cqtYRHjruWO8ox8LWveVbOV9z5Zn9hZpk7gd62VuqZoBSau
         doD/OmQjkemrHb3738cwsPjOGi4TQMJQ/8WLSO3traD66rcmkbe1wNh3SWEFk4b4HMlm
         5obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982020; x=1746586820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UST1Mi40G/ZR+YlagOrkkhzk8x+c2G+x5uHDSWseps4=;
        b=cpYx4wPxeD4ObsdfG42K/kJtcr+MQq5YNHD6pkDC6n0J0hk+e72fefGR2HsL67VLmN
         owgUNQ5NBzaZWuVGj0J2gKMeKvn/JFjpd1yXociF0Cf5Povm0wH11w94iT9ZJHRlZjFT
         WzoSZz6Qi6bLgyiZxDozRkSrJkXCUGsSk8g1opctKVtCfAnJwpL9Mu4FfEWQ3n8AvaRh
         pEWaKzHlndxrcjdzITrBDkaKxkUvpTTbWoaMezhI6ZZoOkPXiGczAAFgI2pNJkv001E8
         sjAnH4UBa4lcidFlIAoOh1qwySmo2FqFjdsaO6Fx8fQdtkH1A5AKzcZ0A2617NnGFrX8
         1KKw==
X-Gm-Message-State: AOJu0Ywb4BzAxKc7w/NTNYTrjML9LTNQr/N6ObkvP3/+m5Qs4TozWFTP
	c9nRF2jKr0SIK9cd8R/A8WbxBUCbYr31B2vWtAazN0m5J/BUJpI2e6NLFP+oPGvCGQ37phw3Dcj
	M
X-Gm-Gg: ASbGncvjqBWL7TvEhRwlgLYvhndgck9kgGAYBQPX0rkvXWnreqsvbIJBDhPKebCchOO
	TvRdC+6aBJLNWZICOdOGQd5DXZQMu2jWORQzWQ5wkF5FQjUrg5qH0P0pIg13uNpWNTworMTYtLa
	tIQiAgsRKYEFOkvkFals5B5I++z77uar1vylMMwVPKWskPvQpGSAhwwVboLfsAwfct1K1CYL2g4
	ulr1EcoScSeHzPp6qm4ojBqITGyk+EDzYtPOjSbGUN6zs+OvSt2HAKx4h7Tx0TRi5bvQjpu3oAp
	LhKfrPWJTEHH+vK6UBFbU7i+lJZnqHY=
X-Google-Smtp-Source: AGHT+IELobHQLNJOHMN/7pQEUZNDpb7ki99UxGAcM9TB39Y5V7na3bhO1Q/GilYdVe9gleevTeYilA==
X-Received: by 2002:a17:903:1a05:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22df474794fmr17115415ad.4.1745982019868;
        Tue, 29 Apr 2025 20:00:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/15] libxml2: patch CVE-2025-32415
Date: Tue, 29 Apr 2025 19:59:52 -0700
Message-ID: <2335d4f0d1826647eaee224c469331980fc84ed2.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215710

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.13 branch as 2.12 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-32415.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
new file mode 100644
index 0000000000..d8ff654a23
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
+@@ -23324,7 +23324,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			j++;
+ 		    } while (j < nbDupls);
+ 		}
+-		if (nbNodeTable) {
++		if (bind->nbNodes) {
+ 		    j = 0;
+ 		    do {
+ 			if (nbFields == 1) {
+@@ -23375,7 +23375,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 
+ next_node_table_entry:
+ 			j++;
+-		    } while (j < nbNodeTable);
++		    } while (j < bind->nbNodes);
+ 		}
+ 		/*
+ 		* If everything is fine, then add the IDC target-node to
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 42672e35bd..2eea65732b 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -19,6 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://CVE-2025-32414.patch \
+           file://CVE-2025-32415.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0


