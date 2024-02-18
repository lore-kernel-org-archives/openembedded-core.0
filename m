Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAF6C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 20:08:44 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.25571.1708286917716647408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 12:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfNU2AZ9;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7c00128de31so102600839f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708286916; x=1708891716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXnQ19LhRy2RdPxFuGK8dxmgumMbkFd00mIbk7kABqk=;
        b=CfNU2AZ9GSs6Cxoi91t4/Eiha3BXqubLMdKI9/gK+JT3bcMqdnckGDeidKPDT7hrYW
         FR50UekbEyoFNc1hYUv00aMWTZmq47NxFGXZBFBHEhRFgSFVE4dtnZOBYl/tMqXWEcag
         F1DZv+rm1J6dYG4RXOMHlWnlhPFa4UoP6voVhnK0BEriQnpQz/nB9Z8csiUAlpBrtSAx
         Q3n2nTEU5dCxmzVrOlzrqXnAdXbn86/NQO0cNJEXdConhozNhPKtX/zdJWsQtNDnfeIe
         2BXXvnBTHtFWcJHTl7MZZT3GbHvVVqlpsbhVlXFCozKYfNWnEReHGPxFAYrOdIr2HpA1
         lW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708286916; x=1708891716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXnQ19LhRy2RdPxFuGK8dxmgumMbkFd00mIbk7kABqk=;
        b=nbyoM3hhVhD3XfibWHueI0+Pn/aTB/s2KrSOtHpI5QW69hZVgUR5pCYLYtIcGg+Uom
         4YftuEBdES36h6VsfLUUPVo0fnVz68VyjjdKAEC6UaOITD4suC1YoKpKAECFwSLCBcFS
         44xljs4FhIoEExcFpXrT7/4OdsBpsa1mvnyHGQjYnqtQ0FGI6f0q+WgyFYl8DJeK5GMd
         I5upraP6xTo7s/psgt0veNtupswMdgALNtC1t/aHrg7Y/AY16hO9HckyE9Ca6uBE3gmm
         PvDetA+X6SHgIlUCZlhhvbfuCn7qNhN17s8x/uCbMpZ+lxTzLbcX+dGDoYQ7AwMOWnku
         Zw0Q==
X-Gm-Message-State: AOJu0YzRaQU/WiRoNpj2IpJrTlUwCF1u2iIjYNZloDfixWcKwCUjJntU
	7R/nigzhVwC9Ak1e0vSh8Dvjeee93tD0rBIpiWnTLxtGoD6BfupkoKPcpPPH
X-Google-Smtp-Source: AGHT+IGWub1cSHqlLUqJhxak+OEvvqukftQhKF8lTNhvfxWaCcMMN+5Zswm8L1+ZvVy7IVB1lBePcw==
X-Received: by 2002:a05:6602:3fd1:b0:7c7:397c:6690 with SMTP id fc17-20020a0566023fd100b007c7397c6690mr6778608iob.17.1708286915986;
        Sun, 18 Feb 2024 12:08:35 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::44fb])
        by smtp.gmail.com with ESMTPSA id x9-20020a056638160900b0047131c78ce3sm1135370jas.4.2024.02.18.12.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 12:08:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Implement new siggen API
Date: Sun, 18 Feb 2024 13:08:30 -0700
Message-Id: <20240218200830.2983352-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 20:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195849

Implements the new API required for querying unihashes in parallel

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1b4380f21bc..aa891ecf0a0 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -205,10 +205,10 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             return self.lockedhashes[tid]
         return super().get_stampfile_hash(tid)
 
-    def get_unihash(self, tid):
+    def get_cached_unihash(self, tid):
         if tid in self.lockedhashes and self.lockedhashes[tid] and not self._internal:
             return self.lockedhashes[tid]
-        return super().get_unihash(tid)
+        return super().get_cached_unihash(tid)
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
         tid = fn + ":" + task
@@ -326,6 +326,7 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
+        self.max_parallel = int(data.getVar('BB_HASHSERVE_MAX_PARALLEL') or 1)
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
-- 
2.34.1


