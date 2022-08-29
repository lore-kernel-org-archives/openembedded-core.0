Return-Path: <ghassanebb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95075ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 14:59:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.71237.1661785184052717064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R3YSOZgV;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: ghassanebb@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r4so10481804edi.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=q67eaABnG9yzN0vCTJWxi0wx+5q0JE0h+8kcnP+YuQw=;
        b=R3YSOZgVZWl5aF1CjpVE7dSmprM6xQ8M82S9pmuDt3S0CJpN5MQNvTktaTI4u1AcKb
         hddUlO0t5XKXTl0fEClwR50sDqDai7HrnL1icGO6xwkEeWfI3huaS24PwFFgOrpuiDiq
         5Y2bDwbFqU/P0UVC5ejB4okON02LtyeLjK72ZQt3vBi82wCuxTveHuuwe1+nKvseQ6UG
         imu6IbPOyuVhNY/62enhUyo4sSRWln1BodHRRiKB2qekHyAbv163ej7fx8QEcKkqDB2U
         +sFX2iD3h2AH9YyFCD6QOFut4xM539vA/iFRC8yREmnwSfWMFMbmCahAnSUMWsPT0KNW
         NiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=q67eaABnG9yzN0vCTJWxi0wx+5q0JE0h+8kcnP+YuQw=;
        b=OffZ1wlSXjFpPQXUrP965rAqreaF+bNkyKO4Qrj0R94nDw+EBayAed/px8kdAZ9fow
         po0FRpsacDlePtKPPs+BaqN2u5AK2E2MSPCpD+p543Q4+9WxN0a3YXBQPaVIQ2HCePje
         lgy2hrsyBzoiYEz2rxqmfVdE/7kMVLtns/Ua8NkmAnBmA9f3svznBNiTNjWWpHw0dmJM
         1h/Tm5GGp8Nmf6tYCy2/SsNJ0PoIc0nxVpnq8ZMUEEvuyraGK061vHm3k6YLkhVx4KOR
         P6MfQNkMic6hlUDn9AwbNJvWezpcriqTxKINEfxCJ9PtdKFHaw9fmw96aEJ4TYedjgaz
         5YSg==
X-Gm-Message-State: ACgBeo119ynwMB+K4t6JmK4t2GGFEA1GkaGAtwzjL9qZRZcQLKNJHgpc
	DOSYKZt+/mi7IQhZDA9szuPlGuOVapJTTR/o
X-Google-Smtp-Source: 
 AA6agR7kwGgabrN1JUsogxWiJXfysb2kJIqa3DNyrfRVS8qCHT19bvXpQwZq3Dy+8DH1bDrF3wPORA==
X-Received: by 2002:a05:6402:2789:b0:440:44b6:849b with SMTP id
 b9-20020a056402278900b0044044b6849bmr17440412ede.387.1661785182227;
        Mon, 29 Aug 2022 07:59:42 -0700 (PDT)
Received: from ghassane-XPS-13-9370.. (93-35-164-135.ip55.fastwebnet.it.
 [93.35.164.135])
        by smtp.gmail.com with ESMTPSA id
 7-20020a170906310700b007246492658asm4562418ejx.117.2022.08.29.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 07:59:41 -0700 (PDT)
From: ghassaneben <ghassanebb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ghassaneben <ghassanebb@gmail.com>,
	Ghassane Ben El Aattar <ghassaneb.aattar@huawei.com>
Subject: [OE-core][PATCH][kirkstone] sqlite: fix CVE-2022-35737
Date: Mon, 29 Aug 2022 16:57:20 +0200
Message-Id: <20220829145719.846399-1-ghassanebb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 14:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170015

Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737.

This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).

Signed-off-by: Ghassane Ben El Aattar <ghassaneb.aattar@huawei.com>
---
 ...riables-in-the-printf-implementation.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch

diff --git a/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch b/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
new file mode 100644
index 0000000000..9e8f039ef6
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
@@ -0,0 +1,26 @@
+From ec75530b8d8268cb07d8e476d79e1b0e59492fa2 Mon Sep 17 00:00:00 2001
+From: drh
+Date: Thu, 18 Aug 2022 15:10:46 +0200
+Subject: [PATCH] sqlite: Increase the size of loop variables in the printf() implementation
+
+Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737.
+
+This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).
+
+Signed-off-by: Ghassane Ben El Aattar ghassaneb.aattar@huawei.com
+
+CVE: CVE-2022-35737
+
+Upstream-Status: Backport [https://www.sqlite.org/src/info/aab790a16e1bdff7]
+---
+ sqlite3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index f867d62..490199a 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -30234,1 +30234,2 @@ static int vxprintf(
+-        int i, j, k, n, isnull;
++        i64  i, j, k, n;
++        int isnull;
-- 
2.34.1


