Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6EEC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 08:08:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.26038.1685606906303253169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 01:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VjDpaYoR;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so5486425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685606904; x=1688198904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=VjDpaYoRD2TVezkXjMbbC9ioDmXYr4zVVjzdL8A+os+qusDpeaxhsiLZAEhuRpWFy6
         HCjw7O6oS0O/PhKIOWN0V5BHdePn6FOU/kG3/WTJXpWUfNC1/Cez1GaJlC5LGBLLOzKR
         fKpTg5X9o+WyEygmrtXyxiJCGd9/HZxIX2ZUc/rpHuNv7p2bXnBmWyS6PJYydpqTvj1r
         wGl2Dx7cfsShzr7COnAHKFpd1J6KyHugwFTaaqqjZ98RrLzTPKF1CHr0t6/0v5B5BiFY
         AC2/4cG1TCRkWM8DvmqRou4qSgRAbfsUb28opgaCSxKOJBjLq7l9nKB6MvxAXHMb/wiV
         fZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606904; x=1688198904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/49Xjj7g0KGr6mzQb2M+nd8WQXO/9VdM4cxbpnHsoY=;
        b=lDSItpNBKpkoatauqvO8X/POi7rfSnjASP+24lkk1gvbeFS3Tk59EwK1mrUEFCtr8j
         4SdnvI04HIIgIbWUiT1ZFNf0TLdrbzL4IIlnO9enw7OZfZvNGA45lw9yTs+766d5aHYx
         0f+ot53JTyw5xcq5EfN1RnYjo5lZFVv+N25dyIxpVzIqLBaH3RFVfTEXy7JZk+soNKG4
         0clk3/v56bCntY36Y+WKoct6Fxlv2i7GdR1sTPlliwM0QH6LfgWIB+tZFRE1vUn2MPDV
         NZsHlIFSRh4Y2eWibg3fr2fw9mo8xoiFb8mwJnFHMHA/f0Jsw3AYjyRP0Lyc+tEE5s+T
         iClg==
X-Gm-Message-State: AC+VfDyjhI4w5mDdfQJsXFFl9yCeQn1zDOBJCjgHhJU2lwfbEUsjohQz
	tDWiE8gAzHSHBP4CCo3V1bhOgNeYZps=
X-Google-Smtp-Source: ACHHUZ59JxB67Ted1Q0wz9dn2gsBOvE7c/mbqk2bybYJl7zSiI2BmKWBdnWznSONZYnCtiseGvjnXQ==
X-Received: by 2002:a05:600c:3784:b0:3f4:ed25:8aa9 with SMTP id o4-20020a05600c378400b003f4ed258aa9mr1216505wmr.36.1685606904180;
        Thu, 01 Jun 2023 01:08:24 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003f4247fbb5fsm1380109wmc.10.2023.06.01.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 01:08:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 1/2] python_mesonpy: New class
Date: Thu,  1 Jun 2023 10:08:20 +0200
Message-Id: <20230601080821.2346868-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182053

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


