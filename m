Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617B7D0E3E0
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 19:04:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.4516.1729796688447712801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 12:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cF+wa3yG;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-27ce4f37afeso920989fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729796687; x=1730401487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KI/gANFO2v4nqDVOnl/wP8ydaEQos+O/roVjql14wA=;
        b=cF+wa3yGXYU/+m7HO1dyteCU0sbNduDnz8tRNiRRd7MnCy+EcaKL1wNe1n/F4/Caf0
         viTqj+S9QpTVXXLDgykS782C6ps8ckS8IXEbSm36sPz+13FW4sh5ZdyDn3mJdXBHnlAb
         UdJOOc//PrLwK12AfTwgi7kxZU+kfhJwHy3YY3C6fLdAUTcLz5G3LeELdWkF1cpteaDb
         eVIo4j/H9jpNXYr8ibauDNd5W14gxLEZRTIpr34k9d6vJkKPlNdz2r+MgB6SLmuwKGeu
         unzF3u0f58+1NnJioN3A7zOISjsfBpceOfO6UkCdoadEpusDl+lXDwrgpEZlulrI3MMq
         ft+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796687; x=1730401487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KI/gANFO2v4nqDVOnl/wP8ydaEQos+O/roVjql14wA=;
        b=oZ6xUKJnWmohnxxWWQbJ5eJRRqYP64D09eIHYlacs9PdHmLWEMigIN7VTioVAtODMd
         2WLBg4iXizGX21mRaZV/CfAtgl7WnxsvUWcosZGOedZiaclMzA8tlYJdLi38Nq3iAlWd
         bSLLK8EQUR0DxnCvTMVRUfrT/jFqaURxeHJaPQK+5n5tAsTD2X5rjtPZL3bFP8U0I9Er
         NCdi8RY1cJoqXU4eavTT2t9ha/VZt3PccX+Dhug0mMAzsYWBaDNLTJpLYIKcNNsywMQX
         QVaMw4laPBcvqbc52kRwmh91tRTL9F3GyiUHodRpGDVI6c+gEi7kDGNpt6fNtrZrGXGb
         ytsw==
X-Gm-Message-State: AOJu0YxWjMo1g5cE4Bgo8Mnetbe/fkTzLNsrUfw64DSHfgarfBdTaNXY
	qmwEAZRn3A02zIwsqSzBjp5/KYOa7VZ7qoR09ryVlrmFOY6421kB80plRw==
X-Google-Smtp-Source: AGHT+IEq4J1NZdfMQZtrgJRaX36rIpjE5rF6lAmVdVW4a0E1xzYQ0A8jTbfgccMbLHV5s6M1lwAfTQ==
X-Received: by 2002:a05:6870:d106:b0:261:1aad:2c03 with SMTP id 586e51a60fabf-28ccb9fb991mr7638812fac.43.1729796686953;
        Thu, 24 Oct 2024 12:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4437])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd5af8sm2233242a34.55.2024.10.24.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:04:45 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 2/4] lib: license: Move package license skip to library
Date: Thu, 24 Oct 2024 13:03:08 -0600
Message-ID: <20241024190438.3630946-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241024190438.3630946-1-JPEWhacker@gmail.com>
References: <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241024190438.3630946-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 19:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206305

Moves the code that skips packages with incompatible licenses to the
library code so that it can be called in other locations

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass | 35 ++++------------------------
 meta/lib/oe/license.py           | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 88b932fc3f0..5b8663f454d 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -573,37 +573,10 @@ python () {
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
 
-        check_license = False if pn.startswith("nativesdk-") else True
-        for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
-              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
-              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
-            if pn.endswith(d.expand(t)):
-                check_license = False
-        if pn.startswith("gcc-source-"):
-            check_license = False
-
-        if check_license and bad_licenses:
-            bad_licenses = oe.license.expand_wildcard_licenses(d, bad_licenses)
-
-            exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
-
-            for lic_exception in exceptions:
-                if ":" in lic_exception:
-                    lic_exception = lic_exception.split(":")[1]
-                if lic_exception in oe.license.obsolete_license_list():
-                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
-
-            pkgs = d.getVar('PACKAGES').split()
-            skipped_pkgs = {}
-            unskipped_pkgs = []
-            for pkg in pkgs:
-                remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
-
-                incompatible_lic = oe.license.incompatible_license(d, remaining_bad_licenses, pkg)
-                if incompatible_lic:
-                    skipped_pkgs[pkg] = incompatible_lic
-                else:
-                    unskipped_pkgs.append(pkg)
+        pkgs = d.getVar('PACKAGES').split()
+        if pkgs:
+            skipped_pkgs = oe.license.skip_incompatible_package_licenses(d, pkgs)
+            unskipped_pkgs = [p for p in pkgs if p not in skipped_pkgs]
 
             if unskipped_pkgs:
                 for pkg in skipped_pkgs:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7739697c401..32c77fa204d 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -422,3 +422,42 @@ def check_license_format(d):
                     '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
                     'in the valid list of separators (%s)' %
                     (pn, licenses, element, license_operator_chars), d)
+
+def skip_incompatible_package_licenses(d, pkgs):
+    if not pkgs:
+        return {}
+
+    pn = d.getVar("PN")
+
+    check_license = False if pn.startswith("nativesdk-") else True
+    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
+            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
+            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
+        if pn.endswith(d.expand(t)):
+            check_license = False
+    if pn.startswith("gcc-source-"):
+        check_license = False
+
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
+    if not check_license or not bad_licenses:
+        return {}
+
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
+    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+
+    for lic_exception in exceptions:
+        if ":" in lic_exception:
+            lic_exception = lic_exception.split(":")[1]
+        if lic_exception in obsolete_license_list():
+            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+
+    skipped_pkgs = {}
+    for pkg in pkgs:
+        remaining_bad_licenses = apply_pkg_license_exception(pkg, bad_licenses, exceptions)
+
+        incompatible_lic = incompatible_license(d, remaining_bad_licenses, pkg)
+        if incompatible_lic:
+            skipped_pkgs[pkg] = incompatible_lic
+
+    return skipped_pkgs
-- 
2.46.2


