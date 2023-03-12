Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B510C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:02:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.66804.1678629768994691000
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h6v8t2nP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso3120273wms.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678629767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fdkJL2hQeuCq2BPaEHpSYuX6jViQ3zqYLLriaFSD/Y=;
        b=h6v8t2nPSAhL8hQHkWffAqCHwQBZuUOmZAERr9usT0M6wpwJqHjQLZ9Aol/hod4hFE
         dE+hPLXSY7yeJoYnejHbtyMamg5EmaFy6wr639Yky2JoJY4abGc32VoAiPA2wu8bYioy
         uLc/NjnGeJvVAVMcA776AIaf+UZ1/eVa2wVsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678629767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fdkJL2hQeuCq2BPaEHpSYuX6jViQ3zqYLLriaFSD/Y=;
        b=Y/RN32UZW3EVkUNt7itaFtdQccbMlQKhJuMylk2n208RLdSL4PA7EPuMO7sBCdxX8j
         KE70PosFq73nrTbdH/aNjRTO01UZgtFKluSqnWFGNrbUCsbXMMFzq7jf1/MGLO8TJkXd
         /5vcatHD+2hC20ydqxWYjJptt6M4GWQpEVDljw1puoLby/mEsmHi+SG1qKWZJbWxBO16
         SfES2R61b8XgjcGIMJrxE6/1zC/Qlf4Zn8nI/vbdQS50rnw9x41suj+G0WaX+3xR/B5E
         mfLsO+bIi1H8wanCNPeKwb/xvTfEKSXOtMdpz/4yMn/xPf894sjR2bTFWtCsESpw9U1w
         q/Ww==
X-Gm-Message-State: AO0yUKWFTK1uUAyaJ9akaY+MeYrGAS70eDieQJRtI0zcLW8rZ4JHxSu/
	Cbf/YyF3yglPdepVFcxq4hhifAzHj6FG6RcLxn0=
X-Google-Smtp-Source: AK7set92kkD/1ykUgDRt+kyPm8J7PPo3ED4jwKSILU2w1dsGn4xHcMn+DI5zZqRr7DQe/p2STLjtBA==
X-Received: by 2002:a05:600c:458e:b0:3eb:37ce:4c3d with SMTP id r14-20020a05600c458e00b003eb37ce4c3dmr7848938wmo.38.1678629767356;
        Sun, 12 Mar 2023 07:02:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ee:6264:1be3:a6af])
        by smtp.gmail.com with ESMTPSA id t21-20020a7bc3d5000000b003ed2384566fsm1312089wmj.21.2023.03.12.07.02.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:02:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/selftest/sstate: Split classes to allow more parallelism
Date: Sun, 12 Mar 2023 14:02:44 +0000
Message-Id: <20230312140244.3565436-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230312140244.3565436-1-richard.purdie@linuxfoundation.org>
References: <20230312140244.3565436-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178390

By splitting the single class into multiple classes, it allows more parallelism
in the execution. These tests don't have interdependencies that benefit
from sstate reuse or anything like that so this makes sense to improve overall
test execution time if/where possible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index aedc35c2626..e978313c61f 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -217,6 +217,7 @@ class SStateTests(SStateBase):
         result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
         bitbake("dbus-wait-test -c unpack")
 
+class SStateCreation(SStateBase):
     def test_sstate_creation_distro_specific_pass(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
@@ -229,6 +230,7 @@ class SStateTests(SStateBase):
     def test_sstate_creation_distro_nonspecific_fail(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
+class SStateCleanup(SStateBase):
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
@@ -242,7 +244,7 @@ class SStateTests(SStateBase):
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-
+class SStateDistroTests(SStateBase):
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
 
@@ -252,7 +254,7 @@ class SStateTests(SStateBase):
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
-
+class SStateCacheManagement(SStateBase):
     # Test the sstate-cache-management script. Each element in the global_config list is used with the corresponding element in the target_config list
     # global_config elements are expected to not generate any sstate files that would be removed by sstate-cache-management.sh (such as changing the value of MACHINE)
     def run_test_sstate_cache_management_script(self, target, global_config=[''], target_config=[''], ignore_patterns=[]):
@@ -331,6 +333,7 @@ class SStateTests(SStateBase):
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
+class SStateHashSameSigs(SStateBase):
     def test_sstate_32_64_same_hash(self):
         """
         The sstate checksums for both native and target should not vary whether
@@ -416,6 +419,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
+class SStateHashSameSigs2(SStateBase):
     def test_sstate_allarch_samesigs(self):
         """
         The sstate checksums of allarch packages should be independent of whichever
@@ -464,7 +468,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_common_samesigs(configA, configB)
 
-
+class SStateHashSameSigs3(SStateBase):
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the
@@ -552,7 +556,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-
+class SStateHashSameSigs4(SStateBase):
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
-- 
2.38.1


