Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2060CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 13:59:02 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.23312.1755179941003176472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 06:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XzhabJlw;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-323266d38c2so1245258a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755179940; x=1755784740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6EtRucJCV4WKrGShs8iSEqhS6jqqhRdRjuV8q132f0=;
        b=XzhabJlwVVyG3QjH/ItEo+tBFXNfnlprN0MnZVfgidHyIT/2Y7fwcDUG1PMvHt/+Xf
         pagOBNpCqzrh5mCUD0L7QT35bppuq82GGLTyi3rBDXZl9vfo+WzwMdzQigv/vADUUZVI
         Cr1pRA6wc2aW7dl7c7asy2OVWXs7ue3sfQQHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179940; x=1755784740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6EtRucJCV4WKrGShs8iSEqhS6jqqhRdRjuV8q132f0=;
        b=q3IdWl15nqfF26ds9dwoBYpSzXFPZgXbrCOHRaJqC/d5WQcc6lbgeMBc0dswbE+Bo9
         1fGo1BCbYN3cgjOJ13VoY8CLhiQXggX1wmgiZiDgOxIg8Hrr5KpvomhsS+hxLKXPhgxt
         V4ziApyGg4kEzeVtDmayeB0qED23Yc8Cpu5ywlfDMi0nI8u0h3uhmU4SGadTovUqFTeN
         bps8xoHUHGCQbsaGrl+vA3HW5iftxHdLY6KiOKn3xkZr7SrKc4cs7HfB27sD/P6ymYUK
         SJ9CJlghczuBDDONWRk+NS+X7DWhgh/b0aOjy7n/+odv+hOIME6myq8BH9eQjHBtvlY4
         51Uw==
X-Gm-Message-State: AOJu0YzNd04z+glf3hpFR48W45iDidBpAWYz3CKhlGeQGFRBq94U+EcT
	F26YRq+wLr+cqnVOqLfAmE321ISqFSYxa2u5kDSuXHdB1SU+ZY71tr8kIkHeztwFFNGOHzLg6c3
	n/FYyibk=
X-Gm-Gg: ASbGncuKbwINDLmnnk0oqCZ3mK1guK+K8vc8AKQpEmWv/TUcn4C/CG4SsxFTCTagEZo
	3aTmblAkvdZ0Dmx82HBN4MkNeqNLmgdc3nvy+Qt3vkmFX80e8jeoH91GOE1JljW/LV9Iux7qr/X
	Im+OzgQhWwh8qikQuKOrJ2X+pdbompLw/xZAOUrYShqpcdqRT1w/OQbiysDoxKe8xlIDb8NSuts
	BQrtlkVzlKiWwzE1I1tHidEgooDMrDdLNx9CoHL9uLcXn56SqZUO8rd+wJcjVUNLjnhM6JjIVpF
	jWNpgRBD+SuJw75Yk+BI8m4PlhOVSwMmCmmfuO4WQC3t8L4/lvSz8xy7IV8BTww7/C5CVVMOo9t
	82Piqii7grJmS+ayN7ICvV3hJDx33bgHR+w==
X-Google-Smtp-Source: AGHT+IGCzQfbEO7bXWluOfhKedkllv/FDWaP/P+xRG6ltB2iC1Z9+CzxRil9st0LSSVRcp3CyQzCXg==
X-Received: by 2002:a17:90b:350d:b0:31f:210d:2e56 with SMTP id 98e67ed59e1d1-32327a8a382mr5206591a91.28.1755179939745;
        Thu, 14 Aug 2025 06:58:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.229.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233100c1d0sm1919591a91.17.2025.08.14.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:58:59 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] xserver-xorg: Fix for CVE-2025-49177
Date: Thu, 14 Aug 2025 19:28:31 +0530
Message-Id: <20250814135831.981377-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814135831.981377-1-vanusuri@mvista.com>
References: <20250814135831.981377-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 13:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221866

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49177.patch         | 54 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch
new file mode 100644
index 0000000000..d71d97d3c2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch
@@ -0,0 +1,54 @@
+From ab02fb96b1c701c3bb47617d965522c34befa6af Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:05:36 +0200
+Subject: [PATCH] xfixes: Check request length for SetClientDisconnectMode
+
+The handler of XFixesSetClientDisconnectMode does not check the client
+request length.
+
+A client could send a shorter request and read data from a former
+request.
+
+Fix the issue by checking the request size matches.
+
+CVE-2025-49177
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Fixes: e167299f6 - xfixes: Add ClientDisconnectMode
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af]
+CVE: CVE-2025-49177
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xfixes/disconnect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfixes/disconnect.c b/xfixes/disconnect.c
+index 7793272..209e3d8 100644
+--- a/xfixes/disconnect.c
++++ b/xfixes/disconnect.c
+@@ -67,6 +67,7 @@ ProcXFixesSetClientDisconnectMode(ClientPtr client)
+     ClientDisconnectPtr pDisconnect = GetClientDisconnect(client);
+ 
+     REQUEST(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+ 
+     pDisconnect->disconnect_mode = stuff->disconnect_mode;
+ 
+@@ -80,7 +81,7 @@ SProcXFixesSetClientDisconnectMode(ClientPtr client)
+ 
+     swaps(&stuff->length);
+ 
+-    REQUEST_AT_LEAST_SIZE(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+ 
+     swapl(&stuff->disconnect_mode);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 6013d0e53c..1fceec89f7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49175.patch \
            file://CVE-2025-49176-1.patch \
            file://CVE-2025-49176-2.patch \
+           file://CVE-2025-49177.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


