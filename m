Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED2E103E18B
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14412.1773841626115694985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mg2U304R;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4152698e745so2997107fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841625; x=1774446425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVHszXY8NilPQUg/rlhRHWFKY4L68xQCK+mRhzQQ1rQ=;
        b=Mg2U304RqRLwO0YTaX9EEMkH7CCRn+Ers6BMTCzh+ztWmNrB3x9vBgpOLuR4PxFveB
         61PgnHLEh2nF3zHfnIfJufNjiQxrWiuMlBaSkAeG9zb+i5hIl9XXtQQP+CObQhi6cYpW
         807mrSdwBYe39ckcm1aCdampb6Z6c1yfM6JkSDkF9nyA5uu01Yy/V3pkmAPFJfSct8/P
         a/mCA/dybdaYo60gHhxxpd5SDqWlKv1tXDR+fTs134kBhlOm0VXsaLJ9wVBYzNvqRs4g
         1IUuwR/gRyR/udrrSVjI7TZmvMgLrlr+D2KAT1Jq7/DNWKPvm6gMFYBD+SbNKOk3e42n
         CDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841625; x=1774446425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVHszXY8NilPQUg/rlhRHWFKY4L68xQCK+mRhzQQ1rQ=;
        b=BylPcgsSNWOGpS7kETz8IOa9nOrhOEAbIn6wsvYc6oxFhAnEIedJfocH7YCD91LdQ/
         j0PL0ADpgpmKUYGV7x25GPiZBUClXyjJv+jQLOtWOU/sfb+uQovvkEMK2H2dKE6xqbTR
         923UmpU6E5nVOb+x2DUG1cT+mgfkVeB5ckpzYjwFWxpUVUiRpbzyQOlNdlPYcXR/xDjX
         KJ4BIKss7vZQhJyN87ywiaI3iqoHH4XaHXh5WS1AFOdEqnUNwaxsvXKIZ11KK6ohuejb
         9hoj0Df5pWioUTVdcZRyfOltMLAvwbr2SqNMsm+AdhaRjlOGxo2pMv1ddWkfPXyZr10f
         261A==
X-Gm-Message-State: AOJu0YxpwrIpVxAMZNE8ZgG6CfGFFzrmHEYIRE3gH/w2jBAFlrl0RTSY
	dAsiSp/kbJydf0okVtM1bcAyTPibZAHzbDrpL22fqEPCwoHNmT/4clAZ2ypqQg==
X-Gm-Gg: ATEYQzxuWshhTkvC7COWTdIkGFg0NXDsnqDrKIhQpqdhp3SWVxUcfg8Nbm/OQ1XRKTl
	PXI4bYqBaTPUW6NOYadO9WdhAq4/7qIx9v3wi8zUsJQORTxPKvTxeqfxinCdJScuqb4tDR6KSKP
	Q6YOh3vYPoivzYsCCwzM554RRfBpS1TbTdv5nvIOrxEl1QZrZI+bfGaJfBuiQBv2HEbBHvnTIX4
	hy+nkzVHUiMwpeIv8rEF2wQdGBBwZS5YvqU5oN21I8KtQrbfW2RrrEnTPSYgvO0Dimx3RSvnHVu
	lRC1JU9A8dHqucBcXP/cdgaxhBEP/cu+1TIiea2EZAaWF2szc90/JbV+e+60/VExFgJYmKU1nU3
	Dj2gZLAwwxFTCJRi8evn9AAgjUDmirXBcaMDciecpfdV4diw4uBUyJhvjTT9YxrMmBtZ3LGK70N
	VDxrrG9zhZ5lHX7a1P82GC
X-Received: by 2002:a05:6820:4b06:b0:67b:f1f1:1abd with SMTP id 006d021491bc7-67c0db3cb74mr2426813eaf.54.1773841624941;
        Wed, 18 Mar 2026 06:47:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 07/12] spdx30: Remove package VEX
Date: Wed, 18 Mar 2026 07:44:35 -0600
Message-ID: <20260318134655.953233-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233397

Removes VEX statements from packages. These are no longer necessary
since the VEX data is now attached to the recipes, which significantly
reduces the duplication of the data, and thus the size of the SPDX
output files.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 72 -------------------------------------
 1 file changed, 72 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index aec47d4f81..5b651900c4 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -768,31 +768,6 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
-    # Collect all VEX statements from the recipe
-    vex_statements = {}
-    vex_patches = {}
-    for rel in recipe_objset.foreach_filter(
-        oe.spdx30.Relationship,
-        relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-    ):
-        for cve in rel.to:
-            vex_statements[cve] = []
-            vex_patches[cve] = []
-
-    for cve in vex_statements.keys():
-        for rel in recipe_objset.foreach_filter(
-            oe.spdx30.security_VexVulnAssessmentRelationship,
-            from_=cve,
-        ):
-            vex_statements[cve].append(rel)
-            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                for patch_rel in recipe_objset.foreach_filter(
-                    oe.spdx30.Relationship,
-                    relationshipType=oe.spdx30.RelationshipType.patchedBy,
-                    from_=rel,
-                ):
-                    vex_patches[cve].extend(patch_rel.to)
-
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -931,53 +906,6 @@ def create_spdx(d):
                     [oe.sbom30.get_element_link_id(concluded_spdx_license)],
                 )
 
-            # Copy CVEs from recipe
-            if vex_statements:
-                pkg_objset.new_relationship(
-                    [spdx_package],
-                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-                    sorted(
-                        oe.sbom30.get_element_link_id(cve)
-                        for cve in vex_statements.keys()
-                    ),
-                )
-
-            for cve, vexes in vex_statements.items():
-                for vex in vexes:
-                    if vex.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                        spdx_vex = pkg_objset.new_vex_patched_relationship(
-                            [oe.sbom30.get_element_link_id(cve)], [spdx_package]
-                        )
-                        if vex_patches[cve]:
-                            pkg_objset.new_scoped_relationship(
-                                spdx_vex,
-                                oe.spdx30.RelationshipType.patchedBy,
-                                oe.spdx30.LifecycleScopeType.build,
-                                [
-                                    oe.sbom30.get_element_link_id(p)
-                                    for p in vex_patches[cve]
-                                ],
-                            )
-
-                    elif vex.relationshipType == oe.spdx30.RelationshipType.affects:
-                        pkg_objset.new_vex_unpatched_relationship(
-                            [oe.sbom30.get_element_link_id(cve)], [spdx_package]
-                        )
-                    elif (
-                        vex.relationshipType == oe.spdx30.RelationshipType.doesNotAffect
-                    ):
-                        spdx_vex = pkg_objset.new_vex_ignored_relationship(
-                            [oe.sbom30.get_element_link_id(cve)],
-                            [spdx_package],
-                            impact_statement=vex.security_impactStatement,
-                        )
-
-                        if vex.security_justificationType:
-                            for v in spdx_vex:
-                                v.security_justificationType = (
-                                    vex.security_justificationType
-                                )
-
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
             package_files = add_package_files(
                 d,
-- 
2.53.0


