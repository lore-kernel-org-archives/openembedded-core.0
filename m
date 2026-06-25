Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66BACDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:24:55 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18310.1782411893898224691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 11:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=W/ioNLLb;
 spf=pass (domain: baylibre.com, ip: 74.125.82.54, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139a5f4ca15so213636c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782411893; x=1783016693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvAnh0flRlFG0QM+vUlDvUTO4z3tJB8cGoaKGUFrWKM=;
        b=W/ioNLLbSP1nmx6ullObJ84TOmgKp6ngdvDg1gwNqb2Z5G5eFA3m+ybYmKxleIGpDj
         ReJV3vEUFZrlWqVfomPGw80iWKc+6/hEtrySesa04K3z4Gr6DN3ObftXGtlq8glU5n64
         rlNLpXgZAJhrjso+KBfz3O35IDxcyCwZhcT7hskhqh9D5F+JgNuYOVbkYBkgUSubQGuK
         8u6CQtCq8s3DKZ/n/OyQ0mlc/xwjp3aWRmYR6hTKNCrPnvFwsMzq2OsB5HZFR7L0cpSq
         xd+tqAnmvFSq28BgrF5LFKLReK1h9dVnUpTiOVOSMShH8xUTwwkwSHrFBpNxMVcaGC+x
         IVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411893; x=1783016693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvAnh0flRlFG0QM+vUlDvUTO4z3tJB8cGoaKGUFrWKM=;
        b=AZd9hkFy6fOK76yKaWeOXxY3IF2h+kfH0YJEge6XVEZyJA9FvNBiv1gU7KrA5nzSBL
         /zNnQ38YkJpUozxox+kKwM7spUlNv1A9MaJhD0r1ekSJJNQ2iRnH982tP0jOBAb4XvBS
         QBetNjfcjDAxIFK4nY/d8+u3dgRcVrm/zhPgXe0QzDzZLfPJU80PGPijVb2U0Pcsq1/X
         2sO4jkrJhuUGb4f8bxf7kOZzExvnp+EMGnAELOyFAiMY7nRS6cWEZBF4YqRylIxZWDLG
         ZDcDzuUQuCIZjsaSPlZEbpfQYrZnJj5TqZTvQSCk0RJBB2/Bhr6cFQGFwsqpFE7kNI3i
         sd6Q==
X-Gm-Message-State: AOJu0Yw58MvbxXgHq0ZnGXB+PhPBvRiqxaa5iI8YNmYd5qAdgPYS5QJd
	NQnka9Uc53lk4wWTl9TlYMFZ9wYCIcKtp5aEEUGbOxhpsd7HCSzBOy3e68SWypDf/xL9zZ37t8+
	4o5uC
X-Gm-Gg: AfdE7cnSGaKZAxAX7Y2viJcIz+8tT8wTvrB3HtDkI1D3ULncsq6lHHjJWik9VLxYHeC
	d0r0Fx4KG2ua2fvx315BLEwvbnxZSX8ZRcQT0tjRprPPONOm3iEa/bhdRpH7QNv2C1cQu2MHhyY
	B1az4SVMR/0pINBsOo94EYl/tEywFdHyu3VFO+MHmq50WYOk2QwTQ0Sipn+RYyY653x64ulAcTG
	1HT9B5RKQRtmV1nO83ZxjyoFYmNZpMBtK3Kf9jLPfkFo2zwe0qzedqDdVa/AaSQSrxNvPZQfyUN
	K2OWn/sOPEDAt5KE65CmT8vG0ahyqeIQMbLXc6BlJyTeeeoBrNCnIxmQTBTbPpaEwCuNqdYBAgR
	sTPziS+zN1Y439qNIOPM+gqM6Jp617fnMY7ZRd20u4SI90RrPbWWY6axtFc5lJd4dztn71AHYje
	fPdy9AYQtMvFEVykdUIgQZs26uizFwHKrBtG2/uPHKsniuJGA5aQ==
X-Received: by 2002:a05:7301:1930:b0:30c:639f:ff8f with SMTP id 5a478bee46e88-30c84d75564mr3992250eec.8.1782411892749;
        Thu, 25 Jun 2026 11:24:52 -0700 (PDT)
Received: from hfranconb ([2804:14c:4c5:9534::62b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm10317147eec.17.2026.06.25.11.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:24:52 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sbom-cve-check-recipe: add SBOM_CVE_CHECK_RECIPE_AUTO
Date: Thu, 25 Jun 2026 15:23:42 -0300
Message-ID: <20260625182435.979787-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239589

"do_sbom_cve_check_recipe" is only added "after do_create_recipe_sbom"
and is never wired before "do_build", so it does not run as part of a
normal build. Users who build packages directly or run "bitbake world"
without producing an image get no CVE analysis.

Add SBOM_CVE_CHECK_RECIPE_AUTO variable that, when enabled, hooks
do_sbom_cve_check_recipe into do_build for every recipe. This lets
"bitbake world" run recipe-scoped CVE analysis across the whole package
feed without first building an image.

The task is only wired for recipes that actually produce a recipe SBOM.
Recipes inheriting "nospdx" delete "do_create_recipe_sbom" and are
skipped, to avoid scanning a non-existent SBOM.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hello,

I tested this with Poky Wrynose, running "bitbake world" from an empty
build (from scratch). It worked as do_sbom_cve_check_recipe ran for
every recipe.

This patch is dependent on the patch I sent earlier,
https://lore.kernel.org/all/20260619183406.239931-1-hfranco@baylibre.com/.

Thanks,
Hiago.
---
 meta/classes/sbom-cve-check-common.bbclass | 5 +++++
 meta/classes/sbom-cve-check-recipe.bbclass | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
index 32c29a0ec2..236bce8545 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -52,6 +52,11 @@ SBOM_CVE_CHECK_SHOW_WARNINGS ?= "1"
 SBOM_CVE_CHECK_SHOW_WARNINGS[doc] = "Show warning messages when unpatched CVEs are found. \
 Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
 
+SBOM_CVE_CHECK_RECIPE_AUTO ?= "0"
+SBOM_CVE_CHECK_RECIPE_AUTO[doc] = "If '1', run do_sbom_cve_check_recipe as part of \
+    the normal build (do_build) for every recipe. This also includes running CVE \
+    check for all recipes with 'bitbake world'. Default is '0' (disabled)."
+
 def show_warnings_from_file(cvecheck_export_file):
     import json
 
diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sbom-cve-check-recipe.bbclass
index c80b8ac83f..084fcf4946 100644
--- a/meta/classes/sbom-cve-check-recipe.bbclass
+++ b/meta/classes/sbom-cve-check-recipe.bbclass
@@ -22,6 +22,13 @@ python do_sbom_cve_check_recipe() {
 }
 
 addtask do_sbom_cve_check_recipe after do_create_recipe_sbom
+python() {
+    if oe.types.boolean(d.getVar("SBOM_CVE_CHECK_RECIPE_AUTO") or "0"):
+        # Recipes that inherit nospdx.bbclass delete do_create_recipe_sbom, so
+        # skip them to avoid running the check against a missing SBOM.
+        if d.getVarFlag("do_create_recipe_sbom", "task", False):
+            bb.build.addtask("do_sbom_cve_check_recipe", "do_build", None, d)
+}
 
 SSTATETASKS += "do_sbom_cve_check_recipe"
 do_sbom_cve_check_recipe[cleandirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
-- 
2.53.0


