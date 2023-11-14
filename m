Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49046C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:32:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.752.1700004743881674953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gAch2uUP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32d9d8284abso3956267f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700004742; x=1700609542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b71u8uuHx0rCS9hKNn9uxq9TthhXjfcYg5w89Im2Jkk=;
        b=gAch2uUPCCT8DWdgEHNelDkd5cd1l6IS+KLBV0AyaDjr+ajEcNSwrc3QLrdlk3ARc4
         A5SXpC3CKOPNYwvXuJ7/EVdCzTOKGQYVKDetrn/Kttq626qf1vyiohlEC5zxFVqu3Sr1
         JT8DAzc3XZzCvAN+e6G1/vshE6R67ndiLATos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700004742; x=1700609542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b71u8uuHx0rCS9hKNn9uxq9TthhXjfcYg5w89Im2Jkk=;
        b=CDT2nrz/mcDQl7AgECfpQj/5c/627lm71u9yTxy/h0Du90DfIbkEQVfmzQsWFs5A6a
         ZIZr4bdy58Sy0gHxXXmFjZC8gMelW0lNIzMPShuxLPxhjgK7Tv7BfGHfAzQnpenBseDl
         LFTFbqfXnYtLeBr0L/eoiq0lAmtBgi0iP4JVj62+/DVmFcZdKaUagIyU4N2fRnzvyQ4a
         4u7ezWwZBDXVyA3M1icW1UCDXDBzol2Wdkq5Re1G54+WgfeS0GolS/Px1+k6Zh6sOxUo
         Vm56IydCQ/4Fy7JARqjC4XRdA8/7gLBa3pL9oky1xpqWg4hRicn8haDyJtTmMpY/aqQA
         DRHQ==
X-Gm-Message-State: AOJu0YxX/yakZ3RT267VqooFl08/PU3G1CpSSwtf2lBPA05jmhzcNXkr
	8kuaWfcj28nDIbSnFjLm+b3y1TJ96+EMdc0sta8=
X-Google-Smtp-Source: AGHT+IFhGbU32GP2MRPaNA0Ozh1/FUfzI00NDI4Li4MOeG4b85oiPmfY6mlsmwM8pB85JXHcx8jfwA==
X-Received: by 2002:adf:b31c:0:b0:32f:a5b1:47e8 with SMTP id j28-20020adfb31c000000b0032fa5b147e8mr5641044wrd.27.1700004741889;
        Tue, 14 Nov 2023 15:32:21 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm8836638wrq.14.2023.11.14.15.32.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:32:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/reproducible: Add OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES support
Date: Tue, 14 Nov 2023 23:32:19 +0000
Message-Id: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 23:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190523

Add a new variable to the reproducible test so the list of excluded
packages can be extended from the metadata. This might be useful for
meta-openembedded for example so known issues can be excluded and
therefore new regressions become more visible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 84c6c3a05ff..dac0dce3467 100644
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
2.39.2


