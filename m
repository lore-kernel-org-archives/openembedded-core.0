Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A59E7D0B7
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 22:37:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9340.1695335831556810968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 15:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SBVktoh8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40531812168so14100785e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695335830; x=1695940630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7sg/PZTmHlJ7vXEkIzDZFb15Us4cTXxzssYs4FHLRg=;
        b=SBVktoh8+B1PJ59lz/61NAo8GJv+27BESCuPD8Tv4v2dEb3kPHt+Kj4YOe6jpiqflz
         T1LfJtUdFoxOhO12rL5o8DXL54blWRkGlbZZpv2XGKzfTIJn1PCuL+BfWM0nNKIlhq79
         E+uEb/jLw5qinO9wbh/JmsErBAOk7k4ekzgKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695335830; x=1695940630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7sg/PZTmHlJ7vXEkIzDZFb15Us4cTXxzssYs4FHLRg=;
        b=YIDXff0OeW7kqhh4dOhXe7os3qiFJsDnyeuHN06SXyiWaIwdaiZekUQKGeKU/s+jge
         PxHBkslqltzrpwL1SCNK/dY/vzS5GF0tt0Qgz/bXW44dUTBF+Hh8MOepYRSO2wVv/Xfh
         bQuWJj3l+UGOFZWt1Sa3lHLMDcqH87c/hGYoVkKFBMG2iSoywR2puZfSCrMzouINdAb3
         Aa3iLut61dSnp3aqMwLgzT4Y+7R6lrpVRtJm1fTOxsd8BUbBP9Uwjci3a+4OJmPkC66H
         egp1nOrdJJiuTDDO1e0SN1mQKTd42+XydhQ2ltGqJRE3K0oRML/xp8dc/qrM21OvJnBy
         cO0Q==
X-Gm-Message-State: AOJu0Yw/+FH1o3Q5JhTvBGs7SyQj370fE4wuYLOxK2zXYTn4HqWOWTtN
	jq0LkyHfVHr/oOIK98TBbNZmYwoARBrUlekHoWk=
X-Google-Smtp-Source: AGHT+IH3bbtAqRu5qA+F6hv8cjwdFffYcv9ezuY0m+eOtRhVuqcL0j2nG962boz7o4h79iQQZ4y6xQ==
X-Received: by 2002:a7b:ca5a:0:b0:401:b53e:6c57 with SMTP id m26-20020a7bca5a000000b00401b53e6c57mr6644038wml.9.1695335829854;
        Thu, 21 Sep 2023 15:37:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c05cb00b003fc06169ab3sm947410wmd.20.2023.09.21.15.37.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 15:37:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] oeqa/selftest/reproducible: Avoid oe-selftest startup delays
Date: Thu, 21 Sep 2023 23:37:05 +0100
Message-Id: <20230921223708.1333390-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
References: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188030

Currently the bb_get_var calls trigger multiple "bitbake -e" executions
which slow the start of oe-selftest for any test. Rework the code to avoid
these delays.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 27 +++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 4c6ed4e4a50..84c6c3a05ff 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -128,23 +128,17 @@ class DiffoscopeTests(OESelftestTestCase):
 class ReproducibleTests(OESelftestTestCase):
     # Test the reproducibility of whatever is built between sstate_targets and targets
 
-    package_classes = get_bb_var("OEQA_REPRODUCIBLE_TEST_PACKAGE")
-    if package_classes:
-        package_classes = package_classes.split()
-    else:
-        package_classes = ['deb', 'ipk', 'rpm']
+    package_classes = ['deb', 'ipk', 'rpm']
 
     # Maximum report size, in bytes
     max_report_size = 250 * 1024 * 1024
 
     # targets are the things we want to test the reproducibility of
-    targets = get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
-    if targets:
-        targets = targets.split()
-    else:
-        targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
-    sstate_targets = (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS") or "").split()
+    sstate_targets = []
+
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
@@ -159,11 +153,20 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE', 'OEQA_REPRODUCIBLE_TEST_PACKAGE', 'OEQA_REPRODUCIBLE_TEST_TARGET', 'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
 
+        if bb_vars['OEQA_REPRODUCIBLE_TEST_PACKAGE']:
+            self.package_classes = bb_vars['OEQA_REPRODUCIBLE_TEST_PACKAGE'].split()
+
+        if bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET']:
+            self.targets = bb_vars['OEQA_REPRODUCIBLE_TEST_TARGET'].split()
+
+        if bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS']:
+            self.sstate_targets = bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS'].split()
+
         self.extraresults = {}
         self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
-- 
2.39.2


