Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD27C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93242.1782742841597650981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tYx6ntp3;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-463f1165e16so3449315f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742840; x=1783347640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AQbpIMm9OR6yMXXb0p7b6zR1Y+HkhkiT3qDFzDjjrR0=;
        b=tYx6ntp3ZwX6AuvlVVa4B/xzfboyeLz83G8P6F4UHEiFMwoayV9ytioEAo/PiTMzPI
         5JSriOb4E6ww8pISCD6SdXy9ioYgZdTpRKeJswPXHSWCk4Kj7tcUj1TZlHxadXSunO99
         e51oZuunm1jabx87GQRbkxbxXzAze23n0U6sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742840; x=1783347640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AQbpIMm9OR6yMXXb0p7b6zR1Y+HkhkiT3qDFzDjjrR0=;
        b=ZpIXeSo6p9B1g4Qv+fNDudCr6xSbFlMxPKGTXrrL92nzHaJO9hhjykYSByIpEuPCdL
         iV/0mYRZ1XCyGHGO972Wo9YzwlPvwYdWM8w1bwMeSspReWQ+UWKUGAPwyuyk95pyye/c
         g3C/EOv/9SDH42XzU1fe20N9vprqb7U/z6Kj4xSanR8vrzUyvOaFQ+IYjau6hlnMwzrt
         w16QvwtXuGNIV8BdZEM3E7ImpwIHk1wPF4tUn5dTuSmtuvBdwjf+wVqX7kiNA24QyClh
         QtmSYBKJMkzZPEgZRnQoiNN2kzVjmi5F5JaFIudy4d6ypazCj4wkuEEtZjlkhaMiQCWA
         5LnQ==
X-Gm-Message-State: AOJu0Yw1Ousb4JP3rNN33xHxw9vQfck2QPJkeaVcIQbVK4chmM/trdzr
	2Xj4FhPPk+zknPhrYKHvmy7uC8xa9cjlhVyfP2YHVjJY/4UpI+j9LhLcrx0n2dhwMGkK8KJ494V
	g4pQyR54=
X-Gm-Gg: AfdE7cloMoRgfheTBIZqk1zcjsYVaZlWhLcutbfBVeY/m6PDwZb8+BBCjSOksxqL8S7
	XwKHeDC38LMAftz2uZoyy8PTT5/LZPf4sx8UIAEKde5/phvtZ3b2RvY8N88NhdxaUL/FxKk9bz9
	ekKcr4nVBa0gpy9xu25/oMelV7fe7ANLyOaIY6kHUYDOOybwAon3sbOOJwBRdN0/4fkGUfOZRhP
	rawBOsBVjvHArEIV+OhqCEuws7yVzEk/HOJ6aiazbmBxn0tmcQeqUYYuqpIwTi2ZGoVG/tg+saW
	BLb8VdE5ycHwI51N4O43myp+CVvSA/Vlrm/VQZEHrFyGugK/stG2oU73HJX23Qw4uTFBdz7Dc7i
	Gq+H7jOa9S4SNdx/aCT+wlTjCjA2sgMsg38H+G+km4wLC7rdyQlhI+10b/N+CHQgecn6F/4GUbO
	RI+oWejKihDJBrEyMiAKwcO6zl8K+JqpBzQ8w9V1d1mlxqxbl+87i9JKAjyszMjgaBSSlbxjjsi
	0Qsvr9WfVg21hwpkZ2d1tNR4WRm9xGYqQ==
X-Received: by 2002:a05:6000:4687:b0:475:2171:add with SMTP id ffacd0b85a97d-47521710e40mr272091f8f.22.1782742839806;
        Mon, 29 Jun 2026 07:20:39 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/19] cve-update-nvd2-native: allow setting resultsPerPage
Date: Mon, 29 Jun 2026 16:20:01 +0200
Message-ID: <1e55fa5f3adf26d81d138947af94f6775c3902b8.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239804

From: Awais B <awais.belal@gmail.com>

It is seen that during bulk updates on the NVD side the server
struggles to keep up with the default/max of 2000 entries per
page and we see a lot of incomplete read errors resulting in
proper db sync failures most of the times. Lowering the per
page value noticably increases the reliability of the process
and hence should ideally be configurable.

Signed-off-by: Awais B <awais.belal@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927c..731cbb5d886 100644
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

