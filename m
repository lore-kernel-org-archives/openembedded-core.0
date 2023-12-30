Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD041C46CD4
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 00:36:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.170556.1703896563790805404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 16:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h1Bp5wLH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so6794504f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703896562; x=1704501362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXY+B6W5qPVO6FPO07dfBp2azUki8X6BnqxkLtzxc3c=;
        b=h1Bp5wLH/SiJ6bbOBk2hhRxXLr22nhh46NK7JrTyXsCI6ShdZ69DYqXEhQDAIuUKt6
         fBlsV5JTkNEF9aZ6JhZWuTFrxgrQBpUqW1S/ZD01N05wiTGLfrdiJeF5giq6oRfy+fjd
         zd53neECp5S5DYmSnnJMHCJjmF7jbKNiWTxLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703896562; x=1704501362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXY+B6W5qPVO6FPO07dfBp2azUki8X6BnqxkLtzxc3c=;
        b=oxrnxPHJTV3N5XgLYVrKPtUsXpdyAGiIgpoZSv+6f5O5iMQIkE7SzvF/VOZL0ABFez
         fSa2w//45odBSbIneVOX+STVTci+u0iHCndY9/StxrYHFjTd9BlHXJbaYB/VumSfBg3Q
         Vk2wRvQNmqDWH/7gR0/sfrsfQeuOq9RBT2yJS7vGB3uP3dshUR5brtQqrad4nLqevKDJ
         MosC1juBu71qDCBhIH8zIWK0u1qaivM5Y54q0rXZv3ONXWfmT2SQCcQWLD55KLMD9Wzi
         L8fNDgcrL5qUQra7FpOVcK1+LmGV2RLgZsED6JWKKtiG6agPrmAU4udx9LXOhU+g1fz6
         WDhw==
X-Gm-Message-State: AOJu0Yx1S9FILCO7JomKJtBarj3vkbMqtrYpkW5KNtC5hdwCk/UmYnSE
	kh0ots6NC2pj2Pm/anCZo8ELXAfqtF1Z3Nt7E1W/FjGvVGU=
X-Google-Smtp-Source: AGHT+IHxu0QUKenwTiz19wmdwj0a+y2z8aiA/PoK/yHgegdTimic0K6ka7BXkLQ/sNj6dDljNDWd0w==
X-Received: by 2002:a5d:4d07:0:b0:336:8657:60df with SMTP id z7-20020a5d4d07000000b00336865760dfmr6320801wrt.79.1703896561678;
        Fri, 29 Dec 2023 16:36:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a152:ea8e:7a3:4258])
        by smtp.gmail.com with ESMTPSA id m5-20020adfe945000000b003366c058509sm20228979wrn.23.2023.12.29.16.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:36:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Update sstate management script tests to python script
Date: Sat, 30 Dec 2023 00:36:00 +0000
Message-Id: <20231230003600.472835-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 00:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193064

Now we've switched to the python script, update the tests to match
that by removing the now unneeded parameter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 9a6bea553ff..340f41162f0 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -263,7 +263,7 @@ class SStateDistroTests(SStateBase):
 
 class SStateCacheManagement(SStateBase):
     # Test the sstate-cache-management script. Each element in the global_config list is used with the corresponding element in the target_config list
-    # global_config elements are expected to not generate any sstate files that would be removed by sstate-cache-management.sh (such as changing the value of MACHINE)
+    # global_config elements are expected to not generate any sstate files that would be removed by sstate-cache-management.py (such as changing the value of MACHINE)
     def run_test_sstate_cache_management_script(self, target, global_config=[''], target_config=[''], ignore_patterns=[]):
         self.assertTrue(global_config)
         self.assertTrue(target_config)
@@ -277,14 +277,10 @@ class SStateCacheManagement(SStateBase):
         # For now this only checks if random sstate tasks are handled correctly as a group.
         # In the future we should add control over what tasks we check for.
 
-        sstate_archs_list = []
         expected_remaining_sstate = []
         for idx in range(len(target_config)):
             self.append_config(global_config[idx])
             self.append_recipeinc(target, target_config[idx])
-            sstate_arch = get_bb_var('SSTATE_PKGARCH', target)
-            if not sstate_arch in sstate_archs_list:
-                sstate_archs_list.append(sstate_arch)
             if target_config[idx] == target_config[-1]:
                 target_sstate_before_build = self.search_sstate(target + r'.*?\.tar.zst$')
             bitbake("-cclean %s" % target)
@@ -296,7 +292,7 @@ class SStateCacheManagement(SStateBase):
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
 
-        runCmd("sstate-cache-management.py -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
+        runCmd("sstate-cache-management.py -y --cache-dir=%s --remove-duplicated" % (self.sstate_path))
         actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tar.zst$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
-- 
2.39.2


