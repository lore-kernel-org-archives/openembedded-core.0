Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A746AC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:14:00 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.2374.1742570031434317162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hacCqB4N;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-727388e8f6cso1276430a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570030; x=1743174830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi+kxOUeR9wq+IJ2Q80Tyzi/mTVNnaaMh4LuGZtTU4k=;
        b=hacCqB4NAxloMUoq+28a+5a25Rx+A43gBDmYCRyshefDKeNXT8zosGE7z9HJwSUtr3
         VyisrGbWXKWei3dJlfCytduQfLaydx3vh+MH1laFpXzuB3R6+RizfBcto+c5elVRPiDM
         2jbDdsP4IWw1OA2pZ4hNiWH1zoNlWp3QE1DfI7oADCMlcvnb+fu8YnLlujtkKtW9cqBw
         4jjUPOxy3haYpX+o414Hv1tF+ITLwfrf0ppbXhTwhPatyGwCqGSdUSbmV8fEOsjNAHiG
         7Dj6ir7w+/4qPsHwwBFtyvowbQifiowSVeg5ondB68ltemJEYbZv7DspXWl+OUjV45Fw
         pYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570030; x=1743174830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi+kxOUeR9wq+IJ2Q80Tyzi/mTVNnaaMh4LuGZtTU4k=;
        b=izfPOLrFDfvVhHROYMKPhCDCvqHqqt8MMOWdLucJ8tkEAZs9eLmIpt1tAZj+oYpKFJ
         R1khdCqQ239oIbpsXlLMqnK4IIhPimN6U35T3zdDNp+b3rPTFQXrJ2OmVrQrn9ah3p5H
         geJ12Olwd1/LghQBgb5Rml8r29JoZSJmOjuqzPBXz7w1UiwU6SO8+1qSPpfV3Z50ZEo1
         yFGgPD0P0Z7KsTJgguymu+ha+YMxaFV3zKSaz2LoPwWDMXjIYn2c2YTPORLakRKrQpY9
         Wf0iUdt2LgwJOl0YDFykYZTFTK0ekMkCYKjivQ9mqnDtlCRMC8n3Wq7hxXlHXkw/vJ7v
         +W5w==
X-Gm-Message-State: AOJu0YxFPL2sHT0wTWp3gmFQgKD62lvgeUfdKXE4BCYu1ow2Etma+XaJ
	S6zfTWshwk/UJo3rv7SbuhqYY0/YrQTAi1Us9RfIBxSpA+TjpRZVXhYXew==
X-Gm-Gg: ASbGncvksa/fOMSrhMVR34LE3rDqW3WKiJJLtGHNsQkapOdzhrfCgAla4uOTEm00eIk
	avr6fq/sCxfWwGOeKHOmeWvzzfRcLPJFZlq4R/dW3gs1cCDm122VIYppXXAPlqqoGOkt8TOgWVo
	sCXpzEbQmzIPj0Z8vjPJaE0bVG3BwhVP9o2K/Y1QYPakKTY9Wjm+kVhFOJCyJlVRwFiTpaLjVk6
	s8RFaZrP5zPAYnXytVpf0RYPE6iPD9GYFc6Vq1HzPbK/NzKuWd1HxVgEUpHOUK1NBJeiy+QZnTy
	McOoNN5hv/Q4BnSbpdjkLng8i6GguD4mjjk+gpsOqqyfjN3b0QPDag==
X-Google-Smtp-Source: AGHT+IFtI3EbtfhVUMBNLh+mI3hlQs7035/K6ykW+yX0b7/sHUj1AiVijGnJKGGkRdmMuAMuFV5siQ==
X-Received: by 2002:a05:6830:6e0e:b0:72b:8f8b:33b with SMTP id 46e09a7af769-72c0ae6a7c7mr2900399a34.10.1742570029894;
        Fri, 21 Mar 2025 08:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::b36f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac389sm425931a34.4.2025.03.21.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:13:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] classes: create-spdx-2.2: Fix dependency handling
Date: Fri, 21 Mar 2025 09:12:39 -0600
Message-ID: <20250321151345.484603-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321151345.484603-1-JPEWhacker@gmail.com>
References: <20250321151345.484603-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213481

The common SPDX code was changed to return a dataclass for dependency
information instead of a namedtuple, but the SPDX 2.2 was missed to
account for this. Correct the SPDX 2.2 code to correctly handle the new
datatype

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 8f988de8681..de62379c503 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -279,21 +279,21 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deps = oe.spdx_common.get_spdx_deps(d)
 
-    for dep_pn, dep_hashfn, in_taskhash in deps:
+    for dep in deps:
         # If this dependency is not calculated in the taskhash skip it.
         # Otherwise, it can result in broken links since this task won't
         # rebuild and see the new SPDX ID if the dependency changes
-        if not in_taskhash:
+        if not dep.in_taskhash:
             continue
 
-        dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
+        dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep.pn, dep.hashfn)
         if not dep_recipe_path:
-            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep_pn, dep_hashfn))
+            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep.pn, dep.hashfn))
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
         for pkg in spdx_dep_doc.packages:
-            if pkg.name == dep_pn:
+            if pkg.name == dep.pn:
                 spdx_dep_recipe = pkg
                 break
         else:
-- 
2.47.1


