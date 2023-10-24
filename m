Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BD5C25B6D
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:40:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.149465.1698158429711368571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MruO4j7k;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4083cd39188so35743585e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698158428; x=1698763228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItcQgBfUjVT6z9AgtopLXVF802NEDrxnfCNLnj+QcBQ=;
        b=MruO4j7kgClBEVO61ONL5qsCMfRJQDWZYm9dXf7QdZnlTNGuis3lcLKbgzQgsEEPXf
         D59XUCOF0+OyWYPz2vSCOO00GElm7AwC/G2I2s84TVgDw/qc0Im0rRjSWkzCCY1+DiTw
         LYIWJWIedD6MwYtZ/dURNA1V/yv/+opG4Ge80zuDHe7Y/odt5q0X1tyWt/JL/HP9bN4C
         CFkA+PKH+GdxzbG14TEZ8u7l7bURgCD4Pn9wBzqoHRLW8T1ehd47AmFKLNGbZpUnuzQj
         xHIH7HvkC5HSxr/p8X5WXtBzGofHl13LSrUC2VF0SIS58HTtTyEwX3e1NaezDK+N+GcI
         YPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158428; x=1698763228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItcQgBfUjVT6z9AgtopLXVF802NEDrxnfCNLnj+QcBQ=;
        b=J0yiuXFqeZnksu8L3DzlprbRVTDgF62jwgLq6zhkFQVbk7Z88wV3kc3GeIErYEILh3
         kxxXXmN8GacIvbHT5evCrkPl74tUNXP7iB7Xi0lfUGwidu1uW6VgX8yt4a/SYWhbuleE
         b7uqHqCvpYeDw8Vxg3UOaQh1R+wlI1Nx2Q87344FIEH3AzGENqbPsNNB6K3ojrnnPMox
         QiH8J6O//boG9DFy51Nt+xGySRw15zBKzpbdFk0Y5xHuaWji3vQW9hGaICron0exI0A+
         EiENH5N3Dot5BLicFc/3Yc9LV/zFuSsDArISqXRsEyyBGCV8DZjAEb0WBj+pM5GXHhY+
         NigA==
X-Gm-Message-State: AOJu0YxS8jMMtFzZeiT3+SwGd5YmzR36saa0mm+UOap+YO2zzRj/X5Ff
	Tjmit1D7bpSyQL5V2yDR0vbteemuBpsL5EzZJys+DA==
X-Google-Smtp-Source: AGHT+IHEAYoM+MmbRCo4xdBipk31mGwlP2BhSv5mueViKiAkwD1GGhlQpOEm1McFQXNJ1tArCPdOhw==
X-Received: by 2002:a05:600c:3555:b0:408:4e90:9a8 with SMTP id i21-20020a05600c355500b004084e9009a8mr9658504wmq.22.1698158427718;
        Tue, 24 Oct 2023 07:40:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b00401e32b25adsm12387271wms.4.2023.10.24.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:40:27 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 3/4] scripts:recipetool:create_buildsys_python: add PEP517 support
Date: Tue, 24 Oct 2023 16:40:20 +0200
Message-ID: <20231024144022.1532605-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024144022.1532605-1-jstephan@baylibre.com>
References: <20231024144022.1532605-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189651

Add basic support for PEP517 [1] for the 3 following backends that are
supported by bitbake:
  - setuptools.build_meta
  - poetry.core.masonry.api
  - flit_core.buildapi

If a pyproject.toml file is found, use it to create the recipe,
otherwise fallback to the old setup.py method.

Some projects can declare a minimal pyproject.toml file, and put all
the metadata in setup.py/setup.cfg/requirements.txt .. theses cases
are not handled. If a pyproject.toml file is found, assumes it has all
necessary metadata.

As for the old setup.py method, version numbers for dependencies are not
handled.

Some features may be missing, such as the extra dependencies.

[YOCTO #14737]

[1]: https://peps.python.org/pep-0517/

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../lib/recipetool/create_buildsys_python.py  | 268 +++++++++++++++++-
 1 file changed, 267 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 69f6f5ca511..9e7f22c0db0 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -656,6 +656,270 @@ class PythonSetupPyRecipeHandler(PythonRecipeHandler):
 
         handled.append('buildsystem')
 
+class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
+    """Base class to support PEP517 and PEP518
+
+    PEP517 https://peps.python.org/pep-0517/#source-trees
+    PEP518 https://peps.python.org/pep-0518/#build-system-table
+    """
+    # bitbake currently support the 3 following backends
+    build_backend_map = {
+        "setuptools.build_meta": "python_setuptools_build_meta",
+        "poetry.core.masonry.api": "python_poetry_core",
+        "flit_core.buildapi": "python_flit_core",
+    }
+
+    # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
+    # according to PEP-621: https://packaging.python.org/en/latest/specifications/declaring-project-metadata/#declaring-project-metadata
+    # while poetry uses the "tool.poetry" section according to its official documentation: https://python-poetry.org/docs/pyproject/
+    # keys from "project" and "tool.poetry" sections are almost the same except for the  HOMEPAGE which is "homepage" for tool.poetry
+    # and "Homepage" for "project" section. So keep both
+    bbvar_map = {
+        "name": "PN",
+        "version": "PV",
+        "Homepage": "HOMEPAGE",
+        "homepage": "HOMEPAGE",
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
+            try:
+                import tomllib
+            except ImportError:
+                try:
+                    import tomli as tomllib
+                except ImportError:
+                    logger.exception("Neither 'tomllib' nor 'tomli' could be imported. Please use python3.11 or above or install tomli module")
+                    return False
+                except Exception:
+                    logger.exception("Failed to parse pyproject.toml")
+                    return False
+
+            with open(setupscript, "rb") as f:
+                config = tomllib.load(f)
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
+
+            if build_backend == "poetry.core.masonry.api":
+                if "tool" in config and "poetry" in config["tool"]:
+                    metadata = config["tool"]["poetry"]
+            else:
+                if "project" in config:
+                    metadata = config["project"]
+
+            if metadata:
+                for field, values in metadata.items():
+                    if field == "license":
+                        # For setuptools.build_meta and flit, licence is a table
+                        # but for poetry licence is a string
+                        if build_backend == "poetry.core.masonry.api":
+                            value = values
+                        else:
+                            value = values.get("text", "")
+                            if not value:
+                                licfile = values.get("file", "")
+                                continue
+                    elif field == "dependencies" and build_backend == "poetry.core.masonry.api":
+                        # For poetry backend, "dependencies" section looks like:
+                        # [tool.poetry.dependencies]
+                        # requests = "^2.13.0"
+                        # requests = { version = "^2.13.0", source = "private" }
+                        # See https://python-poetry.org/docs/master/pyproject/#dependencies-and-dependency-groups for more details
+                        # This class doesn't handle versions anyway, so we just get the dependencies name here and construct a list
+                        value = []
+                        for k in values.keys():
+                            value.append(k)
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
+                        logger.debug("Mapped %s to %s" % (require, mapped))
+                        native_mapped_deps.add(mapped)
+                    else:
+                        logger.debug("Could not map %s" % require)
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
+                        logger.debug("Mapped %s to %s" % (dependency, mapped))
+                        mapped_deps.add(mapped)
+                    else:
+                        logger.debug("Could not map %s" % dependency)
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
+            logger.exception("Failed to correctly handle pyproject.toml, falling back to another method")
+            return False
+
+
 def gather_setup_info(fileobj):
     parsed = ast.parse(fileobj.read(), fileobj.name)
     visitor = SetupScriptVisitor()
@@ -769,5 +1033,7 @@ def has_non_literals(value):
 
 
 def register_recipe_handlers(handlers):
-    # We need to make sure this is ahead of the makefile fallback handler
+    # We need to make sure these are ahead of the makefile fallback handler
+    # and the pyproject.toml handler ahead of the setup.py handler
+    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
     handlers.append((PythonSetupPyRecipeHandler(), 70))
-- 
2.42.0


