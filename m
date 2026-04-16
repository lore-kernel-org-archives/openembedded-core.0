Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5044BF8DFDD
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:05 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28555.1776378782366933222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HdZN5I8Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso10619015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378780; x=1776983580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAr4fTMWwU+MyfZAnRmFaZ/19JNM+e3XSkkF7nKjfgE=;
        b=HdZN5I8QSmlQOWSYalvQLjiXwjmbwXP/sfv4cKrdGzQXgpKGG4e4KWIKsfn7h6XTcv
         e4GlGC+Atqfs1LzhQqWYG7BNUzZCvYmG0s44CAh0WHo58iS/AnoodXdtNU5a+wXv2EVh
         gPVdW2LVFm6IuwkjbDZ6qoATEXNKjkcyK0gQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378780; x=1776983580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAr4fTMWwU+MyfZAnRmFaZ/19JNM+e3XSkkF7nKjfgE=;
        b=Zabd397cHWoOx/zbApUDCyJ7bJBxYAsX936vZg/Ha1C0k0vebIm0Mt2SIjvzSzTXLE
         dZS05tVE0GnP/EzxjQX7naGphpoQAJEjvavK8o5xSjVH8Ssq9jU3GAZ/wFOSU+HlADBy
         flYUHH0IL8xppwb8qBGDDXnyaOpDoGyf7fKKlvjfek58zFLYW1M4AUKuez8kS3LfgNGw
         XwLcn+ybfFGdWUntTRhFFh/P9WjR2d1rDWJJuJtToHrl6EWRmhIFhqu5kwkq9cTRsyFj
         z5K4/n2hu1rSAGzAG2LSFQLWRMGCXfJSZ4eOUdZlPez1G1PvxtUElzMzr+fxcPI6ARAb
         YZvw==
X-Gm-Message-State: AOJu0Yzi5kgqVDCLQnuLtdwdO6i4DfHajXviWT675rT5gIYaQvjbX7wX
	WZ0goqaPPcTVYRBcxALCz1IiV5kjn6czRncoHVCD5l6EBxcKVTwCEb1RoPnSsR/GCrQhIazRQaV
	/9R0I30C9hjbX
X-Gm-Gg: AeBDieuusSGgqrv1pN2Qf1z0XgSqaYmaDsIxr1pzZ3DlD042hLwSZG8poAtWSOdpZh/
	lDt73zSwybDubX5PCWtB0+nZdSGVhgSM9Mw8tMv3kaA07KMx81m77e5sCkHAv9ds0kIfNgUTc0/
	VzRqWOpLHQwM8X9nlBSxfEvLZt8fBUd3L8n+Uz1CxFHnlmzQzwAuK4HV5XAIo/9BBUBHYCq53Wv
	AKQNRWEYre77mbTbRT+0oSHnye+GfehAOzaFCzDj77vojdF4oMib0vv7DaK4yAlAxFAOPVyvRya
	k6AAhvDEJSwRVFFNTE8woE28hoH0QWM/32PGFpbKZY7YPQ6WrcJQs/yChFAGEIttdTX41q01Jpc
	kTTuS9V5L4roJ8Vn3DLzb7znFZKJvKXicu1urZGBxYl485jM73AiFYmsG5Tt5Wgq6wMq3B9qFq7
	O9QgQqqukWOfT8TWQkQVgHqddaVzC4sf3nZ/sJJYRpSSpSZlJP5Y7zKfa6kcG/Ax73XR6A3P5/w
	GAmushdu3iNQIUK8V76NDU9VVOmnaBDY7TZ7A==
X-Received: by 2002:a05:600c:4749:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488fb889385mr2973305e9.5.1776378780504;
        Thu, 16 Apr 2026 15:33:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 04/51] binutils: Fix CVE-2025-69649
Date: Fri, 17 Apr 2026 00:29:47 +0200
Message-ID: <e11b78d960f445c6796e83579c822b0b34cbf17a.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235433

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-69649.patch    | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index a2bb278b438..94b7ca54cb8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -50,4 +50,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
+     file://CVE-2025-69649.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 00000000000..05b382ea526
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,41 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+ 
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++      section = filedata->section_headers;
++      if (section != NULL)
++	for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	  if (display_relocations (section, filedata))
+ 	    found = true;
+-	}
+ 
+       if (! found)
+ 	{
+-- 
+2.35.6
+

