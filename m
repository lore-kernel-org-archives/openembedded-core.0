Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9DFC47DDA
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:54:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1312.1700006035300774525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=hhqw4NEd;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40839807e82so1805715e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700006033; x=1700610833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4E7dkA+mnVDd996zvmU2T2FXm4xQAx7Py2692+xqzfs=;
        b=hhqw4NEdddOygLVvvZD1se1DI5Ea/fcvxk2nWW6aW9Lokk/HSEwE24VWl/hGmupQ7c
         MXAZN4403xBG1VJwy1W4bex3R+GtG6dn/7OY5FNOpyreG5qs+cU+7+PbBj9O9pQ9pM/s
         Zn1dVy10vInDJbXElnnFYXOYgNWSH8u/HMwkPc2kQ6oUtlAF1Wv5qMoPkE2QOo+eOiCU
         abbb1jXhKHv02z8dScowVIIzYVS1bwEGeYTy61XAw8h5pzdcvM4WhdsBhsZvi9JvIwov
         3RNqB65kOco/MbkClJbioq0cz5u/l3R6BN2IdSsMxtrmThSKvVcJ5hWp7hlhuzOADdDZ
         Ih4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006033; x=1700610833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E7dkA+mnVDd996zvmU2T2FXm4xQAx7Py2692+xqzfs=;
        b=E9nyn7PaOmFCbC/i4i7mHbcsUusCjz+VjLDy/zuOOwAfunVi04GASLWv36XAmIA4TB
         K8dguNJtPdFMqvCxP+Ye2OzDHuV2fSaem7eZvhn9xsHs2vfjMztcdUoi4UCa+aPZe/Lb
         JiARLZNpv3ttcb2CrB15WBIYM4WbAt7wm9uMOLbz6OB6mEuiMfBQ8EszmFcuwFB7Qs72
         7L2VdgqBtwW0wv88RNALACLFDqc7Ognlqajb+lCVLolxnjpGiE/lkjgWgMUru/QfjJ0h
         ZHMfGjXlm5rQ9CLRxBMNxqckVrK06997vufYYFc1/9Yql7JJBlBjOafQd3ctxVdQr11I
         ezGg==
X-Gm-Message-State: AOJu0YwIHX96DxzzC4nri+j7/b6rH2iEwYe99R/3J3llDtlCptdAOquV
	1i0NsZswhRtnNCA8WaO8G8AG5X0tToYZWbHJ14I=
X-Google-Smtp-Source: AGHT+IFtEVlhe689E0LAZWcxBohoTrurxpL8yofsNF37R2X8F/A32hYolkTvazbNZ+V9LMsADeePJw==
X-Received: by 2002:a05:600c:1c89:b0:405:358c:ba74 with SMTP id k9-20020a05600c1c8900b00405358cba74mr3864187wms.0.1700006032733;
        Tue, 14 Nov 2023 15:53:52 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c469100b004064e3b94afsm19054193wmo.4.2023.11.14.15.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:53:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] selftest/reproducible: Allow packages exclusion via config
Date: Wed, 15 Nov 2023 00:53:32 +0100
Message-Id: <20231114235332.112208-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 23:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190526

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES can be used to prevent known
not-reproducible packages to make the reproducible test fail.

For example, in local.conf:
  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES = "example-not-reproducible"

To quote the original exclusion commit (4864764667097b32a3ee1935e2c52df732d55632)
> selftest/reproducible: add an exclusion list for items that are not yet reproducible
> [...]
> Non-reproducible excluded packages are not given to diffoscope and do not cause a
> failure, but still saved side-by-side with non-reproducible failing ones to make
> investigation easier.

NB: Patch was written by Richard with small fixes and a commit message
from Yoann.
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 84c6c3a05f..dac0dce346 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -45,13 +45,14 @@ class CompareResult(object):
         return (self.status, self.test) < (other.status, other.test)
 
 class PackageCompareResults(object):
-    def __init__(self):
+    def __init__(self, exclusions):
         self.total = []
         self.missing = []
         self.different = []
         self.different_excluded = []
         self.same = []
         self.active_exclusions = set()
+        exclude_packages.extend((exclusions or "").split())
 
     def add_result(self, r):
         self.total.append(r)
@@ -153,7 +154,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE', 'OEQA_REPRODUCIBLE_TEST_PACKAGE', 'OEQA_REPRODUCIBLE_TEST_TARGET', 'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE', 'OEQA_REPRODUCIBLE_TEST_PACKAGE', 'OEQA_REPRODUCIBLE_TEST_TARGET', 'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS', 'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
@@ -175,7 +176,7 @@ class ReproducibleTests(OESelftestTestCase):
         self.extraresults['reproducible.rawlogs']['log'] += msg
 
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
-        result = PackageCompareResults()
+        result = PackageCompareResults(self.oeqa_reproducible_excluded_packages)
 
         old_cwd = os.getcwd()
         try:
-- 
2.30.2


