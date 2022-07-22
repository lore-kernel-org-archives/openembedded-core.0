Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04848C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.11360.1658515170748928318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lXIW+XvE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ss3so9917890ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HV4O1xBjO7ifIR0IJ+F/PuCW3AjHrupNa+IcB9E8ZQ0=;
        b=lXIW+XvEHyreN/4sl0fIin+Ml9ooKr8rYqa0+w4YJCuUPJMwvLfS8f3ZInyjRaEjo1
         gLmKv/lZY9j2zbIqzdzf1rP+szkaoFNlTpTz25ir7eaGe4DpBHpudAh+yYvEZm1Fp5eQ
         5ModiQoXGSaaskk2hmdsPp5OlWoRzzaT5mSe/45azXKtTMBNpVaB4dtQaGc0ApoOg+nU
         wPkAkr0t55N2u43RC9WJky4LWEr1iFp00pfdcdwwxX9Db+yirQawCiP8zvBkvTe1DEdf
         XSokEq40WvNVLvQJash2vWvUj+SpE7FczxettFmvwnjFwuEOJ1oCK2fKImhQvcWVFjyg
         WBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HV4O1xBjO7ifIR0IJ+F/PuCW3AjHrupNa+IcB9E8ZQ0=;
        b=t+oysEXI+KrcarOahkWqiMBIYVhUlI6FEpSbJZ03fXiYla30j8bb/XVA98QIhSYw4y
         7DAo23TDX+sxZvTcpIomuqnTY+C41F7xvKdPWsydJInlH6XB1kNr1GPLOfWVVwXyLIsq
         pzE9sgzg7SAXIbY7yCK1Nzg+Ub1st3dDeMFgaT8oAIkderlI08Pm8ez68/5tAzLOEYOS
         cGjbH563N5uLu10A0qCTXKiNxwjaehf82y1WwCmnZnlxIfPOfg3T4iLpRdSsE8Lz3eYZ
         Mbt5upurL84HQEYqvKdh16Y03Xe2oYwK/X6joUeUEVQB3kFkNo3MBQ+adb77+Tro7Wle
         MO0A==
X-Gm-Message-State: AJIora9FX4k4KNtRmCOgVQua1xuK5pje1BB74M501MUX8MGuEXSLOvgm
	vOY5onBdp1UmdNyEFgT0a5zXNEHjjG0=
X-Google-Smtp-Source: 
 AGRyM1uuvcND/J3zpn9MV025h8Am8QtW9+hGYlftKj85LOihSfrb+baL+pvFpafRhJPayiYOl5tSsw==
X-Received: by 2002:a17:907:1c24:b0:72b:838f:cada with SMTP id
 nc36-20020a1709071c2400b0072b838fcadamr920102ejc.125.1658515169313;
        Fri, 22 Jul 2022 11:39:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] meson: provide relocation script and native/cross
 wrappers also for meson-native
Date: Fri, 22 Jul 2022 20:39:15 +0200
Message-Id: <20220722183916.360600-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722183916.360600-1-alex@linutronix.de>
References: <20220722183916.360600-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168422

When using meson-native directly from bitbake this has no effect and
everything works as before; the use case is being able to build
meson-driven projects from the 'direct SDK' environment. Build systems
like cmake/autotools are entirely driven by environment variables,
but meson needs configuration files, and so this replicates how SDKs
set things up.

In particular, with this change the libepoxy build test from the SDK
test suite is able to pass.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../meson/meson/meson-wrapper                 |  2 +-
 meta/recipes-devtools/meson/meson_0.62.2.bb   | 34 ++++++++++++++++---
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index 8fafaad975..c62007f507 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-    echo "OECORE_NATIVE_SYSROOT not set; are you in a Yocto SDK environment?" >&2
+    exec "meson.real" "$@"
 fi
 
 if [ -z "$SSL_CERT_DIR" ]; then
diff --git a/meta/recipes-devtools/meson/meson_0.62.2.bb b/meta/recipes-devtools/meson/meson_0.62.2.bb
index acfc64fd4f..fd91da2d1f 100644
--- a/meta/recipes-devtools/meson/meson_0.62.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.62.2.bb
@@ -75,7 +75,7 @@ def generate_native_link_template(d):
 
     return repr(val)
 
-do_install:append:class-nativesdk() {
+install_templates() {
     install -d ${D}${datadir}/meson
 
     cat >${D}${datadir}/meson/meson.native.template <<EOF
@@ -117,11 +117,19 @@ needs_exe_wrapper = true
 sys_root = @OECORE_TARGET_SYSROOT
 
 [host_machine]
-system = '${SDK_OS}'
-cpu_family = '${@meson_cpu_family("SDK_ARCH", d)}'
-cpu = '${SDK_ARCH}'
-endian = '${@meson_endian("SDK", d)}'
+system = '$host_system'
+cpu_family = '$host_cpu_family'
+cpu = '$host_cpu'
+endian = '$host_endian'
 EOF
+}
+
+do_install:append:class-nativesdk() {
+    host_system=${SDK_OS}
+    host_cpu_family=${@meson_cpu_family("SDK_ARCH", d)}
+    host_cpu=${SDK_ARCH}
+    host_endian=${@meson_endian("SDK", d)}
+    install_templates
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
     install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
@@ -132,3 +140,19 @@ EOF
 }
 
 FILES:${PN}:append:class-nativesdk = "${datadir}/meson ${SDKPATHNATIVE}"
+
+do_install:append:class-native() {
+    host_system=${HOST_OS}
+    host_cpu_family=${@meson_cpu_family("HOST_ARCH", d)}
+    host_cpu=${HOST_ARCH}
+    host_endian=${@meson_endian("HOST", d)}
+    install_templates
+
+    install -d ${D}${datadir}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${datadir}/post-relocate-setup.d/
+
+    # We need to wrap the real meson with a thin wrapper that substitues native/cross files
+    # when running in a direct SDK environment.
+    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
+    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
+}
-- 
2.30.2


