Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D8CC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 19:24:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.140032.1680722677408050956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 12:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=BUWw7hHG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id m8so10593217wmq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680722676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5kJMpbFQKsbmOu+FLhZhCjphdK+ql0W5a8UnbPWJ6A=;
        b=BUWw7hHGaGxymrfbnwCT/TUFS2/wUn1aXoD4JoMSi2icaJ506iLgk7OvVLbRFx/BOH
         VteUqOz6xTB9qa4R7HbDoRc8sPBAtquOfyIR2SsWgZ97Ldvsi3qEb1MdVRuv6uBLj1g4
         xEjM1Yv3nBieSZHW3Af+bp8/QmBz0e4ZkDKOzt7glVOM01oRk3gy6PjqoUx0ZoVo9gMe
         5H6G/Uo8kNaEH1NvdL8K50KFgkRk48aAmAPdVQA8m9Eh7aU2g/q9jzXMqUuN5sZBzKR5
         zxhZ3s7oA+vXNnkYCopK8D2hwLyhM8CK5rgvqenDNhE6r5e1ZbLxczG1m6PmMtjHNDPt
         0Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5kJMpbFQKsbmOu+FLhZhCjphdK+ql0W5a8UnbPWJ6A=;
        b=2pH8fm4Qj7QcrTJydEd1yixDV1HaIydoqnJfjE748+BSobyEAPZn84ILUX55bqy58t
         9hBoKcaK0fUWg5W6K8O82/SZ5uUjUG+XNYts4sfjtjC3zxxECFbjta9ARh69OQ5HHxlP
         yXgZUuzRPAHouY8xJepaYLmTmbFTMbpNdX9Y74ngK2Iiz7rC0pdoazsVvITVEPD5P9Le
         x/eFEuueUwOHGmrFer2k9/7i9wlW671+NPICvoNSNaYufk5EerzQeLTT7OocP241Z//C
         SqXJ1Lcg2SXyD9DLKpQ0bMdB+KonM6usFRy/FmdoahYBPxYQOwokLOzXlbZVY7URmEVq
         fgLw==
X-Gm-Message-State: AAQBX9cmMb5XFGRCqzwkRBpzipLsu+PKWv3M7riw6TAtq/orIVckLekQ
	2W+zVfCs2SrtxSdSWagCnIfABQ==
X-Google-Smtp-Source: AKy350bkaojhimNj0pbwFIdQnRTCJrIU1T+GXyOfr9GfzmQ1vOuHETFYSG9WKBojdh8wEItlAHbnNQ==
X-Received: by 2002:a1c:7904:0:b0:3ef:128d:7167 with SMTP id l4-20020a1c7904000000b003ef128d7167mr5753712wme.13.1680722675734;
        Wed, 05 Apr 2023 12:24:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5fce:ed7a:3a7c:4fd9])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003ede04deb14sm3157957wmq.48.2023.04.05.12.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 12:24:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Eil=C3=ADs=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@pidge.org>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][RFC PATCH] base: implement support for the PACKAGECONFIGEXTENDS variable
Date: Wed,  5 Apr 2023 21:24:13 +0200
Message-Id: <20230405192413.170919-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 19:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179749

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some PACKAGECONFIG switches enable building of additional artifacts that
end up in sub-packages for a recipe. For example in foo.bb we have:

  PACKAGES =+ "foo-bar"
  PACKAGECONFIG[bar] = "--enable-bar,--disable-bar,libdep"
  FILES:foo-bar = "${bindir}/bar"

Where ${bindir}/bar is only installed if PACKAGECONFIG contains "bar".

In order to add foo-bar to the image we need to do:

  IMAGE_INSTALL:append = " foo-bar"
  PACKAGECONFIG:append:pn-foo = " bar"

This is redundant so with this change we need to add:

  PACKAGECONFIGEXTENDS:foo-bar = "bar"

to foo.bb and now adding "foo-bar" to IMAGE_INSTALL will automatically
append "bar" to foo.bb's PACKAGECONFIG.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 documentation/ref-manual/variables.rst        | 15 +++++++++++
 .../packageconfigextends.bb                   | 27 +++++++++++++++++++
 .../packageconfigextends/pkgext-bar.sh        |  3 +++
 .../packageconfigextends/pkgext.sh            |  3 +++
 meta/classes-global/base.bbclass              | 13 +++++++++
 .../oeqa/selftest/cases/packageconfigdeps.py  | 11 ++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 meta-selftest/recipes-test/packageconfigextends/packageconfigextends.bb
 create mode 100644 meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext-bar.sh
 create mode 100644 meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext.sh
 create mode 100644 meta/lib/oeqa/selftest/cases/packageconfigdeps.py

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c787a17937..dcb5cdccd9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6016,6 +6016,21 @@ system and gives an overview of their function and contents.
 
             PACKAGECONFIG:append:pn-recipename = " f4"
 
+   :term:`PACKAGECONFIGEXTENDS`
+      List of :term:`PACKAGECONFIG` flags automatically enabled for a package
+      present in :term:`IMAGE_INSTALL`. The :term:`PACKAGES` variable lists
+      the packages generated by a recipe.
+
+      Some :term:`PACKAGECONFIG` switches enable building additional artifacts
+      that are part of sub-packages for a recipe. In order to avoid having to
+      explictly add :term:`PACKAGECONFIG` flags AND include the additional
+      packages in :term:`IMAGE_INSTALL`, the user can just do::
+
+         PACKAGECONFIGEXTENDS:packagename = " foo"
+
+      in which case pulling in `packagename` from the recipe will automatically
+      add `foo` to this recipe's :term:`PACKAGECONFIG`.
+
    :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfigextends.bb b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends.bb
new file mode 100644
index 0000000000..189b9779b3
--- /dev/null
+++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Test case making sure that sub-packages pull in correct PACKAGECONFIG switches."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = " \
+    file://pkgext.sh \
+    file://pkgext-bar.sh \
+"
+
+PACKAGES =+ "${PN}-bar"
+FILES:${PN}-bar += "${bindir}/pkgext-bar"
+
+PACKAGECONFIG = ""
+PACKAGECONFIG[bar] = ""
+
+PACKAGECONFIGEXTENDS:${PN}-bar = "bar"
+
+do_compile[noexec] = "1"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -D -m 0755 ${S}/pkgext.sh ${D}${bindir}/pkgext
+    if [ "${@bb.utils.contains("PACKAGECONFIG", "bar", "1", "", d)}" = "1" ]; then
+        install -D -m 0755 ${S}/pkgext-bar.sh ${D}${bindir}/pkgext-bar
+    fi
+}
diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext-bar.sh b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext-bar.sh
new file mode 100644
index 0000000000..1b208b154f
--- /dev/null
+++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext-bar.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+echo "BAR"
diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext.sh b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext.sh
new file mode 100644
index 0000000000..c5beb15283
--- /dev/null
+++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextends/pkgext.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+echo "FOO"
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b6e339ed9c..7ee43d85e0 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -429,6 +429,19 @@ python () {
     # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends,foo_runtime_recommends,foo_conflict_packageconfig"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
+        # Preprocess PACKAGECONFIG for recipe sub-packages that are in
+        # IMAGE_INSTALL but for which the required PACKAGECONFIG options
+        # were not selected.
+        img_inst = (d.getVar("IMAGE_INSTALL") or "").split()
+        recipe_pkgs = d.getVar("PACKAGES").split()
+        pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
+        for pkg in recipe_pkgs:
+            if pkg in img_inst:
+                deps = (d.getVar("PACKAGECONFIGEXTENDS:{}".format(pkg)) or "").split()
+                for dep in deps:
+                    if dep not in pkgconfig:
+                        d.appendVar("PACKAGECONFIG", " " + dep)
+
         pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
         pn = d.getVar("PN")
 
diff --git a/meta/lib/oeqa/selftest/cases/packageconfigdeps.py b/meta/lib/oeqa/selftest/cases/packageconfigdeps.py
new file mode 100644
index 0000000000..69e23c1083
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/packageconfigdeps.py
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2023: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class PackageconfigDepsTest(OESelftestTestCase):
+    def test_pkgcfgdeps(self):
+        self.write_config('IMAGE_INSTALL:append = " packageconfigextends-bar"')
+        bitbake('core-image-minimal')
-- 
2.37.2

