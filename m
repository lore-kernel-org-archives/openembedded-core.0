Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9CEC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 13:50:36 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.6608.1657893031652237337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OKiqrNYl;
 spf=pass (domain: gmail.com, ip: 209.85.161.50,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id
 r193-20020a4a37ca000000b0043578138958so633374oor.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dw3I+lBackc6Qu0lHtV8pAUwHwurGN2NIx4rCtkwSlA=;
        b=OKiqrNYl+Uco3qtJRvZ025wjAKADUHQ6J41x7gLptOoAsAxFD6TJ4faL23KCJ7CtcK
         ea91FPHs4EnHciMhjo25ZgbUkXpRjkb4hbOLAS5EVPlUQU6J965CJ467gRpUcnxGKFNj
         xNUQALZjdDZ39opUTc0uC8L2AHHMqLh+7bPFkUTvtkA7U21BiKWVe4LSTu91pD4IrE+Z
         5TcPKNmko+dLZH7GtMCwQAn8GFyBTUz8sx1w5GEAegZvy4V/056mUMAJjv8zmiO6ae8m
         5ALJTa7eRkWi8/RpIb0Yk+pw9/yK2YtRHMxKByMGCQ42FLPNtx1Z7T2UZuGE7LW7acNR
         4frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dw3I+lBackc6Qu0lHtV8pAUwHwurGN2NIx4rCtkwSlA=;
        b=ffPkB9zC2Yqa+c6r+rFDfapUxqXLrR6kMxFbILyKrDYuxBjKFRDfKF38JVhHs/aTSG
         VNDHqezWxnsVZA0hhYnvYc/tWGOFT827nNgZgbXmv46J+epeSIPKruvB9dqA6m/M5jjX
         iESIK9bTmKaUgZKCZzITBl+33QzxKp+2xhEPUGTgvs66Fizi1R68idwoQNlVsd84Odea
         9c9w8yRbM+EUnho6hlgsFA4PyVLShz2h8n1EG+yYT5XBsyTA7TQct7ri08jXB3sBLrlv
         l94AVb48CrHocFRPIdfXZhTO6/5VHVCKPgP4z5gORgaMH2SmFUFpdfKmLHM+qd+tn8c1
         C/Eg==
X-Gm-Message-State: AJIora/fwQemT3XlCI5W90hfCm8bnqdak838KTVopegxOQFtT5wL4AMh
	w2U5I746QPk+IdO0FprKiY45Dbw38nbFww==
X-Google-Smtp-Source: 
 AGRyM1t9sUkYd0E8U4QaJE8Bxsq1aqBFsiB368qcUwitEBASedluIBdGMoKSt20QbX+jA5eWucfuUA==
X-Received: by 2002:a4a:4b47:0:b0:428:f03a:56a6 with SMTP id
 q68-20020a4a4b47000000b00428f03a56a6mr4940165ooa.85.1657893030505;
        Fri, 15 Jul 2022 06:50:30 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a056870170400b000f1bc45ba21sm2436517oae.14.2022.07.15.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 06:50:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] sstatesig: Include all dependencies in SPDX task
 signatures
Date: Fri, 15 Jul 2022 08:47:47 -0500
Message-Id: <20220715134747.2820687-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220714192734.416127-1-JPEWhacker@gmail.com>
References: <20220714192734.416127-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 13:50:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168062

SDPX generation involves looking through BB_TASKDEPDATA for
dependencies, then linking to the generated documents for those
dependencies. These document links use a checksum to validate the
document, which means that if a upstream document changes, all
downstream documents must be regenerated to get the new checksum,
otherwise the compendium of documents produced by the build will have
broken links; therefore all dependent task should be included in the
signature (even from "ABI safe" recipes).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 7150bd0929..de65244932 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -24,10 +24,19 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
         return "/allarch.bbclass" in inherits
     def isImage(mc, fn):
         return "/image.bbclass" in " ".join(dataCaches[mc].inherits[fn])
+    def isSPDXTask(task):
+        return task in ("do_create_spdx", "do_create_runtime_spdx")
 
     depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
     mc, _ = bb.runqueue.split_mc(fn)
 
+    # Keep all dependencies between SPDX tasks in the signature. SPDX documents
+    # are linked together by hashes, which means if a dependent document changes,
+    # all downstream documents must be re-written (even if they are "safe"
+    # dependencies).
+    if isSPDXTask(task) and isSPDXTask(deptaskname):
+        return True
+
     # (Almost) always include our own inter-task dependencies (unless it comes
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
-- 
2.33.0


