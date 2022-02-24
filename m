Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5475C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 04:12:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.6261.1645675929014637604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bK4jz0zt;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id l9so204205pls.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hEeeMYKiElhKpIsThqJKWny5qf2I06iupEH95I6UvUk=;
        b=bK4jz0zti4CeD9IvbaKSLBr+m/abLIKIjjGj1cWtDKZCOGyYtYbGb1UQaX6m4pi08W
         8qipb2tqd1MfZ7f8LVKP4ebxX0m1DdZaZIORwF8iQRVYNOs4iZ74SQNfLDjjfq+t6Qns
         lcG1wtZlh8Vo83OJRN3h6T24buEwpH7xoRq/jyowwGUFWP+YwnvjL6Dom/NeoQ+5v24n
         /7yzLSSl0Rg7pBdSwyYqp4eUjrCnU2DchINFnJiU8LxyjA9o0H+PbkzTE99mibNfVE7x
         UC7ch88BUGYdYhewRj7YPGeIuYtl1zF/E4+/FX/LaRzqQXGU0fR6ydlzgWnK915yZhfC
         9P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hEeeMYKiElhKpIsThqJKWny5qf2I06iupEH95I6UvUk=;
        b=zbI6CSxDKBsagkUY88gZ1SzQ8ZIuQF0Ml4/28uXnC8KCuFybzLmkI++VjdFE5cpHzZ
         UDA0B1txyCw/zgFwmvSssvBFId8bsuYNEOGVnAOdOvKaLtHvK1WyJ7XERt2OBJ2ZzqDc
         8q5TR2pCRIpt2tCgdm9gGMiJR716JTHT1cMMbKVhbzok8dEVdmFoToD1V5V7AcMgknuI
         rvkloZ7CWbXGEXWEDIV+9XWthYSHVOIUqTtBtSc5tFQVhBW8MhBM+1sLaE/XrKRux4u5
         jU+j/riFAGW1nuBZbvxcDIROqSHRj1ZUWT70vWdlcc3Dim8lOh1QtLugGbJixc339/SS
         OskA==
X-Gm-Message-State: AOAM5339RDv3P8FuhH9TNG+PLriDka0+nuZodOqp9AYJj690ceJJaYYl
	/1oYI9fhIcFBkaWcLQahu1zsPBJPz6c3Vw==
X-Google-Smtp-Source: 
 ABdhPJy3rbV3UCaaWo47EVBoSyB9v1ySfQU/QJTNw37ceAyDz/tm1/xT+NCDXAng1NY5MUBW6GljsQ==
X-Received: by 2002:a17:902:e806:b0:14f:d9b7:ab1 with SMTP id
 u6-20020a170902e80600b0014fd9b70ab1mr909524plg.151.1645675927856;
        Wed, 23 Feb 2022 20:12:07 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:16be:5024:1d60:b2cd])
        by smtp.gmail.com with ESMTPSA id
 m19sm1086012pfk.215.2022.02.23.20.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:12:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] setuptools3.bbclass: add check for pyproject.toml
Date: Wed, 23 Feb 2022 20:11:59 -0800
Message-Id: <20220224041200.2645054-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 04:12:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162290

With help from Peter Kjellerstedt <peter.kjellerstedt@axis.com> via IRC.

Add a check for pyproject.toml in ${S} and if so check if it has a
[build-system] build-backend. Give the user a helpful warning that
the recipe should be changed to one of the PEP-517 classes (instead of
setuptools3.bbclass).

Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (and
avoid the warning). This is needed for e.g.
python3-setuptools-rust-native which does not build cleanly with
setuptools_build_meta.bbclass

[YOCTO #14736]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools3.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 12561340b07..b137cf0ce48 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -18,6 +18,38 @@ setuptools3_do_configure() {
     :
 }
 
+SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?= "0"
+
+python check_for_pyprojecttoml_build_backend() {
+    import os
+    import tomli
+    from pathlib import Path
+    
+    if d.getVar('SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK') == "1":
+        bb.debug(3, "Skipping check for build-backend in pyproject.toml")
+        return 0
+    pyprojecttoml_file = Path(d.getVar('S'), 'pyproject.toml')
+    if pyprojecttoml_file.exists():
+        bb.debug(3, "pyproject.toml found: %s" % pyprojecttoml_file)
+        with open(pyprojecttoml_file, "rb") as f:
+            pyprojecttoml_dict = tomli.load(f) 
+            build_system = pyprojecttoml_dict["build-system"] 
+            if build_system: 
+                bb.debug(3, "[build-system] found in pyproject.toml")
+                backend = build_system.get('build-backend')
+                if backend:
+                    bb.debug(3, "build-backend found: %s" % backend)
+                if backend == "flit_core.buildapi":
+                    bb.warn("The source has a pyproject.toml which declares 'flit_core.buildapi' as a build backend, please consider 'inherit flit_core' instead of inheriting setuptools3.")
+                elif backend == "setuptools.build_meta":
+                    bb.warn("The source has a pyproject.toml which declares 'setuptools.build_meta' as a build backend, please consider 'inherit setuptools_build_meta' instead of inheriting setuptools3.")
+                elif backend == "poetry.core.masonry.api":
+                    bb.warn("The source has a pyproject.toml which declares 'poetry.core.masonry.api' as a build backend, please consider 'inherit poetry_core' from meta-python instead of inheriting setuptools3.")
+                else:
+                    bb.warn("The source has a pyproject.toml which declares '%s' as a build backend, but this is not currently supported in oe-core." % backend)
+}
+do_configure[prefuncs] += "check_for_pyprojecttoml_build_backend"
+
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
         NO_FETCH_BUILD=1 \
-- 
2.30.2


