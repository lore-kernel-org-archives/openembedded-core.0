Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C81DCDE009
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33403.1782253625809089605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JIhWkPko;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eeba68948so259111f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253624; x=1782858424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdkV6azQymZ3hJHg3AaLd69YJ3BWVqOAMcByxKARz+o=;
        b=JIhWkPkoyceQqU0bjLxfW9lsYBcR6LuueEwBJEGPFhCp11NnDOWs658dk1HN0mtYjc
         dVG3m6hpzL8jkScikUPIfiM6hbAlzvvphzx7srp6hBAf0drZD3QSgrmdQd8AFJuTvmBF
         j3rgP6ohi/Sx51DakwhWqD/o1or8w/TykY9uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253624; x=1782858424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xdkV6azQymZ3hJHg3AaLd69YJ3BWVqOAMcByxKARz+o=;
        b=AHxmdbqYRc9DvPZhRUXHUNL70cYi76U7cqrJkxriWo9lvBd/hTYDCgx+Mw1FhMoIHr
         43j3l93wgwFOplupSLB6/flellQ6gx6RvDqRmqojl+f+41LdrEXmsFPhJsXajiLmMyMT
         AXOyrF0pDou1YcKySxcHf0n4Dcq3sJz1LIxkaDAjt8GWoMBSVh2YyH7HZaC6jw62A/X7
         tkidZgSv6EvXS6+iM6+Y8ySFqzMKX9+e8cA2Yo5GFE+Nya2Z7Dhp5591ZG6NDWkMcMa3
         fQSAeba7CRKynUrpizL5FDnndx0c5PoGW9RVX2GS78QOSPeQIQEu223pj2CUVYdqyUoZ
         +m8A==
X-Gm-Message-State: AOJu0YxA2fOQ18lja5/0fPVhoIStOZuPSdJqntl4LzqSVXWGi24O5Oen
	JTOCDqFLpUr9ybJTFq5P4dnpAapdyelh45bmnNl2YMCmS/7GCjAM+JGrhDcJtWqUv1qLVEzy01v
	fBUdk
X-Gm-Gg: AfdE7cl81Fyy43qKyQPmcRDK4C8R3BssxRRGSfwqLGfLbKLzeDyoY9Rrleeq1xJYdvm
	CxByB9tvmnQDSYGI7e+LXc7wK7e5+0iTqpDOXSUsnMpAmqaduz1/a7+9BBxEmovsufOtWPWtjH/
	L2nLsd58OJVDYi4SLZan2m5F2n9pTyeEyUqmw0jqxyRXZzxLOuFQjlnG6pbz1Tuf06iK3F2eRa9
	9c01bOQiBfgZ1W3E4sncbo6QdboooHdP/3cvDxsQGMvM6ruNeyzz4hPEO9neHXQRhf5+xNTPDK0
	O+r4xBabdiJET/j7FztPCR2qjE6yx6liMfbRjjt/vewK2QRFvKeR5qqobMRCmWPJQz51kIYS2yn
	hPjABmzgmqqhBA0L53463iDvYnrRTDK48yP2Yetn5C6tchWBvJ7HxhpyeSoJ2L5o886+WlOn6Tp
	QVjrP9fKa4xsf85vnQfT1tXJpm8UcQtLGA7RcYYHljk51cJOqBAE4rBZUkpC+wscfEKidJx4KaD
	nHsfcNWAm+Dj2y4
X-Received: by 2002:a05:600c:c099:b0:492:1ea2:6258 with SMTP id 5b1f17b1804b1-4926087a130mr5262365e9.33.1782253624095;
        Tue, 23 Jun 2026 15:27:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 12/41] qemu: Fix CVE-2024-6519
Date: Wed, 24 Jun 2026 00:26:11 +0200
Message-ID: <bb5a1f9c6562038d422ea0efd4e975737c9374c3.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239434

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

