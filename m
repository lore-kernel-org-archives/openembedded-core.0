Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631AFC7EE29
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:47:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.25804.1685605651663960752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o6XUsbtV;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30aef0499b6so487542f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685605650; x=1688197650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=o6XUsbtVR4/uwiu9YdMqfiC2JHDlj5u/60+BxQCwApsTWc93f2uIRLNOspb4PsC1GC
         XpnKd70iUdTBiwrcJuf/14qcZNv1llobjb/413Qt1ByO6ILz6QAa7bWFzhSAMkAqo8Ok
         tx9t6OWSPHnESv29Kkhap9T9G62ugmby/UAu6+U/d9n/mKEbjebo6uVDmXbjeHmsdUot
         +NWJRDDLv7kOp8P+KZ4n/O5dseApOVXZcLRR2KCoQxAU4PHzTh0R37aLJ6OdUKifurWV
         s1Hn7Kuitva8nfmw62rftzrAN9K5JRsfS4nTT5hFh25/f6Pmw2Gy/FtMxuqROV3FjFWP
         JXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605650; x=1688197650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=dGA1pqy0giwOnoApQv3x+5+68Bi/Gv7tu5G+pCeIij5JJE5wERvX1MS0a5Pg/meHgc
         KYBMD9VTQLnJb+vbtBpq9veRTYXLgeKUnzXgSYJ+ylLTU1pebxTBzA1kwdhksNFE/Z+A
         RFURKhhz5MWgkeID1HeWKNmwIfc6SqiJ0PFSegcEF8rPl5DhjqSHBsOngKZBeNyCY/VM
         cr5xhLYYjpWG3T6Vy2vsgAxsg//sYEDnm65MQsjsXY7/xX6/3N9uuM8udpvLw5AeUnlB
         H8ImEeIpD+x2dT7sfPegGU1dv8/V4R6r8BqNo89pXnnUmbHZveEuB67KXai8TNwCmEb6
         zRuw==
X-Gm-Message-State: AC+VfDxxwO4wJYACv6m5zzrXzHFbhknWYnY1MbGsbBR3h5B8hQXSGKD+
	YhIVtU1/DtKnL+dmXuRD2nZoceWbIVM=
X-Google-Smtp-Source: ACHHUZ4KzRmnAzwZ4rlE9abtdneAImBtLfCHDMtwsYdRu+qfJDqJHg1XNxsAjBUhBNjj99bbND5yTw==
X-Received: by 2002:a5d:6405:0:b0:309:452c:2189 with SMTP id z5-20020a5d6405000000b00309452c2189mr1096580wru.57.1685605649652;
        Thu, 01 Jun 2023 00:47:29 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d522e000000b0030aded83385sm9246735wra.27.2023.06.01.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:47:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/2] python_mesonpy: New class
Date: Thu,  1 Jun 2023 09:47:20 +0200
Message-Id: <20230601074721.1985397-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182050

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


