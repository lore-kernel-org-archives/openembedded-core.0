Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EC6C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:10:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8463.1686057007118382560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 06:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=RdaXlG3i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-974f4897d87so662282566b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686057005; x=1688649005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LgxHd6PD+IqNEOvdsjKmG15gImbtP5ccRmmNrZEPYk=;
        b=RdaXlG3it1SzS2tn+Jg5bTELv9cod7W13szQYKIeNIfTzTiEMxajbuqeK5IhHTJ02x
         zO5teWh/o+w+nxyBIRhet9WAN74YhM/B2fIHSslIRtKRYCY5n9tHGZeCxWejTncsYASZ
         YNFo1/6aqXj+XxpvcFst6DgmEXAaeFSA5Tjhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057005; x=1688649005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LgxHd6PD+IqNEOvdsjKmG15gImbtP5ccRmmNrZEPYk=;
        b=AfTMcimOAEw2TNu88L+8zhdu91OYTGtnf0vBm4ZhGVGRiPW/8qrsVG+Hmy2QQVozDT
         GWjfb+WSZz3MQr4iWELdJjJTXUgOK8Htvh7BMSITxRXtqNsbPI9ukzvZkZmmPEeTGAY0
         owcfA8a59/hXKD3AlnpYWyTCn2VLiDM/UH4jgOHSmNjU+g3JFodRhF6D+4Ahvb96HqPS
         3Pw8oOyC03XO13A2feS0qHZAdeYEEBbLYHv4NH7VNweg/oHvtGWfS5wWiae/5E0rjsXY
         srqbiVrelfMyEKT/Eo+9m+qSL2OfpOlOHxpNRbsNP4hOAEeNB7io4lyBp65Zs6PTxxkr
         h5Vg==
X-Gm-Message-State: AC+VfDxDrT9+yIrCfcI/KxUL7TUggBdQr5EVy/L75TK1p2W8L7+HSqhk
	u2SIHZEuxv6qRDy4AdV2cmA45PjuVignXfwM6xk=
X-Google-Smtp-Source: ACHHUZ7tdmGsySOKqF3830q5dw55AN1wkOI+4K0BxF1hLLRV4Db/pu3dm2DPx48CH8z53UaNHjKykQ==
X-Received: by 2002:a17:907:940f:b0:969:edf8:f73b with SMTP id dk15-20020a170907940f00b00969edf8f73bmr2245919ejc.60.1686057005128;
        Tue, 06 Jun 2023 06:10:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bc5d8000000b003f17848673fsm14074251wmk.27.2023.06.06.06.10.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:10:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstatesig: Drop SPDX special casing
Date: Tue,  6 Jun 2023 14:10:03 +0100
Message-Id: <20230606131004.535143-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 13:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182436

Other changes in create-spdx code mean we shouldn't need to do this now. We
need the various exclusions to allow the task hashes to behave correctly
for the SPDX tasks too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index ae7ef14453f..f943df181e6 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -26,8 +26,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
         return "/allarch.bbclass" in inherits
     def isImage(mc, fn):
         return "/image.bbclass" in " ".join(dataCaches[mc].inherits[fn])
-    def isSPDXTask(task):
-        return task in ("do_create_spdx", "do_create_runtime_spdx")
 
     depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
     mc, _ = bb.runqueue.split_mc(fn)
@@ -38,13 +36,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     if task == "do_rm_work":
         return False
 
-    # Keep all dependencies between SPDX tasks in the signature. SPDX documents
-    # are linked together by hashes, which means if a dependent document changes,
-    # all downstream documents must be re-written (even if they are "safe"
-    # dependencies).
-    if isSPDXTask(task) and isSPDXTask(deptaskname):
-        return True
-
     # (Almost) always include our own inter-task dependencies (unless it comes
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
-- 
2.39.2


