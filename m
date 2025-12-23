Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA5E6FE40
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108979.1766524983178246651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EtWEczQt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0a33d0585so50804825ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524982; x=1767129782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=davM2ZIJ6VnqdMPzlxPnkAdPQqCs+BzOiy2aDgzVZbc=;
        b=EtWEczQtqvi/f2eNV+41y6tlJhnCuqJUPhNWrrDjiNPkMeZnRaZne43/Sff99JM2nH
         7evCaIVDp2zMTS7EHaJsnlAQ/L3PyHmEL69FBJTFKPsivQ3wCGIdHa+MONLCrMcea/+i
         utba6mVW80pASY+yVuOTpsnxEwJXeFRfR/lZRIa5C1PTwqi8aJJqygnYdem1+cN5NfBX
         dDv7ZIb/V4k85+mzAXLceA1Lb9PqTRNvOHp6bx5GXLZCM9k0obQCX2uvJOUskeDZ4hUe
         ov32lmsVnJohZwIT8BwemNUjL+0qlbZ0eozH2GQZHuXqoSa6mvkLV0xFpHwkm2s2xoZT
         Ilqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524982; x=1767129782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=davM2ZIJ6VnqdMPzlxPnkAdPQqCs+BzOiy2aDgzVZbc=;
        b=GwPuD8TQr6631SkR/h/8f+4scfr1veMVaYISq5r2wV2lgf2ODuE3D7NnWrHfC85igs
         jdWLTXckDVL9IaPq9Uxa3F1bjCbqcoBNbf5S/Ja4B9VH4xqo41aYUYYAmCulptyWAxho
         vgy7WCwNgaZ0jMYwkSzZ44Yf3HqQMZuWgxRytsWBJif00yNU5FLarskyLWZzbY3hkYS+
         F6vdJ5KfacDBeV02hcgeg9Pa3P23yuZX5Nehswl0COOOyUnr1n9FLevbE+Te+FPnf0TG
         lf/+6TybHv/dC17jrHyh2rqDOrqZl4NA4cI6LxtberwU/3CRtrS0bIxnonfnUnvYAjc0
         i3wQ==
X-Gm-Message-State: AOJu0YwSoWsmwAok1nMempxeNMYB8Cw7djylDNaIxllmmT8vINYooDu6
	TS8D9zLZszOen5zv3h/JzLvmpjYY0aKdZQnzJqaGujLaIfG2/ByEKIZYcrxintmUlm6f968XMJY
	Jge9YrYQ=
X-Gm-Gg: AY/fxX7jIaBadATsuFysDDTm2kCVfFR7GkTQv8WEu+/KVae4Pzk9DWMMKSSjn96orrW
	8/tuyLYq2KRv5a0ve/bBKhOAR/h6KBv24RFMDnLMQvwaxC+fcTNs+bDI6BLAV7zB7CENshphTp2
	+uUV7UayNE6nlaw4v5x5+Pb1KJewdUiQPFOzdjtyXMMLBOGgQL7osL4AldThdm5syfP27jGcEF3
	XTuSVktU5mZr7Kz3pJLS3s8nX5coc79BFynZRThsdIiF4GEBVh7nvFSPMKPeSS1QZn7C/lwU6kG
	P0gAJ5WPHQOh32ni03ZOjL4aysosTZnt0+2F5noWV/QzcRhoDynJM5hQ8MTuNwFtXcgOftFyhSb
	x+kZEmUXeMKNfIoaHIbbF3wTK6rrTod1i+EzsTunnYpXnr5aT51CHWA5vGBkeSvw43CAta80Tcz
	NWCA==
X-Google-Smtp-Source: AGHT+IFUT71+4FpwryFflHAULmwN+IwlFXvxMawIWvLG9iQWp92muKd2BQoOjUKvZ+GcoYKcIM5VnQ==
X-Received: by 2002:a17:903:1c8:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a2f2734d5emr151796335ad.33.1766524982240;
        Tue, 23 Dec 2025 13:23:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/18] kernel.bbclass: Add task to export kernel configuration to SPDX
Date: Tue, 23 Dec 2025 13:22:19 -0800
Message-ID: <1fff29a0428778929ffa530482ebf7db95f1e0ae.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228487

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Introduce a new bitbake task do_create_kernel_config_spdx that extracts
the kernel configuration from ${B}/.config and exports it into the
recipe's SPDX document as a separate build_Build object.

The kernel config parameters are stored as SPDX DictionaryEntry objects
and linked to the main kernel build using an ancestorOf relationship.

This enables the kernel build's configuration to be explicitly captured
in the SPDX document for compliance, auditing, and reproducibility.

The task is gated by SPDX_INCLUDE_KERNEL_CONFIG (default = "0").

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 228a968e7c47d811c06143279bdb0f9c5f374bef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass |  6 +++
 2 files changed, 70 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 4c1cb89a46..d557e98d65 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -873,5 +873,69 @@ addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
+python __anonymous() {
+    inherits = (d.getVar("INHERIT") or "")
+    if "create-spdx" in inherits:
+        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_lic do_deploy', 'do_create_spdx', d)
+}
+
+python do_create_kernel_config_spdx() {
+    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) == "1":
+        import oe.spdx30
+        import oe.spdx30_tasks
+        from pathlib import Path
+        from datetime import datetime, timezone
+
+        pkg_arch = d.getVar("SSTATE_PKGARCH")
+        deploydir = Path(d.getVar("SPDXDEPLOY"))
+        pn = d.getVar("PN")
+
+        config_path = d.expand("${B}/.config")
+        kernel_params = []
+        if not os.path.exists(config_path):
+            bb.warn(f"SPDX: Kernel config file not found at: {config_path}")
+            return
+
+        try:
+            with open(config_path, 'r') as f:
+                for line in f:
+                    line = line.strip()
+                    if not line or line.startswith("#"):
+                        continue
+                    if "=" in line:
+                        key, value = line.split("=", 1)
+                        kernel_params.append(oe.spdx30.DictionaryEntry(
+                            key=key,
+                            value=value.strip('"')
+                        ))
+            bb.note(f"Parsed {len(kernel_params)} kernel config entries from {config_path}")
+        except Exception as e:
+            bb.error(f"Failed to parse kernel config file: {e}")
+
+        build, build_objset = oe.sbom30.find_root_obj_in_jsonld(
+            d, "recipes", f"recipe-{pn}", oe.spdx30.build_Build
+        )
+
+        kernel_build = build_objset.add_root(
+            oe.spdx30.build_Build(
+                _id=build_objset.new_spdxid("kernel-config"),
+                creationInfo=build_objset.doc.creationInfo,
+                build_buildType="https://openembedded.org/kernel-configuration",
+                build_parameter=kernel_params
+            )
+        )
+
+        oe.spdx30_tasks.set_timestamp_now(d, kernel_build, "build_buildStartTime")
+
+        build_objset.new_relationship(
+            [build],
+            oe.spdx30.RelationshipType.ancestorOf,
+            [kernel_build]
+        )
+
+        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch / "recipes" / f"recipe-{pn}.spdx.json")
+}
+do_create_kernel_config_spdx[depends] = "virtual/kernel:do_configure"
+
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c0a5436ad6..15c31ba9a3 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
     useful if you want to know when artifacts were produced and when builds \
     occurred, but will result in non-reproducible SPDX output"
 
+SPDX_INCLUDE_KERNEL_CONFIG ??= "0"
+SPDX_INCLUDE_KERNEL_CONFIG[doc] = "If set to '1', the .config file for the kernel will be parsed \
+and each CONFIG_* value will be included in the Build.build_parameter list as DictionaryEntry \
+items. Set to '0' to disable exporting kernel configuration to improve performance or reduce \
+SPDX document size."
+
 SPDX_IMPORTS ??= ""
 SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that describes how to \
     reference external SPDX ids. Each import is defined as a key in this \
-- 
2.43.0


