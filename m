Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F1BF8807D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7714.1776322102490660140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oRrrvVai;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso2681908f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322101; x=1776926901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDE2oMd6A8MPLHjKWApZ7+QCv1hTduoyi20a5EWGbnY=;
        b=oRrrvVaiHCJFMEit+TuTHlNz3thX0qSYZ9LtWgdv9c22SpaqpbF1PDYeFgzYckymuh
         LOZNeSpi0oFesCutTg+dBhhr+hpJlS5Z9wodIWdBoaTtlAhMcQYWiRacKWybdSy3quLR
         9VbyOOIpCm0F5+2Mp9RuhFlG7W5dkDdGzkjsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322101; x=1776926901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDE2oMd6A8MPLHjKWApZ7+QCv1hTduoyi20a5EWGbnY=;
        b=shQpwIsY1TNu2jEahQO1T+kOORk03dm9uVw9MeVs89EBMvaP8fbPfXxB1SN7nx4IK9
         N4Ose4qGWD2YVgkIt1YNWHghdJfinX0QwdjZoXXTQDLRjWktdePSPDC7xI4rGUwi29wj
         HfZB+yk98Smi0AKmb9kuLe1MkoeuLQJa5qgOHDj47ulD8oo4ilHgqn4p1ZkLVztqfgRo
         2r04xbs4yY7+6IINIyvb5v5e6BNnyZJC4LOCU0xm5KUPyPJscGpDnihI+Po6cvfW/SAS
         kUvu8CCkT5FrwLw1nEzCZQpAVuOscMeS+zTSdHcoN+7KEn9tLUeMNvZeqTT5wKn6pjrG
         QPIw==
X-Gm-Message-State: AOJu0YzbKk2xdQ8KiEBh1YSYTGNlqzTGZR9H6q/P74PGu+cch2e7YaeA
	NWwWdjze8gsNI6AH5tab8r/IaQGpi3DU3TbHXdMsoHD4u9f5oQn9x6ZaAPdBJVixiE4VvdOr3nC
	md0O5kkhO0HX3
X-Gm-Gg: AeBDievP8x2R9YZFL1Nu9Fq7z9abHquq09oqm4dz6UxWrb8yD76H0aCtaDJNG32/pqI
	TDsH9kwxNeiHy2mi7rawMf5Fnovxbao/Zj3+hr9BPDXSft3qc92KV5/Qa39EHZX56IjapgTapnw
	gsr4ttSSxP4FjO+ApznXLk62jbntEtZUwxmXEw1s9BY9+MK4GA24SUrXceWtqHdy5UDr/0lqvqq
	+mSMBTT9iOQtZRpyNsqMX2Y63gqmFqpbDHTluaWqY2KBDpCIXp7XAISl3Pv/5CFItNd4wtBbKuj
	v2fipW7kBzmGx3UHrBjPzTvDUoxkXA1bel0mOYOIwXQTib63FawYF/S0SG1dC8gGeG348mS0Z2D
	2ePxX8H3uNGrCOcFml29UA8RVMPts7cKzZVi1yArheLIKqnNO7iD59y5nUINb6WcWrSWcvVbpMa
	+6yAahxWowEAf+76Pl8RvyB8tPFFjo8YwUC0PtM7nTSZMDF7zJO0x/oKcBK9gaKs0cdJtcuX1gn
	cB2xwfEk26KLntb1IqxPdJRDFnt3vip8AxwHQ==
X-Received: by 2002:a5d:5d83:0:b0:43d:1c49:ce35 with SMTP id ffacd0b85a97d-43d64259c9fmr37156152f8f.3.1776322100475;
        Wed, 15 Apr 2026 23:48:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/47] binutils: Fix CVE-2025-69652
Date: Thu, 16 Apr 2026 08:47:06 +0200
Message-ID: <f2c834408e93586b0a6777e4767503104b13520f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235347

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-69652.patch    | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 94b7ca54cb8..f635d76069a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -51,4 +51,5 @@ SRC_URI = "\
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 00000000000..5de94820d1d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,40 @@
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2462e6540a7..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+ 
+-	  debug_info *debug_info_p = ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+ 
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+-- 
+2.35.6
+

