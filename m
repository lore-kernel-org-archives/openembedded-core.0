Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4094FC46CA3
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:18:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.100665.1701105472330256796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 09:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rjx3nhkA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b4023ea99so14015555e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701105470; x=1701710270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cb+bmsxqysR6yxp0FN8b0/PImhLaVQqAwRfLXSc60A=;
        b=rjx3nhkAnZZShDqVgbLD1ZSZcYAX93j6LMgl3ry8AusKxpaL1sACDh3CsCzNhwm95+
         +jFByWsrLDxr1Led/Gm7jm2SZSAdvgK/Spd4shVBu3ttO2ZmdZqAsZONFuN8kyiw2k9c
         GJlhrtRhKKf/42IylowSI/8ck3HZkNo0OuOJp90B//N9w7puD+VoHc6/yNF1stwuPM15
         54+7MCx68E72t0jQB/uLMw82BI2+9adR+IuHaTx8i9dieZsDkdTaM01WV+MXI7XK0n0c
         tfJnRO/g6OCD+qXi4SbSLDfqSo3v7MMYJAHeCjJ8ZDZiRv4c+ZQKAFun3oEN6Y/oXBd/
         oPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701105470; x=1701710270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cb+bmsxqysR6yxp0FN8b0/PImhLaVQqAwRfLXSc60A=;
        b=jyvjWIBZ7HEFwqwwCyTr+uR+vs7AyxF7e3G9K6KTCpVMNRBpQv2cPcI4k5WlMbMFLm
         1BFJOfaJi572w5gjxg5YhJPO6tYZYkQKwbaYePgnpX2EvnDC70CylhhT0c6qc3g7w40E
         SktZ/0I8Ct+Tka+r52+xoeDAkNmTbfCTmq/3OLtpr4gdz59Y/3Z5tNVB9odpMIQu8aRi
         ZKRUJLN1NH4+0GKYu7y+1cYsVEbK7N/8l+p30ZdIp2KRcavFGkoYlzmo18cRhPbR1MyW
         VhFvHrOG1jlL7KW1INitP0ElVRdLFJvPuxT4Z9H0P+uyW/nM/9z068rjXK1Dg6/h3nrt
         0wAQ==
X-Gm-Message-State: AOJu0Yz4fcJJSMxJ8Px//Iesgvl3wDLsyQNrri3HTBR4DS1BzVZpFYzM
	DHa8vMoBxrbyoUOPwNCSx3XZn9nNtM0J57QFME+1ag==
X-Google-Smtp-Source: AGHT+IFxHGU/9PWBhPZjnyYatx79qJ6ZP77XYJwl33iLOvCdiebAiHBMZlqPshk99ymYy3kvhVGg0w==
X-Received: by 2002:a05:600c:3505:b0:40a:5129:c284 with SMTP id h5-20020a05600c350500b0040a5129c284mr5618848wmq.35.1701105469864;
        Mon, 27 Nov 2023 09:17:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b0040b3e7569fcsm9156684wmq.11.2023.11.27.09.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:17:49 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] recipetool: create: add support for crates
Date: Mon, 27 Nov 2023 18:17:42 +0100
Message-ID: <20231127171742.416913-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127171742.416913-1-jstephan@baylibre.com>
References: <20231127171742.416913-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 17:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191312

This commit adds a new plugin for creating recipes for crates (rust based
applications).

TODO: add more description here on final version of the patch

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_cargo.py | 125 +++++++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_cargo.py

diff --git a/scripts/lib/recipetool/create_cargo.py b/scripts/lib/recipetool/create_cargo.py
new file mode 100644
index 00000000000..d24ce63509c
--- /dev/null
+++ b/scripts/lib/recipetool/create_cargo.py
@@ -0,0 +1,125 @@
+# Recipe creation tool - cargo support plugin
+#
+# Copyright (c) 2023 BayLibre, SAS
+# Author: Julien Stephan <jstephan@baylibre.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import os
+from recipetool.create import RecipeHandler
+
+logger = logging.getLogger("recipetool")
+
+tinfoil = None
+
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
+class CargoRecipeHandler(RecipeHandler):
+    """
+    Base class to support rust crate
+    """
+
+    # The supported metadata list
+    # Exaustive list available here: https://doc.rust-lang.org/cargo/reference/manifest.html#the-manifest-format
+    manifest_package_table = [
+        "name",
+        "version",
+        "homepage",
+        "description",
+        "license",
+        "license-file",
+        "dependencies",
+    ]
+
+    bbvar_map = {
+        "name": "PN",
+        "version": "PV",
+        "homepage": "HOMEPAGE",
+        "description": "SUMMARY",
+        "license": "LICENSE",
+    }
+
+    def __init__(self):
+        pass
+
+    def process(
+        self, srctree, classes, lines_before, lines_after, handled, extravalues
+    ):
+        if "buildsystem" in handled:
+            return False
+
+        # Check for non-zero size Cargo.toml file
+        manifestfiles = RecipeHandler.checkfiles(srctree, ["Cargo.toml"])
+        for fn in manifestfiles:
+            if os.path.getsize(fn):
+                break
+        else:
+            return False
+
+        manifest = os.path.join(srctree, "Cargo.toml")
+
+        lockfile = RecipeHandler.checkfiles(srctree, ["Cargo.lock"])
+        if lockfile == []:
+            logger.error(
+                "No cargo lock found, this is not yet supported, falling back to another method"
+            )
+            return False
+
+        try:
+            import tomllib
+        except ImportError:
+            try:
+                import tomli as tomllib
+            except ImportError:
+                logger.exception(
+                    "Neither 'tomllib' nor 'tomli' could be imported. Please use python3.11 or above or install tomli module"
+                )
+                return False
+            except Exception:
+                logger.exception("Failed to parse pyproject.toml")
+                return False
+
+        try:
+            with open(manifest, "rb") as f:
+                config = tomllib.load(f)
+
+            metadata = config["package"]
+
+            if metadata:
+                for field, value in metadata.items():
+                    if field in self.manifest_package_table:
+                        if field == "license":
+                            # license field is an SPDX 2.1 license expression
+                            # https://doc.rust-lang.org/cargo/reference/manifest.html#the-license-and-license-file-fields
+                            value = value.replace("AND", "&")
+                            value = value.replace("OR", "|")
+                            # even if deprecated we can still find some old crate using "/" to separate mulitple licenses
+                            value = value.replace("/", " & ")
+                        elif field == "license-file":
+                            # TODO: handle this properly
+                            continue
+
+                        extravalues[self.bbvar_map[field]] = value
+
+            if "dependencies" in extravalues:
+                lines_after.append("include ${BPN}-crates.inc")
+                extravalues.pop("dependencies")
+            classes.append("cargo")
+            classes.append("cargo-update-recipe-crates")
+            handled.append("buildsystem")
+        except Exception:
+            logger.exception(
+                "Failed to correctly handle Cargo.toml, falling back to another method"
+            )
+            return False
+
+
+def register_recipe_handlers(handlers):
+    # We need to make sure these are ahead of the makefile fallback handler
+    handlers.append((CargoRecipeHandler(), 80))
-- 
2.42.0


