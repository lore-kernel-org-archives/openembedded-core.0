Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC8AC43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:38:05 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.55902.1656423482889735410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IOljgftt;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ay16so25851004ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S5bmxcvt7Rv1TtCoDf/5JtZI7HmGZZDk20//LP+OpaM=;
        b=IOljgfttC7JYdNjsIPyaTgX2aOo7TQV3qh6udmoK8lH0ykQHG0TRqnLoE+D/AepzQw
         uvoF+KG5Fq5LdIjnlSZJTtB7WZOT7GnxOcmGH7T810PFjtZiqD4R1FxrBLsIDRMSHfFo
         ri2BXn1iKJSOFcIlHGvH4vnXVzzO3ABk/XZ3y748S27DTkScKB6pJO3CYsTnnZOc3+Ln
         8epZ+tHkTQmV488mZs6lsC+gnYMqwjx112RfZ708z+T0XDZiTiYUSKHz7TvZxVTj6h97
         oP9eTc+1G4zoBBEU8c79Aoszrtb+5oEEoKWhcFnsvBAR8HWoCdtPZ3cND4QwSM9RYFTY
         dKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S5bmxcvt7Rv1TtCoDf/5JtZI7HmGZZDk20//LP+OpaM=;
        b=C1Tq4P8MdlrdsW/ur8U3lxeJFUZ8t9+eQbuaqWlHxlHd9FZqU3lRDX5ALkLaBtmsSN
         TIOOYRmvaPmpsLBpoIARdxbH8I3IS9QkfMMdBujhVnHdcuQS5V3vfSzKBC1uklEfGY/M
         2cFPSi7hP4ivsxx4MwOeZgtL6pMfHg4EG/GNYWkdlZi34iA4rF7PiaiDaM+OB0Or/RNs
         TagxuYUEQrBqHECKfG3/CWAOAXoMIEL0bPAUqXORFvOwSTWUz9rt5+q2OTgY8G9ei3yh
         5RQuGuGdnMGpUU0ewsvD5FeSoocpfN3phS8TD1zvEoQizUKwumR8XDMilM57tlPEJ8Os
         Igtg==
X-Gm-Message-State: AJIora89eRAK2Z3gKVmAr1Zh6XVtps6/9YZkbWGsT7og9RKL6t78kScj
	qef+OjxGcmCoBhXuDWCQiY1DxaQZtXQ=
X-Google-Smtp-Source: 
 AGRyM1sNOHOinNoD2qom9C+93DbWu+LxmWYVLkt9HnrNwA0Ib3As1gN/T/Hvx3ZyAMKpsiMZwI3A/g==
X-Received: by 2002:a17:906:5344:b0:712:3c7e:cf58 with SMTP id
 j4-20020a170906534400b007123c7ecf58mr18467947ejo.679.1656423480931;
        Tue, 28 Jun 2022 06:38:00 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm6451853ejp.64.2022.06.28.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:38:00 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH 5/5] selftest/cve_check: update to new
 cve-check bb var
Date: Tue, 28 Jun 2022 15:37:13 +0200
Message-Id: <20220628133713.3390786-5-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628133713.3390786-1-davide.gardenal@huawei.com>
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167343

After cve-check.bbclass refactor some variables changed,
this commit updates them to get the test working properly.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 34 ++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index d0b2213703..a06bda019f 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -52,12 +52,14 @@ class CVECheck(OESelftestTestCase):
         config = """
 INHERIT += "cve-check"
 CVE_CHECK_FORMAT_JSON = "1"
+CVE_CHECK_CREATE_BUILD_REPORT = "1"
+CVE_CHECK_CREATE_RECIPE_REPORTS = "1"
 """
         self.write_config(config)
 
-        vars = get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        summary_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-native_cve.json")
+        vars = get_bb_vars(["CVE_CHECK_OUTPUT_DIR", "CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"])
+        summary_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], str(vars["CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"]) + ".json")
+        recipe_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], "recipes_reports/json/m4-native.json")
 
         try:
             os.remove(summary_json)
@@ -88,11 +90,13 @@ CVE_CHECK_FORMAT_JSON = "1"
         config = """
 INHERIT += "cve-check"
 CVE_CHECK_FORMAT_JSON = "1"
+CVE_CHECK_CREATE_IMAGE_REPORT = "1"
+CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE = "cve-report_core-image-minimal-initramfs-qemux86-64"
 """
         self.write_config(config)
 
-        vars = get_bb_vars(["CVE_CHECK_DIR", "CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        report_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
+        vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE", "CVE_CHECK_OUTPUT_DIR"])
+        report_json = os.path.join(vars["DEPLOY_DIR_IMAGE"], str(vars["CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE"]) + ".json")
         print(report_json)
         try:
             os.remove(report_json)
@@ -108,9 +112,9 @@ CVE_CHECK_FORMAT_JSON = "1"
         self.assertEqual(report["version"], "1")
         self.assertGreater(len(report["package"]), 1)
 
-        # Check that a random recipe wrote a recipe report to deploy/cve/
+        # Check that a random recipe wrote a recipe report to log/cve/recipes-reports/json
         recipename = report["package"][0]["name"]
-        recipe_report = os.path.join(vars["CVE_CHECK_DIR"], recipename + "_cve.json")
+        recipe_report = os.path.join(str(vars["CVE_CHECK_OUTPUT_DIR"]), "recipes_reports/json/" + recipename + ".json")
         self.assertExists(recipe_report)
         with open(recipe_report) as f:
             report = json.load(f)
@@ -124,12 +128,14 @@ CVE_CHECK_FORMAT_JSON = "1"
 INHERIT += "cve-check"
 CVE_CHECK_FORMAT_JSON = "1"
 CVE_CHECK_REPORT_PATCHED = "0"
+CVE_CHECK_CREATE_BUILD_REPORT = "1"
+CVE_CHECK_CREATE_RECIPE_REPORTS = "1"
 """
         self.write_config(config)
 
-        vars = get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        summary_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-native_cve.json")
+        vars = get_bb_vars(["CVE_CHECK_OUTPUT_DIR", "CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"])
+        summary_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], str(vars["CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"]) + ".json")
+        recipe_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], "recipes_reports/json/m4-native.json")
 
         try:
             os.remove(summary_json)
@@ -160,12 +166,14 @@ CVE_CHECK_REPORT_PATCHED = "0"
 INHERIT += "cve-check"
 CVE_CHECK_FORMAT_JSON = "1"
 CVE_CHECK_REPORT_PATCHED = "1"
+CVE_CHECK_CREATE_BUILD_REPORT = "1"
+CVE_CHECK_CREATE_RECIPE_REPORTS = "1"
 """
         self.write_config(config)
 
-        vars = get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        summary_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json = os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "logrotate_cve.json")
+        vars = get_bb_vars(["CVE_CHECK_OUTPUT_DIR", "CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"])
+        summary_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], str(vars["CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE"]) + ".json")
+        recipe_json = os.path.join(vars["CVE_CHECK_OUTPUT_DIR"], "recipes_reports/json/logrotate.json")
 
         try:
             os.remove(summary_json)
-- 
2.34.1


