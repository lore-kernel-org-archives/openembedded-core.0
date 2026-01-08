Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FCDD1D47D
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:30:53 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8987.1767886252734958072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 07:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5ara3Q/;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c6e9538945so1267255a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767886252; x=1768491052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEYZ/Q/SBZjqfcPREBqtD0YUn6guKtaIQk8nz7T5TFM=;
        b=N5ara3Q/YcnHr1ZK7LeZILxKf2FJGZGxEDxjbDwDEvEs1V1J90E2sYFJlr+hnz4YHv
         rbe5BGsDL/PfX3jcYrGgXG9TJEpWpsj4SgRctcndG9RShg6DwQFu9eQibkkVe9n69ebj
         d5UFbxiLh1wXmJL7ATjei7SJSGE0HZx0NrrySN6iuiCIGaMhnnZOr7RAxhpnPo5Utfuv
         mExyDCGWD33St9RINNQetBuIVBDD0fNTm/tlw12tnbp7zqOchMEy/9oDLZa93Oru8XBw
         XbMu0kkO77gBIm7Lhg/RuUH5i4aMDN0rb5Q0jYv6C4Yasuv6lSsBC18DVIFaGGWhWXCu
         bayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886252; x=1768491052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEYZ/Q/SBZjqfcPREBqtD0YUn6guKtaIQk8nz7T5TFM=;
        b=B+zh9E47+T+16JaVt4XUXNhRQwr2dd/3Oo/2CvAdNbGtZ7/79PN0f1l5cOsphMcwxJ
         UY9EgqntGhBdMl9PMLSD1QNcjIicCONsHYSTp/0/vFMJWL9DwbKNCvM6SxXsaL7NhLYD
         FAgHKNzoXXdTUq+F+ctgTan70Ja0JnZdadvVtOdv1NUnbCl06LlY8JOTdHx5IiF5ym5Y
         CmRN1Sea5hpP43adkbSjzMIH7ulsEn9AnU6RX0MLAtgga6M82wKDYbyKlQ2hW5rUuZ0a
         3KCxAJSuFoLt0qvyvPdEjWV/DMoin44Zxswg1d61zUh5GD2IOh029ljBFHOygmCEgPEn
         R43A==
X-Gm-Message-State: AOJu0Yz6TlN+lCOp9jTgZDULXUoU/uaszWbGZo+FlOf+fuiIE2yjUZtZ
	DR6ZYiiOEF3w62h7YgRiSlbaZuk+0DZQUGhmb0TZBvqzAQ0MnZwhMH/aCboPzw==
X-Gm-Gg: AY/fxX5b7DExTEztWIMbehsMirf/mgBfIKPUJ1wxaolOitPdxAU/Ax/LwLuHmnumLpF
	RLYRS/gt3L0qH7v+5Z2MymGInSABQStRSZIyLd9LUsYPsNGYtlAXwmYqemcgmjj26aGzoDq6ird
	gayiBMFeDkl2QNs/GJ3emevk9a7jY6cy6moYtRWsFH+hFQyP0dFMgFl772mXdlpGsx7ridvPvQs
	F5yIZUzYRMC932WpQuWJAXSBrH2DJ+L3V2N+fj05DUio1gDrL4OV9bMXpQ46BNQYEarZ88Q99Cq
	gDMEczk27DgHO54U+Rg+M6tD0aBresnbOTPoN8ohDbTvCI6bJLD0YRQBE3Pa8sw58itaHImSega
	yyhDbGX8JNiFMlewwfoz4ni5L1uBEQsQGHaQh97q+GhN0n1qxzh2CedFUC3J4F04BCu/b37+Ewz
	jqzO6jrXYG
X-Google-Smtp-Source: AGHT+IEMu6Vi81Im6/N+l8E9+B8ZYR5jsebbWCSlrR+iZNjzjPDGq1TMPu2b8E7YqrO78moMy9ywNw==
X-Received: by 2002:a05:6808:e89:b0:44f:f5de:5519 with SMTP id 5614622812f47-45a6b8211cfmr3517202b6e.18.1767886251588;
        Thu, 08 Jan 2026 07:30:51 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::78bf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5dfb6256sm3737669b6e.0.2026.01.08.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:30:51 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] spdx: Add yocto PURLs
Date: Thu,  8 Jan 2026 08:30:33 -0700
Message-ID: <20260108153033.2837942-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107232019.2649430-1-JPEWhacker@gmail.com>
References: <20260107232019.2649430-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 15:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229084

Adds code to add PURLs to packages based on the PURL specification for
Yocto packages [1].

The SPDX_PACKAGE_URL variable is renamed SPDX_PACKAGE_URLS to make it
clear that it can now be a list of PURLs. SPDX_PACKAGE_URL is retained,
but marked as deprecated.

[1]: https://github.com/package-url/purl-spec/blob/main/types-doc/yocto-definition.md

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 11 ++++++++-
 meta/lib/oe/__init__.py              |  2 +-
 meta/lib/oe/purl.py                  | 34 ++++++++++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py          | 21 ++++++++++++-----
 4 files changed, 60 insertions(+), 8 deletions(-)
 create mode 100644 meta/lib/oe/purl.py

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 96c0b9722b..d4575d61c4 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -131,7 +131,16 @@ SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
 SPDX_PACKAGE_URL ??= ""
 SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
 the package URL string (in accordance with the Package URL specification) for \
-a software Package."
+a software Package. DEPRECATED - use SPDX_PACKAGE_URLS instead"
+
+SPDX_PACKAGE_URLS ?= "${SPDX_PACKAGE_URL} ${@oe.purl.get_base_purl(d)}"
+SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
+    the software Package. The first item in this list will be listed as the \
+    packageUrl property of the packages, and all purls (including the first \
+    one) will be listed as external references. The default value is an auto \
+    generated pkg:yocto purl based on the recipe name, version, and layer name. \
+    Override this variable to replace the default, otherwise append or prepend \
+    to add additional purls."
 
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 9e4134c483..13d887a4aa 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -12,4 +12,4 @@ __path__ = extend_path(__path__, __name__)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
-             "cve_check", "tune", "classextend"]
+             "cve_check", "tune", "classextend", "purl"]
diff --git a/meta/lib/oe/purl.py b/meta/lib/oe/purl.py
new file mode 100644
index 0000000000..2f92a23596
--- /dev/null
+++ b/meta/lib/oe/purl.py
@@ -0,0 +1,34 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import urllib.parse
+
+PREFIX = "pkg:yocto"
+
+
+def quote(s):
+    """
+    Returns the percent encoded version of the string, suitable for including
+    in a PURL field
+    """
+    return urllib.parse.quote(s, safe="")
+
+
+def get_base_purl(d):
+    """
+    Returns the base PURL for the current recipe (that is, the PURL without any
+    additional qualifiers)
+    """
+    layername = d.getVar("FILE_LAYERNAME")
+    bpn = d.getVar("BPN")
+    pv = d.getVar("PV")
+
+    name = f"{quote(bpn.lower())}@{quote(pv)}"
+
+    if layername:
+        return f"{PREFIX}/{quote(layername.lower())}/{name}"
+
+    return f"{PREFIX}/{name}"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f731a709e3..01e7dcbbc6 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -639,12 +639,21 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
-            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
-                set_var_field(
-                    "SPDX_PACKAGE_URL",
-                    spdx_package,
-                    "software_packageUrl",
-                    package=package
+            purls = (
+                d.getVar("SPDX_PACKAGE_URLS:%s" % package)
+                or d.getVar("SPDX_PACKAGE_URLS")
+                or ""
+            ).split()
+
+            if purls:
+                spdx_package.software_packageUrl = purls[0]
+
+            for p in sorted(set(purls)):
+                spdx_package.externalIdentifier.append(
+                    oe.spdx30.ExternalIdentifier(
+                        externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
+                        identifier=p,
+                    )
                 )
 
             pkg_objset.new_scoped_relationship(
-- 
2.52.0


