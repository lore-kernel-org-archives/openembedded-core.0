Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FC2E67A8A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23110.1772642926077884454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=grFsEOIW;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40fb2789476so1812205fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642925; x=1773247725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=grFsEOIWpfsQOTPKiV+Qib05asz9WnFHQZYrjcMP1tZx40nWOcvsrn+1WbYwuFSWol
         gBd5KMD8Ko3EPmvNHqamCPnZAcImmc4AhUbzKxLNUuspJ2VXNa6RVZLVUFhahBe5NPkB
         g8MMfQAbCnULtW4UusAgTaklg2KPNTfln3+hc89qPaPF2TwzWIT/KA71Xie98k59zPgS
         pfFF1KNeFGKqquvMegSI/yfP+r9y01DcPh7e1PNfzrc6M86VTBuvpz5T2IpQMOhE6jR+
         N4dcdZwO43dX/pFSAilQWk1f7kpC0+wUJZyqSJtVMMi3PsjTv+D/05Zs2ywKkt3QIAh/
         884g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642925; x=1773247725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=o5aigUKNB5rmjoqqI6YYtUwECSxvxVwAdq5fVrMkaE6g18PRMR5tQyuiYRk5d6LP5g
         h8baynWlGPmf7isvg2C1Os2r2VKhrHT4/Ysat8OHdZkx13fR1GjPhAGDFHWLrH7xBRjx
         xQDXPn8CRm/xxqkIOBIhdLpDLqihUAzCT47qfIy+zVo+ZBZvKHny8zIPY/1RrqwH1d6y
         DSE2inZuAj+YeBkmOdzDQ/PBJjBTWtrQELA1fDp8lgw7bcNlmNBHaNk/GeTGquMcMF0N
         b8kcpiJDEl1qK4pllrmaapTcXI5lHTuJeU2Zl09x8TENsUPquXQpQBT5+ptEcitiLOCE
         Oj8g==
X-Gm-Message-State: AOJu0Yxo0vfD1xFGfnjMzySZMb2FyPn2HXJlETOU5fdYo9fnad0LJ7hL
	/dWTUqkyyud2lmomQRXpYkexO47k0F9KzaMiUmggTqjZPVyIWkVYpSGb1CY9Ow==
X-Gm-Gg: ATEYQzzO0gN5rLt9kqcZZQKe1wJZQrDxunp/AtYFKeJ+ABZP60e0wovueYn7mgSDnxt
	mQ13/j+Ppq8hiVhnIRpsEzQIMTgbRiy3yTGN0ROVaMbYftJzFD/nMose7L+IInilu0Fd/ZOCoMe
	vdrmrx2sflUpCqZ3ouii/Swz6BWU552VUU5ruVLk450BU8WFK2awdnjAerikeR/7YiFtQbUmRah
	8qbXkV60fpUzWiNEuX9u3Zd9tIVP3u+3TuakbMyz3r4NM/oqZdz0bn1Pct/4+7iRGxFDD5OU9yQ
	ANvOUxCjDd12RB/MvHZGKOV+Fm3zR1+rCUs7FJ4pkv0tygBOHqXF914p6ZxvauQK9rZDYuRTypU
	2Qz5AClva2qQwHFmC5aKMEQ21qLS6Wagjq9X3zyyF6dwtHvfqHkmzhI2YdP9bFwPJ3rh+X/Evx5
	3fmPWtL1vvITL4QUlRdP6ySu9xL1ak8eE=
X-Received: by 2002:a05:6870:21cc:b0:40e:f203:eb4d with SMTP id 586e51a60fabf-41691d7bea9mr3395784fac.2.1772642924854;
        Wed, 04 Mar 2026 08:48:44 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 09/13] spdx30: Skip install package CVE information
Date: Wed,  4 Mar 2026 09:44:20 -0700
Message-ID: <20260304164835.3072507-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232398

Skips adding the install package CVE information by default. This
information grows exponentially, since it ends up be N_CVES *
N_PACKAGES. The CVE information for a given installed package can be
determined by following the "generates" link between the install package
and the recipe and looking at the CVE information for the recipe,
meaning that the CVE information is only included once in the SPDX
document.

If users still need the legacy method of including CVE information for
each package, then then can set SPDX_PACKAGE_INCLUDE_VEX = "1"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
 meta/lib/oe/spdx30_tasks.py          | 39 ++++++++++++++--------------
 meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
 3 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c3ea95b8bc..88b7ef9f42 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] = "Controls what VEX information is in the output. Set to
     including those already fixed upstream (warning: This can be large and \
     slow)."
 
+SPDX_PACKAGE_INCLUDE_VEX ?= "0"
+SPDX_PACKAGE_INCLUDE_VEX[doc] = "Link VEX information to the binary package outputs. \
+    Normally, VEX information is only linked to the common recipe that `generates` the \
+    binary packages, but setting this to '1' will cause it to also be linked into the \
+    generated binary packages. This is off by default because linking the VEX data to \
+    each package causes the SPDX output to grow very large, and the same information \
+    can be determined by following the `generates` relationship back to the recipe. \
+    Before recipe packages were introduced, this was the only way VEX data was \
+    expressed; you may need to enable this if your downstream tools do not \
+    understand how to trace back to the recipe to find VEX information."
+
 SPDX_INCLUDE_TIMESTAMPS ?= "0"
 SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
     useful if you want to know when artifacts were produced and when builds \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index aec47d4f81..887fac813a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -771,27 +771,28 @@ def create_spdx(d):
     # Collect all VEX statements from the recipe
     vex_statements = {}
     vex_patches = {}
-    for rel in recipe_objset.foreach_filter(
-        oe.spdx30.Relationship,
-        relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-    ):
-        for cve in rel.to:
-            vex_statements[cve] = []
-            vex_patches[cve] = []
-
-    for cve in vex_statements.keys():
+    if (d.getVar("SPDX_PACKAGE_INCLUDE_VEX") or "") == "1":
         for rel in recipe_objset.foreach_filter(
-            oe.spdx30.security_VexVulnAssessmentRelationship,
-            from_=cve,
+            oe.spdx30.Relationship,
+            relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
         ):
-            vex_statements[cve].append(rel)
-            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                for patch_rel in recipe_objset.foreach_filter(
-                    oe.spdx30.Relationship,
-                    relationshipType=oe.spdx30.RelationshipType.patchedBy,
-                    from_=rel,
-                ):
-                    vex_patches[cve].extend(patch_rel.to)
+            for cve in rel.to:
+                vex_statements[cve] = []
+                vex_patches[cve] = []
+
+        for cve in vex_statements.keys():
+            for rel in recipe_objset.foreach_filter(
+                oe.spdx30.security_VexVulnAssessmentRelationship,
+                from_=cve,
+            ):
+                vex_statements[cve].append(rel)
+                if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
+                    for patch_rel in recipe_objset.foreach_filter(
+                        oe.spdx30.Relationship,
+                        relationshipType=oe.spdx30.RelationshipType.patchedBy,
+                        from_=rel,
+                    ):
+                        vex_patches[cve].extend(patch_rel.to)
 
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index efee0214fc..f1ea2694cf 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -429,3 +429,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 value, ["enabled", "disabled"],
                 f"Unexpected PACKAGECONFIG value '{value}' for {key}"
             )
+
+    def test_package_vex(self):
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx.json",
+            extraconf="""\
+                SPDX_PACKAGE_INCLUDE_VEX = "1"
+                """,
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.53.0


