Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAC2C4450A
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155316.1783358253076110434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z+Ea+yv1;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b7612475so30892915e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358251; x=1783963051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44AzcP91x8dxFmKA3RGtFx8/w8WwIJM4K26LiKt0Rnw=;
        b=Z+Ea+yv1WOIKLjTZLeD258DCbTu8cNWyb2/K1GUgbgapCmGwL1ZgFZpHDCMXyrS22l
         8kNN3x1jcMhFnK0sYZlkFU2ohI6ekFOlKSlT4mnLCHJqJtPLnMNeLd8wugTmiwzhexs3
         4OEBiGHHIo40nKrOhRYJTTCj5jetptYmIt5G4/1uwjeZau2RlNBlicHxliecT4uGS8Sv
         YteXLGZ0derKOnGGgkr2j9BRmn7weelvQh4wtk+0xvKYL03/Siz84OT8N3HH6F04in1u
         AezyOAQOdu7SAOC6IBH43LA41qxf7CopL7nW/+Xja3cwOD/aGhYXci4hIAqof6s31b+T
         iRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358251; x=1783963051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44AzcP91x8dxFmKA3RGtFx8/w8WwIJM4K26LiKt0Rnw=;
        b=SPAirQWQUFL3wGrC7kdbHuAMLqoSDhs32EXVyX0LteE2e+fv7419pfA56WVaKmiXvQ
         RwG5wNAMQ/CcwAhXqlzztzvTgK/UKTHQMOkYpy6Ow3zBNQ7XChYoxulHqBCMwl56iTQQ
         yaqcScUdV/NWILrwDgwypyO+P7doX95aL2HslrqW5RfpZfh/MNBy53vmWL4qXdXVzkPX
         GTmmH2n3vXocSEnw6BIiXsaAKdo1m/CO7r3Fw00emgJEeHIpyaKHhCiD90Cu0ORG0Z+8
         pcqFMOSM80Y46POtUwHvV7hX7rhgLp96IO76qEOxUtz1cw+W83A8SmAtS0nFjIAxYnNx
         inrw==
X-Gm-Message-State: AOJu0Yxcp4rs0ouyr7rgvneiGYhfHtqGS0AsM96TS+jKyYlasDsq6Jcu
	AdtFZHVgUkRLqD3qjBxiLMZ40m0kjkoRL21/BBCo0rX11w4wc7UybD4VETT2yw==
X-Gm-Gg: AfdE7cln2bZOomsi6mM/W8kBqstazeB/ki52EUWoNYggz+K12+3iSd87BD+B4ZkOT/Y
	dLoxFJjKUzKl39S7V4UIt6K3Z/MWOoiSq4ZdQ6ZfAlaGSz94t7V24L+hzrXgnNO0e6JS+XfeuDm
	sLu/gC9IHlbiJMY5Jhu2oQO7APXg0/+epnJZRZsXvlgmcsJwAVfvdtIvxBBQRkqxEjKz4zhp7yh
	twnxsLAUZyaPC1uGlR5W67MEPeADYEP0oSMq8kkITi7p38q4gn5sfXJsFIV6gLyT/GSZZOg8rU2
	lAT35jE9rHTJlG+hID9YN7HJBfxF7nTb3xq2rgPYbLWy4DK8VdZgJf47YUciWAOmtA/7XhuKyDW
	Irwhn2OjtPxSvid0z8no4AM6CGuaVGMZ1lsWOKW3mOsVlaq0unCN8WCKXsiKhxv+1x8k/erJjxW
	3qCoUJ8hF9xD+HGexavffgy5pPnQ7+zi2SSCpPH25gFl9wqoTs
X-Received: by 2002:a05:600c:c16d:b0:493:bd67:316 with SMTP id 5b1f17b1804b1-493df074319mr17082015e9.16.1783358251253;
        Mon, 06 Jul 2026 10:17:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/45] python3-setuptools-rust: upgrade 1.12.1 -> 1.13.0
Date: Mon,  6 Jul 2026 19:16:44 +0200
Message-ID: <20260706171701.70536-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240316

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to avoid build failures due to use of custom rust targets.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rustc_info.py-do-not-add-unstable-op.patch | 44 +++++++++++++++++++
 ...1.bb => python3-setuptools-rust_1.13.0.bb} |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust/0001-setuptools_rust-rustc_info.py-do-not-add-unstable-op.patch
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.12.1.bb => python3-setuptools-rust_1.13.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust/0001-setuptools_rust-rustc_info.py-do-not-add-unstable-op.patch b/meta/recipes-devtools/python/python3-setuptools-rust/0001-setuptools_rust-rustc_info.py-do-not-add-unstable-op.patch
new file mode 100644
index 0000000000..313e7454c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-rust/0001-setuptools_rust-rustc_info.py-do-not-add-unstable-op.patch
@@ -0,0 +1,44 @@
+From 8e0c0ae45a8e4274482d39ee87775ca6d8de9ccb Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 30 Jun 2026 21:36:12 +0200
+Subject: [PATCH] setuptools_rust/rustc_info.py: do not add 'unstable-options'
+ to rustc invocation
+
+This avoids the error:
+| error: the option `Z` is only accepted on the nightly compiler
+| 
+| help: consider switching to a nightly toolchain: `rustup default nightly`
+| 
+| note: selecting a toolchain with `+toolchain` arguments require a rustup proxy; see <https://rust-lang.github.io/rustup/concepts/index.html>
+| 
+| note: for more information about Rust's stability policy, see <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-features>
+| 
+| error: 1 nightly option were parsed
+
+Please see https://github.com/rust-lang/rust/issues/155963
+for report to upstream about why we need custom targets and why
+requiring unstable-options gets in the way, badly.
+
+Rust is meanwhile patched to not require it:
+meta/recipes-devtools/rust/files/0002-Fix-rust-build-failure-with-unstable-options.patch
+
+Upstream-Status: Inappropriate [the issue is in rustc; see above]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ setuptools_rust/rustc_info.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setuptools_rust/rustc_info.py b/setuptools_rust/rustc_info.py
+index ad37249..f470e04 100644
+--- a/setuptools_rust/rustc_info.py
++++ b/setuptools_rust/rustc_info.py
+@@ -68,8 +68,6 @@ def get_rustc_cfgs(target_triple: Optional[str], env: Env) -> RustCfgs:
+ def get_rust_target_info(target_triple: Optional[str], env: Env) -> List[str]:
+     cmd = ["rustc", "--print", "cfg"]
+     if target_triple:
+-        if _is_custom_target(target_triple):
+-            cmd.extend(["-Z", "unstable-options"])
+         cmd.extend(["--target", target_triple.split(".")[0]])
+     output = check_subprocess_output(cmd, env=env, text=True)
+     return output.splitlines()
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
index a1135794ba..884d6a6771 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
@@ -9,7 +9,8 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
+SRC_URI += "file://0001-setuptools_rust-rustc_info.py-do-not-add-unstable-op.patch"
+SRC_URI[sha256sum] = "f2afcf4baeee689910ce49cfa8aad4e08cce72f417449bcc32891b8664fdc726"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.47.3


