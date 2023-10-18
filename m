Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FA6CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 12:01:26 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.279505.1697630480327394058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 05:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EEnVjJzQ;
 spf=pass (domain: baylibre.com, ip: 209.85.167.52, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507962561adso7993107e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697630478; x=1698235278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zf3+mF+ADEXhiKuFNw47M820pdeUykGEqBItJp/P2ZM=;
        b=EEnVjJzQV2RJzxNGm5hYLkvMY+9s3N2E8gLxAjBf1uAf89N33Wt6jdH5rS/Qv7+aUU
         /HKtJ+kiwfBLARQT4b8sCkdDBNNh9VNqthuvFGqLgaGjXLyfZdb3B5DJuZKtRAhRHKxs
         D9PGxXENkZuKPgTdGqM3KoZTHQSqGtt5iQnJeunioOwfJpMTyBWx92i2hB96s03l44EX
         L5D5rgbamh5B15TXmQ3Ukrzjf1zGM0eat+bse0rOXLhiXLuJ897cTl/3jntA4YRbjdun
         ih9/D/A268sXFbn1j+8gvixEZXkNxo3armWKbrleIB1CMTd6CmiPwAuDd3aBhnKdPnSc
         M34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697630478; x=1698235278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zf3+mF+ADEXhiKuFNw47M820pdeUykGEqBItJp/P2ZM=;
        b=nk62iL8+eJ8LXOTMb4zFzjOspGG9nKkm3JFR2juHFfki1HtlHXgBumdvU8MnAiikmS
         nSuGZVTFG+mO4L7JnCOkMOTSCnGMIMcezdJSgO8M62IsuuLZTNFhSoUzxpQh5teaSeky
         AzKssKSSbsTU8DmMnYtlKAuydAEmaMObcaqRIoPDTTo/mMv0/u9dmhqX1vL2FdEymtS6
         b69VVeNIEU0HCZx4+5RctmvoNI3ikXu0x6CpaqASpsSbBYD9EBFdjsIzxN+gPWLioixj
         02ZlAbahhDuPRoKgl+blHe6jTvLdUkoHWSuPULn9rdOngEt21BatynhbGRory4mA3dnE
         cJVw==
X-Gm-Message-State: AOJu0YzHhDgkRkYXZC1LYyyYwbSTl3k57fpZK8Pb/qZwC/aGiymXJEPN
	LLZkQ64UdpiA1MMXjy1e0W6i23DiROu/E9ML4R9xzA==
X-Google-Smtp-Source: AGHT+IFQGK8ptK9W61I8b9aVjtyv2EYVqrfqusRxcs9bkxubcooU7j1bpjjCoeJr/jWQ5s5SkKCY4A==
X-Received: by 2002:ac2:4424:0:b0:4fe:db6:cb41 with SMTP id w4-20020ac24424000000b004fe0db6cb41mr3822980lfl.39.1697630478189;
        Wed, 18 Oct 2023 05:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j4-20020adfe504000000b0032da7454ebesm1960312wrm.79.2023.10.18.05.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:01:17 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 4/4] scripts:recipetool:create_buildsys_python: add PEP517 support
Date: Wed, 18 Oct 2023 14:01:14 +0200
Message-ID: <20231018120114.1222475-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018120114.1222475-1-jstephan@baylibre.com>
References: <20231018120114.1222475-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189387

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
2.41.0


