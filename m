Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292D9FD4F24
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2663.1773168069370836584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4g2eDfP;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-464ba2bb3aeso143168b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168068; x=1773772868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GygUv99XXYXKewxHRq+dVr3zF/qZkskkMg0YO5XWbQU=;
        b=T4g2eDfPW8cYNKW1/g/HfHq2WIP29DthiWFAp7Asev7h8F2JjvxiZC/ULUgekXACjS
         /DAm0+LVxdBnOr+C+zuM6ua2E2Z5mWq69V1T9Gw7+lr21oy8By5DqEdeb03ht11/Yfvq
         t8FVoBJSwSavJKK1qpMPmXJBvDlzF2bAGsz2FeiCr/iQf7KGtfnyl4d1w3Y/3dUJLD5t
         +C0zcFqzrc2pXHaMPv2GeqLGxUAFzLq1wVGOelJFrXHhYBZ1YurE53YcGaPuIiyHxeka
         mIeY42rJPZmjgg46UPxFkR0zzUTF8zDiADg59ykWNjcgGPT3X2d6+k6goiQxVD/2e3IT
         n/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168068; x=1773772868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GygUv99XXYXKewxHRq+dVr3zF/qZkskkMg0YO5XWbQU=;
        b=oDClFR5fVnmSBJRugL1NsktZQI1zcpGa7vnIObHun87dt1G/hbsGzuc+oDPUcn+wvW
         8EilUJZrP+lQu6U2ep9Z5tyP/UQtydqGH7//M5hY3DsMUaca08Cv/dGXDjQal9/zgD8v
         Dm14kBxzrAlNpqXvevnSH6b7Zs9/tZbX2xqb6lYWykkIIe8iZV+N9XPvNJpE+kSSNm3D
         FrkJEHimjR5r39o4Vz0EI7rSphcrrn5FmASp1F1ujNYmFbMxuMveIT6J4N01ufwRjeow
         PFIFGszidOEZQis7bZqFwrfLvoRIdtvK/OOLt5JoFvpgiC8m0GVXbCenDNVpK2jsv8H2
         4ycQ==
X-Gm-Message-State: AOJu0Yzh10bhymDaBAA14JDCyOJ+O/iXqqocc7eAhfBeOa/0Tsta8BjD
	mGn3oA2piEVC9YWdz6nKWBQlk9fQBNvZvW0GGrgdVsZ+Qra3X5GJaBrYajwGPQ==
X-Gm-Gg: ATEYQzz+rGta4QG16qyVFTVda4k+q7TFBGDzTDSTDHz2Ya4HpaMsfOzw2mzyxc3Bh44
	8I98SBI1R0kZSPDRtl/heB4GTbwd5xLnbeN24Dxe2K0g5Dt3GQUoBi3AOpCg/BiW0NOn+VYxaN9
	DxwtO6w5LWtiYfBrVU0v9IQzIjGwrdOhp04jtTfeaBqEp2EfiITJmNZuyTjtVphkoA/EP7Yh52H
	T52NjcRG3Or4K0mJzdvOCRy9EJSLrJb2KfBBtCfEjIDdfjNWeWwCvjzrrhWIIQOJoK++5VFWrDC
	hgdCaFnP7yJTFv+qb8gKTUZYNDb2WGpwGccKuR6MnPoTLEwIngm172djpi8gRoivjM4GXcE1/qi
	d5UHrMPq0HJ+jzk8uyvOwgx6EF3sM6MRXnmMNDXics50wcmC3uEq2/KHy6z1T19G97fH5+NJgBf
	yS6gKO7xjDUnPAqlzLogOd
X-Received: by 2002:a05:6808:1990:b0:45c:85fa:5a3e with SMTP id 5614622812f47-4671bfb6b05mr2545745b6e.25.1773168068417;
        Tue, 10 Mar 2026 11:41:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 06/15] spdx30: Include patch file information in VEX
Date: Tue, 10 Mar 2026 12:38:26 -0600
Message-ID: <20260310184058.533343-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232817

Modifies the SPDX VEX output to include the patches that fix a
particular vulnerability. This is done by adding a `patchedBy`
relationship from the `VexFixedVulnAssessmentRelationship` to the `File`
that provides the fix.

If the file can be located without fetching (e.g. is a file:// in
SRC_URI), the checksum will be included.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 60 ++++++++++++++-------------
 meta/lib/oe/spdx30_tasks.py | 81 ++++++++++++++++++++++++++++---------
 2 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 50a72fce39..21f084dc16 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -620,37 +620,38 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 
-    def new_file(self, _id, name, path, *, purposes=[]):
-        sha256_hash = bb.utils.sha256_file(path)
+    def new_file(self, _id, name, path, *, purposes=[], hashfile=True):
+        if hashfile:
+            sha256_hash = bb.utils.sha256_file(path)
 
-        for f in self.by_sha256_hash.get(sha256_hash, []):
-            if not isinstance(f, oe.spdx30.software_File):
-                continue
+            for f in self.by_sha256_hash.get(sha256_hash, []):
+                if not isinstance(f, oe.spdx30.software_File):
+                    continue
 
-            if purposes:
-                new_primary = purposes[0]
-                new_additional = []
+                if purposes:
+                    new_primary = purposes[0]
+                    new_additional = []
 
-                if f.software_primaryPurpose:
-                    new_additional.append(f.software_primaryPurpose)
-                new_additional.extend(f.software_additionalPurpose)
+                    if f.software_primaryPurpose:
+                        new_additional.append(f.software_primaryPurpose)
+                    new_additional.extend(f.software_additionalPurpose)
 
-                new_additional = sorted(
-                    list(set(p for p in new_additional if p != new_primary))
-                )
+                    new_additional = sorted(
+                        list(set(p for p in new_additional if p != new_primary))
+                    )
 
-                f.software_primaryPurpose = new_primary
-                f.software_additionalPurpose = new_additional
+                    f.software_primaryPurpose = new_primary
+                    f.software_additionalPurpose = new_additional
 
-            if f.name != name:
-                for e in f.extension:
-                    if isinstance(e, OEFileNameAliasExtension):
-                        e.aliases.append(name)
-                        break
-                else:
-                    f.extension.append(OEFileNameAliasExtension(aliases=[name]))
+                if f.name != name:
+                    for e in f.extension:
+                        if isinstance(e, OEFileNameAliasExtension):
+                            e.aliases.append(name)
+                            break
+                    else:
+                        f.extension.append(OEFileNameAliasExtension(aliases=[name]))
 
-            return f
+                return f
 
         spdx_file = oe.spdx30.software_File(
             _id=_id,
@@ -661,12 +662,13 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             spdx_file.software_primaryPurpose = purposes[0]
             spdx_file.software_additionalPurpose = purposes[1:]
 
-        spdx_file.verifiedUsing.append(
-            oe.spdx30.Hash(
-                algorithm=oe.spdx30.HashAlgorithm.sha256,
-                hashValue=sha256_hash,
+        if hashfile:
+            spdx_file.verifiedUsing.append(
+                oe.spdx30.Hash(
+                    algorithm=oe.spdx30.HashAlgorithm.sha256,
+                    hashValue=sha256_hash,
+                )
             )
-        )
 
         return self.add(spdx_file)
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8fffbb085..aec47d4f81 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -568,44 +568,63 @@ def create_recipe_spdx(d):
     if include_vex != "none":
         patched_cves = oe.cve_check.get_patched_cves(d)
         for cve, patched_cve in patched_cves.items():
-            decoded_status = {
-                "mapping": patched_cve["abbrev-status"],
-                "detail": patched_cve["status"],
-                "description": patched_cve.get("justification", None),
-            }
+            mapping = patched_cve["abbrev-status"]
+            detail = patched_cve["status"]
+            description = patched_cve.get("justification", None)
+            resources = patched_cve.get("resource", [])
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-            if (
-                include_vex != "all"
-                and "detail" in decoded_status
-                and decoded_status["detail"]
-                in (
-                    "fixed-version",
-                    "cpe-stable-backport",
-                )
+            if include_vex != "all" and detail in (
+                "fixed-version",
+                "cpe-stable-backport",
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
                 continue
 
             spdx_cve = recipe_objset.new_cve_vuln(cve)
 
-            cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
+            cve_by_status.setdefault(mapping, {})[cve] = (
                 spdx_cve,
-                decoded_status["detail"],
-                decoded_status["description"],
+                detail,
+                description,
+                resources,
             )
 
     all_cves = set()
     for status, cves in cve_by_status.items():
         for cve, items in cves.items():
-            spdx_cve, detail, description = items
+            spdx_cve, detail, description, resources = items
             spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
 
             all_cves.add(spdx_cve)
 
             if status == "Patched":
-                recipe_objset.new_vex_patched_relationship([spdx_cve_id], [recipe])
+                spdx_vex = recipe_objset.new_vex_patched_relationship(
+                    [spdx_cve_id], [recipe]
+                )
+                patches = []
+                for idx, filepath in enumerate(resources):
+                    patches.append(
+                        recipe_objset.new_file(
+                            recipe_objset.new_spdxid(
+                                "patch", str(idx), os.path.basename(filepath)
+                            ),
+                            os.path.basename(filepath),
+                            filepath,
+                            purposes=[oe.spdx30.software_SoftwarePurpose.patch],
+                            hashfile=os.path.isfile(filepath),
+                        )
+                    )
+
+                if patches:
+                    recipe_objset.new_scoped_relationship(
+                        spdx_vex,
+                        oe.spdx30.RelationshipType.patchedBy,
+                        oe.spdx30.LifecycleScopeType.build,
+                        patches,
+                    )
+
             elif status == "Unpatched":
                 recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
             elif status == "Ignored":
@@ -751,12 +770,14 @@ def create_spdx(d):
 
     # Collect all VEX statements from the recipe
     vex_statements = {}
+    vex_patches = {}
     for rel in recipe_objset.foreach_filter(
         oe.spdx30.Relationship,
         relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
     ):
         for cve in rel.to:
             vex_statements[cve] = []
+            vex_patches[cve] = []
 
     for cve in vex_statements.keys():
         for rel in recipe_objset.foreach_filter(
@@ -764,6 +785,13 @@ def create_spdx(d):
             from_=cve,
         ):
             vex_statements[cve].append(rel)
+            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
+                for patch_rel in recipe_objset.foreach_filter(
+                    oe.spdx30.Relationship,
+                    relationshipType=oe.spdx30.RelationshipType.patchedBy,
+                    from_=rel,
+                ):
+                    vex_patches[cve].extend(patch_rel.to)
 
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
@@ -889,7 +917,9 @@ def create_spdx(d):
 
             # Add concluded license relationship if manually set
             # Only add when license analysis has been explicitly performed
-            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE:%s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
+            concluded_license_str = d.getVar(
+                "SPDX_CONCLUDED_LICENSE:%s" % package
+            ) or d.getVar("SPDX_CONCLUDED_LICENSE")
             if concluded_license_str:
                 concluded_spdx_license = add_license_expression(
                     d, build_objset, concluded_license_str, license_data
@@ -915,9 +945,20 @@ def create_spdx(d):
             for cve, vexes in vex_statements.items():
                 for vex in vexes:
                     if vex.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                        pkg_objset.new_vex_patched_relationship(
+                        spdx_vex = pkg_objset.new_vex_patched_relationship(
                             [oe.sbom30.get_element_link_id(cve)], [spdx_package]
                         )
+                        if vex_patches[cve]:
+                            pkg_objset.new_scoped_relationship(
+                                spdx_vex,
+                                oe.spdx30.RelationshipType.patchedBy,
+                                oe.spdx30.LifecycleScopeType.build,
+                                [
+                                    oe.sbom30.get_element_link_id(p)
+                                    for p in vex_patches[cve]
+                                ],
+                            )
+
                     elif vex.relationshipType == oe.spdx30.RelationshipType.affects:
                         pkg_objset.new_vex_unpatched_relationship(
                             [oe.sbom30.get_element_link_id(cve)], [spdx_package]
-- 
2.53.0


