Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AA4C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:44:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7186.1685691866948854114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 00:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZK75+WOW;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so16473885e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685691865; x=1688283865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=ZK75+WOWnRZqVos36o3DjfCXaXnVZAqsQmb74Jkpm4qXeMXWyxmTb8bKJHu2ykmajy
         kWrdgYeqMEgiEwgYvGxYWqh++fNg40on6iN/DRP1t+Kjt2wZrYWoQVTQeiBSrp2NydC5
         SxAZenDAqnPSEkkdqH1icNcd0ffAzMxHXtbaYTJhqM8NxzZklsE+LRutXn2YAumcndq2
         nKR7gomkAuNa7dY0FfQsbVHzQIaLOTZxDvezWfkdbo5FdY9u1yw5gl98u7Tp84Gs4l/Y
         1jH5xZGiD1hnBP9XFmFsx7O/T5RIOO7BaHOFhugzoKkSGCmzyxvvcDnZ1vttGS9u58a+
         Ci4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685691865; x=1688283865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=lE+EV+rpUG3QYaQtZqmXPi38WfzFOLNQO5bFwzDlleAsBcEJ8ToZA6irAUsn7Rv2lA
         yUhL/f/LnVDL6d08WnFZGU7XxzsZoDpUyTqsJiGarWVG5gWSYN51CDzhc5XPgwNgakQ+
         1hDA1Wt7jknC9HH9QMSPXMt2z7uCG9Ey2RZvX5bCc8Dr9ICO8FzVt0Mpa8cQKfQxPTep
         aCFYivYR+2m4YAtax8ty/tmDwPBat2Rw9CsDic/Wny/tXmF0N+9GT+izZcRLi0/36Gyq
         qHPfbhsHjJse1TXYKcbofL0fqVVVMvk9e9NpKP1EEFfcaGgITo1Repfms0axwtChcc4k
         Z95w==
X-Gm-Message-State: AC+VfDzksMZ/s1QHyVPAuCO6qMJxZCB1rn4f/omNBFiYOdt7xmSigG1P
	kIjFfseCivghF0ug9lv34XkqgTak0F4=
X-Google-Smtp-Source: ACHHUZ6+n5oewkMYZ6wBsDPuZzcEVJ7aysjfTPEkXN1JqUCJEHPMboUkEeiZ5lVuXfWCzYB/8TnUFw==
X-Received: by 2002:a05:600c:292:b0:3f4:e853:6a1 with SMTP id 18-20020a05600c029200b003f4e85306a1mr1360254wmk.38.1685691865118;
        Fri, 02 Jun 2023 00:44:25 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c214600b003f607875e5csm4596225wml.24.2023.06.02.00.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:44:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 3/3] python_mesonpy: New class
Date: Fri,  2 Jun 2023 09:44:19 +0200
Message-Id: <20230602074419.2450399-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602074419.2450399-1-zboszor@gmail.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182148

This is a new PEP517 compatible build class for python modules
that use pyproject.toml and this:

[build-system]
build-backend = 'mesonpy'

The new class uses python3-meson-python-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/classes-recipe/python_mesonpy.bbclass

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-recipe/python_mesonpy.bbclass
new file mode 100644
index 0000000000..1da8b005ab
--- /dev/null
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit meson setuptools3-base python3targetconfig python_pep517
+
+# Filter out meson_do_qa_configure from do_configure[postfuncs]
+DOCONFIGUREPOSTFUNCS := "${@d.getVarFlag('do_configure', 'postfuncs')}"
+DOCONFIGUREPOSTFUNCS:remove = "meson_do_qa_configure"
+do_configure[postfuncs] := "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
+
+# This prevents the meson error:
+# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
+MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
+
+CONFIGURE_FILES = "pyproject.toml"
+
+DEPENDS += "python3-wheel-native python3-meson-python-native"
+
+def mesonpy_get_args(d):
+    vars = ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
+    varlist = []
+    for var in vars:
+        value = d.getVar(var)
+        vallist = value.split()
+        for elem in vallist:
+            varlist.append("-Csetup-args=" + elem)
+    return ' '.join(varlist)
+
+PEP517_BUILD_OPTS = "-Cbuilddir='${B}' ${@mesonpy_get_args(d)}"
+
+# Python pyx -> c -> so build leaves absolute build paths in the code
+INSANE_SKIP:${PN} += "buildpaths"
+INSANE_SKIP:${PN}-src += "buildpaths"
+
+python_mesonpy_do_configure () {
+    python_pep517_do_configure
+}
+
+python_mesonpy_do_compile () {
+    python_pep517_do_compile
+}
+
+python_mesonpy_do_install () {
+    python_pep517_do_install
+}
+
+python_mesonpy_do_bootstrap_install () {
+    python_pep517_do_bootstrap_install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.40.1


