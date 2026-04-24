Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2985EFE51E8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:50:11 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16919.1777020606867529895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WsWtCA4I;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1279eced0b9so11343967c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777020606; x=1777625406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yOrQBot5hic91cwiNGDJM0udgQkXOYL8RrVpje1MiE=;
        b=WsWtCA4IgoF6rUttxd5WHOzdu6MnY6AgL/bWA+heYSVSaKlII4MWzgw9xwg+BOPxmj
         Nt8V0rmwecpblOTRG0PbZnC0e5ww9y8pqcEW74r7GQlQw1gMvAKdwAlr4m1/PMoo5zx9
         d4+wD3T+IhOBtzCDSdvHflhe6U8YiVeOiUzXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020606; x=1777625406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yOrQBot5hic91cwiNGDJM0udgQkXOYL8RrVpje1MiE=;
        b=R5U9YysxL6F94v5QLA3I2pqcvA3Ru43frMTqmM5roJ+cSM5Z/u8pve2du4tRqzXu4U
         LvRXvZhjpbg1Yul/Ciwkgr+EEULRKcua7ZC9Iunm4WR64iYL5hz41ZzeeyR5QTqwB/ee
         UPGAkn6TfPTB+Qvr5XDy1TPT0v7ImcaPCopjpY8bmFSCiUl4Sz9OA6+6DslSOK99VgqE
         FZqNXbgbFlCMcuoqNopwsd11Iw5NkF9w2NUpjnB1G3FVonZWw2P8lfXSAwMBsHMx6r3l
         /hJM5J0+Z7r2fwXBW58hS23h/4/aod7PwF5lV3Dmuu+X+nd8onEB1Tvk9sstzLJwp6sE
         csbw==
X-Gm-Message-State: AOJu0YwCltVKiBeUDoqg7tomPmZjqGb/rSNTkB9/wbpBiFoNKHrrtZfq
	WyHcD6vIKOKdVqzn4zWfOUojYWC7tRjcQWOMlUs3mA1RlL+j0jhUOUo45LfD5VfrcHL0d9Po+o4
	Di0VLhOE=
X-Gm-Gg: AeBDieuAyJVtFFDRsRLQlUMHXVp19vMbHfV+iNelrYCteL3UnHKvm89AxVBLtL54G3K
	evocIoFllaKaMvwUMiNJh4x3OqtNQ0sGFErmMpWHeQ50mex/qGezo7/6wiDxzz0C1xBC6o8pf5A
	dmdrNIc0LVVIHJy6Q1hfptexPt6pdtbuYkBnln6WZDsN8h8LpTu6AsTc57SBoG1sLitNoclDiE7
	TnYsfpoH6Ou2SeItoh1IGb8kyFOqXEWSH47HqTpJI428eV6lqqS+bijnzUED0odlZW3QGewiy+2
	05zeIohICwP52Tov9gINWiVafQXC+ilaLi7QYFs3i45FX7WPX9PXfP4i7drZXU1DBscyDJUlWfZ
	8Ci582sEhNz2C8if1h+MwUYnTKXoA4f7pff9OBBJaOP/DKy5JXMbc7yKNhm9XF28sVwPq23ACXD
	OxsZFee3J6/COVVlcyxGqHn2bmjz30FYLaRFsB8nVaIq3Qwqo=
X-Received: by 2002:a05:7022:4199:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12c73f83616mr16657922c88.15.1777020605898;
        Fri, 24 Apr 2026 01:50:05 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm8888183c88.15.2026.04.24.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:50:05 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] rsync: fix for CVE-2026-41035
Date: Fri, 24 Apr 2026 14:19:56 +0530
Message-ID: <20260424084956.214345-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235847

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c
[2] https://security-tracker.debian.org/tracker/CVE-2026-41035
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-41035

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../rsync/files/CVE-2026-41035.patch          | 39 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
new file mode 100644
index 0000000000..66b1b93672
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
@@ -0,0 +1,39 @@
+From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 22 Apr 2026 09:57:45 +1000
+Subject: [PATCH] xattrs: fixed count in qsort
+
+this fixes the count passed to the sort of the xattr list. This issue
+was reported here:
+
+https://www.openwall.com/lists/oss-security/2026/04/16/2
+
+the bug is not exploitable due to the fork-per-connection design of
+rsync, the attack is the equivalent of the user closing the socket
+themselves.
+
+CVE: CVE-2026-41035
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ xattrs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xattrs.c b/xattrs.c
+index 26e50a6..65166ee 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
+ 		rxa->num = num;
+ 	}
+ 
+-	if (need_sort && count > 1)
+-		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
++	if (need_sort && temp_xattr.count > 1)
++		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
+ 
+ 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 14beafb681..2a1c3d9d56 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
            file://CVE-2025-10158.patch \
+           file://CVE-2026-41035.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.50.1


