Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6605EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.17606.1687961631943572854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ttff9lcF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b7fef01fe4so24026595ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961631; x=1690553631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWliQolywzeGkyknp3oYMCm0PuDvhLWi7Jw0eBKQuJE=;
        b=ttff9lcFHs6eiD37OyRSpCs1aKxYoCqi+jqkeKeC9K6Sdqcpzai6MVtQ5xO/eXMzei
         SuRcgOkjEixXsKjJS92s/8HKgNfl38QbEYAHgS6mn1l1prEO5zXqxMQZemz+P9+E1qJt
         6EwxHNqy92WWPLgvyU+hlooweFzgpfFoXwmBk3KQvCNldNTcW9+hDEQh8UaMqA+08LG+
         lbe6m2KfWGbTTQMgOYktrEQtUYQoRNbI1PM9lcT2Y40+9xZr9A+vziwcLH5MSJzw1Onu
         EA2Bx2ndSYqC4TUad3iOa8nOoSiU/xCMX/ICXMIpiXZr3OdeNszEbNaFTPi86pdH7wNz
         QKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961631; x=1690553631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWliQolywzeGkyknp3oYMCm0PuDvhLWi7Jw0eBKQuJE=;
        b=R8icRpJrIIoZTtuMh4uwf5/l86L73Q8bJ8l1XPo7SLlu+8BD5JTkZT1DpkO/Y1jPgu
         Ij1b2Te3eO728IQycbhxLQHLk4qrTCMzZiBGPps3YxOJm8gp5jA6a3Nl77d4gc0mLS+U
         ZykpxorRf+Vs6qS4v/qZfhoV1mPJYYgXYN5AfS8npxWEamEhxvzUT0ZWSDex5T0mDAXE
         ZZCuDRbta2Y0jklqE9No3Yi/YpsAN60aw8n+g8ftqMvdG/mKE/YNUr/iJ/syHCj1bgaw
         bkGeZqlU61YkfiAF6mL35wellGp1AiehyQT964gbJAzlTOBZocbOOHAb0y5evpmZtufF
         4FMA==
X-Gm-Message-State: AC+VfDyOZL8oxe5Zdg27g8iVfLnemVOkLqXG5GJcxpcFdYkgO2Beyvlm
	36bc08HtQQhPBIGjWQU+s8gpR6u7xA083+b+vWatfA==
X-Google-Smtp-Source: ACHHUZ5qibQC0a0CyP39wvQkOkbnesCBie3EBVsxgaKibT1TdgXoN8/0QOcicPcsmAyO/H4UpycpFA==
X-Received: by 2002:a17:903:2595:b0:1b8:2630:997d with SMTP id jb21-20020a170903259500b001b82630997dmr3297314plb.37.1687961630967;
        Wed, 28 Jun 2023 07:13:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/29] blktrace: ask for python3 specifically
Date: Wed, 28 Jun 2023 04:12:54 -1000
Message-Id: <f20a12ead2d5890e88e7f4ce149a777de47edc48.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183584

From: Sakib Sajal <sakib.sajal@windriver.com>

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..e2305a1111
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From 6f4769e6e2c5cdc1262891470995e6dead937c7a Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:57:36 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
+
+python2 is deprecated, use python3.
+
+Upstream-Status: Denied [https://www.spinics.net/lists/linux-btrace/msg01364.html]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index bba5e04504..1c0856be7b 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


