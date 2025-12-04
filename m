Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF5FD1F9CD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41401.1764847883084584838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3TB7sotJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47796a837c7so6478325e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847881; x=1765452681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4na1mr8VM9FscKTpuTWGYDFWbdgW1jXc3QTFA55KMXE=;
        b=3TB7sotJN9zjGXj6Nw+bT6PfPi9bfDPggQ0dOeeyMHyuhckiqy88wj6nua1lK4VY5c
         8KB2KAU19GVG6UWNIgaVKctYCkwxxbu4zBDgL9NRBgzLeBmV81hfO9xgNweh+WcMqGM3
         01h3VGQIyYizCiLMhGydDqQBWtXSf5NkpD1RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847881; x=1765452681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4na1mr8VM9FscKTpuTWGYDFWbdgW1jXc3QTFA55KMXE=;
        b=JAoigmRYpeASqwVnBn+1Yb7pKArJscM/H4K+gWlha/rblkejebAHNaoB2vdw3sZ3+b
         izLeHfo4okTcgQjL3B2YOyjLMXUOZVtVrsv5rGk+PL15ERSz5WAWgkvQwVlvgNvcqBIR
         a84bf8Uu4qcMh1PDY6beC9IRmB70eB4EhmoWDhfJVAwF8Z8WDnGO3R/sG/ZZ7ciVZ9hN
         Nfj+8hrjcYC9ATniShPGvlKFbof/7io3BMtWN7aBgdGG4Ht3g3PApczgN3WaSCQUJmGV
         I3ss7YrnMQCyGYN70UMffGxpLjxI20i35txG17eMorft3yE/Xgb4BBjt5hj4CexLyGt0
         sa7A==
X-Gm-Message-State: AOJu0YzMn8mqKU78NtgfiL+f4urgOzmeaklq76Or8DQbYtXPjowyvtaO
	OZDvuAc08vUnNMwVni2c1PvLaaTQXvShHYCWxnrTOofJvcQE/yQ+VEZsKeN3BqGstjhF6Y/qt5+
	ZMiyq
X-Gm-Gg: ASbGncsBzyqkxEj4YFXZDsqks25jW2q5X/klo3/T7yxF/IqgKBscg0Mn+i1FyOeWHLV
	GzKUSQti503QooNPzJsHXMLdXL5R9ZjKEoIK/OJL5TMUXYNAWsIoewlRfMzB9nLeBN6YFNxRo+M
	cJPlx7tjUTmCkH+f8NNy1zOA0DM07n9CDvO9asvGQNaIcHkSZVyEAoUATPALY5/b+Qqfgiv6UbX
	N/zTKMZCvz9zSGCAIdEJ6iQukxTFRdOQ611Z8hJLsPrcWI7vrcoYvk8o55REE69VNiZECXYRgzw
	WaeEzw6ANxzMnPC6KV3LdTG27fLvwtfulzDFp57T7BF5XaUczORY4U3utqRwRjyHaZirksiSdNd
	/tUEsZyiUNXR45m0epQvgA++gwa3Rf2naP74J9aE9WZ+nXSQFQTrDtE6fbi29/CXjy4D3oc0eDH
	XIAZ7OAxKvAvFQe+I4EylHJGA2pPkCmRSIPn2bb68rec5fJSgBlR8slWd4LJsKu+gm+uF70OWPU
	f5Ou2tJxVIdPvc=
X-Google-Smtp-Source: AGHT+IFjmZAryN3Nx2jAdie4DNT2AsOiE0Dgb+4DO6AFEF7yXH+8szU88OTNW1MkQf1HpO4kQ0AoTw==
X-Received: by 2002:a05:600c:3b13:b0:471:9da:524c with SMTP id 5b1f17b1804b1-4792aef1bd5mr66033405e9.12.1764847880914;
        Thu, 04 Dec 2025 03:31:20 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 5/5] runtime_test: Add rust-out-of-tree selftest
Date: Thu,  4 Dec 2025 12:30:58 +0100
Message-ID: <20251204113058.948115-6-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
References: <20251204113058.948115-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227286

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2:
* Add the needed layer meta-skeleton for the test
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 66cb112a7c1..b519cf30cdd 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -493,8 +493,11 @@ class RustKernel(OESelftestTestCase):
             import textwrap
             self.write_config(textwrap.dedent("""
                 DISTRO_FEATURES:append = ' rust-kernel'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -505,3 +508,10 @@ class RustKernel(OESelftestTestCase):
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
 
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
+

