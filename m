Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89885EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:19:48 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.15967.1687450779309346197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sGx/K+pp;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3ff22072856so40393461cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687450778; x=1690042778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fOrjuR+aZRsIU5ugu4IcX6K0LzpnJJ2Q9L3FOlB7MJw=;
        b=sGx/K+ppHyzyTCqMXMISvKXWTf35wmOn6NeoqYfY+0WOQWUExcSQBsYC7D0JD3hdUG
         C2No7b1wU7z6WjwRzUB5uFoIrbtQmPMiBzAKtGpfkeUcW/mIwsB55IeGQI8b1MR5YfED
         /qH6hsKFQThUi+nUwBrR7T37/ddspKWLU1yPf4A86RiXFghDEIDidR4chiUPbL/3kQE5
         +2CEb/LhainaOFC/5YRRMgr+2+BeK49gD5O9FUaaDMLYtdG31oH1tn89aArk5WqzxfBb
         yJ2tEFsZszw1Dk9IX+h2r9/RNKppHhfh/+HrMlyx7WV2VqASctdnXlIX7f5iSg5my63O
         Fu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450778; x=1690042778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOrjuR+aZRsIU5ugu4IcX6K0LzpnJJ2Q9L3FOlB7MJw=;
        b=VjeNG1wxLxckj70X+3Jdg0vxXEMNTY80F3RhabNu7ZSUnP9K73vJQVx3NdNzTXpTZy
         +9n4Avs0b3zmFZlwRCjV7+zQSwtGXnfyF5yPJoi6lrpHeXAZZTE30TNLum66tOWxVpHX
         m1yVY9vayucnl3EkC5d70JtxsvHojVn+t7Hq8kTxkPT9ZIrrWD8KsuCDhc8enINajPIC
         pkdFgr5E6BtUjWOpUTU/uf3oPerzw9r0SfSWEXadTiCCfoVblMqgiUHuRU/v4ktlktSn
         E4BK1mffkgC23YnW36XPDz0cx5W4WX4e8jP5OYPonqmjJE+uGwkG+uLh2GiBCeizJgwi
         6o7A==
X-Gm-Message-State: AC+VfDw++cBcgKl1iowNIkv+ATC5XNuyMC93IlnKm2h1zEnCFQGbfR+C
	UFq4iziPzuVZRUmmNlFJ8sYAYHWnGy0=
X-Google-Smtp-Source: ACHHUZ6SU4ksaaRjm560Gzuc8EGzgLxrbNOPGF1RQGUPMKWiC+7mKYsoKk5IypuJbADNQ+OhldG4Ow==
X-Received: by 2002:a05:622a:145:b0:3ff:2726:5a91 with SMTP id v5-20020a05622a014500b003ff27265a91mr12604396qtw.15.1687450778118;
        Thu, 22 Jun 2023 09:19:38 -0700 (PDT)
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l14-20020ac84cce000000b003f7a54fa72fsm460698qtv.0.2023.06.22.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 09:19:37 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v2 1/3] package: fix src packaging path for nativesdk
Date: Thu, 22 Jun 2023 12:17:48 -0400
Message-Id: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183263

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

Directory tree doesn't contain the correct structure when packaging
for source files for the sdk. Since the structure is incorrect,
they won't be part of the installed sdk.

Having source files in nativesdk is necessary when using it as a
development sysroot for debugging. Otherwise, when debugging in an
emulation mode it's impossible to step in 3rd party library code.

Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
---
v2: - No change

 meta/conf/bitbake.conf |  8 ++++----
 meta/lib/oe/package.py | 25 +++++++++++++++++++------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..9d9b268858 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -649,10 +649,10 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${S}=${prefix}/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${S}=${prefix}/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${B}=${prefix}/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${B}=${prefix}/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 70040f09e7..b2799aec3e 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -687,6 +687,10 @@ def split_locales(d):
     #d.setVar('RDEPENDS:%s' % pn, ' '.join(rdep))
 
 def package_debug_vars(d):
+    prefix = d.getVar('prefix')
+    srcdir = ("%s/src/debug" % prefix)
+    libdir = ("%s/lib/debug" % prefix)
+    staticlibdir = ("%s/lib/debug-static" % prefix)
     # We default to '.debug' style
     if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
         # Single debug-file-directory style debug info
@@ -695,9 +699,9 @@ def package_debug_vars(d):
             "staticappend": "",
             "dir": "",
             "staticdir": "",
-            "libdir": "/usr/lib/debug",
-            "staticlibdir": "/usr/lib/debug-static",
-            "srcdir": "/usr/src/debug",
+            "libdir": libdir,
+            "staticlibdir": staticlibdir,
+            "srcdir": srcdir,
         }
     elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-without-src':
         # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
@@ -718,7 +722,7 @@ def package_debug_vars(d):
             "staticdir": "/.debug-static",
             "libdir": "",
             "staticlibdir": "",
-            "srcdir": "/usr/src/debug",
+            "srcdir": srcdir,
         }
     else:
         # Original OE-core, a.k.a. ".debug", style debug info
@@ -729,7 +733,7 @@ def package_debug_vars(d):
             "staticdir": "/.debug-static",
             "libdir": "",
             "staticlibdir": "",
-            "srcdir": "/usr/src/debug",
+            "srcdir": srcdir,
         }
 
     return debug_vars
@@ -1257,6 +1261,7 @@ def populate_packages(d):
     dvar = d.getVar('PKGD')
     packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
+    prefix = d.getVar('prefix')
 
     bb.utils.mkdirhier(outdir)
     os.chdir(dvar)
@@ -1271,7 +1276,7 @@ def populate_packages(d):
         src_package_name = ('%s-src' % d.getVar('PN'))
         if not src_package_name in packages:
             packages.append(src_package_name)
-        d.setVar('FILES:%s' % src_package_name, '/usr/src/debug')
+        d.setVar('FILES:%s' % src_package_name, ('%s/src/debug' % prefix))
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastructure
@@ -1301,6 +1306,7 @@ def populate_packages(d):
     oldumask = os.umask(0)
 
     debug = []
+    source = []
     for root, dirs, files in cpath.walk(dvar):
         dir = root[len(dvar):]
         if not dir:
@@ -1309,6 +1315,11 @@ def populate_packages(d):
             path = "." + os.path.join(dir, f)
             if "/.debug/" in path or "/.debug-static/" in path or path.endswith("/.debug"):
                 debug.append(path)
+            elif ("%s/src/debug" % prefix) in path:
+                if split_source_package:
+                    source.append(path)
+                else:
+                    debug.append(path)
 
     for pkg in packages:
         root = os.path.join(pkgdest, pkg)
@@ -1325,6 +1336,8 @@ def populate_packages(d):
 
         if autodebug and pkg.endswith("-dbg"):
             files.extend(debug)
+        if split_source_package and pkg.endswith("-src"):
+            files.extend(source)
 
         for file in files:
             if (not cpath.islink(file)) and (not cpath.exists(file)):
-- 
2.36.0


