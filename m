Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD4CCA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:54:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.11583.1755788087017734795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LktihDSt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 228EC43880;
	Thu, 21 Aug 2025 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755788085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71UiAJLR4molQ6ue/JIbrDv0C+7ublut0EYr3NZZ4fs=;
	b=LktihDStwbmKJxIl/y57seeBhJq+c61pk128kbB3PePzyILhWANRvJmDH7WcKLoPn7cGLh
	vLC4a9DWnGhtcS45Q7ZbL9R66NCLpuE4XXDzWjEg7whkII88F8EsIDXmUauk6CtjaOzvBf
	68uX3dDjed5Yhvb8BFCtrjWvFLzuolpkGtV+dGTFncgDdq02DrGPTjKzySU9K5+d3oYSkI
	cPZq65OicBf5lW4h4ehPpAGHjRArNVA4IZAmlhFLQbPvkSQrwas6461naHJHIitFvVhkOb
	NnW/r4f9OoaCGMzWkam6XGJZsP/xe3lqzbvc4jV+VtQcHIluPKlKC6SSCcFNyA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v3 2/2] spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
Date: Thu, 21 Aug 2025 16:54:36 +0200
Message-ID: <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
References: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddukeekfeetgfeltdfgieeugeeggeejieejheekueevhffgffegkefgffeukedvnecukfhppeeltddrieefrddvtddvrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrieefrddvtddvrdegtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepm
 hgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222247

Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when enabled causes
PACKAGECONFIG features to be recorded in the SPDX document as build parameters.

Each feature is recorded as a DictionaryEntry with key PACKAGECONFIG:<feature>
and value enabled or disabled, depending on whether the feature is active in
the current build.

This makes the build-time configuration more transparent in SPDX output and
improves reproducibility tracking.

This makes the build-time configuration more transparent in SPDX output and
improves reproducibility tracking. In particular, it allows consumers of the
SBOM to identify enabled/disabled features that may affect security posture
or feature set.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 meta/classes/create-spdx-3.0.bbclass |  5 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 15c31ba9a3..6125e8b547 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the Build.build_parameter list as Di
 items. Set to '0' to disable exporting kernel configuration to improve performance or reduce \
 SPDX document size."
 
+SPDX_INCLUDE_PACKAGECONFIG ??= "0"
+SPDX_INCLUDE_PACKAGECONFIG[doc] = "If set to '1', each PACKAGECONFIG feature is recorded in the \
+build_Build object's build_parameter list as a DictionaryEntry with key \
+'PACKAGECONFIG:<feature>' and value 'enabled' or 'disabled'"
+
 SPDX_IMPORTS ??= ""
 SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that describes how to \
     reference external SPDX ids. Each import is defined as a key in this \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c352dab152..d708715981 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -815,6 +815,26 @@ def create_spdx(d):
             sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
         )
 
+    if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
+        packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
+        all_features = (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+
+        if all_features:
+            enabled = set(packageconfig)
+            all_features_set = set(all_features)
+            disabled = all_features_set - enabled
+
+            for feature in sorted(all_features):
+                status = "enabled" if feature in enabled else "disabled"
+                build.build_parameter.append(
+                    oe.spdx30.DictionaryEntry(
+                        key=f"PACKAGECONFIG:{feature}",
+                        value=status
+                    )
+                )
+
+            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
+
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
 
 
-- 
2.43.0


