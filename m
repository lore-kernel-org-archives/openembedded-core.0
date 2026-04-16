Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79449F8DFDF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28253.1776378783889721232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zeo9iqf1;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488afb0427eso612885e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378782; x=1776983582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDE2oMd6A8MPLHjKWApZ7+QCv1hTduoyi20a5EWGbnY=;
        b=zeo9iqf1r4Gw/YUyFrxBuC53iKVIb15YCWxEKAoJ1e67DVTUVvemoAqmYbvfpkygo+
         rlVbI0PpB6VVYFXQ8IBD96hVkDSs9gkqLcmi4zlcmOzROuT9Nzo/LoyNkqDN+MdH/KBG
         /3zR4awb5S4UkyPcC5SmWOqku9Sv7bXX/tdlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378782; x=1776983582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDE2oMd6A8MPLHjKWApZ7+QCv1hTduoyi20a5EWGbnY=;
        b=N8BjQBlHrDkv4FEjQr5Bl8c5Zo/CXovP9JId9ieY4vmUysaJBKx5rqM8P004snNwtI
         lFrMrWqi5mkaiiabFRmYp2zt3IVz7bpom/zn+SHvZjU1gvV3uGzWPxHCg4SF5jOCUKMf
         5Nm2KxJM9S2ur/QTBp0Dqfm3RJiBulBZzC8jrCWNNRtStsGmq6ryUMIbViK8ZwDa10jv
         f5ExlLfCAxScL38x1mXOjCGzyIpZ8e9kXqEl/SmsGr7QAjZNhDANjLfVKIV13VwrRO7D
         X/3qWMiyFVgmv2hLM62nLp5ObngfFYwnqYVFcbivuWw2vnxqLSVGylbEkO3I1NVbLFqd
         qxyw==
X-Gm-Message-State: AOJu0YxCcV0a+2EJBcvvPUJxgWxALZCBuE2aKP8XvcOKpGKXSoowl0F1
	jG9zEJ/RtWc+DY3PNU6Qa8QMI3y4pMHKPrAKe3qnbduxQ2kvT0eY0uAvf7H4ZV2xbQ+Vqr7wBpJ
	LZH2lDSHMEDY9
X-Gm-Gg: AeBDies1PJvogx3Zh2I6QTAGGMrE+lHkcCn7XmillVMv1ElJkY8lf/THnINc9Ejkr6M
	CpmD/U909u3K2Jj0wmt35yD4e/Z5GVscTJ//i2mbsBsCUi4yb5Q8NeLkTwv8SXy79apspod5NPX
	7aZEkyya8iaQis/ybTGn98DzGPU4VV6kbr56d6Py5FH3bUxueSVSOZ58j4fI++REUYDeiDvQGUt
	Pj+KDGTZNssiWnaKphH/bNlu65w2GJekNaQlaM34rVQW14lNeHuhBID2faj1+vY9XwWDRnuinDV
	CNDpG9njwhKB9uB4lBcTyVMycc4B5R1/9Efs6E8/bxYAAQ1OhuXl5TWHClOzoRBi46zNk0DS429
	IJwNZWnMapJfuhsyjTKnq0dbzvgUgVWy/mxCiLi1Cv/pra6gKjjcN3KujW3JAYcNwn5D/Zoa1j+
	J6CKshHDJK1IiZ2BtlxLP1/NjqziXo6pe/pRHX2aYT9OCis0HuQrok9kri1Pi+RYd5jxHPtZJWg
	3ywrq3aRg8tXgh6+ekslXoIp8wyVJ/+R6xCTg==
X-Received: by 2002:a05:600c:674f:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488fb6e9cecmr6067775e9.0.1776378781807;
        Thu, 16 Apr 2026 15:33:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 05/51] binutils: Fix CVE-2025-69652
Date: Fri, 17 Apr 2026 00:29:48 +0200
Message-ID: <f2c834408e93586b0a6777e4767503104b13520f.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235434

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

