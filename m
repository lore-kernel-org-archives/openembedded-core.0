Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD61ECFA756
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:49:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7570.1763714975318753918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=37ek4PYt;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso1100764f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763714973; x=1764319773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XeRwhUcU2Ufu/8VcvQhL0FhasjElyFQk2L6gsfcqls=;
        b=37ek4PYtr3VoxAQMg2TvHzdv/S6lRpUnHwO5eIMu0Q3ngTnY9Oqbmwh/kS9j6SiQPF
         wA4aHcfoy65Q7aK6CeSs1h7PPcn9WbIyTaA3dVtiKZOgL24kCn1IqmR7KRaPe5uCsMnw
         MRD+mw+mo9Vsu2E8OTLFRj2KkXA2PG2Shbdq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714973; x=1764319773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XeRwhUcU2Ufu/8VcvQhL0FhasjElyFQk2L6gsfcqls=;
        b=JvuPVwKIfqNSOMVtGiFvyGWAYQQrM8JhoS6c9NRRm5nxufijO+HeYaMWgi71BPVBbL
         WNYwemXC0/qzrOMnKEeLVnO4tK2Sbi9oVMpObrZcZO9Kn3JQcT4zqNmCX7drD6hOZuJv
         eQiduwSmGPtBV45OlCGJ6cERgy/DH28+hnEJNw3f82TmULr2ePPzkSWaHbbzYVjF5M4V
         VluFeg1IF8JRS1V4gW42bj7nDzPPnBPOl1u7H2iOrDCJs0z9OUu+j3jkGbret9yDx5u9
         JWzb+sICFZmfuaMvPGaNHzEq72kzCZ+hhQ+m+69MK11r5kBrcoikvU7v48GKhwAT6M5c
         9FFg==
X-Gm-Message-State: AOJu0YyrKuNBh8l20kK0AXl9qzWuoVTLqwuLOaUk2QZMczHexGRQoi8B
	hISducabeyTkqTe88Z0zDasr6eQ4RTeUv7q+EianhChnektAKT8igf5+XbU1Ol2jW3OIbTww0ub
	YJj4B
X-Gm-Gg: ASbGncsAqZa0NMQNj8/HKvGPc+2wtL0BZfqdLA8EbjWMjwq7uasQXhbqCjsJ5zoy/aQ
	KtKIVEckwBDDFv1FYy4qhqBq+JDR+e0VxyIvwvaoru/G15G6OJ4eXIC/WFhHxjdJAh2DKjsTzWW
	TsxfuXtYanKJkezZPE5b6L9A6r8kuMlWrM29I8lQJADqpHw1kCAg6rxvXWo8LxNCVPb+m1+C7Vx
	cMxqJ3YECvnxoBR1e01iToV71H9RtV6OONQrZXte7HfXD5SzERSsU8MuymbmYH6lhn/WEQdnQkt
	AZRO02z5ZgGD7vanbCBHZuMd0dWHZtC2qEnPk6K5AikEeRzyX1/I0ikWHMTkK9BTRbIU6G0P/bv
	9iC+NmPhMel9TuPhfBh5Qw4qw2dRImVqC5ffr9Az5V+ka+vGy/qdUQ4zlDp9LfXS8CjxvdpZP/r
	nlc/81pnpBg1myNhfgLByMw0jRbBvIkJHSdN0TNhdAx3lc1USFV+hXt27HOcijdERA8xwHyudOF
	zZwe4KzSHQKiAR9ZK2lMVkOpm0q
X-Google-Smtp-Source: AGHT+IFsXKovMiwGPqbpN09kSAU7wFy89fNA+FyZ3tSq/A+riLx3s97A13YmtaChlQu02bP+G+5AlA==
X-Received: by 2002:a05:6000:2003:b0:42b:389a:b49 with SMTP id ffacd0b85a97d-42cc1d0c57fmr1315613f8f.28.1763714973586;
        Fri, 21 Nov 2025 00:49:33 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00856597798efcbb8b.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:8565:9779:8efc:bb8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm9635201f8f.22.2025.11.21.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:49:33 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v3 2/2] oe-selftest: uboot: add test for building U-Boot initial env binary
Date: Fri, 21 Nov 2025 09:49:18 +0100
Message-Id: <20251121084918.875151-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226654

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

This adds two new selftest cases `test_uboot_initial_env_binary` and
`test_uboot_config_initial_env_binary` to verify the build of the U-Boot
initial env binary with the mkimage tool.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
changes in v2:
- add tests

changes in v3:
- fix UBOOT_CONFIG[test] with the correct UBOOT_MACHINE
---
 meta/lib/oeqa/selftest/cases/uboot.py | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 980ea327f0..28169514f5 100644
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
@@ -96,3 +99,54 @@ QB_DRIVE_TYPE = "/dev/vd"
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
+        uboot_machine = get_bb_var("UBOOT_MACHINE", "u-boot")
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_CONFIG = "test"
+            UBOOT_CONFIG[test] := "{uboot_machine}"
+            UBOOT_MACHINE = ""
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


