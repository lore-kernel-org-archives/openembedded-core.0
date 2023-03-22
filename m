Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB06C7619A
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:25 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.55755.1679517977122443610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VcOgV8qd;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 103-20020a9d0870000000b0069f000acf40so8660493oty.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm8YMtE330dM9AhPhm/wzfexiJH9xDQm3HQQVQS/0rk=;
        b=VcOgV8qdxSfZ71WcVb4iBskGb7slElo6OD8h0iy2sPYBedQx0Ad6aD3s2cIgeRy9In
         0ihI448dbjES98UKIy/FYH/kUe06IBt5f4DCIte3GJ2b2VQt/Gik1LO8tGNFSfWBUNjz
         27xotZNqjj8OwKWQgd+qiPsdE7Z5Afqt0T7Gap29neo1I/04xgkSD4tHJ6kvHOqu8Eyw
         sH1CnM3Lc3q2SHn+OroqBL76nv0eRMy12du++KUgnC4HqA9cRxR5SFSm7TglY3UX5jXv
         PdHR5MucvqsSJ9Q77nioDxfHiPBuDtGEyIFDssREjUZyfLHTqsM0kb/SNolb0aLsKo0J
         gVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm8YMtE330dM9AhPhm/wzfexiJH9xDQm3HQQVQS/0rk=;
        b=Ggml+2QyCSAI8Z5kSWTYbidQt8JiGfJ/eYNFLDsF0zyrd4j+5qgWnMIaBljZeHUGOa
         g3GTkBZsXVM+F5d+zDPrLKgT9FFfwC5bvEhbyFLM1u1wQHWVDmdAoQvhO8fbe97LPpiP
         yVB71kor26WGfaqUGnkAnGTU8oQXoDc/1lxFGO2NBeBylxIqwtRSI4AOSNsorGuz2bOy
         WoeLkJjVazXENn4/mYTgTgHoFVu61E9DAXKX7P6jsCS99z+ZfjLfFujzsV1F4WUih3Y5
         izmo1+hjxyfzgiK5xJzeAvM1G+UncjGBf9AgjMmahkqsgNOmxbzLgRi2jqCsRfDazJ03
         9zNw==
X-Gm-Message-State: AO0yUKVcvcK9uPxfGjywxMd5vTPljT86H3113Ytm8Cpx38+lnDK6/SBu
	W707cqDMf3ox8QiExZqRWUAohibG+70=
X-Google-Smtp-Source: AK7set/yO8s+yKocg2AS/wsiDFW2a38Hk3cj8H1rCsGk+FpMT1bJm0v13iPNEuEN9nHwSKDKuPUsoQ==
X-Received: by 2002:a9d:480b:0:b0:694:8a0f:644a with SMTP id c11-20020a9d480b000000b006948a0f644amr1948933otf.38.1679517975826;
        Wed, 22 Mar 2023 13:46:15 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH 4/5] create-spdx: Use gzip for compression
Date: Wed, 22 Mar 2023 15:45:57 -0500
Message-Id: <20230322204558.1386634-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178960

The master version of the SPDX classes uses zstd for efficient
compression, but it relies on the zstd tool to be present on the host
system. Since dunfell supports older distros, we don't want to add this
tool as an additional requirement so switch to using gzip instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 13d13fe1fc..608f182a49 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -466,13 +466,11 @@ python do_create_spdx() {
     @contextmanager
     def optional_tarfile(name, guard, mode="w"):
         import tarfile
-        import bb.compress.zstd
-
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        import gzip
 
         if guard:
             name.parent.mkdir(parents=True, exist_ok=True)
-            with bb.compress.zstd.open(name, mode=mode + "b", num_threads=num_threads) as f:
+            with gzip.open(name, mode=mode + "b") as f:
                 with tarfile.open(fileobj=f, mode=mode + "|") as tf:
                     yield tf
         else:
@@ -931,7 +929,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     from datetime import timezone, datetime
     from pathlib import Path
     import tarfile
-    import bb.compress.zstd
+    import gzip
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1002,8 +1000,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     index = {"documents": []}
 
-    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
-    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
+    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.gz")
+    with gzip.open(spdx_tar_path, "w") as f:
         with tarfile.open(fileobj=f, mode="w|") as tar:
             def collect_spdx_document(path):
                 nonlocal tar
-- 
2.33.0


