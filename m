Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB02CDB484
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:37:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.22104.1697701021236458337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 00:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Zd110PcQ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3226cc3e324so6746273f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697701019; x=1698305819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFovip7EMA0fq0Hfj0BTpeLkuCNgTuTZeaFR+cVmXfc=;
        b=Zd110PcQxYQa/TIGKSJYC6fx6MN2qabjkBkJ9aK5k27ehegliHuO3etRzpht+mcmTq
         TQwjdHsbJO7F+eOsDxujlAPBlN8mYSxRAYXZsZoHDBd3fBobttYzWAEOHHAbFCLE7NoH
         BEkvqzENE/4BRTkTBtjd2NvMr3NDKeHGVRBG1BW8PFciT9UFOhluZAUHJum8EsNNq9Nc
         jIdmbSBH7O4NEuPHIxdaW1e6bbfaz05EQ2Eg6tVhFLj5iPQhdioN73OIDWh8Bm/aLviV
         QZM8Qr3wQ3x7ZwrC9dLMAZAJ/9iAwQugLmTezEIBt2vdP5XW/BziZscbo8bsEIPv1eIO
         ibmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701019; x=1698305819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFovip7EMA0fq0Hfj0BTpeLkuCNgTuTZeaFR+cVmXfc=;
        b=VekjSSdQ6jGKCKBYqq78gRqfCTLgW/SHN4zzk0vhStmKYiSSjzp7fIqA3RlvFQ5DL7
         JLzFoRVyj1J33mUwkLPoZenPreC2gatYBMlpdN1lO1sphQ6la0G507bh8EAoqms4MzG2
         hflhSMDr2oLztQyHXfHKKa+p9qq81LH6ktaBCZM1WuarAEhKx1qEyRE6YXPOhta6SSH2
         ZDiKYXy27qbc64M0pXNcXrFRGOx0Wo7TUX2SrpmsBsJigaTiJ0MrqG9pd89aMytk9x6U
         OjBeYVN1UJVuaPSYcO3JIqxg0FTkGrmjZgq88TpVKjQe6gdyS8hB9p8UtW++YOC7RtRR
         GC9w==
X-Gm-Message-State: AOJu0Yy+KbUrMiFdUP5Oh+BIM6fQBvYgUj2K56QeD6FJUNDHbU4N5q2h
	86tHVPN5DXwSYU19L/lwhwQyAD/Mqul78Id7kEqw0A==
X-Google-Smtp-Source: AGHT+IG3kaeg3jgJDAACmPcxnINriycY2Ej9DXVmIMIazA3mXlkG7bpYy3HV48mi1+JAVtIFFe1sBA==
X-Received: by 2002:adf:f2c6:0:b0:31f:f893:e07f with SMTP id d6-20020adff2c6000000b0031ff893e07fmr860989wrp.12.1697701018957;
        Thu, 19 Oct 2023 00:36:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b0032d9efeccd8sm3809219wrw.51.2023.10.19.00.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:36:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 4/4] scripts:recipetool:create_buildsys_python: add PEP517 support
Date: Thu, 19 Oct 2023 09:36:53 +0200
Message-ID: <20231019073653.1280730-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019073653.1280730-1-jstephan@baylibre.com>
References: <20231019073653.1280730-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189431

add support for PEP517 [1]

if a pyproject.toml file is found, use it to create the recipe,
otherwise fallback to the old setup.py method.

[YOCTO #14737]

[1]: https://peps.python.org/pep-0517/

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../lib/recipetool/create_buildsys_python.py  | 234 +++++++++++++++++-
 1 file changed, 233 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 69f6f5ca511..0b601d50a4b 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -18,6 +18,7 @@ import os
 import re
 import sys
 import subprocess
+import toml
 from recipetool.create import RecipeHandler
 
 logger = logging.getLogger('recipetool')
@@ -656,6 +657,235 @@ class PythonSetupPyRecipeHandler(PythonRecipeHandler):
 
         handled.append('buildsystem')
 
+class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
+    """Base class to support PEP517 and PEP518
+
+    PEP517 https://peps.python.org/pep-0517/#source-trees
+    PEP518 https://peps.python.org/pep-0518/#build-system-table
+    """
+
+    # PEP621: https://packaging.python.org/en/latest/specifications/declaring-project-metadata/
+    # add only the ones that map to a BB var
+    # potentially missing: optional-dependencies
+    bbvar_map = {
+        "name": "PN",
+        "version": "PV",
+        "Homepage": "HOMEPAGE",
+        "description": "SUMMARY",
+        "license": "LICENSE",
+        "dependencies": "RDEPENDS:${PN}",
+        "requires": "DEPENDS",
+    }
+
+    replacements = [
+        ("license", r" +$", ""),
+        ("license", r"^ +", ""),
+        ("license", r" ", "-"),
+        ("license", r"^GNU-", ""),
+        ("license", r"-[Ll]icen[cs]e(,?-[Vv]ersion)?", ""),
+        ("license", r"^UNKNOWN$", ""),
+        # Remove currently unhandled version numbers from these variables
+        ("requires", r"\[[^\]]+\]$", ""),
+        ("requires", r"^([^><= ]+).*", r"\1"),
+        ("dependencies", r"\[[^\]]+\]$", ""),
+        ("dependencies", r"^([^><= ]+).*", r"\1"),
+    ]
+
+    build_backend_map = {
+        "setuptools.build_meta": "python_setuptools_build_meta",
+        "poetry.core.masonry.api": "python_poetry_core",
+        "flit_core.buildapi": "python_flit_core",
+    }
+
+    excluded_native_pkgdeps = [
+        # already provided by python_setuptools_build_meta.bbclass
+        "python3-setuptools-native",
+        "python3-wheel-native",
+        # already provided by python_poetry_core.bbclass
+        "python3-poetry-core-native",
+        # already provided by python_flit_core.bbclass
+        "python3-flit-core-native",
+    ]
+
+    # add here a list of known and often used packages and the corresponding bitbake package
+    known_deps_map = {
+        "setuptools": "python3-setuptools",
+        "wheel": "python3-wheel",
+        "poetry-core": "python3-poetry-core",
+        "flit_core": "python3-flit-core",
+        "setuptools-scm": "python3-setuptools-scm",
+    }
+
+    def __init__(self):
+        pass
+
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        info = {}
+
+        if 'buildsystem' in handled:
+            return False
+
+        # Check for non-zero size setup.py files
+        setupfiles = RecipeHandler.checkfiles(srctree, ["pyproject.toml"])
+        for fn in setupfiles:
+            if os.path.getsize(fn):
+                break
+        else:
+            return False
+
+        setupscript = os.path.join(srctree, "pyproject.toml")
+
+        try:
+            config = self.parse_pyproject_toml(setupscript)
+            build_backend = config["build-system"]["build-backend"]
+            if build_backend in self.build_backend_map:
+                classes.append(self.build_backend_map[build_backend])
+            else:
+                logger.error(
+                    "Unsupported build-backend: %s, cannot use pyproject.toml. Will try to use legacy setup.py"
+                    % build_backend
+                )
+                return False
+
+            licfile = ""
+            if "project" in config:
+                for field, values in config["project"].items():
+                    if field == "license":
+                        value = values.get("text", "")
+                        if not value:
+                            licfile = values.get("file", "")
+                    elif isinstance(values, dict):
+                        for k, v in values.items():
+                            info[k] = v
+                        continue
+                    else:
+                        value = values
+
+                    info[field] = value
+
+            # Grab the license value before applying replacements
+            license_str = info.get("license", "").strip()
+
+            if license_str:
+                for i, line in enumerate(lines_before):
+                    if line.startswith("##LICENSE_PLACEHOLDER##"):
+                        lines_before.insert(
+                            i, "# NOTE: License in pyproject.toml is: %s" % license_str
+                        )
+                        break
+
+            info["requires"] = config["build-system"]["requires"]
+
+            self.apply_info_replacements(info)
+
+            if "classifiers" in info:
+                license = self.handle_classifier_license(
+                    info["classifiers"], info.get("license", "")
+                )
+                if license:
+                    if licfile:
+                        lines = []
+                        md5value = bb.utils.md5_file(os.path.join(srctree, licfile))
+                        lines.append('LICENSE = "%s"' % license)
+                        lines.append(
+                            'LIC_FILES_CHKSUM = "file://%s;md5=%s"'
+                            % (licfile, md5value)
+                        )
+                        lines.append("")
+
+                        # Replace the placeholder so we get the values in the right place in the recipe file
+                        try:
+                            pos = lines_before.index("##LICENSE_PLACEHOLDER##")
+                        except ValueError:
+                            pos = -1
+                        if pos == -1:
+                            lines_before.extend(lines)
+                        else:
+                            lines_before[pos : pos + 1] = lines
+
+                        handled.append(("license", [license, licfile, md5value]))
+                    else:
+                        info["license"] = license
+
+            provided_packages = self.parse_pkgdata_for_python_packages()
+            provided_packages.update(self.known_deps_map)
+            native_mapped_deps, native_unmapped_deps = set(), set()
+            mapped_deps, unmapped_deps = set(), set()
+
+            if "requires" in info:
+                for require in info["requires"]:
+                    mapped = provided_packages.get(require)
+
+                    if mapped:
+                        logger.error("Mapped %s to %s" % (require, mapped))
+                        native_mapped_deps.add(mapped)
+                    else:
+                        logger.error("Could not map %s" % require)
+                        native_unmapped_deps.add(require)
+
+                info.pop("requires")
+
+                if native_mapped_deps != set():
+                    native_mapped_deps = {
+                        item + "-native" for item in native_mapped_deps
+                    }
+                    native_mapped_deps -= set(self.excluded_native_pkgdeps)
+                    if native_mapped_deps != set():
+                        info["requires"] = " ".join(sorted(native_mapped_deps))
+
+                if native_unmapped_deps:
+                    lines_after.append("")
+                    lines_after.append(
+                        "# WARNING: We were unable to map the following python package/module"
+                    )
+                    lines_after.append(
+                        "# dependencies to the bitbake packages which include them:"
+                    )
+                    lines_after.extend(
+                        "#    {}".format(d) for d in sorted(native_unmapped_deps)
+                    )
+
+            if "dependencies" in info:
+                for dependency in info["dependencies"]:
+                    mapped = provided_packages.get(dependency)
+                    if mapped:
+                        logger.error("Mapped %s to %s" % (dependency, mapped))
+                        mapped_deps.add(mapped)
+                    else:
+                        logger.error("Could not map %s" % dependency)
+                        unmapped_deps.add(dependency)
+
+                info.pop("dependencies")
+
+                if mapped_deps != set():
+                    if mapped_deps != set():
+                        info["dependencies"] = " ".join(sorted(mapped_deps))
+
+                if unmapped_deps:
+                    lines_after.append("")
+                    lines_after.append(
+                        "# WARNING: We were unable to map the following python package/module"
+                    )
+                    lines_after.append(
+                        "# runtime dependencies to the bitbake packages which include them:"
+                    )
+                    lines_after.extend(
+                        "#    {}".format(d) for d in sorted(unmapped_deps)
+                    )
+
+            self.map_info_to_bbvar(info, extravalues)
+
+            handled.append("buildsystem")
+        except Exception:
+            logger.exception("Failed to parse pyproject.toml")
+            return False
+
+    def parse_pyproject_toml(self, setupscript):
+        with open(setupscript, "r") as f:
+            config = toml.load(f)
+        return config
+
+
 def gather_setup_info(fileobj):
     parsed = ast.parse(fileobj.read(), fileobj.name)
     visitor = SetupScriptVisitor()
@@ -769,5 +999,7 @@ def has_non_literals(value):
 
 
 def register_recipe_handlers(handlers):
-    # We need to make sure this is ahead of the makefile fallback handler
+    # We need to make sure these are ahead of the makefile fallback handler
+    # and the pyproject.toml handler ahead of the setup.py handler
+    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
     handlers.append((PythonSetupPyRecipeHandler(), 70))
-- 
2.42.0


