Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B712CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:12:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13149.1763395971648755854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 08:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ydLKOvHC;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso31626775e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763395970; x=1764000770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvuIh/GzumCpLYYkXGMqs5xA12hR/pH8thHq4Hj18Pc=;
        b=ydLKOvHCfBdqdrz56CmgaRod99hfmE+E2/T1qO0UswWbv7mhXAGA60MeZAY+xNd/l4
         3UYh1d9vQkve2b51WY+dxK88Jc2ZMl2Tf2l3GvTotkTEl4IEqnsMP5C6QyA3wxQrdcGm
         UqquzDMzXyq92N+jb164i9A/7uOd6tqNRt0yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395970; x=1764000770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvuIh/GzumCpLYYkXGMqs5xA12hR/pH8thHq4Hj18Pc=;
        b=rY1A3yTlzPML99zX+gy3a9dFWWzONlw0cdAo7Q2V4MYsYMhQWY+YVijnUh+FMWKiNY
         r/UdTozrsIcxhFZr24641nq/KE5ZU4VN8VPdFwGe4aChh6I9dRx1h5a8rKiSWKMOIL8J
         LYTmmF4BwkQWRQcmCB0aXy46JIfpJSo3WgP3SgzAQnD8AsEnmM7itovaF7nYVZTZNWc1
         fFgtXn3USqAANg9u9mNqoYma6nJb7ckNwOLCn/ope118RuCXf98G37IFghoeQSUEAqyR
         iuEEH9DslHeMrEbnla438nncPct3QmKJYmo9LYRUq3feJkL5h1qOOB6t+hCTHTRCwwKZ
         kVjQ==
X-Gm-Message-State: AOJu0YyHtN0RI2o6wcf4M6YVFdDVOU9kwvwc71SKOOqFqK1mXLFgRvqg
	z3lrzMhEhwJe+Tml3WjTRNNceQQmiZHwiIeQYg6SbtXhygqdFtcCVOlX0UNE/dh/B+MlY8g+P0b
	JVDtG
X-Gm-Gg: ASbGncu6NKC5bEGN139KpT/IFp3/c/ZTul1p8C1j1+AlNDmvzTD8qW3uRr4QU7soxTA
	pHQYDimIA45KHDzAtp3ScOJeOmyZGcXDAinkG6O0+jb4i3JDsZ/lTvcqhuIFCMK0AZP9CCv+7gv
	H1T+18pMe8RJ2pt/24oNSxb13bN95XQvH5wUYUCf3dGXCkWYcJnja/YNYwsC7FckOHjU9svT6Cx
	KOlbzuhRlgJqBla3P/hRGjBxt9BRjZ+DXzYu7zuysCbOmRk1Fsi383x6ZyctlCg1Gpkhm+/mL6r
	afie9S3Z3jhW1Ib2URBpTspwCkqV8YZVI1acBPs1zgyakk0+xfQWfqSUwWoYs/D22bmlRtWa0Wg
	dNmuTJSR6MmaqpXuc52hCK8fhgf7Ck37mViu7koTPWX0KR/YuLKc5WVAWAJaFF3CShgGpZmpoVH
	h2YkuYQL1FeHSoI1RJGNyZ263HpidOYqvuqgs=
X-Google-Smtp-Source: AGHT+IFld3IknOjG6jmc8OP+EOuitKjVT3WzX+jQZTjVAAQbsUBR2+ruU7icKcWeuHSj+cY+BdBYag==
X-Received: by 2002:a05:600c:8b4b:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4778fe504abmr127710815e9.17.1763395969926;
        Mon, 17 Nov 2025 08:12:49 -0800 (PST)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm26431181f8f.33.2025.11.17.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:12:49 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 2/2] oe-selftest: uboot: add test for building U-Boot initial env binary
Date: Mon, 17 Nov 2025 17:12:39 +0100
Message-Id: <20251117161239.1227164-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117161239.1227164-1-pierre-loup.gosse@smile.fr>
References: <20251117161239.1227164-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226502

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

This adds two new selftest cases `test_uboot_initial_env_binary` and
`test_uboot_config_initial_env_binary` to verify the build of the U-Boot
initial env binary with the mkimage tool.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: Ross Burton <ross.burton@arm.com>
---
changes in v2:
- add tests
---
 meta/lib/oeqa/selftest/cases/uboot.py | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 980ea327f0..e2478d3dfd 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -5,6 +5,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
+import textwrap
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars, runCmd
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
@@ -96,3 +99,52 @@ QB_DRIVE_TYPE = "/dev/vd"
             self.assertTrue("Machine model: linux,dummy-virt" in output, msg=output)
             # with KVM enabled
             self.assertTrue("KVM: hypervisor services detected" in output, msg=output)
+
+    def test_uboot_initial_env_binary(self):
+        """
+        Tests building the initial U-Boot environment in binary format with
+        the U-Boot mkimage tool.
+        We assume that the uboot-mkenvimage tool generates a correct binary.
+        """
+
+        self.write_config(textwrap.dedent("""
+            UBOOT_INITIAL_ENV_BINARY = "1"
+            UBOOT_INITIAL_ENV_BINARY_SIZE = "0x4000"
+            UBOOT_INITIAL_ENV_BINARY_REDUND = "1"
+        """))
+
+        bitbake("u-boot")
+
+        bb_vars = get_bb_vars(["DEPLOYDIR", "UBOOT_INITIAL_ENV"], "u-boot")
+
+        uboot_initial_env_binary_path = os.path.realpath(os.path.join(
+            bb_vars["DEPLOYDIR"], "%s.bin" % bb_vars["UBOOT_INITIAL_ENV"]
+        ))
+
+        self.assertExists(uboot_initial_env_binary_path)
+
+    def test_uboot_config_initial_env_binary(self):
+        """
+        Tests building the initial U-Boot environment in binary format with
+        the U-Boot mkimage tool for a U-Boot config.
+        We assume that the uboot-mkenvimage tool generates a correct binary.
+        """
+
+        self.write_config(textwrap.dedent("""
+            UBOOT_MACHINE = ""
+            UBOOT_CONFIG = "test"
+            UBOOT_CONFIG[test] = "qemu-x86_64_defconfig"
+            UBOOT_INITIAL_ENV_BINARY = "1"
+            UBOOT_INITIAL_ENV_BINARY_SIZE = "0x4000"
+            UBOOT_INITIAL_ENV_BINARY_REDUND = "1"
+        """))
+
+        bitbake("u-boot")
+
+        bb_vars = get_bb_vars(["DEPLOYDIR", "UBOOT_INITIAL_ENV"], "u-boot")
+
+        uboot_initial_env_binary_path = os.path.realpath(os.path.join(
+            bb_vars["DEPLOYDIR"], "%s-test.bin" % bb_vars["UBOOT_INITIAL_ENV"]
+        ))
+
+        self.assertExists(uboot_initial_env_binary_path)
-- 
2.34.1


