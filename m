Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99674C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:30:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.82.1708363855214948524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTBrqhjt;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dbf1fe91fcso9820825ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708363854; x=1708968654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3kZVyRFDEYRz6XY10W86nABiQe8s4y7ht3sMyisbVs=;
        b=dTBrqhjts7Ondu3kzqi7YzLHPCVA3XaZ5tI1gAU9TxaIylSM7WijnyWx8Iclmgqq0Z
         vT0bd5KvoV0TX8sIuRDuS8W+S6v0LhEjApGo6iD2Fp2IIsjxDycAhKgbIjjzqzgi8JnY
         yDaw5NWrBfhPOYEoUsGTdzOK+OWoZLiX52HI0wicOFNHC/ylqFUhm4lT9qASDcj/SA0Q
         UpTusb+gD36Hu9hQJttial0UxqTfdkvXb4GQPG9C3Q54pfVJ6NibkpyhMV8hDK0ngOWH
         g6GL28RITXH1MFAXYu5SbQ0+6hjC6ErOQqPaMZM4hx6GPhbaLar/JP7T6h2bHNekG/vv
         nG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363854; x=1708968654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3kZVyRFDEYRz6XY10W86nABiQe8s4y7ht3sMyisbVs=;
        b=pQQofkH/PADLN6npOv/woePTmq0pEuD/+iBu0DG9xc6bRhsMVMCeksAF9sNl2nIRrn
         U85hH+edv5PgAxSknQVAn04ry0KlTThF+fWfk5R3jPM5FXx/wB3ENogxi8eo949cesQk
         yi8bRG9qxFT0PBBzmGLTTukjzEk5VzFcdLc1JHI4ka/5Odm+LFntq2lhAA8aPkEjGKlJ
         g9wa+xL+OgVSGC5H8dJX5jQwPdjew34/ywjqc/wRAjUMHRIHnHQJjUe0P++tv3+r8nzy
         SEPcM0eqZTTZ+Z2Vm2SNfqXaV6zbPSUrd6waI0OTGpN8DBHRiO3ZJIUQ4KvVP9LnMuuL
         F12A==
X-Gm-Message-State: AOJu0Yy8MZPNM7cHQOrF1z3z4JAQIb9SMefxIjxMX8iayEcqMXrUExxW
	NoqkGjaXSfDiHynDNg5RB8CnVSSaumcArtHsr1j5LcLZ/hFmlTwHVdTmqHEe
X-Google-Smtp-Source: AGHT+IEvB93j/NESHwOHoG4PVvoY1OQasjV4syaU6lhKjJ8vSerKO3+30sCMe8yn4A41CYp8eOBU5w==
X-Received: by 2002:a17:902:ecc9:b0:1db:b69a:3fb9 with SMTP id a9-20020a170902ecc900b001dbb69a3fb9mr12144320plh.25.1708363854266;
        Mon, 19 Feb 2024 09:30:54 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001d965e737f2sm4630428plc.268.2024.02.19.09.30.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:30:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python_mesonpy.bbclass: move from meta-python
Date: Mon, 19 Feb 2024 09:30:22 -0800
Message-Id: <bbd4321b0196dc3f301f6260bd6cd9419580c97d.1708363628.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708363628.git.tim.orling@konsulko.com>
References: <cover.1708363628.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195893

Move the PEP-517 back-end bbclass from meta-python to support:

[build-system]
build-backend = "mesonpy"

This is the declared backend in python3-numpy since:
https://github.com/numpy/numpy/commit/942fb8caf33a65e449fbf198ecf1cd39be953248

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/classes-recipe/python_mesonpy.bbclass

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-recipe/python_mesonpy.bbclass
new file mode 100644
index 00000000000..131fa74bede
--- /dev/null
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -0,0 +1,52 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit meson setuptools3-base python3targetconfig python_pep517
+
+# meson_do_qa_configure does the wrong thing here because
+# mesonpy runs "meson setup ..." in do_compile context.
+# Make it a dummy function.
+meson_do_qa_configure () {
+    :
+}
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
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.34.1


