Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996E1C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8841.1699358492878940295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OuYK5RKt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40806e4106dso34134265e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 04:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699358491; x=1699963291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTmCE8AoQCe6Yj/4vtdwzmDZhz3xWfvMP65WylQsJO0=;
        b=OuYK5RKtYowKSkj0ffBlnGtOiWAZ3GueqqzwNXqYN9e7rwBcURPwhtMnBM+hZeowif
         z4ZjPsUQBzjEjhTJ8euBKqgQ47pTKZgPgwSyBofWrEZ7+VIDICYiBHfz/vBjxkk1o60W
         frcmAWeyJSaePk+cvSZM+6IochlUqAi0KB8Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699358491; x=1699963291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTmCE8AoQCe6Yj/4vtdwzmDZhz3xWfvMP65WylQsJO0=;
        b=wgHS+pMTLQ8ifpE+2piljJJTDkSdrAwhjU+6g3Yq0x+H2qGfCnLlf2aAD7ykMTUaub
         xUh/IftomUFSfDaih7RC2mC/+bNLUwLji4n0g4f080/sFbEXeEDESNV0JnSOhTS8uU1i
         NWAnzOr1MbvDjDnt+aqoLDfAglSSGMB2nYNQgBfAQfhh9Q640zN6Gwzkq9mNfn+sGCur
         1//1qz09NhnucAVIISeupE2lglc69urSDxlEAFKrj4L+sq5RcZEY5iLOA9WzyS4QScLu
         59bfGKqQiyiftIRV7z1mCaW927vnuLhxMyX01lfhO2S0C7/6P6q4EQp//KoR2R/JHtuS
         P8bA==
X-Gm-Message-State: AOJu0Ywk1OXd6hMRxfPb0CSnlkjRr4YSa4WV2TIIrOyJSKkzw1cqT/XZ
	HwQVwu7PedieP51DiNkPYdsrTv4emEhBdAGU1Zk=
X-Google-Smtp-Source: AGHT+IGLEwi5vpTW+q/t1CgCB/H2xPQZQrG9GjTy8jcRypStZCXTyNZlwYlYvn5f5wPZAQyIqA35kg==
X-Received: by 2002:a05:600c:3d9a:b0:407:5de2:ea4d with SMTP id bi26-20020a05600c3d9a00b004075de2ea4dmr2909402wmb.13.1699358490770;
        Tue, 07 Nov 2023 04:01:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e4a5:26c0:cc7e:6810])
        by smtp.gmail.com with ESMTPSA id er14-20020a05600c84ce00b0040472ad9a3dsm15012410wmb.14.2023.11.07.04.01.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 04:01:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Fix intermitttent errors and improve performance
Date: Tue,  7 Nov 2023 12:01:29 +0000
Message-Id: <20231107120129.1314360-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190273

You could reproduce an error in this test with:

bitbake core-image-minimal
bitbake tzcode-native -c cleansstate
oe-selftest -r sstatetests.SStatePrintdiff.test_image_minimal_vs_base_do_configure

since tzcode-native isn't needed once tzdata is available and isn't rebuilt
by "bitbake core-image-minimal" if it is missig. tzdata is allarch so if tzdata is
built on an x86 host, a aarch64 build machine would never build tzcode-native with
this set of calls.

Add a --runall option to the initial bitbake invocation to force these things to be
created if they're missing.

This explains why some failures were occurring on the infrastructure. With that issue
fixed, drop the hash mode change since I believe this fixes that issue. That
restriction was hurting performance, this should allow sstate reuse for the test
and improve the speed of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index a6865a5ba7b..24c96ace08c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -776,16 +776,15 @@ addtask tmptask2 before do_tmptask1
                 self.assertEqual(recursecb_count,1)
 
 class SStatePrintdiff(SStateBase):
-    # FIXME: OEBasicHash setting is necessary for now as otherwise the following error can occur:
-    # ERROR: Can't find a task we're supposed to have written out? (hash: e79d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?
-    # The underlying issue should be investigated and addressed.
     def run_test_printdiff_changerecipe(self, target, change_recipe, change_bbtask, change_content, expected_sametmp_output, expected_difftmp_output):
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
-BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
-        bitbake(target)
+        # Use runall do_build to ensure any indirect sstate is created, e.g. tzcode-native on both x86 and
+        # aarch64 hosts since only allarch target recipes depend upon it and it may not be built otherwise.
+        # A bitbake -c cleansstate tzcode-native would cause some of these tests to error for example.
+        bitbake("--runall build {}".format(target))
         bitbake("-S none {}".format(target))
         bitbake(change_bbtask)
         self.write_recipeinc(change_recipe, change_content)
@@ -793,7 +792,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
-BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
         result_difftmp = bitbake("-S printdiff {}".format(target))
@@ -807,17 +805,15 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
     def run_test_printdiff_changeconfig(self, target, change_content, expected_sametmp_output, expected_difftmp_output):
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
-BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
-        bitbake(target)
+        bitbake("--runall build {}".format(target))
         bitbake("-S none {}".format(target))
         self.append_config(change_content)
         result_sametmp = bitbake("-S printdiff {}".format(target))
 
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
-BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.append_config(change_content)
         self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
-- 
2.39.2


