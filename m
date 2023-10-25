Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FBCC25B6F
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:47:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.47148.1698248828406549875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iHn1IuGp;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3926933f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698248826; x=1698853626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItcQgBfUjVT6z9AgtopLXVF802NEDrxnfCNLnj+QcBQ=;
        b=iHn1IuGp2KFxo2WtA49U/Tyne6outrLE26yihBVnq10bgvGKgxw+pe1ETQL39ZKe8f
         BjwBRMB6PCkd20c0t6zZiFMqLOgO/0uIAgpBYXO+KPYY4RafN3FBWef8n6RCuj0h4/U2
         TY1rKkVm8aJSWybkH02ELvyGMUNGb3lS3wOpax0dP8hucJEgSFO+DjZxIpOJe2O3/k8C
         kR6uJF4MMPmP38O3WyDKcj3P/cTNlA4aaOloVQQr7kJFzRsFN+l33XhaogTorKNwNTGz
         DRCsJDJ7SPVWdb+5oZFWSNcyyMCH37ep79p5QgN6skcRDsEZf/cQIoeHQLnWBACTST61
         mtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248826; x=1698853626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItcQgBfUjVT6z9AgtopLXVF802NEDrxnfCNLnj+QcBQ=;
        b=P1ngL+2Icid57wwnIMP8Ae9olbNLCdp9eHgD1G9YUvVEl3A2JmLjKFBib1RtTC0KJN
         AU2z5wBlO9elTVn+k4/+KA9YmtE6vaZPsaJ2TWsRy6wO5zqyhAGNLMBRSJgy8+/vFy/h
         Hgg+sLTxyfMyUSl1uZhFBtvz86uK43aT0pxOvD6gENtC4x6Ke4qWtGrILCIyo3N+qZeb
         aF22wWSQ1M2KM1Va0tBA+Qqle00dbvb+zI96W/7eBqB4M3jWep/L1V1luXVby1pnnbOG
         u/BhP7GryE9M+QrD/geSfcW8AHcX649TLZPKGTnDUsvxi44PoxXzMsd4K1EXXHLDjL4K
         7QtQ==
X-Gm-Message-State: AOJu0Yz0qKSe7FN6oECzVVc4nAU9OObvZZIvTM5SR+tjgH7/bj9qLHMa
	b2FEzVS21FIu6/wTfiBvkkWF3Wrj74RqGdGafG/yrg==
X-Google-Smtp-Source: AGHT+IG9RZhq94rfCeoOanzhxMUXspaDAhR73HX4ARdLt1ljcJZ6Ivt+G+HknPvXtdCX96dpwUeEzg==
X-Received: by 2002:a5d:453a:0:b0:32d:96e0:8048 with SMTP id j26-20020a5d453a000000b0032d96e08048mr11968557wra.9.1698248826609;
        Wed, 25 Oct 2023 08:47:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm12301964wrn.87.2023.10.25.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:47:06 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 4/5] scripts:recipetool:create_buildsys_python: add PEP517 support
Date: Wed, 25 Oct 2023 17:46:58 +0200
Message-ID: <20231025154659.2442373-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025154659.2442373-1-jstephan@baylibre.com>
References: <20231025154659.2442373-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189685

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


