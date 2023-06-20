Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D8AEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 21:36:49 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.2051.1687297007269673817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 14:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KkLwFBKB;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7624af57b21so349706385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687297006; x=1689889006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AjdiA+kR7BzIh0c0XTKHaiu+IWkJ+58HVZFv9NAz03Q=;
        b=KkLwFBKBesM1apSK/o4GUTY3fuIfHnZkUghqLwVl7iGqcVEuoQLrLFP8tCAAUPyTLr
         SZe1yPwDOlg4A+Q8Fjtx3IcftTwtvx0lZNjY4RoZF4ZUc5h6GDamVFHZaz9wyb7Nrsqg
         daboZFoXXo/NfYG9x21GcIe2VDcEGrtIfIHwywiTX0tMfHL1xTsE99cbA13vv6YHe4NR
         upigwcWaV3Kzsehx8shxpAtm3NZlCtnyV4Y/kGhn37xnbeMd3xa4fHajzMvUMClV4Yc2
         c2lkZys3iPgPBdPplu2TGClNT5mPEhAsSIRIIQMDkotnD7iWqthQ0d8ajT5KTZrmbMB8
         gOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687297006; x=1689889006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjdiA+kR7BzIh0c0XTKHaiu+IWkJ+58HVZFv9NAz03Q=;
        b=UmWl8OY5bRGsbE5okUlcYhXI6Wf0lMW/O5Xq/D33DV2tqP+If3fJL6j4SmEelK8+aX
         7W1an/7rmzMxK3Hre/3kfny2ugm5N9N9U1sbUBTVrX0iX29XMy3KmlNj1/+yGmOG1qIQ
         GUT9wDy7ifeHz4LJgXNV4Y84yxL4dhjExgc+F7k0ejAyAS6M4DkatHr5FfIFNHXQpd8B
         yoKcb8cZ9ODUTxjB6qKrlCAFOqz7mKPEJZDnfCiN3OJltRLTubszT/S39BpeOK32vNof
         OX9SGAugatd65VbKS+9PmToL6F0nYHcVwtIP/rycp5CqgGoOVQBDrW8vOd6SC6BdWoP0
         +RUg==
X-Gm-Message-State: AC+VfDwG4b8kgLauqeimvb3FDqFdnksUF6fDSvb3rM8p7HQmBfLp6yJK
	Zye/cRLoxHFPVvltXyMaM/p/P5FbfAA=
X-Google-Smtp-Source: ACHHUZ5C5fJouyb54lAIOunLIjqPZ9Not1Wktt+k5R/H8cK0sIKzjWtjAu2p2u1u5P5kQ3uR+5eWsQ==
X-Received: by 2002:ac8:7d0e:0:b0:3fb:42ac:551c with SMTP id g14-20020ac87d0e000000b003fb42ac551cmr18644121qtb.33.1687297005939;
        Tue, 20 Jun 2023 14:36:45 -0700 (PDT)
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id g4-20020ac84684000000b003ef1586721dsm1571136qto.26.2023.06.20.14.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 14:36:45 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
Subject: [PATCH] package: fix src packaging path for nativesdk
Date: Tue, 20 Jun 2023 17:36:40 -0400
Message-Id: <20230620213640.2050758-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 21:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183156

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

Directory tree doesn't contain the correct structure when packaging
for source files for the sdk. Since the structure is incorrect,
they won't be part of the installed sdk.

Having source files in nativesdk is necessary when using it as a
development sysroot for debugging. Otherwise, when debugging in an
emulation mode it's impossible to step in 3rd party library code.

Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
---
 meta/conf/bitbake.conf |  8 ++++----
 meta/lib/oe/package.py | 25 +++++++++++++++++++------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 702881144e..eb438a1499 100644
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


