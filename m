Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506F5C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6803.1707746073748105990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mJYHXe4P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e09a890341so1154328b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746073; x=1708350873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYJDBnIMq/LIaC3QEZA1K2gLt/fUNq7hFR7jqGaRrYU=;
        b=mJYHXe4Psf7ZyBaElVSh+N3DbO+E1h28oPtN+ETjjFrYg7q5SjYqHb6PELOANvsHto
         sgiL8yh8UaaV0ND/KLs4p9N6oS/lOV/QEJ1/qn5F2LHzFg1kGDIcv1lueSj7yWk4kJq7
         gofw2Xex7kqq+AhXM8481bX3le/OgGOR7YyygJT2y7fxCmy97gwWv8M79OOtEt0Xyt7F
         YBclHctpyq+OiEBTTzZyLaIRQIK8ByuzGnq1myX0fPU/QmM3fW0lEi/Nzx/ht5A5vQZ7
         r9cZk6uQYZNxkegqYQfPo4OGpYHuvsVyYUxSsZdXEa/N4tBEiSK9ZNCXEL7HFt6fmfRe
         6pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746073; x=1708350873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYJDBnIMq/LIaC3QEZA1K2gLt/fUNq7hFR7jqGaRrYU=;
        b=CEqzqambODg6t63HGsjw7LoJtso9FUNhp0a2v7mA7PMX88zKYG2lZ53XUeekxLQsWw
         u3yDyqZr9zdM5NxmwlLuJfeNz571g1AMQAW0gDIbk7obyYKYOP6qQuM8PwkU1V6MmOGt
         sxqE9+ATpIj/1UUXeBy1V6AebVUrNdpwO83SpdFQEY5L5k53Mzfg6g/sCfsvjgj5fhRw
         NY8zYO6QSU/SdWu0de/2DV0UmGTe+BnPQA7DC3tKsjBvfgBajwaZSHk4Hp8DYNjBtKVM
         a+lyNumZe0vxYV3fa1mTHBgw1MXxlwpIQmTczT2WrpBZOSsI99qQ1yJxk+nhXNhDatD+
         HCuQ==
X-Gm-Message-State: AOJu0Yz16OSsByCDUFq249Zq99LJ6xzCPt0iAVPO1h5IoGcD/GiJ2GhI
	rRHNDSdgy52q7XBC7eJ01n4pUfeu0iWp3U7gy/ACB8QKcrQUwfOpPvHSxnGFijOrkfh/sEy9wt0
	xjWk=
X-Google-Smtp-Source: AGHT+IHl3kmSHj+J8kxl+UjmBb6T+FEnSRWP+YnviXquQ4/3eXsafH6tYlA1szjoaB1PWefhOCoKlg==
X-Received: by 2002:a05:6a20:9d94:b0:19e:a1a1:5360 with SMTP id mu20-20020a056a209d9400b0019ea1a15360mr5047908pzb.23.1707746072857;
        Mon, 12 Feb 2024 05:54:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] libxml2: Fix for CVE-2024-25062
Date: Mon, 12 Feb 2024 03:54:12 -1000
Message-Id: <55027bc882cf6cab830f4e4f21fa9a2ffb4ad72e.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195322

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2024-25062.patch       | 33 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
new file mode 100644
index 0000000000..5365d5546a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
@@ -0,0 +1,33 @@
+From 2b0aac140d739905c7848a42efc60bfe783a39b7 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 14 Oct 2023 22:45:54 +0200
+Subject: [PATCH] [CVE-2024-25062] xmlreader: Don't expand XIncludes when
+ backtracking
+
+Fixes a use-after-free if XML Reader if used with DTD validation and
+XInclude expansion.
+
+Fixes #604.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]
+CVE: CVE-2024-25062
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xmlreader.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xmlreader.c b/xmlreader.c
+index 979385a13..fefd68e0b 100644
+--- a/xmlreader.c
++++ b/xmlreader.c
+@@ -1443,6 +1443,7 @@ node_found:
+      * Handle XInclude if asked for
+      */
+     if ((reader->xinclude) && (reader->in_xinclude == 0) &&
++        (reader->state != XML_TEXTREADER_BACKTRACK) &&
+         (reader->node != NULL) &&
+ 	(reader->node->type == XML_ELEMENT_NODE) &&
+ 	(reader->node->ns != NULL) &&
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 533a6dae01..2b7e9999d9 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -31,6 +31,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-39615-0002.patch \
            file://CVE-2023-45322-1.patch \
            file://CVE-2023-45322-2.patch \
+           file://CVE-2024-25062.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.34.1


