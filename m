Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A46CD8C8E
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.92769.1696947276432586496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pBhp7j+M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c874b43123so48408945ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947275; x=1697552075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3g4JJk11IO4GuzmgkvSmWjgGPDnVtGWJeN49FIEarQ8=;
        b=pBhp7j+MRaN03y1gRyWMaOE07gLy0OEpax0LQNKEZiAH4m13bJtCTdRv5U5ROHkIYZ
         8WMgikHoHVCxti0jcfy0pdTcnoV6FsoUY+kFW/SFwim0o1BkeOrvusQqeOvZ1J2PQvVt
         9vqDZlsKXvUPPbjmBxMm8/oMKyYHFoXh8otmLkorukF/QD6FXE4joW6EeLTgXXUXop1L
         3WE0z6nTWdDqF/n/VQuIaS4h0vJejSKPIje0XAuom+yb5Rex0IPUnAKKGdex3NhN4c7Z
         E1IKu35MxoBG9mGTWKJ5EIMBn7XmNgFLf2Y7KXb8qMOV8sZB7MnmjmJMfEFFe+hxZOI5
         jZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947275; x=1697552075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3g4JJk11IO4GuzmgkvSmWjgGPDnVtGWJeN49FIEarQ8=;
        b=MMranCoaC4LYrGLGl4MMpbE6Uhx/74ORaVKkTBUUZsj2RV8AMdUbyMfl2Y9ei8tePE
         7+h1zmmDRU4pDhEeYE6dcwLmyb3rnzj67fV6Bg3MTkOArNAJPWxRNBz8Ml5rIQKSNGXo
         aljzqmr2tdoPsqiql1mBKpwcycIrjQg6KknpYxbsiSkjOEcqgPOc/oPq6ho6ojW6c+UC
         VH42vyG2oMacLKNv64ZQJdfh3kIYRl4JeyZQrPRzyfBkWcF9Kb97UByeCySWu2Hq+S44
         ym9rHilh3duNf7e9mFkWSt7JQu1tP6qHRMElkKkf3W9uT8rdQaIMEDP4XXV7pUQP7Jj4
         Z3nw==
X-Gm-Message-State: AOJu0YzyPXcTYzzcAoTK8+MqC2o0wzIqWknIa1uG4jN7k0MIzf39fmRs
	o4QSvDTO0J05PlZEBBYUleznNdLYexfFbCICEh0=
X-Google-Smtp-Source: AGHT+IGLdtyzk8y2Fm2weJHGlV9j/dGo6ksz/h8+ncSvTXUwPMwaRE5WrlaHmXhCwtigaj6KJJ09aQ==
X-Received: by 2002:a17:903:11d2:b0:1c7:2697:ec0a with SMTP id q18-20020a17090311d200b001c72697ec0amr20239373plh.30.1696947275274;
        Tue, 10 Oct 2023 07:14:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] cups: Backport fix for CVE-2023-32360 and CVE-2023-4504
Date: Tue, 10 Oct 2023 04:14:18 -1000
Message-Id: <d14dce8ba2a8b4bf05c7c5ea7292b0c2c327f088.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188900

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream commits:
https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913
& https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../cups/cups/CVE-2023-32360.patch            | 31 ++++++++++++++
 .../cups/cups/CVE-2023-4504.patch             | 40 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1d2377486a..6cfe314f20 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://CVE-2022-26691.patch \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
+           file://CVE-2023-32360.patch \
+           file://CVE-2023-4504.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
new file mode 100644
index 0000000000..4d39e1e57f
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -0,0 +1,31 @@
+From a0c8b9c9556882f00c68b9727a95a1b6d1452913 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <michael.r.sweet@gmail.com>
+Date: Tue, 6 Dec 2022 09:04:01 -0500
+Subject: [PATCH] Require authentication for CUPS-Get-Document.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913]
+CVE: CVE-2023-32360
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ conf/cupsd.conf.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/conf/cupsd.conf.in b/conf/cupsd.conf.in
+index b258849078..a07536f3e4 100644
+--- a/conf/cupsd.conf.in
++++ b/conf/cupsd.conf.in
+@@ -68,7 +68,13 @@ IdleExitTimeout @EXIT_TIMEOUT@
+     Order deny,allow
+   </Limit>
+ 
+-  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job CUPS-Get-Document>
++  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job>
++    Require user @OWNER @SYSTEM
++    Order deny,allow
++  </Limit>
++
++  <Limit CUPS-Get-Document>
++    AuthType Default
+     Require user @OWNER @SYSTEM
+     Order deny,allow
+   </Limit>
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
new file mode 100644
index 0000000000..be0db1fbd4
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
@@ -0,0 +1,40 @@
+From a9a7daa77699bd58001c25df8a61a8029a217ddf Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Fri, 1 Sep 2023 16:47:29 +0200
+Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
+
+We didn't check for end of buffer if it looks there is an escaped
+character - check for NULL terminator there and if found, return NULL
+as return value and in `ptr`, because a lone backslash is not
+a valid PostScript character.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31]
+CVE: CVE-2023-4504
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/raster-interpret.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+--- a/cups/raster-interpret.c
++++ b/cups/raster-interpret.c
+@@ -1113,7 +1113,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - S
+ 
+ 	    cur ++;
+ 
+-            if (*cur == 'b')
++	   /*
++	    * Return NULL if we reached NULL terminator, a lone backslash
++            * is not a valid character in PostScript.
++	    */
++
++	    if (!*cur)
++	    {
++	      *ptr = NULL;
++
++	      return (NULL);
++	    }
++
++	    if (*cur == 'b')
+ 	      *valptr++ = '\b';
+ 	    else if (*cur == 'f')
+ 	      *valptr++ = '\f';
-- 
2.34.1


