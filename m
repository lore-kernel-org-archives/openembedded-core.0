Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0DF109B475
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:20:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21555.1774966812189322104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aYWj5LGx;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo63608215e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774966810; x=1775571610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfxfoRuvoIv4ymhXRP1P38az+yVv2RGj0CtRfaifaMc=;
        b=aYWj5LGxPnmYkRVrKn3a7+WTa/3h2tOYz6JdlM/bzT1TYI9NpfGjyD0kLH3VigWYul
         MPXRN5oIgVzv2FAKtRD1xtgHBw6dbr5FX41CzLQ+zl0wtreIegkDm760x2WasFp9mi5l
         0SPa3S+HsdTh4nUozqa8In1y9Go2DibbqViPSzymL9xR+bO9k+Bok28tOzcyAFTC5Fxy
         qjeMt6Q/5I/iBqvhXjUOnfWhOqEwNeGkrCA/HazLcNFB+UjGk8FJ545pwm1Z+5uGcb0/
         ZioyJ9fjdusmlxm1C7zLX8sSAAZrfekrViEM5Hyd6t4K4Sro2+mXsgUDhfuM7uilKUlK
         uMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966810; x=1775571610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VfxfoRuvoIv4ymhXRP1P38az+yVv2RGj0CtRfaifaMc=;
        b=ADQEHJeHI/6iOOI29oE0NUkg/U+Q2Lj3ctiWUTcaPlgim6JDCGFJNEr3NTQnKTNe+D
         YYUMn9gCKhen0PGRZP8q8M5Etv0A5PljmMEN3KIdfcTUwV18lTg5ojTxyiKZTKLTeZZV
         ifVHAhHgOTv625ey2A2nqIGdINXgaMKQoQOvdKDL/gfIluC53QgJn3VZFXE1kbLEJ/ul
         9aZMX2edPFro/ivG9CatQcbEmObLJ0B2R8qfmTrqqe+5ZW+cL5O2LPlwLIl8FYa6yGzK
         bGT4psnIeIbLPB9kJzb6b4xpagHDkim9yAJcdqf0uV7AOHZBaAF7MYgvfeSC2FpQpr3m
         LzDA==
X-Gm-Message-State: AOJu0YzZVIbF/aCs0/I+mD81HGPNtptwlHw6ljqBhgZxP/Z5Zp1WGNsW
	VRXyIMMExwyjctbTHWJI96ivQs2470A4lrTrLKrawZjZKG1G1hxTjjDr88hn74U7IFY=
X-Gm-Gg: ATEYQzxalyYXBi4OofO2bLByx78YDvI2u135+oJQd/wZpBfSssvtABEztf56uvKmY+c
	Rle6OqTbsFeIOQ3RCKHVglJTh2Xy2b2xoSt4svqpP4Chq9MF2yWcCnHuX/YMxjd4kuhCWqzuKk+
	acVPJhjBkkN6gC55VVP+355pYEOD1t3iGvmbF7kGm7Do8yoKmbmC2oRoNym5P3WbxVIfAWTA8dL
	+bRFBx8b3QpWABsMWpaQNEfAvdeF306ubFnQmjpR+GDLfOi3CLv5WHtYXTszW8o5C9BpO02csGi
	cShuw/nOnANhoDGUNMT54fTJK+xfg/NOBPm5ny4Sxpzg78CwwZFCbVFBXzeYBJ/Fbgk8iDF2bl3
	YAvVNc4TTPPA9WRsMG9382Ac3ffCrJZJymKyBwObBkJ/Gnl30G/ArL2JM1u8JVXa7NSQjvq3ofw
	8OjzD0W3R0MpbKIWYrCKk9lLY5iIctfdpT+R2C6xINDt6lZK9567VRY08UZtOtVsLjdmYvCoYbq
	hEcpQ==
X-Received: by 2002:a05:600c:528d:b0:488:7f49:eae5 with SMTP id 5b1f17b1804b1-4887f49ed4bmr38704015e9.16.1774966810042;
        Tue, 31 Mar 2026 07:20:10 -0700 (PDT)
Received: from fedora (mob-194-230-144-65.cgn.sunrise.net. [194.230.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c536a7fsm40865415e9.1.2026.03.31.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:20:09 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	marta.rybczynska@syslinbit.com,
	benjamin.robin@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	stefano.tondo.ext@siemens.com
Subject: [RFC PATCH 1/2] spdx30: Add OpenVEX standalone document generation
Date: Tue, 31 Mar 2026 16:19:55 +0200
Message-ID: <20260331141956.608976-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331141956.608976-1-stondo@gmail.com>
References: <20260331141956.608976-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234292

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add OpenVEX document generation integrated into the SPDX 3.0 recipe-level
workflow. When enabled, standalone .vex.json files are generated alongside
SPDX documents for each recipe with CVE data.

Key changes:
- Add generate_openvex_from_spdx() and helper functions to spdx30_tasks.py
  that create OpenVEX documents from SPDX VEX assessment relationships
- Map SPDX VEX status to OpenVEX status (Patched->fixed, Unpatched->affected,
  Ignored->not_affected, Unknown->under_investigation)
- Extract product PURLs from SPDX packages with proper fallback chain
- Add VEX sstate copy in create_package_spdx() for sstate restore survival
- Add OPENVEX_GENERATE_STANDALONE, OPENVEX_AUTHOR, OPENVEX_ROLE variables
  to create-spdx-3.0.bbclass (default disabled)
- Add SSTATE_ALLOW_OVERLAP_FILES for DEPLOY_DIR_SPDX
- Document OpenVEX variables in spdx-common.bbclass

This implementation is designed to work with Joshua Watt's recipe-level
SPDX architecture where VEX data is created in create_recipe_spdx() with
the recipe_objset and 4-tuple cve_by_status format.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass |  19 +++
 meta/classes/spdx-common.bbclass     |  15 +++
 meta/lib/oe/spdx30_tasks.py          | 193 +++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 432adb14cd..0519f87c41 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] = "Controls what VEX information is in the output. Set to
     including those already fixed upstream (warning: This can be large and \
     slow)."
 
+OPENVEX_GENERATE_STANDALONE ??= "0"
+OPENVEX_GENERATE_STANDALONE[doc] = "Controls whether standalone OpenVEX .vex.json \
+    files are generated alongside SPDX documents. Set to '1' to enable. VEX data \
+    remains embedded in SPDX when SPDX_INCLUDE_VEX is not 'none' regardless."
+
+OPENVEX_AUTHOR ??= "Yocto Build System"
+OPENVEX_AUTHOR[doc] = "Author name for generated OpenVEX documents."
+
+OPENVEX_ROLE ??= "Build System"
+OPENVEX_ROLE[doc] = "Author role for generated OpenVEX documents."
+
 SPDX_INCLUDE_TIMESTAMPS ?= "0"
 SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
     useful if you want to know when artifacts were produced and when builds \
@@ -186,6 +197,9 @@ SPDX3_VAR_DEPS = "\
     SPDX_PROFILES \
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
+    OPENVEX_GENERATE_STANDALONE \
+    OPENVEX_AUTHOR \
+    OPENVEX_ROLE \
     "
 
 python do_create_recipe_spdx() {
@@ -223,6 +237,11 @@ SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
 do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
+
+# Allow VEX files to overlap between create_recipe_spdx and
+# create_package_spdx sstate. VEX is generated during create_recipe_spdx
+# and copied to create_package_spdx sstate to ensure it survives restore.
+SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_SPDX}"
 do_create_spdx[deptask] += "do_create_spdx"
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 40701730a6..c2960f04d2 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -82,6 +82,21 @@ SPDX_MULTILIB_SSTATE_ARCHS[doc] = "The list of sstate architectures to consider
     when collecting SPDX dependencies. This includes multilib architectures when \
     multilib is enabled. Defaults to SSTATE_ARCHS."
 
+OPENVEX_GENERATE_STANDALONE[doc] = "Controls whether standalone OpenVEX .vex.json \
+    files are generated in addition to VEX data embedded in SPDX documents. Set to \
+    '1' to enable standalone file generation. VEX data remains embedded in SPDX when \
+    SPDX_INCLUDE_VEX is not 'none' regardless of this setting. \
+    Default: '0' (disabled). Defined in create-spdx-3.0.bbclass."
+
+OPENVEX_AUTHOR[doc] = "Author name for generated OpenVEX documents. Identifies \
+    the person or organization that created the VEX document. \
+    Default: 'Yocto Build System'. Defined in create-spdx-3.0.bbclass."
+
+OPENVEX_ROLE[doc] = "Author role for generated OpenVEX documents. Describes the \
+    capacity in which the author is creating the VEX document (e.g., 'Build System', \
+    'Security Team', 'Maintainer'). Default: 'Build System'. \
+    Defined in create-spdx-3.0.bbclass."
+
 SPDX_FILE_EXCLUDE_PATTERNS ??= ""
 SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of Python regular \
     expressions to exclude files from SPDX output. Files whose paths match \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index cd9672c18e..ba9bef3105 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -790,9 +790,188 @@ def create_recipe_spdx(d):
             sorted(list(all_cves)),
         )
 
+    # Generate standalone OpenVEX document from recipe VEX data
+    generate_openvex_from_spdx(d, recipe_objset, deploydir, cve_by_status)
+
     oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
 
 
+def generate_openvex_from_spdx(d, objset, deploydir, cve_by_status=None):
+    """
+    Generate OpenVEX document from SPDX 3.0.1 in-memory data structure.
+
+    Called from create_recipe_spdx() where CVE/VEX data originates,
+    leveraging the cve_by_status dict for accurate status mapping.
+    """
+    import json
+    import hashlib
+    from datetime import datetime, timezone
+
+    generate_standalone = d.getVar("OPENVEX_GENERATE_STANDALONE")
+    if generate_standalone != "1":
+        return
+
+    include_vex = d.getVar("SPDX_INCLUDE_VEX")
+    if include_vex == "none":
+        return
+
+    statements = []
+
+    if cve_by_status:
+        # Use cve_by_status dict directly (preferred path)
+        for status_key, cves in cve_by_status.items():
+            for cve_id, items in cves.items():
+                spdx_cve, detail, description, resources = items
+
+                statement = _make_vex_statement(d, objset, cve_id, status_key,
+                                                detail, description)
+                if statement:
+                    statements.append(statement)
+    else:
+        # Fallback: extract from VEX assessment relationships in objset
+        for obj in objset.foreach_type(oe.spdx30.security_Vulnerability):
+            cve_id = _get_cve_id(obj)
+            status, detail, description = _get_vex_status_from_relationships(
+                objset, obj
+            )
+            statement = _make_vex_statement(d, objset, cve_id, status,
+                                            detail, description)
+            if statement:
+                statements.append(statement)
+
+    if not statements:
+        bb.debug(1, "No vulnerabilities found in %s, skipping OpenVEX" % d.getVar("PN"))
+        return
+
+    author = d.getVar("OPENVEX_AUTHOR") or "Yocto Build System"
+    role = d.getVar("OPENVEX_ROLE") or "Build System"
+
+    statements_json = json.dumps(statements, sort_keys=True)
+    doc_id = hashlib.sha256(statements_json.encode()).hexdigest()[:16]
+
+    openvex_doc = {
+        "@context": "https://openvex.dev/ns/v0.2.0",
+        "@id": "https://openvex.dev/docs/yocto/vex-%s" % doc_id,
+        "author": author,
+        "role": role,
+        "timestamp": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z"),
+        "version": 1,
+        "statements": statements,
+    }
+
+    # Write VEX to sstate staging area (deploydir) so it is included in
+    # the do_create_recipe_spdx sstate output and survives sstate restore.
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    pkg_name = d.getVar("PN")
+    openvex_file = deploydir / pkg_arch / "recipes" / ("%s.vex.json" % pkg_name)
+
+    openvex_file.parent.mkdir(parents=True, exist_ok=True)
+
+    try:
+        with open(openvex_file, "w") as f:
+            json.dump(openvex_doc, f, indent=2)
+        bb.debug(1, "Created OpenVEX document: %s (%d statements)" % (
+            openvex_file, len(statements)))
+    except Exception as e:
+        bb.warn("Failed to write OpenVEX file %s: %s" % (openvex_file, e))
+
+
+def _get_cve_id(vuln_obj):
+    """Extract CVE ID from vulnerability external identifiers."""
+    for ext_id in vuln_obj.externalIdentifier:
+        if ext_id.identifier and ext_id.identifier.startswith("CVE-"):
+            return ext_id.identifier
+    return "Unknown"
+
+
+def _get_vex_status_from_relationships(objset, vuln_obj):
+    """Extract VEX status from SPDX assessment relationships (fallback path)."""
+    vuln_link = oe.sbom30.get_element_link_id(vuln_obj)
+
+    for rel in objset.foreach_type(oe.spdx30.security_VexVulnAssessmentRelationship):
+        if vuln_link in rel.to or vuln_link in rel.from_:
+            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
+                return "Patched", None, None
+            elif rel.relationshipType == oe.spdx30.RelationshipType.affects:
+                return "Unpatched", None, None
+            elif rel.relationshipType == oe.spdx30.RelationshipType.doesNotAffect:
+                desc = getattr(rel, "security_impactStatement", None)
+                return "Ignored", None, desc
+
+    return "Unknown", None, None
+
+
+def _make_vex_statement(d, objset, cve_id, status_key, detail, description):
+    """Create an OpenVEX statement dict from CVE status information."""
+    products = _extract_products(d, objset)
+
+    status_map = {
+        "Patched": "fixed",
+        "Unpatched": "affected",
+        "Ignored": "not_affected",
+        "Unknown": "under_investigation",
+    }
+    status = status_map.get(status_key, "affected")
+
+    statement = {
+        "vulnerability": {"name": cve_id},
+        "products": products,
+        "status": status,
+    }
+
+    if status == "fixed" and detail:
+        statement["status_notes"] = "Patched: %s" % detail
+
+    if status == "affected" and detail:
+        statement["status_notes"] = "Unpatched: %s" % detail
+        statement["action_statement"] = (
+            "This vulnerability is not yet patched. Consider updating "
+            "to a newer version or applying a backport patch."
+        )
+
+    if status == "not_affected":
+        statement["justification"] = "vulnerable_code_not_in_execute_path"
+        if description:
+            statement["impact_statement"] = description
+
+    if status == "under_investigation":
+        statement["status_notes"] = "CVE status is unknown or under investigation"
+
+    return statement
+
+
+def _extract_products(d, objset):
+    """Extract product identifiers (PURLs) from SPDX objset."""
+    products = []
+
+    for pkg in objset.foreach_type(oe.spdx30.software_Package):
+        if hasattr(pkg, "software_packageUrl") and pkg.software_packageUrl:
+            products.append({"@id": pkg.software_packageUrl})
+            continue
+
+        for ext_id in pkg.externalIdentifier:
+            if (
+                ext_id.externalIdentifierType
+                == oe.spdx30.ExternalIdentifierType.packageUrl
+            ):
+                products.append({"@id": ext_id.identifier})
+                break
+
+    # Fallback: generate PURL from recipe metadata
+    if not products:
+        recipe_purl = oe.purl.get_base_purl(d)
+        if recipe_purl:
+            products.append({"@id": "%s?type=source" % recipe_purl})
+        else:
+            doc_id = oe.sbom30.get_element_link_id(objset.doc)
+            if doc_id:
+                products.append({"@id": doc_id})
+            else:
+                products.append({"@id": "urn:spdx:unknown"})
+
+    return products
+
+
 def load_recipe_spdx(d):
 
     return oe.sbom30.find_root_obj_in_jsonld(
@@ -1133,6 +1312,20 @@ def create_package_spdx(d):
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
+    # Copy VEX file from create_recipe_spdx deploy output to
+    # create_package_spdx sstate input as a secondary capture path.
+    # The primary path is via create_recipe_spdx sstate, but this
+    # ensures VEX files are also available if create_package_spdx
+    # sstate is restored independently.
+    import shutil
+    pn = d.getVar("PN")
+    vex_src = deploy_dir_spdx / pkg_arch / "recipes" / ("%s.vex.json" % pn)
+    if vex_src.exists():
+        vex_dest = deploydir / pkg_arch / "recipes" / ("%s.vex.json" % pn)
+        vex_dest.parent.mkdir(parents=True, exist_ok=True)
+        shutil.copy2(str(vex_src), str(vex_dest))
+        bb.debug(1, "Copied VEX file to sstate: %s" % vex_dest)
+
     if get_is_native(d):
         return
 
-- 
2.53.0


