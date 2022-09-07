Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C86CC6FA8B
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.8357.1662560446655848573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zvavRcfw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso18445924pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=6e6zkXavoz2ATx82Eph8mMAqIIiXUWp9wLLPZ4PWzsk=;
        b=zvavRcfwLwbWDE/Fil3PG9lTLA66pTMoUgM77Z3Kfr1cy5KANCjdA4SraTwWw7EPNB
         F82YQLDge/t+QvBsCAQiePv1Flg2n06DxxspOabRGHKbFlf//u4Z0+FpVADVh79wQxvx
         U+Fb2cczf3LMwvwjcA7FMTE1c8ZuFXQV7PkR0YRXCKSH3GsJ4I9l1g55MJmTzqhOZRUw
         imLzlhqSIVjzUozW1pHa8XzxycD+nnrGSEIGxYdXX4Ym7MyxOG6lEsJLpAVlm0ApxeMM
         N5/WZ82jf57r/N44FpVsAxYDXvXldJaHlL7ndj2l9CGpyuwG12rqud1AQyZQaxz2qzIN
         z7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6e6zkXavoz2ATx82Eph8mMAqIIiXUWp9wLLPZ4PWzsk=;
        b=26S3Zz3SjpVXu1q/pZQYlugGWF9s2Sds9pj0w2pbEskwHI5aPpuw9qePHzzDdtkxdG
         LwuERLrhOHl3GDKqMPE+njZSrOqNZo7KexnM/sNfN6Ccpy5mpTPg4Jbm6S1OZTyMvzn8
         xwEdxRWgigK4XoWqOPo1dmUXLwbDKBctxQIibnKruf+mncGWzVG7wy4gkXWEk4y6K458
         JkAAijSretn2B+iMeDgRzr1mWkcCykbCjapzSMmdc6T8t26rLQGHAu6qIB4fe9eWUZOC
         JGUvrlaF4aGY5brvgCkXLATxgC0+bYhB2QLvLG2nlsVREIL+BezoXDuguneCnNBYpgfB
         XQUw==
X-Gm-Message-State: ACgBeo1Xn6AMXg988SqPyjoBgqhAHaNisGJFwO5+oZS9VuC5E9tm3nno
	w3oTGSBOaXO5nLUo2iez9ZeQIqxLcJ6J7piE
X-Google-Smtp-Source: 
 AA6agR7A2iWaHDAGcyaLlfo+71NiJqaKqIhDx7tl5f6gM3LjB8HRohnsAT+hAhstnZBqA46qJhZ1eA==
X-Received: by 2002:a17:902:ea11:b0:176:b283:9596 with SMTP id
 s17-20020a170902ea1100b00176b2839596mr4129326plg.69.1662560445751;
        Wed, 07 Sep 2022 07:20:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/24] classes: cve-check: Get shared database
 lock
Date: Wed,  7 Sep 2022 04:20:05 -1000
Message-Id: 
 <655bc5acdebdee9b4dfd3c964104a84b6845b2d4.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170399

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
index da7f93371c..b751c986ef 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -139,17 +139,18 @@ python do_cve_check () {
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
2.25.1


