Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22697C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:29:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.720.1662604138502244748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uRLY5OIX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id j12so4038147pfi.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=99bkRObsS1T/GMio38Cej9fqOXC8egFZQ15hHBqnK+M=;
        b=uRLY5OIXCjU/Ope24N3TBEy11aC+Nojc540dYhchf/qQEPMBnDwtOvqjzmu9IUROjb
         P4iXWaiSSkmJgXN8nBGuCUQ1ubkYJ59LrPzemWMBEGCmozi+HrsBUBNlAHv77O3G7J4n
         z+rBfqearjLvd8kJlaliN7xhxL21QiiY3Kb/bSqB8ldS57w8zjn8Wz24WtfZ27v9XGzV
         N1fxlvFxfMKvG2sppLOJgZcN9r9NY2nSoPMg/xOYNEQhs7X44rl7o0dOTr203uXnWoxW
         B2fuIe/P/dO27pjK4kpfacVban+/VQCCqqsgD3NBscY/nGpVCBWeuG1KZWLnwLQ8AJ9S
         5H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=99bkRObsS1T/GMio38Cej9fqOXC8egFZQ15hHBqnK+M=;
        b=waNHcn+j0rlJVIKw1Dnf00uEcg98mkYmtoJiByjiJo2Bh1pMrQA2mnA1KLu8T3G7as
         0NPzSlJjlAFILdGVLJ8yuhCn5LtSB5ArZZUJy+Vb5EsIMmPFfB9AoAOgyj8Uld5Vcqpq
         +IJx7wyVlQIxJtSDULRk8lCN7I4XM2UeHkiIOIxIAft53AH4rA1R4rgoflyRpm2lwprl
         0CoqyJdzEaQEXhx8RSj8r8J5LgFmR6wEFGvlixzzAw7d+mplPD+Aeiuv2FcM14tDOdBu
         kYjrigerplFPnhgX9ljMVhSyn8dB8OJRl5zjFlSy/COnJZjJmCXAJr80kgh1Pfno3llD
         tNhw==
X-Gm-Message-State: ACgBeo3JgQ89ysnI3SXUBuWQ88PDroKCL801lzQhoSHuMAGR7/+NWl8e
	R1O+dSd/8Lm//qmC3Sm8n0gY4/OGDLA/VldX
X-Google-Smtp-Source: 
 AA6agR4cWdaq4QvBR3ZyGQCAdKtxYiPmHUx9zyJeflDqEV+auD6HzjAaKwMNmvNyQw7NJcq0yDDXpg==
X-Received: by 2002:a63:d1b:0:b0:42b:828b:f14a with SMTP id
 c27-20020a630d1b000000b0042b828bf14amr6007773pgl.235.1662604137553;
        Wed, 07 Sep 2022 19:28:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] classes: cve-check: Get shared database lock
Date: Wed,  7 Sep 2022 16:28:30 -1000
Message-Id: 
 <374dd13db2c4fa92793f12c93d68d09304f77c17.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:29:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170444

From: Joshua Watt <JPEWhacker@gmail.com>

The CVE check database needs to have a shared lock acquired on it before
it is accessed. This to prevent cve-update-db-native from deleting the
database file out from underneath it.

[YOCTO #14899]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20a9911b73df62a0d0d1884e57085f13ac5016dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 9eb9a95574..c0d4e2a972 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -138,17 +138,18 @@ python do_cve_check () {
     """
     from oe.cve_check import get_patched_cves
 
-    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-        try:
-            patched_cves = get_patched_cves(d)
-        except FileNotFoundError:
-            bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
-        if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-            cve_data = get_cve_info(d, patched + unpatched + whitelisted)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data, status)
-    else:
-        bb.note("No CVE database found, skipping CVE check")
+    with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")], shared=True):
+        if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+            try:
+                patched_cves = get_patched_cves(d)
+            except FileNotFoundError:
+                bb.fatal("Failure in searching patches")
+            ignored, patched, unpatched, status = check_cves(d, patched_cves)
+            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
+                cve_data = get_cve_info(d, patched + unpatched + ignored)
+                cve_write_data(d, patched, unpatched, ignored, cve_data, status)
+        else:
+            bb.note("No CVE database found, skipping CVE check")
 
 }
 
-- 
2.25.1


