Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ED4CCA47C
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.6541.1655130167392498991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1004IkZP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id z14so1529909pgh.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=neEU0fNB2m7g2PaUFcNQc1qGmqHITIFnRmmSFlpAEoY=;
        b=1004IkZPNXx0FElvPzKx3OjYG+yhC1hiNDTrkpOSpJQ0qHJVvfvaNfZwr2OG5hkHej
         Is4o9pEqj+ojPLpuwNavtfHRk0Km1LvQRB6lwdrogWAtMTL8biJDYRXN0AplDMX53lWU
         pD6LVPLjOGJEvokugoOCdh38N3QlmrxYldkPwy0EBK7vsELONmMrMYFWlTZ0z4PJ5E5z
         hD+JimpDmUupIOH48XFuNYSXxUrxohmFMBwMnYKb3LaRxOCWBL8DLeocI9c8KJFPKyfy
         hYwGRdO7iGDp3KIRuC869+pamvvD3bWZBNh0SFBkV/bdtdwwYZygEeFs3RS2AYenwsuM
         Zg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neEU0fNB2m7g2PaUFcNQc1qGmqHITIFnRmmSFlpAEoY=;
        b=mpDVo6ftnjMir4InuqjM4otW1u6zPm9nlTqDXkQb/D4tCR8gj5nw+WHXCqunhcBIcU
         ABMyS47N+akeASgAz1+TEXty+rkQQh/FAKXApWLvwEZJn93iZ+i5Hm0r/ITp51F5Evj3
         4t4y4ro5ruud3pko6uy879BQrbJjDxTvFmmEBfc6GQaRRQNLxacXOqw4V/7gcFJe11Ij
         YhYY06TXKyYkXL+3QIToQ9B+I/vAqb7vStiuFZV/96f5BT2Rz/fh+TJbHdS1H3Kak4RX
         AfQOaBxKiSzNHOR7c5IXPHeN9ssZ0QCPWuDE2wB4O/RRbzYvz94qoYcWfAhkQodg2zm+
         HR7w==
X-Gm-Message-State: AOAM530317otp1hWfnlcFH4pFmK38swrDHcXqdR5eG4eiM9D7GfsBOIo
	CMBvMnnti6+8EwCMxJ9fFfvNN0BPS0QaRWKB
X-Google-Smtp-Source: 
 ABdhPJzgkfLUEkV4kP1EwlE2mseOm4jnA1vWu/UdbGi76u7mshUw6VbQnpHmBlurQp/OQRAxNKMbJA==
X-Received: by 2002:a63:c63:0:b0:3fe:e14b:b5a0 with SMTP id
 35-20020a630c63000000b003fee14bb5a0mr21769435pgm.428.1655130166288;
        Mon, 13 Jun 2022 07:22:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/20] lttng-modules: Fix build failure for
 5.10.119+ and 5.15.44+ kernel
Date: Mon, 13 Jun 2022 04:21:48 -1000
Message-Id: 
 <48aad396d902b36ece414b0adb9cce4aebb093d7.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166860

From: He Zhe <zhe.he@windriver.com>

The following kernel commit has been back ported to v5.10.119 and v5.15.44.

commit 14c174633f349cb41ea90c2c0aaddac157012f74
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Thu Feb 10 16:40:44 2022 +0100

  random: remove unused tracepoints

  These explicit tracepoints aren't really used and show sign of aging.
  It's work to keep these up to date, and before I attempted to keep them
  up to date, they weren't up to date, which indicates that they're not
  really used. These days there are better ways of introspecting anyway.

Which causes the following build failure
lttng-modules-2.13.3/src/probes/lttng-probe-random.c:18:10: fatal error: trace/events/random.h: No such file or directory
|    18 | #include <trace/events/random.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8effd12cae7c7024f8e6c8f6ef70ed602d380ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...emove-unused-tracepoints-v5.10-v5.15.patch | 44 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
new file mode 100644
index 0000000000..361a59c2e5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
@@ -0,0 +1,44 @@
+From 13e4c978d45237b8780f1de6d404812b3af26a49 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 2 Jun 2022 06:36:08 +0000
+Subject: [PATCH] fix: random: remove unused tracepoints (v5.10, v5.15)
+
+The following kernel commit has been back ported to v5.10.119 and v5.15.44.
+
+commit 14c174633f349cb41ea90c2c0aaddac157012f74
+Author: Jason A. Donenfeld <Jason@zx2c4.com>
+Date:   Thu Feb 10 16:40:44 2022 +0100
+
+  random: remove unused tracepoints
+
+  These explicit tracepoints aren't really used and show sign of aging.
+  It's work to keep these up to date, and before I attempted to keep them
+  up to date, they weren't up to date, which indicates that they're not
+  really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Pending
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/probes/Kbuild b/src/probes/Kbuild
+index 5478447..31e0ee8 100644
+--- a/src/probes/Kbuild
++++ b/src/probes/Kbuild
+@@ -204,7 +204,10 @@ endif
+ 
+ # Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
++    if [ \( ! \( $(VERSION) -ge 6 \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
+       -a \
+       $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+-- 
+2.32.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index a5e6b906d2..e049bdc6d2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
            file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
            file://0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch \
+           file://0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
           "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


