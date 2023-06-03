Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD228C7EE2E
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 08:07:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8004.1685779629129307532
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 01:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aywXII6T;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so2164883f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685779627; x=1688371627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=aywXII6Tr9QdVbTLL4GF9pMuk/GZzdyg8cqTY7vb20EFn7JNaxvJZ5ku4CUC26Ymth
         PJSX9y8sKtdBLXAv4/QMdS79WpwtERxF5vV4EJTGoHzvYjpuV0o47JzDQ7QuRgjasYa4
         6x5I5LkEYxkAPvBZ8AYsVX0mgtCnf5PjISaPhymjKhkgSWpxOTyyewkAicOmH+LXZu7g
         yZUmtQQkPTRFUq/JhODc60szn+lK2Y55sCXV3+DF1EDrLDdrIyM8llQjp2RSLJ+JXaP/
         J/+Y2uuRxZl0JHChS2gohHxx4ndNHwiifOsWHXTvFg3MW4OKiU9HvatUKaeHqe9+Izav
         P5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685779627; x=1688371627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=JvsPtadiBgXr6fkKM2sA4s44G5H/j99bGl4DcuVR2GYNat6WhFKq7uCZ/XM+YRRu01
         zSnAICDIhV2rDdIuOQAaP22ECBzDGNVS+KcwgtgQv1rlCMOPYv7gTJQNpsfzRZdX6ak0
         F3/KiNZlv6zH8+fR454r4/McOiZ+Lz9jMQIZFQ/vptaAWPLTbCCoWSQ93T+FIzjz6paf
         kKyKR/xc4EaieRNBSd+11oB/v1k+sQ/hbjhwvZzLVonAuEwCS24arS/NlCDZPWYW8RLL
         ManAkWzrtpooaUztkRO7/wtFuX4reWwQ4SZHgEapobanm3UMYRlxIgtvYPnQmO5pugaZ
         W0yQ==
X-Gm-Message-State: AC+VfDxT9NEAy2z5nCqTRRTA8nFFWRSFJO8CCsujjJs0u+cPGhTMoGiy
	Ci475rC85A4ks7kKW4VztTz9ByiKgnE=
X-Google-Smtp-Source: ACHHUZ7o5zv9U3/o85WANkBCyOzeWaxhFLENdRhp5f4hxWNs028tuGD+kzAEgr+OL+LlrSoV7ySsMQ==
X-Received: by 2002:a5d:5915:0:b0:30a:e70d:8022 with SMTP id v21-20020a5d5915000000b0030ae70d8022mr1433709wrd.26.1685779626965;
        Sat, 03 Jun 2023 01:07:06 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i8-20020adfdec8000000b0030796e103a1sm3801902wrn.5.2023.06.03.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 01:07:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 3/3] python_mesonpy: New class
Date: Sat,  3 Jun 2023 10:07:03 +0200
Message-Id: <20230603080703.1400571-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230603080703.1400571-1-zboszor@gmail.com>
References: <20230603080703.1400571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182349

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


