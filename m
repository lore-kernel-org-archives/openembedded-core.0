Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BC5CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:25:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11249.1782393950001652037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IPe/CmdT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: awais.belal@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1632513f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782393948; x=1782998748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rf6tOgXYZjzxGMJAm14Jw/kTDmJUMYU1voSunBppWNo=;
        b=IPe/CmdT30hTFQQWF7hp/X9VA/lMKaTLHsTb1YJy7m4hQDDsjb1DOE+wQSlqLGxzZl
         df6zdNOfi843Lz0/72NlXCVARUSlf7I4DphzR9RiI63SBZyjA0BcsDQj//Gjl76aLOxA
         MG+2fWeE8CfUOzQ8aiTJ+vv5+kubPfu4CoAvv4X0NFamcch0EoLWdXXStUMRlLsdRsYs
         5S0KzijAPdjOQP36gZO+m+BGCsL0Z1gp0MmaKxwIEGMGWA2xdKaFz53KVxvNCjDIC+nq
         shkMEwx0PNPadSPWI6iix4BzPdiSwOIuqKfRdiYttLHXyz07IS7M82Zd1gdO1volNOnu
         PAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393948; x=1782998748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf6tOgXYZjzxGMJAm14Jw/kTDmJUMYU1voSunBppWNo=;
        b=HPl30Q1cYdu1Ou8zdBA1r/bQAc6g6kvZm0tvQbzKWIC2IjN8RW7CYouaRTOtU6IC7u
         UmwPwLsrUZYk4coLde84tT3Lmgi7lC173vvq+KY8fN36CHlPEL5Xge2AIvfs++RTpu6a
         JiFb4S2fvI01g0CMd05Gx47nSCl9F3SBvf4ROJwZ0OZT+GCr0D5lF8x7LudPgZSdZ/Tu
         lF+FyZcc5KqXOq4C8EJxYVJXy/YH0fV7xDOO15YHp7d5uO7GMmoNOHCy/hel8j5mDYw6
         xPhLpd6K8d7BkgkSWzH6z+EK8+09AGy/G8Hu8IM1bjn1WC5OlS22A7bXFwNT8nW8GMTs
         RkJg==
X-Gm-Message-State: AOJu0YzIf7FhJ2dlT5LR3HxK04SjKKx1i1b0ktxrBBd0G8sMcUPmtbjK
	3bFxIXFCMiWjAVoHR7EH0lPpiaP1RIXriHzB0dbkNkYhqSNJBJDCFumU3J7KIg==
X-Gm-Gg: AfdE7clCfc4iF64jwLIi1NXRy7uwHG1acY2yrEfzUPw0syAxtIR0ocsHZtjFWBmFfYR
	iVWQZNs0UifyPkHO1ojp4rCckyi32XpUzvyIIutUgKngTBooN+TGfhuazoN0XECWmyQMjKEw0EL
	zOkgJzuGMu6vvaaip5nKOh6vvRy++P6YpeVHP524o2Frr453KMFNmYH90UbGcKggqWKeM2JWE7j
	6mMs/FJ89n2PyIenf3fLuruCyqOjcz7LKswJRKtgBu2QdIXi5GkPC+s9qgbByIyUAuTzckL51+P
	nVebh/JXH6XfHSHQKanjdkRqJnlmBdtA6wf1K7WY2GL0HdL3EmXIZNZiK51VxmdbhfDVH/C8LYJ
	jwHkfPXOiYotUT+h5klGNWWVd6i0cUU9WZisBRssEKSPC+m3QhCUVBHWWO9jwiymSAzMo2g3Uvu
	sZPgIzcXhuhS6dQQVdYG4UDaJ2vkz+u1DIEGQ=
X-Received: by 2002:a5d:588b:0:b0:461:a16c:d88d with SMTP id ffacd0b85a97d-46dc0efe59dmr4105756f8f.26.1782393947959;
        Thu, 25 Jun 2026 06:25:47 -0700 (PDT)
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1b754471sm15481255f8f.0.2026.06.25.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:25:47 -0700 (PDT)
From: Awais B <awais.belal@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Awais B <awais.belal@gmail.com>
Subject: [scarthgap][PATCH v2] cve-update-nvd2-native: allow setting resultsPerPage
Date: Thu, 25 Jun 2026 18:25:34 +0500
Message-Id: <20260625132534.3979958-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239562

It is seen that during bulk updates on the NVD side the server
struggles to keep up with the default/max of 2000 entries per
page and we see a lot of incomplete read errors resulting in
proper db sync failures most of the times. Lowering the per
page value noticably increases the reliability of the process
and hence should ideally be configurable.

Signed-off-by: Awais B <awais.belal@gmail.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927..731cbb5d88 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,6 +34,10 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
+# Maximum number of CVE records per API response.
+# Lowering this value can help avoid incomplete read errors during bulk NVD updates.
+CVE_DB_RESULTS_PER_PAGE ?= ""
+
 CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
@@ -217,6 +221,15 @@ def update_db_file(db_tmp_file, d, database_time):
         api_key = d.getVar("NVDCVE_API_KEY") or None
         attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
+        results_per_page = d.getVar("CVE_DB_RESULTS_PER_PAGE")
+        RESULTS_PER_PAGE_MAX = 2000 # imposed by NVD
+        if results_per_page:
+            results_per_page = int(results_per_page)
+            if results_per_page > RESULTS_PER_PAGE_MAX:
+                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d, capping" % RESULTS_PER_PAGE_MAX)
+                results_per_page = RESULTS_PER_PAGE_MAX
+            req_args['resultsPerPage'] = results_per_page
+
         # Recommended by NVD
         wait_time = 6
         if api_key:
-- 
2.34.1


