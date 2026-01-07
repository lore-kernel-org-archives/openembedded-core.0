Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF20D0D17E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 23:20:39 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19893.1767828034558654098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 15:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sx8z1JJD;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ce2b14202fso1156922a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767828033; x=1768432833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljHbu+anoqAva7sGiIhvLCURyDrRg1mOZ5KayzNhasM=;
        b=Sx8z1JJDuz4AB5TyYhg0RDv5eaRntPJwp2N9s3sAxWkzraweb3VoKXzo8KvLkwsr56
         ED0ZVKoZA+deDnCv6OiXs09e8aeiXF1GTWGeY6nSQPwyv22KTQxliTqQ34l5JEY7rBOm
         LIRLoh/QrptFKx1BOGc9b9Z7F0PUDeOMSwyMVpww0gz+thlJjhCh01yAVCRn11vZZKZh
         ZB3fbYB7VuVJJLMKPIJtgLMyYupbem0f0dWNyVzdsbXH9DUPaatT6oJ4vNfZ7WLiPW0u
         3Kceb13HVDvHcKD7VQAMkmM8e0mCD2ba+w9qkjSiZWKBsJF4gODAEKvtHYHvY0alNNTi
         UfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767828033; x=1768432833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljHbu+anoqAva7sGiIhvLCURyDrRg1mOZ5KayzNhasM=;
        b=goFNxDsDJLwpqcOxG/8l+h22pjWqkY2+kl1gfX9wJkgPYM6PnxMl1BDBfaVXlH97XF
         LhOLZj0X6RZGtSwC+pt2nvWnTTm8Ox7xofVDXafNgHUACMVsSUeQWPWoaxLszB6HP8I4
         y1Hr3H/RwIJ9eemza5O3YD+5i0+M0Xe3qqu9ic7LLjK9Whpp6zaSZDtVjNoi7Q8PKc10
         O+EalVwTv5G4aev/oYy/XJWNU3pKx69sDTJSgeGqSd8DII7ArXz8sM9lQtIvOAxSUqim
         U9J80cPfWPDfpH/cQRoX0Rb28c2+EW1MuaVz87CGcHQ/iFeZlVcXkpiMlNQXW16ISkIJ
         r68w==
X-Gm-Message-State: AOJu0YyAMT4T+VWVXUHnpDWTWHhoUN68lMz/DznAIjxdfw/2YWTZtB8Q
	856+nZlTJ3K2jnqvob57wf51X/MnT+dyGE68h1UpIXRmiDRVVHF7Ku9ieNPsfQ==
X-Gm-Gg: AY/fxX78SYsJ2rqwxsANfIOf5M+OVWQGm0pmMCDus+d9gns3geWCnrfN8r/5tcN55Fp
	DffzmWCIEfi0XsPgwXOEIcVUTdOI0vlWPPZbGJV6smofKHRPb+RUtX55PkWJsqQ/FOUpjgzqSCJ
	Bnw38trxwvTuEGstWZDPisdWSOMH1VyG+zT+wrh6f40cQYK2Uk72AEPedVCQ+9jkYvllYcz5vXf
	Jwt/tYvgv83mSsvBaE/Z0a5WArDAC3SCh2I176az8LO0uB8OzmlP1h247QPNw44RBklZctCl+sj
	iP0BekyEoXp3B8GOhKb7HmsOVjIIaBvWhFT0CvBf93T/1MGRV7k0l6iw9Zn/YLWExhAlcECOOdu
	YI3uEyirko90bll+38MmiXRN8Rf/UIsNDDfculrIkPWhCkfBbhInmrqK/WyRpgWWK7DMSiO0oxE
	julrqHIDw=
X-Google-Smtp-Source: AGHT+IG5SHapwgfjZsy8tvR9iNn3bUBMOCAYBHQPslcT1ZkufUglLHkiLRAxKwu/0+ZRQTTeyti6TQ==
X-Received: by 2002:a05:6830:7194:b0:7ce:2b34:deca with SMTP id 46e09a7af769-7ce50bef411mr2055045a34.28.1767828033518;
        Wed, 07 Jan 2026 15:20:33 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::6be])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ede43sm4192944a34.27.2026.01.07.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:20:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx: Add yocto PURLs
Date: Wed,  7 Jan 2026 16:20:19 -0700
Message-ID: <20260107232019.2649430-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 23:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229035

Adds code to add PURLs to packages based on the PURL specification for
Yocto packages [1].

The SPDX_PACKAGE_URL variable is renamed SPDX_PACKAGE_URLS to make it
clear that it can now be a list of PURLs. SPDX_PACKAGE_URL is retained,
but marked as deprecated.

[1]: https://github.com/package-url/purl-spec/blob/main/types-doc/yocto-definition.md

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 11 ++++++++++-
 meta/lib/oe/spdx30_tasks.py          | 21 +++++++++++++++------
 meta/lib/oe/spdx_common.py           | 12 ++++++++++++
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 96c0b9722b..3adda24003 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -131,7 +131,16 @@ SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
 SPDX_PACKAGE_URL ??= ""
 SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
 the package URL string (in accordance with the Package URL specification) for \
-a software Package."
+a software Package. DEPRECATED - use SPDX_PACKAGE_URLS instead"
+
+SPDX_PACKAGE_URLS ?= "${SPDX_PACKAGE_URL} ${@oe.spdx_common.get_base_purl(d)}"
+SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
+    the software Package. The first item in this list will be listed as the \
+    packageUrl property of the packages, and all purls (including the first \
+    one) will be listed as external references. The default value is an auto \
+    generated pkg:yocto purl based on the recipe name, version, and layer name. \
+    Override this variable to replace the default, otherwise append or prepend \
+    to add additional purls."
 
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
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
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..3f0b25ddef 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -10,6 +10,7 @@ import json
 import oe.packagedata
 import re
 import shutil
+import urllib.parse
 
 from pathlib import Path
 from dataclasses import dataclass
@@ -288,3 +289,14 @@ def get_compiled_sources(d):
             types.add(ext)
     bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {str(types)}")
     return sources, types
+
+
+def purl_quote(s):
+    return urllib.parse.quote(s, safe="")
+
+
+def get_base_purl(d):
+    layername = d.getVar("FILE_LAYERNAME").lower()
+    bpn = d.getVar("BPN").lower()
+    pv = d.getVar("PV")
+    return f"pkg:yocto/{purl_quote(layername)}/{purl_quote(bpn)}@{purl_quote(pv)}"
-- 
2.52.0


