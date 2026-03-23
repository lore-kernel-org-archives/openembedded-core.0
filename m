Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D18F4613C
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 21:08:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5651.1774300073996444874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 14:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cTmTeGUw;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fe655187so42323455e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774300072; x=1774904872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFrTdq6KPRDe3vHhYtrnDo7un5Va8725ATZO+n9qHp8=;
        b=cTmTeGUwX8B6MdRsGsHP+ID7OSGPeIi4E37Xc4V6s4MkE10SFxs1fodYOoQaYVH6iQ
         voI39Z4B0Bllmed0jLMq3GzFHnM2TpOVDfS+vcqjQrgIzZHvUiefYvJbaifOO/KE/GAc
         kCAV29m+0TTe+amkg0PWGD1Fz3knGqqwGspSOudEVPZ0FMf8HB3+UYmRH9estaERJ/zS
         wwYljkjnIgUeUqi5OtBPVqOJmJPmo5lWcIAIue853M/tVp1uvbZ5Lgk+2JOzhf98NTZe
         I8i20+5hdbqIEujeMlSOaCvPGDhtdkBndSLDaF3CmiwI/9aaR24csDsflyyy5ruHXAdr
         k3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300072; x=1774904872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFrTdq6KPRDe3vHhYtrnDo7un5Va8725ATZO+n9qHp8=;
        b=j/NJz4CNVkYqk7Y2fgoYYMDSo7HqQlTMJYyvUMbLtTtT3ZrZBHviiEj8rgpVnKwIWq
         voFvYzocI/LH4sVinLxx+MIiKGUE7hV8fxXBlxX4BS2zJ4oIkcvdow6SPGxTk05BdNVN
         Jeh74q/Ptf76YrE0b7JV7ZqWtAgndE9r5rVu/JaUjjwEmbsj/KyUTwcuM1RqpgoA55a8
         uf133sxgavFccwdUNP18hO26APaVYgcExYJQtUfMtOibdvXc6G0OszoQeL9TyjrTSaiH
         /6M6raT/pTx3xOz8V05+Cd1Fr42PYz9nPUaoxv8R9YrEShDP9Dc09DebvrO0+DQquuBg
         QYag==
X-Gm-Message-State: AOJu0YzXKT0pqGHcn2C2HyQSWAjDLoBPLapfO1H1lfW8/Vp8lCvIr+0/
	v7KMhSXFS2BpkflH36oTANPxgoUwXAiQ9n1owNafom0r3R+qANroBaRALrF5BnaD
X-Gm-Gg: ATEYQzx6NdlNhGPY+0/ouft1F8FKS1nINBfjwwkQkOaypva2Hrdtt6Lr5RcLSr4FAON
	UfVyerfXhy7oJS2goHComiK/+jGr5yR4dKHO/TeeGeAkDH0G4JCWGNQ76QLmiSL0HZ2da9TEA79
	ViNxifcTTfONRkMpIldWVJCSkAyRuQ/aD24cmacbvwVmX/7zoVjgdEIop4twGZxkUDXcDm3gRe9
	UKii1S0u4pJIJZsgMardomxcMf43O86fiMjEQDFi5k7VxX1mmk0Vmy49vbdHPUEqtp4h901YB87
	XV+umz1b6ij6N5VlvS9jDYI1/qqNa3P868z2/xC6uv6fGf2uT0NaQakBziJsfM9IzJEPMmXWWkG
	MZo/5dRnBNojBfZZtiuby3Nx2+p430Tr22HUHlC3tqgAIUToOuHODMiQD+VJHfI7mvXaLe7iJC0
	M5UA7IDCvYQkD1AvbOSS3ZG4FDznNUD2ikJxS+wGUX9jo9XDUljts+
X-Received: by 2002:a05:600d:8401:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-486fee297demr152148965e9.29.1774300071816;
        Mon, 23 Mar 2026 14:07:51 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113c4eb3sm853495e9.0.2026.03.23.14.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:07:50 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v13 3/4] spdx30: Enrich source downloads with version and PURL
Date: Mon, 23 Mar 2026 22:07:44 +0100
Message-ID: <20260323210745.1337169-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 21:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233766

Add version extraction, PURL generation, and external references
to source download packages in SPDX 3.0 SBOMs:

- Extract version from SRCREV for Git sources (full SHA-1)
- Generate PURLs for Git sources on github.com by default
- Support custom mappings via SPDX_GIT_PURL_MAPPINGS variable
  (format: "domain:purl_type", split(':', 1) for parsing)
- Use ecosystem PURLs from SPDX_PACKAGE_URLS for non-Git
- Add VCS external references for Git downloads
- Add distribution external references for tarball downloads
- Parse Git URLs using urllib.parse
- Extract logic into _generate_git_purl() and
  _enrich_source_package() helpers

For non-Git sources, version is not set from PV since the recipe
version does not necessarily reflect the version of individual
downloaded files. Ecosystem PURLs (which include version) from
SPDX_PACKAGE_URLS are still used when available.

The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
generation for self-hosted Git services (e.g., GitLab).
github.com is always mapped to pkg:github by default.

Add ecosystem-specific SPDX_PACKAGE_URLS to recipe classes:
- cargo_common.bbclass: pkg:cargo
- cpan.bbclass: pkg:cpan (with prefix stripping)
- go-mod.bbclass: pkg:golang
- npm.bbclass: pkg:npm (with prefix stripping)
- pypi.bbclass: pkg:pypi (with normalization)

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 ++
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/create-spdx-3.0.bbclass     |   7 +
 meta/lib/oe/spdx30_tasks.py              | 175 +++++++++++++++++------
 7 files changed, 172 insertions(+), 43 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index bc44ad7918..0d3edfe4a7 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
 # https://github.com/rust-lang/libc/issues/3223
 # https://github.com/rust-lang/libc/pull/3175
 INSANE_SKIP:append = " 32bit-time"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:cargo/${BPN}@${PV} "
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index bb76a5b326..dbf44da9d2 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -68,4 +68,15 @@ cpan_do_install () {
 	done
 }
 
+# Generate ecosystem-specific Package URL for SPDX
+def cpan_spdx_name(d):
+    bpn = d.getVar('BPN')
+    if bpn.startswith('perl-'):
+        return bpn[5:]
+    elif bpn.startswith('libperl-'):
+        return bpn[8:]
+    return bpn
+
+SPDX_PACKAGE_URLS =+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index a15dda8f0e..5b3cb2d8b9 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -32,3 +32,9 @@ do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
 # Make go install unpack the module zip files in the module cache directory
 # before the license directory is polulated with license files.
 addtask do_compile before do_populate_lic
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:golang/${GO_IMPORT}@${PV} "
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:golang/${GO_IMPORT}@${PV} "
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 344e8b4bec..7bb791d543 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -354,4 +354,11 @@ FILES:${PN} += " \
     ${nonarch_libdir} \
 "
 
+# Generate ecosystem-specific Package URL for SPDX
+def npm_spdx_name(d):
+    bpn = d.getVar('BPN')
+    return bpn[5:] if bpn.startswith('node-') else bpn
+
+SPDX_PACKAGE_URLS =+ "pkg:npm/${@npm_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 9d46c035f6..e2d054af6d 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -43,7 +43,8 @@ SECTION = "devel/python"
 SRC_URI:prepend = "${PYPI_SRC_URI} "
 S = "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_PYPI_PACKAGE ?= "${PYPI_PACKAGE}"
+# Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
+UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
 
 # Use the simple repository API rather than the potentially unstable project URL
 # More information on the pypi API specification is avaialble here:
@@ -54,3 +55,6 @@ UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 9a6606dce6..265dc525bc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -156,6 +156,13 @@ SPDX_RECIPE_SBOM_NAME ?= "${PN}-recipe-sbom"
 SPDX_RECIPE_SBOM_NAME[doc] = "The name of output recipe SBoM when using \
     create_recipe_sbom"
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
+    mappings to configure PURL generation for Git source downloads. \
+    For example, "gitlab.example.com:pkg:gitlab" maps repositories hosted \
+    on gitlab.example.com to the pkg:gitlab PURL type. \
+    github.com is always mapped to pkg:github by default."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 62a00069df..6f0bdba975 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -14,6 +14,7 @@ import oe.spdx_common
 import oe.sdk
 import os
 import re
+import urllib.parse
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -384,6 +385,120 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
+def _generate_git_purl(d, download_location, srcrev):
+    """Generate a Package URL for a Git source from its download location.
+
+    Parses the Git URL to identify the hosting service and generates the
+    appropriate PURL type. Supports github.com by default and custom
+    mappings via SPDX_GIT_PURL_MAPPINGS.
+
+    Returns the PURL string or None if no mapping matches.
+    """
+    if not download_location or not download_location.startswith('git+'):
+        return None
+
+    git_url = download_location[4:]  # Remove 'git+' prefix
+
+    # Default handler: github.com
+    git_purl_handlers = {
+        'github.com': 'pkg:github',
+    }
+
+    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
+    # Format: "domain1:purl_type1 domain2:purl_type2"
+    custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+    if custom_mappings:
+        for mapping in custom_mappings.split():
+            parts = mapping.split(':', 1)
+            if len(parts) == 2:
+                git_purl_handlers[parts[0]] = parts[1]
+                bb.debug(2, f"Added custom Git PURL mapping: {parts[0]} -> {parts[1]}")
+            else:
+                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+
+    try:
+        parsed = urllib.parse.urlparse(git_url)
+    except Exception:
+        return None
+
+    hostname = parsed.hostname
+    if not hostname:
+        return None
+
+    for domain, purl_type in git_purl_handlers.items():
+        if hostname == domain:
+            path = parsed.path.strip('/')
+            path_parts = path.split('/')
+            if len(path_parts) >= 2:
+                owner = path_parts[0]
+                repo = path_parts[1].replace('.git', '')
+                return f"{purl_type}/{owner}/{repo}@{srcrev}"
+            break
+
+    return None
+
+
+def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+    """Enrich a source download package with version, PURL, and external refs.
+
+    Extracts version from SRCREV for Git sources, generates PURLs for
+    known hosting services, and adds external references for VCS,
+    distribution URLs, and homepage.
+    """
+    version = None
+    purl = None
+
+    if fd.type == "git":
+        # Use full SHA-1 from fd.revision
+        srcrev = getattr(fd, 'revision', None)
+        if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}:
+            version = srcrev
+
+        # Generate PURL for Git hosting services
+        download_location = getattr(dl, 'software_downloadLocation', None)
+        if version and download_location:
+            purl = _generate_git_purl(d, download_location, version)
+    else:
+        # Use ecosystem PURL from SPDX_PACKAGE_URLS if available
+        package_urls = (d.getVar('SPDX_PACKAGE_URLS') or '').split()
+        for url in package_urls:
+            if not url.startswith('pkg:yocto'):
+                purl = url
+                break
+
+    if version:
+        dl.software_packageVersion = version
+
+    if purl:
+        dl.software_packageUrl = purl
+
+    # Add external references
+    download_location = getattr(dl, 'software_downloadLocation', None)
+    if download_location and isinstance(download_location, str):
+        dl.externalRef = dl.externalRef or []
+
+        if download_location.startswith('git+'):
+            # VCS reference for Git repositories
+            git_url = download_location[4:]
+            if '@' in git_url:
+                git_url = git_url.split('@')[0]
+
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.vcs,
+                    locator=[git_url],
+                )
+            )
+        elif download_location.startswith(('http://', 'https://', 'ftp://')):
+            # Distribution reference for tarball/archive downloads
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.altDownloadLocation,
+                    locator=[download_location],
+                )
+            )
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -447,10 +562,14 @@ def add_download_files(d, objset):
                 )
             )
 
+            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-                    expected_checksum = getattr(fd, "%s_expected" % checksum_id, None)
+                    expected_checksum = getattr(
+                        fd, "%s_expected" % checksum_id, None
+                    )
                     if expected_checksum is None:
                         continue
 
@@ -506,7 +625,6 @@ def get_is_native(d):
 
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     pn = d.getVar("PN")
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
@@ -541,20 +659,6 @@ def create_recipe_spdx(d):
 
     set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
 
-    # TODO: This doesn't work before do_unpack because the license text has to
-    # be available for recipes with NO_GENERIC_LICENSE
-    # recipe_spdx_license = add_license_expression(
-    #    d,
-    #    recipe_objset,
-    #    d.getVar("LICENSE"),
-    #    license_data,
-    # )
-    # recipe_objset.new_relationship(
-    #    [recipe],
-    #    oe.spdx30.RelationshipType.hasDeclaredLicense,
-    #    [oe.sbom30.get_element_link_id(recipe_spdx_license)],
-    # )
-
     if val := d.getVar("HOMEPAGE"):
         recipe.software_homePage = val
 
@@ -588,7 +692,6 @@ def create_recipe_spdx(d):
             sorted(oe.sbom30.get_element_link_id(dep) for dep in dep_recipes),
         )
 
-    # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
         patched_cves = oe.cve_check.get_patched_cves(d)
@@ -598,8 +701,6 @@ def create_recipe_spdx(d):
             description = patched_cve.get("justification", None)
             resources = patched_cve.get("resource", [])
 
-            # If this CVE is fixed upstream, skip it unless all CVEs are
-            # specified.
             if include_vex != "all" and detail in (
                 "fixed-version",
                 "cpe-stable-backport",
@@ -692,7 +793,6 @@ def create_recipe_spdx(d):
 
 
 def load_recipe_spdx(d):
-
     return oe.sbom30.find_root_obj_in_jsonld(
         d,
         "static",
@@ -717,10 +817,8 @@ def create_spdx(d):
 
     pn = d.getVar("PN")
     deploydir = Path(d.getVar("SPDXDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
     is_native = get_is_native(d)
 
     recipe, recipe_objset = load_recipe_spdx(d)
@@ -783,7 +881,6 @@ def create_spdx(d):
     dep_objsets, dep_builds = collect_dep_objsets(
         d, direct_deps, "builds", "build-", oe.spdx30.build_Build
     )
-
     if dep_builds:
         build_objset.new_scoped_relationship(
             [build],
@@ -919,9 +1016,7 @@ def create_spdx(d):
 
             # Add concluded license relationship if manually set
             # Only add when license analysis has been explicitly performed
-            concluded_license_str = d.getVar(
-                "SPDX_CONCLUDED_LICENSE:%s" % package
-            ) or d.getVar("SPDX_CONCLUDED_LICENSE")
+            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE:%s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
             if concluded_license_str:
                 concluded_spdx_license = add_license_expression(
                     d, build_objset, concluded_license_str, license_data
@@ -1011,13 +1106,12 @@ def create_spdx(d):
                 status = "enabled" if feature in enabled else "disabled"
                 build.build_parameter.append(
                     oe.spdx30.DictionaryEntry(
-                        key=f"PACKAGECONFIG:{feature}", value=status
+                        key=f"PACKAGECONFIG:{feature}",
+                        value=status
                     )
                 )
 
-            bb.note(
-                f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled"
-            )
+            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
 
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
 
@@ -1025,9 +1119,7 @@ def create_spdx(d):
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-
     direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
-
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
@@ -1205,15 +1297,15 @@ def write_bitbake_spdx(d):
 def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None):
     import oe.sbom30
 
-    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
-
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_package_spdx")
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
 
     build_deps = set()
+    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            bb.note(f"Unable to find SPDX provider for '{name}'")
+            missing_providers.add(name)
             continue
 
         pkg_name, pkg_hashfn = providers[name]
@@ -1232,6 +1324,11 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
             for h, f in pkg_objset.by_sha256_hash.items():
                 files_by_hash.setdefault(h, set()).update(f)
 
+    if missing_providers:
+        bb.fatal(
+            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
+        )
+
     if build_deps:
         objset.new_scoped_relationship(
             [build],
@@ -1390,6 +1487,7 @@ def create_image_spdx(d):
 
                 set_timestamp_now(d, a, "builtTime")
 
+
         if artifacts:
             objset.new_scoped_relationship(
                 [image_build],
@@ -1583,10 +1681,3 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
-    sbom_name = d.getVar("SPDX_RECIPE_SBOM_NAME")
-
-    recipe, recipe_objset = load_recipe_spdx(d)
-
-    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
-
-    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
-- 
2.53.0


