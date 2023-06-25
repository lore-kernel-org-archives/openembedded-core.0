Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F55AEB64DD
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20355.1687728176502544466
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BASnLPc+;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31297125334so2155005f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728175; x=1690320175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6Cj5qSZt9DkGepYLDgWFhRzzaY5hOkFopWzOO6OEFI=;
        b=BASnLPc+HTRJFVZ+EigsqNA+nMjaCsZ4Hz+8qR6JP6F8raYv1s2HCH6rMW94ZW6NTm
         gq3QRHr5hQ+0fJXO0/MQlGsDG6klBHsNToLlhij9TOFMN7JOeu5iFpCmMW76A87nyyGA
         hSP6kMQHKXdtk5aNHrGvJr4qMkaGRN4QqzX/I5QeyPaajY+pmetlv5WMED/KE76XW8fA
         m8hPVFQHBStDbl2KhHA4BAFZLtiwRS55H1s+esiPtWpBJOKkf8aqIDR0LuU/z7YeqJ8K
         5EofH/4ixMqPKw/cbr8EsnB6xWp98wRkOdCYXphByd1gZG8flstQcyWmb+h/fRdG9pWx
         9Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728175; x=1690320175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6Cj5qSZt9DkGepYLDgWFhRzzaY5hOkFopWzOO6OEFI=;
        b=TMl2jsd0an01YRTVWtPxowUU8uS88Qxa1wp2IethMjxSl4W+4EIKi6nFKrvSZJGjsu
         R25TTxZrjShagY92Sc1+13kCa7roKfpMA+FRq2d3to5IG3CMI47Uj1GJjA0hhT7Sn1lu
         S2ZfASmjOYvSeIhYmNTWy2kexRDAUezeiM6xGaq0xnYtwlzaW8Q3kgsXUwKRenMn4ev+
         q/vbOlfSuvW6wOcGu7TgxINWoizUl80iHqoW9FqnK9VPy2N8v2mTUoY84bZ4POc8jKke
         zdyPMBCfI4zjftkTV8M8MZNoGxULuXDixVE39ZeoKI+xs3bA1A98MgvJqZZfsvOMFFMv
         2ALA==
X-Gm-Message-State: AC+VfDyYK4iVJqplljQLRobvt/yJ3sOxBmN1rCVz1ZF3WzYC7lOvlFCY
	bilsKsX5CYRg1+u4beEo+grCZNyjYtrQWw==
X-Google-Smtp-Source: ACHHUZ6E5j+77soUxaUpyM2r2gZIEEQFujKar1GOilsXK5r5uszDKY4NFW3GOP1o3oAiL+sNbFTSpQ==
X-Received: by 2002:a5d:4846:0:b0:30f:bde3:aa6 with SMTP id n6-20020a5d4846000000b0030fbde30aa6mr27851538wrs.15.1687728174943;
        Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/21] libproxy: update 0.4.18 -> 0.5.2
Date: Sun, 25 Jun 2023 23:22:40 +0200
Message-Id: <20230625212241.915739-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183395

License-update: formatting, years

Upstream has completely overhauled the build system
(cmake -> meson) and available options. Add the most
important ones that require external dependencies;
there's plenty more if someone finds them useful.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py      |  3 +-
 .../{libproxy_0.4.18.bb => libproxy_0.5.2.bb} | 29 ++++++-------------
 2 files changed, 11 insertions(+), 21 deletions(-)
 rename meta/recipes-support/libproxy/{libproxy_0.4.18.bb => libproxy_0.5.2.bb} (50%)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index b0489483869..8faa0602348 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -85,8 +85,9 @@ class BitbakeLayers(OESelftestTestCase):
         result = runCmd('bitbake-layers show-recipes -i image')
         self.assertIn('core-image-minimal', result.output)
         self.assertNotIn('mtd-utils:', result.output)
-        result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
+        result = runCmd('bitbake-layers show-recipes -i meson,pkgconfig')
         self.assertIn('libproxy:', result.output)
+        result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
         self.assertNotIn('mtd-utils:', result.output) # doesn't inherit either
         self.assertNotIn('wget:', result.output) # doesn't inherit cmake
         self.assertNotIn('waffle:', result.output) # doesn't inherit pkgconfig
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.18.bb b/meta/recipes-support/libproxy/libproxy_0.5.2.bb
similarity index 50%
rename from meta/recipes-support/libproxy/libproxy_0.4.18.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.2.bb
index 748b1bd2c04..7faec2d3d68 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.18.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.2.bb
@@ -8,32 +8,21 @@ BUGTRACKER = "https://github.com/libproxy/libproxy/issues"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
+                    file://src/libproxy/proxy.c;beginline=1;endline=20;md5=bb9a177ef1c995311070f34c5638a402 \
+                   "
 
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "caccaf28e3df6ea612d2d4b39f781c4324019fdb"
+SRCREV = "e4f467b05c8adf25e5a2d5464914fc7e92bb7990"
 S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig
+inherit meson pkgconfig gobject-introspection vala gi-docgen
+GIDOCGEN_MESON_OPTION = 'docs'
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
-PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
-PACKAGECONFIG[gnome3] = "-DWITH_GNOME3=yes,-DWITH_GNOME3=no"
-
-EXTRA_OECMAKE += " \
-    -DWITH_KDE=no \
-    -DWITH_MOZJS=no \
-    -DWITH_NM=no \
-    -DWITH_PERL=no \
-    -DWITH_PYTHON2=no \
-    -DWITH_PYTHON3=no \
-    -DWITH_WEBKIT=no \
-    -DWITH_SYSCONFIG=no \
-    -DLIB_INSTALL_DIR=${libdir} \
-    -DLIBEXEC_INSTALL_DIR=${libexecdir} \
-"
-SECURITY_PIE_CFLAGS:remove = "-fPIE -pie"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[curl] = "-Dcurl=true,-Dcurl=false,curl"
+PACKAGECONFIG[config-gnome] = "-Dconfig-gnome=true,-Dconfig-gnome=false,gsettings-desktop-schemas"
+PACKAGECONFIG[pacrunner-duktape] = "-Dpacrunner-duktape=true,-Dpacrunner-duktape=false,duktape"
 
 FILES:${PN} += "${libdir}/${BPN}/${PV}/modules"
-- 
2.30.2


