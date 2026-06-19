Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AF3CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38256.1781857993710219998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IzLxgmB8;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso11752505e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857992; x=1782462792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk3/7Vgx9wqUc75evU/FMdMHjEOD7xNU5M20wvf4vr0=;
        b=IzLxgmB889hFcd0tB0lAN1ZOUPPIEvXrWUo6aFus+OslwfMOBaRknsVNjrXDUlnaxZ
         yqZpSVOM6HMhKs/IleOvlKmELOrTS9JevXuAYqMLCrLWS2w3PNhO6W9Lf78Y/MTKhLnu
         hGhijLzgj4Tz4S3HFzIWkskypPpeJX/CVsL8V2FYDS18VhAOHAqOvY5WQf3EDGe9ymSr
         LcVxnfWwc4+FTb+jZtgPXIA7yC6zOIc5I9u5glRZvcKayk22fH/UtWWbEPRjfEzezRpn
         405fV6s+3NqZj7qIsAqEmJhL57N0tnPkEO+XRyRbFPUlNBGSRrocDp5xePTN4GnQk3sZ
         lgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857992; x=1782462792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk3/7Vgx9wqUc75evU/FMdMHjEOD7xNU5M20wvf4vr0=;
        b=ZvL69fY7gg4bT+HU3awF5iiMB+FoKPbcJnd3M7kCG8W3pJBi0I/LOxCU5bpoMJyigH
         lqzGuV9uBFzrwgukKdHowjDq0g5sLbvWtBQOSSfIgZ/8a8L3JIXU5MlninUqJI4RXE8x
         0fHQ8KWMyxjxkyXuetawZhRsXN7GLmxF0uL3kWYn7K6m+RitXvTjhsWVA2slKyVCrfZF
         Jd3nok3VtTG8bneTv8x+Eo+rNpEVXGvFfzNAmQyavxwIiB+hp7ShqN67glHDkO7Q8eRu
         MBe0QSWW037ObuZa2U1ZZuR+cnOw5uy+/fUFTMArK37CXnInD/rJlKbX+dqtslQYBrum
         xyVw==
X-Gm-Message-State: AOJu0YyIK++s0x+RzTKCA3dVigAkKNU4oywfbUc79pIJ888hwK+5kVVE
	fH0N3evi40Nz8e+mFlX2bUCkRsiAfbUPNFQUk/dk2+MBDRnZj1fCT81dGfWVVLKS
X-Gm-Gg: AfdE7ckPVVcOvqQZXso2pckpq5peFQ3p/VkPPRKF62BmpgTfoYZ63MGH7ySx5uHcEmj
	PLTs4cTsrAAykLDehLKR1/4Sb7Mn7OePwze2ngjk4iIEdieAdhlVpYat4Jf4L/GiGI2q4zbdN0j
	CnHLWHsaH+3RTBLI7vqwfVLanmV37HJewb4xp80kpkN2uYNRpEtTgIYrZvjHg/oH8Cm9lgXttgv
	oY71qpS6/FVJrDm2koIP/2nYUgzDnkf18vl5Km0HX96wElcSQwJus6GOkDHzoLP013BKbAOcVr1
	B0TCRzWh74h/3mvFpiJE9ibu/wVXjTPXjlOlRfPyYmFy7i8oY1XMQl3XdFXDRKcrevbpSuDtd67
	+TzHRVheVVZV5FhTU8IDuaHlto2l2jQ7/Ovn9vqeVB1L5JrVs72/iXywARNimb6in+cgN7uGP/I
	kOVzoJCJPaJelth8QyQNLu+49ViRCoqi1y7do0Cw55CUnPDiGb
X-Received: by 2002:a05:600c:3b11:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4923f584984mr50700505e9.25.1781857991451;
        Fri, 19 Jun 2026 01:33:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/15] lttng-modules: upgrade 2.14.4 -> 2.15.1
Date: Fri, 19 Jun 2026 10:32:46 +0200
Message-ID: <20260619083305.3505156-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239139

From: Alexander Kanavin <alex@linutronix.de>

Drop a backported patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...st-range-in-btrfs-probe-for-v6.18.14.patch | 36 -------------------
 ...ts-during-the-folios-writeback-v6.17.patch | 11 +++---
 ...trace-event-i_ino-fields-to-u64-v7.1.patch |  9 ++---
 ...p-unnecessary-pointer-indirection-in.patch |  9 ++---
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 10 ++----
 ...onvert-pageout-to-take-a-folio-v5.18.patch |  9 ++---
 ...group-IDs-to-vmscan-tracepoints-v7.1.patch | 10 ++----
 ...i_ino-from-unsigned-long-to-u64-v7.1.patch | 11 +++---
 ...trace-event-i_ino-fields-to-u64-v7.1.patch |  9 ++---
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 16 +++++----
 ...ules_2.14.4.bb => lttng-modules_2.15.1.bb} |  3 +-
 11 files changed, 36 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb => lttng-modules_2.15.1.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
deleted file mode 100644
index 662a803680..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From de7ca66c797ba0b3273a217a47c8fb791d896f7c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 27 Feb 2026 17:54:39 -0500
-Subject: [PATCH] fix: adjust range in btrfs probe for v6.18.14
-
-Upstream commit c5667f9c8eb9 ("btrfs: headers cleanup to remove
-unnecessary local includes") was backported in v6.18.14, adjust the
-range accordingly in the btrfs probe.
-
-Upstream-Status: Backport from commit ca93dc3b05fcb
-
-Change-Id: I51c5cb6345c6a1e1aa4e5e3cb9a4af2ec962ecb2
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- include/instrumentation/events/btrfs.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index feb4f40b..e87f0085 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -12,7 +12,8 @@
- #include <linux/writeback.h>
- #include <lttng/kernel-version.h>
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0) || \
-+	LTTNG_KERNEL_RANGE(6,18,14, 6,19,0))
- #include <../fs/btrfs/ordered-data.h>
- #endif
- 
--- 
-2.47.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
index a8403fbb3f..90a46df3cb 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
@@ -1,8 +1,8 @@
-From 329ef88b9ae02228387f55a61ca1cef87a5cf3f4 Mon Sep 17 00:00:00 2001
+From 8abda1d7c6b4a6346ef79e1b677ced4077c6b96e Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 16:22:42 -0400
-Subject: [PATCH 7/8] fix: ext4: enhance tracepoints during the folios
- writeback (v6.17)
+Subject: [PATCH] fix: ext4: enhance tracepoints during the folios writeback
+ (v6.17)
 
 See upstream commits:
 
@@ -38,7 +38,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 34 insertions(+)
 
 diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 75f92b31..fa5de84d 100644
+index 75f92b3..fa5de84 100644
 --- a/include/instrumentation/events/ext4.h
 +++ b/include/instrumentation/events/ext4.h
 @@ -242,6 +242,39 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_writepages,
@@ -89,6 +89,3 @@ index 75f92b31..fa5de84d 100644
  
  LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages_extent,
  	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map),
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
index 5031ac5d42..4b8799bd6d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
@@ -1,7 +1,7 @@
-From e80f709c4665a333da82b27605c26a3afccb299f Mon Sep 17 00:00:00 2001
+From 22078c50f8093b80741e080e17a3196fe074884c Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 16:01:09 -0400
-Subject: [PATCH 8/8] fix: ext4: widen trace event i_ino fields to u64 (v7.1)
+Subject: [PATCH] fix: ext4: widen trace event i_ino fields to u64 (v7.1)
 
 See upstream commit:
 
@@ -24,7 +24,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 1048 insertions(+), 75 deletions(-)
 
 diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index fa5de84d..43b93cde 100644
+index fa5de84..43b93cd 100644
 --- a/include/instrumentation/events/ext4.h
 +++ b/include/instrumentation/events/ext4.h
 @@ -26,6 +26,95 @@ struct ext4_extent;
@@ -1419,6 +1419,3 @@ index fa5de84d..43b93cde 100644
  
  #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0))
  LTTNG_TRACEPOINT_EVENT(ext4_fc_replay_scan,
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
index 8bf20a2047..e9c9e5957a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
@@ -1,7 +1,7 @@
-From a74f94be254e5a9856655c982dbca44b86437897 Mon Sep 17 00:00:00 2001
+From faf9b9d9584ef6615243dc123f7c14ab01b0e7c3 Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 10:54:27 -0400
-Subject: [PATCH 2/8] fix: hrtimer: Drop unnecessary pointer indirection in
+Subject: [PATCH] fix: hrtimer: Drop unnecessary pointer indirection in
  hrtimer_expire_entry event (v7.1)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -29,7 +29,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 24 insertions(+)
 
 diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
-index dfc295e0..c4a94605 100644
+index dfc295e..c4a9460 100644
 --- a/include/instrumentation/events/timer.h
 +++ b/include/instrumentation/events/timer.h
 @@ -299,6 +299,29 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
@@ -70,6 +70,3 @@ index dfc295e0..c4a94605 100644
  
  LTTNG_TRACEPOINT_EVENT_CLASS(timer_hrtimer_class,
  
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
index de5e08c346..6dd794f460 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
@@ -1,8 +1,7 @@
-From 531c6e02c5a231f153d12ff628ecb677b7c2f7b9 Mon Sep 17 00:00:00 2001
+From 82000f32ec1c54a83e95ce10aefedfd6c41ec4bd Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 10:38:18 -0400
-Subject: [PATCH 1/8] fix: hrtimer: Reduce trace noise in hrtimer_start()
- (v7.1)
+Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)
 
 See upstream commit:
 
@@ -38,7 +37,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 37 insertions(+), 2 deletions(-)
 
 diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
-index f69e069b..dfc295e0 100644
+index f69e069..dfc295e 100644
 --- a/include/instrumentation/events/timer.h
 +++ b/include/instrumentation/events/timer.h
 @@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
@@ -98,6 +97,3 @@ index f69e069b..dfc295e0 100644
  LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
  
  	timer_hrtimer_start,
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
index de498fa448..660c7a43a8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
@@ -1,7 +1,7 @@
-From b9d853f90111cf657762c3e23110ab9f7a66e1aa Mon Sep 17 00:00:00 2001
+From 62aa0b4bba7e3b0c60f0bcdb5c98c77bedcd45ba Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 11:36:32 -0400
-Subject: [PATCH 3/8] fix: mm/vmscan: Convert pageout() to take a folio (v5.18)
+Subject: [PATCH] fix: mm/vmscan: Convert pageout() to take a folio (v5.18)
 
 See upstream commit:
 
@@ -24,7 +24,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/include/instrumentation/events/mm_vmscan.h b/include/instrumentation/events/mm_vmscan.h
-index 15d56b38..f33bcbd2 100644
+index 15d56b3..f33bcbd 100644
 --- a/include/instrumentation/events/mm_vmscan.h
 +++ b/include/instrumentation/events/mm_vmscan.h
 @@ -510,7 +510,20 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_lru_isolate_template, mm_vmscan_memcg_
@@ -49,6 +49,3 @@ index 15d56b38..f33bcbd2 100644
  LTTNG_TRACEPOINT_EVENT(mm_vmscan_writepage,
  
  	TP_PROTO(struct page *page),
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
index c1113468bd..506004a3c6 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
@@ -1,8 +1,7 @@
-From 0d2ee7c9cb79a880c440153beeacd736d1b61a31 Mon Sep 17 00:00:00 2001
+From c3dac15e9e2be4ab818b59a74fda26466cc16c2c Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 11:30:54 -0400
-Subject: [PATCH 4/8] fix: mm: vmscan: add cgroup IDs to vmscan tracepoints
- (v7.1)
+Subject: [PATCH] fix: mm: vmscan: add cgroup IDs to vmscan tracepoints (v7.1)
 
 See upstream commit:
 
@@ -29,7 +28,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 123 insertions(+), 2 deletions(-)
 
 diff --git a/include/instrumentation/events/mm_vmscan.h b/include/instrumentation/events/mm_vmscan.h
-index f33bcbd2..cce06198 100644
+index f33bcbd..cce0619 100644
 --- a/include/instrumentation/events/mm_vmscan.h
 +++ b/include/instrumentation/events/mm_vmscan.h
 @@ -121,7 +121,43 @@ LTTNG_TRACEPOINT_EVENT(mm_vmscan_wakeup_kswapd,
@@ -193,6 +192,3 @@ index f33bcbd2..cce06198 100644
  
  #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,7,0) || \
       LTTNG_RHEL_KERNEL_RANGE(5,14,0,427,16,1, 5,15,0,0,0,0))
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
index c7b4c1a7f1..a87ee574fb 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
@@ -1,8 +1,8 @@
-From 0ae8e932cc2c431bafe390a43feb29b0c6a98ab5 Mon Sep 17 00:00:00 2001
+From 69ee47280a495540d91718442a66af18362a4a26 Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 14:52:02 -0400
-Subject: [PATCH 6/8] fix: treewide: change inode->i_ino from unsigned long to
- u64 (v7.1)
+Subject: [PATCH] fix: treewide: change inode->i_ino from unsigned long to u64
+ (v7.1)
 
 See upstream commit:
 
@@ -37,7 +37,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/lttng-uprobes.c b/src/lttng-uprobes.c
-index 39c09b8f..84edbd33 100644
+index 39c09b8..84edbd3 100644
 --- a/src/lttng-uprobes.c
 +++ b/src/lttng-uprobes.c
 @@ -256,8 +256,8 @@ int lttng_uprobes_add_callsite(struct lttng_uprobe *uprobe,
@@ -51,6 +51,3 @@ index 39c09b8f..84edbd33 100644
  		       uprobe_handler->offset);
  		ret = -1;
  		goto register_error;
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
index c16e6e932e..ee38b753f3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
@@ -1,7 +1,7 @@
-From 95d19f6ff3d0591afce0e5666d3d17b9192789f6 Mon Sep 17 00:00:00 2001
+From 06f95d412fd63d4bd0ba2c24243a67808931f034 Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Mon, 25 May 2026 11:37:51 -0400
-Subject: [PATCH 5/8] fix: vfs: widen trace event i_ino fields to u64 (v7.1)
+Subject: [PATCH] fix: vfs: widen trace event i_ino fields to u64 (v7.1)
 
 See upstream commit:
 
@@ -26,7 +26,7 @@ Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
  1 file changed, 174 insertions(+), 5 deletions(-)
 
 diff --git a/include/instrumentation/events/writeback.h b/include/instrumentation/events/writeback.h
-index f53d9d3c..cbf9a426 100644
+index f53d9d3..cbf9a42 100644
 --- a/include/instrumentation/events/writeback.h
 +++ b/include/instrumentation/events/writeback.h
 @@ -35,6 +35,31 @@ static inline const char *lttng_bdi_dev_name(struct backing_dev_info *bdi)
@@ -271,6 +271,3 @@ index f53d9d3c..cbf9a426 100644
  LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_single_inode_template, writeback_single_inode,
  	TP_PROTO(struct inode *inode,
  		 struct writeback_control *wbc,
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index a47b5b9789..b6001c2e29 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 60d423945bd4f4c4b7bfc6f29da9231152d05690 Mon Sep 17 00:00:00 2001
+From e7d6a99119798856810f4067c7c550cae2173cef Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
@@ -19,11 +19,13 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/Kbuild | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
-Index: lttng-modules-2.14.0/src/Kbuild
-===================================================================
---- lttng-modules-2.14.0.orig/src/Kbuild
-+++ lttng-modules-2.14.0/src/Kbuild
-@@ -3,10 +3,13 @@
+diff --git a/src/Kbuild b/src/Kbuild
+index f33d0d5..beef608 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
+@@ -1,12 +1,15 @@
+ # SPDX-License-Identifier: (GPL-2.0-only or LGPL-2.1-only)
+ # SPDX-FileCopyrightText: 2010-2024 EfficiOS Inc.
  
 -ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
 +ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)	# Check if dot-config is included.
@@ -39,7 +41,7 @@ Index: lttng-modules-2.14.0/src/Kbuild
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -168,3 +171,5 @@
+@@ -168,3 +171,5 @@ obj-$(CONFIG_LTTNG) += tests/
  obj-$(CONFIG_LTTNG_SYSCALLS_EXTRACTOR) += lttng-syscalls-extractor.o
  
  # vim:syntax=make
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.15.1.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.15.1.bb
index 6e0cc811b4..c6c78c1840 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.1.bb
@@ -14,7 +14,6 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-                   file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
                    file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
                    file://0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch \
                    file://0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch \
@@ -24,7 +23,7 @@ SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-w
                    file://0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch \
                    file://0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch \
                 "
-SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
+SRC_URI[sha256sum] = "4eab35edeaa84ddefa243f2f842af1482325062ee008fb511a3ff191b9aa09ac"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.47.3


