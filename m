Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90319C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:27:50 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.400.1657826861832026292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yqkk2JaX;
 spf=pass (domain: gmail.com, ip: 209.85.160.46,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so2545766fac.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y6832rXAXTCcjUkkPEBkXDexk76f881Ndd1wPi8xs+A=;
        b=Yqkk2JaXOHz9Y4cSG9uMNy+FU3vaFfbqS8UjIDrjyWswHLuVsb7KAb4sJ4RMPhavnu
         E7IusJrcO7QAKES7ZSsTyCj+CjkJfxjMXQYRQ3ciBGOdIrEttd8st+ZPZqDEW/LJFzhP
         Ba9O/1X5qOMHYHvsAxlkgtINhtUvL98aa5Bb6LPxE1TF2b+wv1NaSL33vAREyUOkkoYs
         7HzGHjLVaE4FUj3OFtD7oOVE9/zK9FWG7ZOss8/pYJLrntyg6X4rzgZG4fcHJWeaV5RI
         II+NbtuE5fWhil3BBFLJEuyDrlnML2x/CWxmPzxkAyGS3Z4lloZCLxznsgB3/n47FR72
         5gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y6832rXAXTCcjUkkPEBkXDexk76f881Ndd1wPi8xs+A=;
        b=TOhZaz0L0QZ0KAarBsOQVIEL7/8zZRMSC1HwhtvLQWCi8tAK8QNerHQmOLAOA5WMPu
         oeYL7iMWmfmqbAk56LrRvpQHWb/KJVEV+5ljL58GPQ8ur3zxDB2UaajGtg8hjTvNF5t5
         l9+1Yds+qUUH6YmkIFran2YZd8b5ci6feNQyEFvZ8rQ8CbsbtMtqOyq6fCumY7H/WV/v
         VxT2QqhyhxFm8t0PMW4ZVlROeDftuY//ygqu8KxMUXLvKrY43xEH7XAxc105nxaf3ePl
         wdPG0sqUiD5Kr5480WjqMtCXZJaa6y3h/X+Y13CZZsL/IR7xURRgqviuN//9O0JMWpnS
         6yWQ==
X-Gm-Message-State: AJIora+6fNGU5B3vsBsxQJ7czPgszZGGTxLS6W4iOodXOXNDByyvlhhg
	PPaVWsO8gEoi4DTAKYUR6My/bz2szSvpOg==
X-Google-Smtp-Source: 
 AGRyM1v816Tm0QU78d7DYfs/0yCwyPp84X2cbHQiPB4DH/pkE82wFQLlmwc5Lthu4uv2Sn/zjbZ9LQ==
X-Received: by 2002:a05:6870:972c:b0:10c:151d:4df8 with SMTP id
 n44-20020a056870972c00b0010c151d4df8mr7980609oaq.210.1657826860631;
        Thu, 14 Jul 2022 12:27:40 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 r41-20020a056870582900b00108b31bf8fbsm1325498oap.53.2022.07.14.12.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:27:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Include all dependencies in SPDX task
 signatures
Date: Thu, 14 Jul 2022 14:27:34 -0500
Message-Id: <20220714192734.416127-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:27:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168051

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
index 7150bd0929..839b3a992a 100644
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
+    if isSPDXTask(task):
+        return True
+
     # (Almost) always include our own inter-task dependencies (unless it comes
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
-- 
2.33.0


