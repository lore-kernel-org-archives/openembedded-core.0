Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3824DF36C55
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:45:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14480.1776671098952934779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wJ9UX4EX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 611DC4E42A74;
	Mon, 20 Apr 2026 07:44:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38DB05FFA5;
	Mon, 20 Apr 2026 07:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A024010460B7A;
	Mon, 20 Apr 2026 09:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TPs+Mz9OryRweTDKXwkebPBiH615j5168YhYTjDALss=;
	b=wJ9UX4EXSV4cpFRIj7MLbk+pOdMG4Q4R2AXZUqB94EFFL/e8/+9jWWyIkSczjhZI1Oc6zi
	AYQr5iB9vaINFZN49QpdNx0E8mCENsOcff7oj6B0ij1ygNKml4tfpCPLsi3//epv5oPjKM
	ml2KmDXdpBn/DycLpFDpkHJVfJm16nP2y4wkoO2KnHwUBKFitOYSG1LWku7TDrWI5nYnnt
	5Hv8B22twsK2LbfOoHM1kV/gB53mMOwCOJmKNOv6ZyNjkZ+Yb89/FkiGIsrAMgkCDFqCfI
	ybMGss2R7f3eqsHj37L9DUKpR9ruj8rPWSeJ+44niin+4m/cYSr94oQTFI1z4g==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:41 +0200
Subject: [PATCH 10/10] oe/spdx30_task: Prevent duplication of sources in
 hasInput rel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-10-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235551

If the debug_sources are already inside the build_inputs, we must not
add them again, otherwise, the source files are going to be referenced
multiple times inside the hasInput relationship.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ffedc1e25b59..1821dd7de4a9 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -893,7 +893,7 @@ def create_spdx(d):
             sorted(oe.sbom30.get_element_link_id(b) for b in dep_builds),
         )
 
-    debug_source_ids = set()
+    debug_sources = set()
     source_hash_cache = {}
 
     # Write out the package SPDX data now. It is not complete as we cannot
@@ -1057,13 +1057,10 @@ def create_spdx(d):
                 )
 
             if include_sources:
-                debug_sources = get_package_sources_from_debug(
+                debug_sources |= get_package_sources_from_debug(
                     d, package, package_files, dep_sources, source_hash_cache,
                     excluded_files=excluded_files,
                 )
-                debug_source_ids |= set(
-                    oe.sbom30.get_element_link_id(d) for d in debug_sources
-                )
 
             oe.sbom30.write_recipe_jsonld_doc(
                 d, pkg_objset, "packages-staging", deploydir, create_spdx_id_links=False
@@ -1089,12 +1086,17 @@ def create_spdx(d):
                 sorted(list(sysroot_files)),
             )
 
-    if build_inputs or debug_source_ids:
+    if build_inputs or debug_sources:
+        debug_source_ids = sorted(
+            oe.sbom30.get_element_link_id(d)
+            for d in debug_sources.difference(build_inputs)
+        )
+
         build_objset.new_scoped_relationship(
             [build],
             oe.spdx30.RelationshipType.hasInput,
             oe.spdx30.LifecycleScopeType.build,
-            sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
+            sorted(build_inputs) + debug_source_ids,
         )
 
     if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":

-- 
2.53.0


