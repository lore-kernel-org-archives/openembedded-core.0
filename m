Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0528EB3653
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7691.1772498762122881880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzKU6Yt7;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-463208653d6so4079259b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498761; x=1773103561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=hzKU6Yt78mphUB5bkpnXjI8hYiF87Y+PZv24YnPIDz7S3uk+2v9DZdmRRJLt+MKKqE
         fElmsIP/Rv7ZKJ39tc0I2vQWWUzGEJaM2PpOLTH9v/d7V/aupVdcMmDmUjLrvdgv9loX
         4zrsd0gPXfc/qljz/IvNCeXWu2ih4L3Pn+8r/oLb2ZdOirx1cZxmtRLlx8cb65XnN3pc
         fz/+GrgEKpOUtaIXwOg8MzOByycuEMUvMOMHyucHlsfIkElS2vllPblGXvwmfSYUdhv1
         H8vKI0oUxZ9Xo3UNp0Ked9RvsQlCePX6CAsMts6ySH++Vfm9I0hkXdY9RQQDEjIeJWFW
         kkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498761; x=1773103561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=n+D7r/Y8ijT5rVdk5HKVSIig2Rs003OwMaZlSHKGshTyz0wJqwozFtd+RbEYrl3TeV
         VZTg/Kr7DYppFefxUeSsd4JK3+DNcM58Nwyndvs+5pDPFJid0TXbBVCWr3dMISSv5m+X
         i1Cjnkvtv1MpMh7MfyE7doCvo12x1g2dHESa35OUlaqfPSTfujc7p09HVBdKvTAGD++3
         gVml6b5QCSLoATKIk+3iFFeUudLkG3TsN+iiSKfKB4F/PqaOBEtrVcHliVIZoV+ARZE0
         b+iJ8zUxVWwGui7F1LrdkcpEUL7tElkkvBqSeEZDjZjVe4F7GYJp+Q2JfA6GmsCa0EM7
         5GfQ==
X-Gm-Message-State: AOJu0Yxbu9dTB3NP3qOCbTKFDFHOn/wmUWMzRuW/2KEW2gqiKPMjIAz7
	slSyukjqCx+XYKEdUcYYKkCdFEZycZDZkf0a1TeqRKx+r1WebLJOFNICNB8ISA==
X-Gm-Gg: ATEYQzz6hgzUrbyKp8Q4wfQevxKcKOaUKALjS0e3xwsYXV9PnOOCzLtHy7pWidwPFmx
	Jb0cfQ17CHWCbVNn2QG2mCTY1uve32BYYzn3lmmmcN719xWxjj7c3EnBJ8jVfW5RUB08Krs5scQ
	6ursvTf6RrwPp1xQ5gTx/zKiM6eWHblF/chvqTrVoy14uELw0E069wbvh0aCHK7hwJT4nmd6jGt
	wsIPI4ImtH78hIW+24d73Ra/dNdeEjwO9JDInWrpEHETqEJgmypTz1RFlxDYF9H3Yh7iHovqTsk
	OvtG38MU9s3Uh3CZUEg9/RKkLmCsijNOQWAT8TLSuguieogYZ5u+c53xPawDAe3D4c9RoDAlP17
	yCdW4Rd5C1rmBkmP61sahLTWeLk1A+8HVuYwe1jXfEGdShtSPbjqyNAM9gjQy0ljTXE2XIyyqTl
	pOIO6258o6LuFu9f8rZaiM2lGpdB+ClOs=
X-Received: by 2002:a05:6808:67c5:b0:459:a26c:2c3c with SMTP id 5614622812f47-464be9cadbbmr6981087b6e.26.1772498761144;
        Mon, 02 Mar 2026 16:46:01 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:46:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 9/9] spdx30: Skip install package CVE information
Date: Mon,  2 Mar 2026 17:43:56 -0700
Message-ID: <20260303004550.650726-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232232

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


