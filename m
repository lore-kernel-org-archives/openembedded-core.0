Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F91ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 15:59:45 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.13616.1661875184026776732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 08:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WHxe3R8S;
 spf=pass (domain: gmail.com, ip: 209.85.210.48,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id
 d18-20020a9d72d2000000b0063934f06268so8378307otk.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=74JIedIM0boQX3WRKHmN4u/oWzc6USRyvmUlMihQL4s=;
        b=WHxe3R8SJmgSFmXvnxxjjG5Uurc/BIsA8uvo1nRl74XT4Hgv9bHC7cTYV42uhDPIhd
         +U3IGzGTv+uxrdX5673DUFPhcpjoaqCwHKns2YGM6IcSk0eQY975VMtxzwB5D4fYz2Lm
         be5TpNbOPJqTQ20XGep+sGQOjUhyyFoZjl7AyKz74lMp18Ihuk6fPk2JTQ48AgZB9Vow
         K4wTt/dSQUXOsIOsY6GGje7uGsfGrn95VzqiVcDXrSiOVNjp9Lb0UilyENxdIsmqU4Be
         UEqhrytO3Psgk/FaRw/nRPOxcEctK3J0MhMXg6iYXIUKspvo3vjcH8PxwVB8f0r+QtNl
         B+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=74JIedIM0boQX3WRKHmN4u/oWzc6USRyvmUlMihQL4s=;
        b=CvCwXOUPdPmVP0wVZAcVYD69zdGer6d60uDYRlbBapqRyWZN1aVLz/9jW20muoYFVh
         nMNfMfhCU/vaeJ7lugdOfKJpVcGNU9x7MDUazPR2CyMkDZEHV3TdjBTw+DtDi3qo/Vze
         +eYxjUw2v4JrJ+PAxZb+097pyzjFoefCWqV22E3qNwlEIw03VLlCbZZWgPQRL3JOIjB7
         IHkgNlxvmpcT48WvcUozNsGWDaSByuqYFpOxoVBDvIp2YbdYr5+QkWbW86esWLl0h6Jh
         2u4ZH1pwMp+RqR+Ez2/1LP1k4TVS8f/UZk0J+D3qZRbJceUTYIiP+jxW2NYAxGQaRdrM
         GXrg==
X-Gm-Message-State: ACgBeo2p/JOth8xDdNIX1b9IIe8EaECO850KKw0TUvWwf+Jey1Q4AuI/
	yyfkYZOy91VvMCmFfoLrp91vwqDszuM=
X-Google-Smtp-Source: 
 AA6agR7LS/vN1DOkybT+VyDpHtIiWWILUEWwHg+0je4QGbTlOxiF1hYsMOq/aTawWOQKoIUYPPMeDg==
X-Received: by 2002:a05:6830:34aa:b0:637:ac4:c80d with SMTP id
 c42-20020a05683034aa00b006370ac4c80dmr8807618otu.66.1661875182982;
        Tue, 30 Aug 2022 08:59:42 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a4ad0cb000000b00435785e7b49sm6859704oor.19.2022.08.30.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:59:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes: cve-check: Get shared database lock
Date: Tue, 30 Aug 2022 10:59:39 -0500
Message-Id: <20220830155939.662178-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 15:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170076

The CVE check database needs to have a shared lock acquired on it before
it is accessed. This to prevent cve-update-db-native from deleting the
database file out from underneath it.

[YOCTO #14899]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/cve-check.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d95465775d..5c8b512c11 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -145,17 +145,18 @@ python do_cve_check () {
     """
     from oe.cve_check import get_patched_cves
 
-    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-        try:
-            patched_cves = get_patched_cves(d)
-        except FileNotFoundError:
-            bb.fatal("Failure in searching patches")
-        ignored, patched, unpatched, status = check_cves(d, patched_cves)
-        if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-            cve_data = get_cve_info(d, patched + unpatched + ignored)
-            cve_write_data(d, patched, unpatched, ignored, cve_data, status)
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
2.33.0


