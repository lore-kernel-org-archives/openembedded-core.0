Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6BFCD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20449.1782220476572791298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lelfz6jg;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49222fb062bso58794545e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220475; x=1782825275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdkV6azQymZ3hJHg3AaLd69YJ3BWVqOAMcByxKARz+o=;
        b=lelfz6jgFZQ8pmfZ4ggY7MWVZH0Dw9fvfKrNrYlRkS8U7cLWySGYfS01KTg/SG6qn6
         MgOPF1xbJ2QqlfrtxIzrpCyJSIdXn/vfk+qK7QzTkVe69Pw6M2Lsit/rbIoKcPxrfsJe
         7N9+Y9WFPGHkrAkF8iqq5FOu+23oaqjIgcMd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220475; x=1782825275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xdkV6azQymZ3hJHg3AaLd69YJ3BWVqOAMcByxKARz+o=;
        b=e+HWkvdzJDqk3S2TuS+HrLrNXLPrurOnpZGhxQVfXixTyc6fpnHLwm+NArApwBp2uM
         XDRCX4OPKz7BTX6JBH9+6NG4uUWD78ai3S+kUMJBWzw7ukx25noOxWz2yt2w9ep+C6UG
         /8Tdzt37Y2JgGep1ak9G50Qe4iZIMgG9KKatjhCgHBIPDwO1Fbg0LAxqohfX75qNrw8N
         H2sXZaBsAufNSrbhBOdDE4seYIWZtp3OD8SvfkVLncPIGvgQI6c1OyIYiVLydkELLcjr
         EgoEqmgy9+bfxyiELuJ27WXlK92zJQkF40uoyPgtxrRrZe8Fqtcz/L3SUYXGE4RiZ91P
         yzVA==
X-Gm-Message-State: AOJu0YwodbNMimrg3v0bhuk8pnOBXagpSvR59R8cTo6jCbgGWk0hY7UI
	SRywxd7RMo3PrT2dFvfMUipFueSKEJrX+BQ7CQR0sXeSVqK1Nz2CQ26KHbrdTPWYwMOfyTsk2lV
	uVXoc
X-Gm-Gg: AfdE7ckqgPSk6D4HUqaBaSRWWE22LeTppGJtCeZzmeirQXnJAtzYDoIRktLLpGDeRRE
	FjUSfDtr2HWJFFlhOedgOrLN08okQPnz3mXfrrTsCeQvOcfo4dJ0xUbzJfE0ZMA5ZaXKshAWlKi
	nyQ732pgUS2OK6+9LjJICFjDDGseKSKLZO+xnOiA0DsEA9H6/jXdbK1LnYu9B15+WoGRMzHQeiu
	AFvEW2JHL8+iViq/eaE4calFoc+3li0ml8MtuttHpkQlhyL4sCba5kYo6swivyXc1Z6TKZ/fuXv
	fNnEjdU4b8mR9qeYL3s5/wdM0IYVpkiUok/1y3IxSEWGjaupB0TqKDZjlMNsi3synsH4rPgTl6g
	9/xAGdnrxC7Zhn6mbXMrxP8wJmBBo4IboZoerMgwEqNekxOOCWfPfnU5VhcP6P8id1iKM7a24mr
	xiUPpBeLv6MqCbuRs/iUNJ34830CVVoKJ/NE0Xgt5MF1O3IdNHWCnOMt3P6hD2qTbsRRd3qA5gY
	yCUf4YSyA6CYakyww==
X-Received: by 2002:a05:600d:6451:20b0:492:25a0:1730 with SMTP id 5b1f17b1804b1-49240ea820bmr240124915e9.32.1782220474713;
        Tue, 23 Jun 2026 06:14:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/26] qemu: Fix CVE-2024-6519
Date: Tue, 23 Jun 2026 15:13:53 +0200
Message-ID: <bb5a1f9c6562038d422ea0efd4e975737c9374c3.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239378

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v11.0.0-rc2 backport for
CVE-2024-6519. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit link is recorded in the embedded patch header.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9
[2] https://security-tracker.debian.org/tracker/CVE-2024-6519

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-6519.patch             | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b688c2bd125..ff8877e54b7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -47,6 +47,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-python-backport-avoid-creating-additional-event-loop.patch \
            file://CVE-2025-11234-01.patch \
            file://CVE-2025-11234-02.patch \
+           file://CVE-2024-6519.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
new file mode 100644
index 00000000000..431afbbc60a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
@@ -0,0 +1,51 @@
+From 86bc714d9d02a23ea6be878febdc327bbfc9ff50 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Fri, 27 Mar 2026 17:37:31 +0100
+Subject: [PATCH] lsi53c895a: keep a reference to the device while SCRIPTS
+ execute
+
+SCRIPTS execution can trigger PCI device unplug and consequently
+a use-after-free after the unplug returns.  Avoid this by keeping
+the device alive.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3090
+
+CVE: CVE-2024-6519
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9]
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 4862d2c95104d9fd0430cc003c205094f8ada1f9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ hw/scsi/lsi53c895a.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 4d0c5fcd9b7..37dd38d7a87 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1158,6 +1158,7 @@ static void lsi_execute_script(LSIState *s)
+         s->waiting = LSI_NOWAIT;
+     }
+ 
++    object_ref(s);
+     reentrancy_level++;
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+@@ -1177,6 +1178,7 @@ again:
+         s->waiting = LSI_WAIT_SCRIPTS;
+         lsi_scripts_timer_start(s);
+         reentrancy_level--;
++        object_unref(s);
+         return;
+     }
+     insn = read_dword(s, s->dsp);
+@@ -1625,6 +1627,7 @@ again:
+     trace_lsi_execute_script_stop();
+ 
+     reentrancy_level--;
++    object_unref(s);
+ }
+ 
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)

