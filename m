Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E18C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:59:17 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.7732.1714661950531274316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 07:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PodXogV3;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7d5e93b40feso347327839f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714661949; x=1715266749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCauMNGp2A6rkl/2rdrQDpCRLWmri45N4qrlW+vQJ4E=;
        b=PodXogV3UxhMBl2gLR5Qp3Yekw6kgyCPlQAvSQ1NnDewhY0SO9C6mUDeVCOSJR/9R7
         wEpoXrskD0LNF6ew+P+s2qGKkQGGY7G43UtUvCUL0ySP0RfbTghmw2Wgoz47IuDx/lMJ
         NcaiFrwSvmB3zQHtlVHZyHOMwy7x2fEj+yqPvE8U50TY6nuUFVap2mB5UJ2N+H6Rc0BA
         T8ohHLk1wF347JYof8jr7iwcVgmNnaYP5An7qKnJhu9FQRmpGGMcmipxytjmgiVR0AIh
         5/XBAt/dBiPC3Sns0hKFNT8Wtn5R0jbCm36utpl2hUWFK1fuHBbKAsz1DBR3YAhcV3Fw
         ++xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661949; x=1715266749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCauMNGp2A6rkl/2rdrQDpCRLWmri45N4qrlW+vQJ4E=;
        b=hNzglQmPmLLfvSF1vGR0oEAER4NCj55ceOx4XdZBHuT6xEI8p5ipLX8mTfZTAXnTPQ
         K21J0aw9fprlG+KMfQHd50FwY16sFKVNfC2zPs8qWQUpe223ygp7i6vt4JQ4bIN4CtKd
         TCNQ3XAUbz60/DyaKIOgbCbh27zOCi1plaksGwK0meYiWKyFU1YEDaFOcRCo+1/pMFJK
         x33f1/chah9HOX+qvMNBOtMs1PA5vNkkIG2vYO7bevV/LDSpxACNELUDw15P6N7MmGdu
         Z4ZqfNAwUkLlyVEf/8y2JMZbFGOyT8RaoYye0BN2Hc3PvpVRTsxrDyHOoVpVACXsU/H4
         R5Ng==
X-Gm-Message-State: AOJu0YxtR6IgqwFMas84wbZD7224EwV21lpLRGszjuzL3parjzk1Urcf
	2P0+yQnna4y+x837ROE3jORMSggzvoLJl+RXfBRnjVDuA46c6r36Nemcgg==
X-Google-Smtp-Source: AGHT+IG5ZJiwRlN2UAS7FPAZBLKHgVulTyroT0g06YMAxh5BtDqLWhV667BSRARdqRHmB/5uJTw8Qg==
X-Received: by 2002:a05:6602:1b12:b0:7de:c608:15aa with SMTP id dk18-20020a0566021b1200b007dec60815aamr6336504iob.11.1714661947211;
        Thu, 02 May 2024 07:59:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::d802])
        by smtp.gmail.com with ESMTPSA id u9-20020a05663825c900b00487bcf58da9sm248567jat.90.2024.05.02.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:59:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDX dependencies for ABI Safe recipes
Date: Thu,  2 May 2024 08:57:50 -0600
Message-Id: <20240502145750.1145411-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 14:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198928

SPDX Documents can currently get into a state where they reference SPDX
IDs that do not exist (locally). The reason for this is that some
tasks/recipes are marked as ABI safe, and thus are excluded from
taskhash. This means that when SPDX creates a document, it will refer to
the SPDX ID in the dependency at the time when the document is created,
but if the dependency changes and gets a new SPDX ID, the document will
not rebuild to reference the new SPDX ID, causing it to be dangling.

Fix this by using the new field in BB_TASKDEPDATA to skip dependencies
that are not part of the taskhash calculation.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 486efadba96..bae437f48e7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -357,7 +357,13 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     with spdx_deps_file.open("r") as f:
         deps = json.load(f)
 
-    for dep_pn, dep_hashfn in deps:
+    for dep_pn, dep_hashfn, in_taskhash in deps:
+        # If this dependency is not calculated in the taskhash skip it.
+        # Otherwise, it can result in broken links since this task won't
+        # rebuild and see the new SPDX ID if the dependency changes
+        if not in_taskhash:
+            continue
+
         dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
         if not dep_recipe_path:
             bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep_pn, dep_hashfn))
@@ -478,7 +484,7 @@ def collect_direct_deps(d, dep_task):
     for dep_name in this_dep[3]:
         dep_data = taskdepdata[dep_name]
         if dep_data[1] == dep_task and dep_data[0] != pn:
-            deps.add((dep_data[0], dep_data[7]))
+            deps.add((dep_data[0], dep_data[7], dep_name in this_dep[8]))
 
     return sorted(deps)
 
@@ -721,9 +727,9 @@ def collect_package_providers(d):
     providers = {}
 
     deps = collect_direct_deps(d, "do_create_spdx")
-    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
+    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True))
 
-    for dep_pn, dep_hashfn in deps:
+    for dep_pn, dep_hashfn, _ in deps:
         localdata = d
         recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
         if not recipe_data:
-- 
2.34.1


