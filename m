Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5819C61DD2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:16:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16443.1771661812503407270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZHmkvuU3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4376acce52eso1715587f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771661810; x=1772266610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4LUtME+T3wgQdy12mzFuDDsMhLrnz+im+ChwCqwJHrI=;
        b=ZHmkvuU36Z2tU65aA3i4nV5Jx9RhC+WrI2878Axvj5TVyv7A3X6bo1d4cH5nfzlooX
         JfI9a3/pG7xCl7azPz5mgviXedzAMWAUs8p2TnNdTuMmWNZslLyvE+AOSqv0n12bbAwP
         TZmQPNYplSt8vuR3cvRiy07AaYnjDWEtzj5RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771661810; x=1772266610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LUtME+T3wgQdy12mzFuDDsMhLrnz+im+ChwCqwJHrI=;
        b=wha9igASrGfjW/kBdF7azGGIdNO3ke4qPJEbSZ/JA5KAk6Iwe9BuySRIJtDuqVLy73
         Pt66LkOh+5k/JM29inNtss4xh7CYqA832LCaqoihgaCjcNhWkAndk6gxRQbM+RWGqklK
         GFK4I6Cf1O/1A0TFTPOaYmOELgRhZZaONNWZlTrmGQtkaEsiBH/bGv28AZgHHB1nie2X
         URxqeRkvQ4RU/kQO5CoYmzTeV35m797OdMh/4ao2C/kG7D/DrvZk/sIxRhAUIWatw0BK
         i/4AhxDbg3/sHne44PgaTAXgYDs4CNA7oq3w2Qa7cwaH8XQrR5OqhWM0o361+Vpm9rgm
         oiJA==
X-Gm-Message-State: AOJu0YxCXHVOv59BbX214qaK324OPPWW8YdUDW9F6KQy6Ho1teU3OPF9
	fcRv1+qwCo3a2Ize5EaPYtH7ARlbho6egksJfp7Bd04l8ta4FZi2nzxc384zGVY42M3C0g85eLk
	sQOZyPlM=
X-Gm-Gg: AZuq6aKdtr7+TEgAy8Bam5pCVlKd4npw/HUKmjrA/ui1o1nPlT+Ox6ShGnkhC/FRxzL
	64kb2RC3Jv9A6mC+TxVu9WIgvRIhVGQwy0wOn+TOH5O0tsC+RVRAIWxP3V72wuBBVLpX+GzV8VZ
	4BJDrOSG4CE8iJbep34/ciXDxNOF02edGMM3ianjtQCBJFe+xkywcj8dLULuWaz/GtkCqnqI3LN
	T21XTfjHTPHArN1YlV+eYUL5fDutKpX8aCePa8s2uJ1zeI6Ubpg67v2BvdC8d183Zi9DQPRzl//
	41SnC2M/lKfVbPB1wSfJm3oWdMSj67cd2biaJHC/MuFUMhFsYf3AZPbgIv7jkE3rlExSKVCXT8A
	JhGgYuhfeNc9Da56Cgbav42ZmvN+ODnK6pZGXkukJpwPrcWRde1lDGJh+0P8IMELRtUjK5UJadA
	anpoSEXkuQZJicWemNP4IsRmA/YEv8t3iyPjDu03/6gCawbsFcgJo=
X-Received: by 2002:a05:6000:40ca:b0:437:73a2:2d4c with SMTP id ffacd0b85a97d-4396f15a735mr4474848f8f.13.1771661809979;
        Sat, 21 Feb 2026 00:16:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm3455846f8f.26.2026.02.21.00.16.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:16:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nativesdk/crosssdk: Fix DISTRO_FEATURES_BACKFILL handling
Date: Sat, 21 Feb 2026 08:16:45 +0000
Message-ID: <20260221081647.3216983-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231602

Similar to native, backfilling of items from DISTRO_FEATURES when
combined with DISTRO_FEATURES_FILTER_NATIVESDK was not functioning
correctly.

Ensure the backfill is applied before filtering, then clear the value to
prevent further backfill. This makes the nativesdk and crosssdk cases
match the native code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/crosssdk.bbclass  | 2 ++
 meta/classes-recipe/nativesdk.bbclass | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 3541c2c393d..a2853e6a920 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -19,8 +19,10 @@ python () {
     # Set features here to prevent appends and distro features backfill
     # from modifying nativesdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
+    oe.utils.features_backfill("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
+    d.setVar("DISTRO_FEATURES_BACKFILL", "")
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index c2e53c8450a..4404a18856a 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -17,7 +17,6 @@ CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
 MACHINE_FEATURES = "${SDK_MACHINE_FEATURES}"
-DISTRO_FEATURES_BACKFILL = ""
 MACHINE_FEATURES_BACKFILL = ""
 
 MULTILIBS = ""
@@ -85,8 +84,10 @@ python nativesdk_virtclass_handler () {
     # Set features here to prevent appends and distro features backfill
     # from modifying nativesdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
+    oe.utils.features_backfill("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
+    d.setVar("DISTRO_FEATURES_BACKFILL", "")
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))

