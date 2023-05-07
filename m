Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBEEC77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 05:44:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.60808.1683438282565758231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 22:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=H7OqeYVT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f195b164c4so21653285e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683438280; x=1686030280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoQrLf0kfHF6b/76yKR9iHK+8Djd2Lr8Qhhx7DGSZ8g=;
        b=H7OqeYVTn8Myp1UZWjrAG0fwPxC965vhIOAmNWZDb3SwhOyeZe3CSISCwlAIqGdP4t
         BKK/OOpJmWn5x82CZwjdbiBLJD4AzLEVjenZqBACFpYYYpMSyBbIP1frP/7tmUVBCVzS
         SF2vXR5aY0GkhgP4SPlYPgXfTXWaf0X4n0dhzBuil110D7eETGDE0SaF8KX7tdH0nPwt
         cpaKhhBgAKDU+KOLSJ13pL1x93Os44pL38SlitkuhiD364f0qNj/bEyXI+AsKiXDPN+R
         94bBJyGf+BILwzrtwH/R/l5B+Tiz9D8GGWecVjSLtvwh0cBwScg6QJw//+RLnJ1glQmk
         cHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683438280; x=1686030280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoQrLf0kfHF6b/76yKR9iHK+8Djd2Lr8Qhhx7DGSZ8g=;
        b=JR6y7Zcg8a4f+2PcifwwWfDM8RWozA9P4I20o55DH5rSAj8BuzbUIgdU+J/kFQBLsU
         hvPhbwwsD9kfQ/C4MeHhDW02BPYtr4EnvebFfxwA67+IcpEZJm1fOko0EGqA2t/yPN5v
         b47FzTC7Lhd0sRm/EBVdrlBxoH9lBx6+GWbyKZ13ohfhQiRnvJ7NDom4Y3Mw6lrBexNz
         7uVWXGnuVbu0JfyBo6thiaJEUkrfjRuBRanrBze3WweFCkxsJy+vwDjDz+wQEvKEQfcd
         h913C9y3FyLC3Pdg3jUEHGiB0s3SuuytdO5kSNclIeS9sZ0w3SdrF6QiU+wu+ughNc83
         AOqA==
X-Gm-Message-State: AC+VfDyraCmLwOdzycmeoX0cor9y6iMJy7L4cfYjdL/zZiwxlZQRNZQf
	wvwxxAR95bjK6YTfBluyEWNBjMreYwE=
X-Google-Smtp-Source: ACHHUZ6bY1EQTRiZ4Tq03VqpS3JTAh9AOcDQtBegO2UiTBtxu1y7vl00IzyRON4gT9HydKAMkly6kg==
X-Received: by 2002:a5d:6981:0:b0:306:43bc:806f with SMTP id g1-20020a5d6981000000b0030643bc806fmr4278917wru.24.1683438279868;
        Sat, 06 May 2023 22:44:39 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:8bee:b36:7b19:3ac5])
        by smtp.gmail.com with ESMTPSA id y11-20020adff14b000000b0030497b3224bsm7258115wro.64.2023.05.06.22.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 22:44:39 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] ptest-cargo.bbclass: add the possibility to define test arguments
Date: Sun,  7 May 2023 07:44:35 +0200
Message-Id: <20230507054435.1689878-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 05:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181000

From: Frederic Martinsons <frederic.martinsons@gmail.com>

It can be useful for user of this class for giving common rust test
arguments (like --shuffle, --format or --test-threads)

To add arguments to test binary , simply define RUST_TEST_ARGS
in your recipe that inherit ptest-cargo, for example:

RUST_TEST_ARGS = "--shuffle"

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index f28bc7a826..4ed528445a 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -1,5 +1,8 @@
 inherit cargo ptest
 
+RUST_TEST_ARGS ??= ""
+RUST_TEST_ARGS[doc] = "Arguments to give to the test binaries (e.g. --shuffle)"
+
 # I didn't find a cleaner way to share data between compile and install tasks
 CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
 
@@ -74,6 +77,7 @@ python do_install_ptest_cargo() {
     pn = d.getVar("PN", True)
     ptest_path = d.getVar("PTEST_PATH", True)
     cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+    rust_test_args = d.getVar('RUST_TEST_ARGS') or ""
 
     ptest_dir = os.path.join(dest_dir, ptest_path.lstrip('/'))
     os.makedirs(ptest_dir, exist_ok=True)
@@ -94,12 +98,12 @@ python do_install_ptest_cargo() {
             f.write(f"\necho \"\"\n")
             f.write(f"echo \"## starting to run rust tests ##\"\n")
             for test_path in test_paths:
-                f.write(f"{test_path}\n")
+                f.write(f"{test_path} {rust_test_args}\n")
     else:
         with open(ptest_script, "a") as f:
             f.write("#!/bin/sh\n")
             for test_path in test_paths:
-                f.write(f"{test_path}\n")
+                f.write(f"{test_path} {rust_test_args}\n")
         os.chmod(ptest_script, 0o755)
 
     # this is chown -R root:root ${D}${PTEST_PATH}
-- 
2.34.1


