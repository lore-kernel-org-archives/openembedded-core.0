Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F0FCA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:54:52 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.11582.1755788086728728019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LstQOY4q;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 479B5449B9;
	Thu, 21 Aug 2025 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755788084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap981Ze32TCkEtg52/ELD99ju5mxNUU9Cvvw+sP9+w0=;
	b=LstQOY4q1axkaeUYlRJIiqWuMPcWAMkS7IRYC6FddxleE8KVSBTWs+5YsDtarb6wN4S7IR
	4pYHmt2whij6Ml6YL8jY3nLunFJdI0Haub2pOLh+W3IU5e5Sc6OaYievpJpzwAgn4aaFfR
	FFo1wj9P2H/Tkdngc9GmcpJFrOc8+aYIC1YsriMHqxBvvYQyCU7enX2zxo1ftSsoJg99Ym
	T7DFSii0PQ9oA831md8gnwQ93n129UEjfVclTkwiLSv29IShWRdrdVncxTFud3ohUBfKJt
	3JSc0USkjVKnN3RwPgt4Yj6avuVorGy3l4LlFYXEPWsOSufgdopFO82h0dLA5g==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v3 1/2] kernel.bbclass: Add task to export kernel configuration to SPDX
Date: Thu, 21 Aug 2025 16:54:35 +0200
Message-ID: <20250821145438.2537767-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
References: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdekhfefueegieeffeetvdevudfhjeejgfevvdeludevudejuefgieeihfeljeeinecuffhomhgrihhnpehsphgugieftddrsghuihhlugdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeeltddrieefrddvtddvrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrieefrddvtddvrdegtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222246

Introduce a new bitbake task do_create_kernel_config_spdx that extracts
the kernel configuration from ${B}/.config and exports it into the
recipe's SPDX document as a separate build_Build object.

The kernel config parameters are stored as SPDX DictionaryEntry objects
and linked to the main kernel build using an ancestorOf relationship.

This enables the kernel build's configuration to be explicitly captured
in the SPDX document for compliance, auditing, and reproducibility.

The task is gated by SPDX_INCLUDE_KERNEL_CONFIG (default = "0").

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
v3:
  - Fix missing dependency on kernel do_configure
v2:
  - Disable exporting kernel config metadata by default
  - Move kernel config SPDX logic from spdx30_tasks to kernel.bbclass
  - Generate a separate build_Build for kernel config and relate via ancestorOf

 meta/classes-recipe/kernel.bbclass   | 63 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass |  6 +++
 2 files changed, 69 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index eb03424dfc..5282f24fff 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -863,5 +863,68 @@ addtask deploy after do_populate_sysroot do_packagedata

 EXPORT_FUNCTIONS do_deploy

+python __anonymous() {
+    if bb.data.inherits_class("create-spdx", d):
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


