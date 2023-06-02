Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC46C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 17:02:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.1010.1685725372223499942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 10:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QUi3hS4M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307d20548adso2179146f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685725370; x=1688317370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Mf4q2MybqHWo96CHz06WIOQ2CUBOyAdU0K3f0Y2TU=;
        b=QUi3hS4MsbyJzHpPXfN3scg9czQyYl1AO9ziPWQqOTHThglG65MEXgzcLpdr/anChp
         GYHuBjzxAskMH3VVlyT270Mevw2+M5EhzZc5SBDP0DLdMDsz3Y6zVerOyKtjZCDwqTLB
         jRGbhPVlWUx95hlvbSyrwjBT3+z7xxCEhNWb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685725370; x=1688317370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Mf4q2MybqHWo96CHz06WIOQ2CUBOyAdU0K3f0Y2TU=;
        b=FGdrFAbdHV9Uv0LBFdVZHiYJpKkEw0kFhWaxfM+zdPiJXjEqFj1PLyKBPmPW7oBnrm
         AbzJqagVVXp32wIggkxkxRhCdKoV+SO1EBB+1er1qhAf1rs8IfyJp5WyCin3fpjsC0Xk
         XC5cHYZca4iz9lX2XvLPjPICUht7y+cjGDi7LoJrpXeBtYSUuvNHzf3InqlL4IuJ2gvx
         VYViJ6xIDm64Kwmyro++EDwXu1bv6wqxl4M8wDwqkhaKRqV5rYEk0y941HyEe+GG1Pko
         TOfO3NgRHydyIfqDdn5gKBohNkfu9nUTAsKJ8CFAIU+ezUtkgcYoo8YaDu9GtQjoMj2q
         c23w==
X-Gm-Message-State: AC+VfDzl4YwDulyVc2RuvAMbwlGqeLSkKIxOaSthTsM1imA8CULixrZz
	06YYMRaVoeoQg5ApwHDf4naDZrrGI8TM6slIcB4=
X-Google-Smtp-Source: ACHHUZ5g+lC+uw8V02FDZJ+P8lY6+a0KDEQHGHwwWJA6xDRluU70Kw1mcT68slgYnQnTx4K2jcmleQ==
X-Received: by 2002:adf:dc01:0:b0:30a:ee20:249a with SMTP id t1-20020adfdc01000000b0030aee20249amr458271wri.6.1685725370202;
        Fri, 02 Jun 2023 10:02:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b0030ae973c2e7sm2192521wrx.83.2023.06.02.10.02.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 10:02:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/wic: Fix host contamination issue
Date: Fri,  2 Jun 2023 18:02:48 +0100
Message-Id: <20230602170248.258343-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 17:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182336

If wic.Wic2.test_gpt_partition_name is run on a system without sfdisk, the test
will currently fail. As done in another test, it needs to use sfdisk from the
wic-tools sysroot. This patch fixes that host contamination issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d4793437735..a3c6deb5aa3 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1359,17 +1359,19 @@ class Wic2(WicTestCase):
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
         image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
 
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
         # Image is created
         self.assertTrue(os.path.exists(image_path), "image file %s doesn't exist" % image_path)
 
         # Check the names of the three partitions
         # as listed in test_gpt_partition_name.wks
-        result = runCmd("sfdisk --part-label %s 1" % image_path)
+        result = runCmd("%s/usr/sbin/sfdisk --part-label %s 1" % (sysroot, image_path))
         self.assertEqual('boot-A', result.output)
-        result = runCmd("sfdisk --part-label %s 2" % image_path)
+        result = runCmd("%s/usr/sbin/sfdisk --part-label %s 2" % (sysroot, image_path))
         self.assertEqual('root-A', result.output)
         # When the --part-name is not defined, the partition name is equal to the --label
-        result = runCmd("sfdisk --part-label %s 3" % image_path)
+        result = runCmd("%s/usr/sbin/sfdisk --part-label %s 3" % (sysroot, image_path))
         self.assertEqual('ext-space', result.output)
 
 class ModifyTests(WicTestCase):
-- 
2.39.2


