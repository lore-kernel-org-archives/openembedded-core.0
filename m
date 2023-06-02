Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A532C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.13175.1685712903196777016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=My6tzrx+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso1944683f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712901; x=1688304901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LgxHd6PD+IqNEOvdsjKmG15gImbtP5ccRmmNrZEPYk=;
        b=My6tzrx+dzeYiyKSCvp/5TP58UCS2EaDCY5hbobhpylwqZxhzc4F/lcs3PnttYQLk9
         jfzy8AyO1jOMOQq7heEOidPlEw78JUh/UIpedhrsz0NtVfU4paxewpywBd+FQ0ja2Lrf
         Cc5Pb3GRip3mgKhHBmIOc5UyeJWqqmNxF6MMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712901; x=1688304901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LgxHd6PD+IqNEOvdsjKmG15gImbtP5ccRmmNrZEPYk=;
        b=HtiVxVG58xUpzqt2V+DvtZEfm043CSjz0OvLz0GUhlQ/oTTpFRvQpy6NbQ57QkvSep
         45db5LF558+2EoY2mcBT1c3ILSBfpIXbUkaRr5lUb35beZHvsRAoSVvcndHFPVWE0+zj
         PvbU5lsuwwDJU/+BhyrCwzvZT4tnv75dt6TaQfFWx9rl1BWRQQL5NVA9pxpggJbsPNpj
         I1fwIt91oDHVgzITX58hDRyVZVAEXRCmY86d4dx4WKqRI6CVqJcuv4rdSCROYz3mqwlI
         0n3TpQGwxIsKybiRF0mQZ82V1xXp0HFdWpukj3TeKwSFV21rZv6m7CqXFFeyZknzNW0M
         pP2A==
X-Gm-Message-State: AC+VfDwE1xfXJavt/Uifw7CwbEURA0gVRicLcLw7dDys3Ar256Q7DjSw
	EfD8dhiqcD3GGoC4bezZWQZUE52JSEwMbOd/pwI=
X-Google-Smtp-Source: ACHHUZ66KbpTg8Tt39k7Iwy18uK7IRkor8psUkEiZIptKWlMBtjtxlU3rK/GiWSmV/Li6C5+7Xp39Q==
X-Received: by 2002:adf:f187:0:b0:2f4:4e1a:bea2 with SMTP id h7-20020adff187000000b002f44e1abea2mr4390178wro.59.1685712901599;
        Fri, 02 Jun 2023 06:35:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] sstatesig: Drop SPDX special casing
Date: Fri,  2 Jun 2023 14:34:50 +0100
Message-Id: <20230602133453.229023-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182326

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


