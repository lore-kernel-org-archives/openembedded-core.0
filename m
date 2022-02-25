Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03397C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 23:43:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.1267.1645832608091878609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JI2cFg1J;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id g1so6035393pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/g2Kv9FPFIEKi3YU0gEhT3cDnnDSfoALCB4tZSdaONU=;
        b=JI2cFg1JEiFcrYsj2fxrOGkvz5mzk2jVBu+iOGp1O5+rcp/0NBjk+ET873Yej0iVeh
         Ad7aciaTfDkbznQcM5Dg2zOBV7aMxs67pAwMARs5EfJIHEIZ0zDSK+fmUxkg1+BKezkg
         lAwNu2+a9SyD5+1GUHm7i8dq8ux6fhXGsLPF7+zBspZMpGc61xHaApxLyoMp7TpwNshV
         8MNWmAPqw82BOeLPJBPgHHpENPSBy3TKA756L451G2F1Mhb9V9Pu3Ug0qt3bjPVCVI8G
         6lF7rYIk4o33zfNRaIGCA2WrKyOuLQLY54lLf8Xy0uLNXZIAfGPyLUORXBG4zdhP0Z7s
         dw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/g2Kv9FPFIEKi3YU0gEhT3cDnnDSfoALCB4tZSdaONU=;
        b=namt9VCaUbnRf5nzM9/Yi9Ht9FRUdTJVA2Ik+F9eEm544KQBZOT0gMcmylQp85+qnu
         w2I7tf3DYrq174r1UDCKzby+symgTXCAdEfMZbtvtdbxmYBPzsA6b6rbj1qAXi4x1gtZ
         mvzJcSTJ34XCh3opvCrrPIlCR8s3DWoZX1YkK2AhdXAn3mHVbrui40xNRAUyOl0y830H
         +4lMayFA+Mr1dzcN0++wVK12pbWflLfwGZ7UWhaPF2WSTPRdDBIjrNejx94hDOUZ0APk
         YWXC2BbwBSDqReU4VdEUq9k+62uTJxhp1O/qTRp3Krd79Y/3IK8myRiRPZbUhNRqn50k
         +Ppw==
X-Gm-Message-State: AOAM531VybOZflSfb4cQ1soGw1lgVInVoR30CkhcKtlVFrzFL+KDjpqT
	rlqp9wTV0/4BbJLUex2JZiFcOHDcZoI=
X-Google-Smtp-Source: 
 ABdhPJwoSlmA+smlnk+a327wYhjcqqV8LwLQbT/LLJ4QwIZRviNzkOUlCRHYf8q434g1VAMZ++IQ9A==
X-Received: by 2002:a05:6a00:14ce:b0:4ec:aa7a:53c7 with SMTP id
 w14-20020a056a0014ce00b004ecaa7a53c7mr10141497pfu.62.1645832607113;
        Fri, 25 Feb 2022 15:43:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 w17-20020a056a0014d100b004f1063290basm4556214pfu.15.2022.02.25.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 15:43:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3] setuptools3.bbclass: add check for pyproject.toml
Date: Fri, 25 Feb 2022 15:43:17 -0800
Message-Id: <20220225234317.668778-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 23:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162414

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

Because some sources have a pyproject.toml but no [build-sytem] or no
properly defined (or accurate) build-backend, add a try: except: clause
to avoid KeyError.

[YOCTO #14736]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools3.bbclass | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 12561340b07..d80a91d3296 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -18,6 +18,47 @@ setuptools3_do_configure() {
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
+    warn_string = "The source has a pyproject.toml which declares '%s' as a build backend, please consider 'inherit %s' instead of inheriting setuptools3."
+    warn_layer_string = "The source has a pyproject.toml which declares '%s' as a build backend, please consider 'inherit %s' from %s instead of inheriting setuptools3."
+    pyprojecttoml_file = Path(d.getVar('S'), 'pyproject.toml')
+    if pyprojecttoml_file.exists():
+        bb.debug(3, "pyproject.toml found: %s" % pyprojecttoml_file)
+        with open(pyprojecttoml_file, "rb") as f:
+            pyprojecttoml_dict = tomli.load(f)
+            try:
+                build_system = pyprojecttoml_dict["build-system"]
+                if build_system:
+                    bb.debug(3, "[build-system] found in pyproject.toml")
+                    backend = build_system.get('build-backend')
+                    if backend:
+                        bb.debug(3, "build-backend found: %s" % backend)
+                    if backend == "flit_core.buildapi":
+                        bb.warn(warn_string % ('flit_core.buildapi', 
+                                               'flit_core'))
+                    elif backend == "setuptools.build_meta":
+                        bb.warn(warn_string % ('setuptools.build_meta',
+                                              'setuptools_build_meta'))
+                    elif backend == "poetry.core.masonry.api":
+                        bb.warn(warn_layer_string % ('poetry.core.masonry.api',
+                                                     'poetry_core', 'meta-python'))
+                    else:
+                        bb.warn("The source has a pyproject.toml which declares '%s' as a build backend, but this is not currently supported in oe-core." % backend)
+            except KeyError:
+                bb.warn("The source has a pyproject.toml, but either no [build-system] or it is malformed. If the recipe is still buildable with setuptools3, you can skip this check with:\nSETUPTOOLS_SKIP_BUILD_BACKEND_CHECK= \"1\"")
+                pass
+}
+do_configure[prefuncs] += "check_for_pyprojecttoml_build_backend"
+
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
         NO_FETCH_BUILD=1 \
-- 
2.30.2


