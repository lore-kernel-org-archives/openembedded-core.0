Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88404C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 04:04:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.3254.1645761852871519267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k60Kf0ns;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id x11so3714254pll.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=00ybtLqcmgkt4bYBjeG5BaQ/rMF0X+eMjL0kjGPb8CY=;
        b=k60Kf0nsJ1zm4SPItQKHKSqW8lgPHnFxnVydFDtid13EshiapaqYhpSwJwYaFolHiy
         gDiG7iX3LqEbtyRkoEjlDiGmQX3LYIQNUyqaf/xuH6VBmit3pdknbHx9yFRHb1d/IX19
         zktLdi359+ePyHvfyqCrVZonx5KZObLQzFm7imGIXYs4D93HVMOHfyMB5aYlll+d1Skb
         wvgKvehXvLTvxEcxjGVr//s0TR8Z37wa3+pYDjVeXxhPI5ECiHNDEhOIlTh7n4APBgUa
         CgSnoYzN3E5hp368z4KGFbwPC4GzmFOP16sTObMX2axnumooCgGcoNawwBlY9v47yPcX
         ioMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=00ybtLqcmgkt4bYBjeG5BaQ/rMF0X+eMjL0kjGPb8CY=;
        b=Ef4qPhq2XOwX6+00FvEgbObf5LzYYzBgmBU7MSUBJeIGIfY0MSnNXoaUNQqJQebJD3
         nmcM06lf8bEn7wauFFhslSBTY4C7zZVJ5bto1/ooiLrO+4POlNd9iF4Q0tiZkl4wtH5k
         /tsoekwtPlhzmeA9odGhEZ8OrqUHmd2Nk7G95orGlnqAKGX6/bRK8zbuapykL3dkI4bA
         BPash2KSLwxn6pVOoq0J2S7XENap/eYchNM0YqxwqkoJgNSXjFzWigkIhN1zio5hEnOO
         KI5vereH1wFaDYwwPFAmxg79VuLC3QTmTQkevXU5iZ18O5rMxE6uI6u050nIqQ/xo9IV
         1Uwg==
X-Gm-Message-State: AOAM533e1TPWyKGtGXUAjOjE/i86ef4dcM8OJkgfe8S+JJ97kwQkx/Hn
	OdJEULLibFTH1dYmRftO1HFDRL6nSqyiKg==
X-Google-Smtp-Source: 
 ABdhPJyJQn/ozZe+SD+oS3xFh93onbrVEQVBASYghC+isLdDU3sQIG5Uo481pbzxWovZXpmv7zVaZw==
X-Received: by 2002:a17:90a:3c89:b0:1bc:b475:65e1 with SMTP id
 g9-20020a17090a3c8900b001bcb47565e1mr1335768pjc.30.1645761851912;
        Thu, 24 Feb 2022 20:04:11 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00190500b004f104b5350fsm1066512pfi.93.2022.02.24.20.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 20:04:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/2] setuptools3.bbclass: add check for pyproject.toml
Date: Thu, 24 Feb 2022 20:03:29 -0800
Message-Id: <20220225040329.813595-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 04:04:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162334

From: Tim Orling <ticotimo@gmail.com>

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
Changes in v2:
    fix whitespace errors

 meta/classes/setuptools3.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 12561340b07..12d662fb49c 100644
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


