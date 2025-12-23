Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7521BE6FE41
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108981.1766524986782553535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PYB/3Eub;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a12ed4d205so47458855ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524986; x=1767129786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXLc3w99BMxoACBy3FYvd9FpKAJWbUJyLPhry+DfJIc=;
        b=PYB/3EubFQMXe/UsuLS9BACOltrK0Ll8ZKrggUEOo3fxcHl0Zu4an5Bv1Ss9/dAuXJ
         YZKOSBGsxgR3mZoEJgB46r00/7Bd6We8oC3TXu8T/M0nHKxuOnhLIt5VHVjHQQLe44KP
         8i5GRswJNEjGkrcWw/FFWul4qnVkmRZ2UTX5cSHv6X37D1z/OMOUp2o6R7iUt+ACtQx1
         MAVXhBIT9cZKsqGTR4ApW/Y3MhSS3wde6e0qndT2LBI4zer0UK/UNaho9qQRlyingUvl
         Ll9drXjp2K+pM3EtO+f445yWiJcaJvjO15hTHVYZcUeX96tGtNdnNb6nkOJjS7fWyJVe
         dMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524986; x=1767129786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OXLc3w99BMxoACBy3FYvd9FpKAJWbUJyLPhry+DfJIc=;
        b=KmFb5UxsRsOJI08L5KEe7b3JFlyF01SammdbkFekAr/kE7BmKw6YpPo8Xc4Jt/X7x1
         dNpy/W1p8kpzeMWfh58BGSa2gAqV/B1risA9AQqY01zEyuelGj1AKBn5kwNezJg6riKv
         W7jZvtZcnFkqrNBbsXtvqfRBXXNK5tyiJEviOkOcKv6RmS22QJo9+aVDq6RPJhWUgMR8
         2mTsG5m9kL7WGJo9xNhMYIV+OJdhk+7ZPwQuEQFtKKQz1oypMvBghWqu0KNNFlXMXb7p
         LF9/E1AfrPBw1jURZHG2cr5EzFsMEv84AfLkls8ExdbqQmblSLWbo/Mawc0yjZNN2+cB
         F5pg==
X-Gm-Message-State: AOJu0YwOPWA3RKsVuA+9jCbHORFPkFD9jtU+jRS3d8WePksSsPd+NuGa
	c0x1dGPAI4JM5zzkgOhQKZM4TA+zG6ZOjBWIiPGkxDPeJk9DezPOE+l8zRQCi6/DMNQckddLG+7
	GqQVJ
X-Gm-Gg: AY/fxX6WEzOn8A0gR+DLrV4eXLf/aAryksKPvnR/9xtEaCchjPWEJj+VbL7loLya5DS
	pea8Y3xYE42bFWJzEaxkSVlSOojGSQpOzceZiJXl2Q8BQLnw1ag1XKMKrXLGa5MbcliGxzt4Ybd
	J6E1XsvKJZ3FM9NI/xa6Ie6j/9T6PCnYymc9+bUlu+up/zUH1z2svGbeztUY+o297oWhsxWAt4A
	KA0GBgYKJRtX+n0FTAZMsmFvQfMTQQ4bmOat6wLCLZzKwEswtCLAhn0ebxXvCnL13SPSYG7GXT+
	Whekm3SQT1W24gzuaLH5Re9mwotJ/1OHeDAEaXmaT2BP0Hdejh8l5be3Nh2zElzSgZw8co5hvMP
	2CjD+z5wmX8ezipt8VC97CcokvjpH5WmR9xFsYYBaqWen9gwcgD5cd7qO/W7C08sXm+HhgMSOiB
	A8ADDXKVBVApuD
X-Google-Smtp-Source: AGHT+IEzsh0hoLRi7KyDacom8QMbnbk8kTGRX1cl88rQdXo2oR0CSdfqRp7pSdbeJq4W2FmNRj5IDA==
X-Received: by 2002:a17:903:244f:b0:29f:3042:407f with SMTP id d9443c01a7336-2a2f2227091mr148309815ad.21.1766524985965;
        Tue, 23 Dec 2025 13:23:05 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/18] oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and PACKAGECONFIG
Date: Tue, 23 Dec 2025 13:22:21 -0800
Message-ID: <a172a0e8d543796ee78bb66650726168352f1cdf.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228489

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Add test_kernel_config_spdx and test_packageconfig_spdx to verify
SPDX document generation includes kernel configuration and package
feature metadata when enabled.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f0ab110d7521510c60e0493ef3cb021130758cd)
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 57 ++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8cd4e83ca2..035f3fe336 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -286,3 +286,60 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 break
         else:
             self.assertTrue(False, "Unable to find imported Host SpdxID")
+
+    def test_kernel_config_spdx(self):
+        kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
+        spdx_file = f"recipe-{kernel_recipe}.spdx.json"
+        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{spdx_file}"
+
+        # Make sure kernel is configured first
+        bitbake(f"-c configure {kernel_recipe}")
+
+        objset = self.check_recipe_spdx(
+            kernel_recipe,
+            spdx_path,
+            task="do_create_kernel_config_spdx",
+            extraconf="""\
+                INHERIT += "create-spdx"
+                SPDX_INCLUDE_KERNEL_CONFIG = "1"
+                """,
+        )
+
+        # Check that at least one CONFIG_* entry exists
+        found_kernel_config = False
+        for build_obj in objset.foreach_type(oe.spdx30.build_Build):
+            if getattr(build_obj, "build_buildType", "") == "https://openembedded.org/kernel-configuration":
+                found_kernel_config = True
+                self.assertTrue(
+                    len(getattr(build_obj, "build_parameter", [])) > 0,
+                    "Kernel configuration build_Build has no CONFIG_* entries"
+                )
+                break
+
+        self.assertTrue(found_kernel_config, "Kernel configuration build_Build not found in SPDX output")
+
+    def test_packageconfig_spdx(self):
+        objset = self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.json",
+            extraconf="""\
+                SPDX_INCLUDE_PACKAGECONFIG = "1"
+                """,
+        )
+
+        found_entries = []
+        for build_obj in objset.foreach_type(oe.spdx30.build_Build):
+            for param in getattr(build_obj, "build_parameter", []):
+                if param.key.startswith("PACKAGECONFIG:"):
+                    found_entries.append((param.key, param.value))
+
+        self.assertTrue(
+            found_entries,
+            "No PACKAGECONFIG entries found in SPDX output for 'tar'"
+        )
+
+        for key, value in found_entries:
+            self.assertIn(
+                value, ["enabled", "disabled"],
+                f"Unexpected PACKAGECONFIG value '{value}' for {key}"
+            )
-- 
2.43.0


