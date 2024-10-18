Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF5ED3F2BB
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 22:08:34 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.33573.1729289309981394209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4unN10a;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e6005781c0so966728b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729289308; x=1729894108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4fay7qcHrEpKnh6n6qL2gXUE736MQW/eCFY5zW5btY=;
        b=h4unN10agjUKg0uWhksePTHhsJhAFwDh8QeLABPy94JLKUBTEzDHb1GsYRHMert26F
         c6E84JzmgAfXAkQ+JaqB9Bg8qokYdfUh3AHMUHnrLxkNA61dMeEwBHM70jO4EAQOK9kR
         3+ffntJGAD5gq+ytB0sdlU0hcZ5R8ASIP9wpXzIE+LUR2X3YiHWRIQX/2ANHmSq/wo+L
         j9q96G7jHvH5KWVc4++smY0YLNdunSvFAZiKp6rzzjFghqj8RI4pDDh99L+77TrR2Da7
         UCfY5BvgNwBV+W9Zhzyq2EhpBOFTd5759p+HaRS2Y8j5kApeBWtlpACTtUOnAF9QUizX
         bGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729289308; x=1729894108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4fay7qcHrEpKnh6n6qL2gXUE736MQW/eCFY5zW5btY=;
        b=l2Mu5Wybs/9mZB+r+T3xnNfzCfpBX5mCn17srqD8ad0GL3bw32YDYwLNno/RY86p9e
         3PMMK3Ky9IN0+lEaYvTJk8hul2UQRa+yxq3AcVQyrZwC/kfHR9M2dnsOujtzGGfEjmpA
         fJP/BJTCo6lugZ8IhZSCNWSxxOnpQO4bbo+Wr7UfX8YO3Haqp92OtIeX7lbFc6r1oOkl
         nNNz/CbCQD2NJJuiX45bUwYcEqwYEbvAYpt9jHm3aRTfPJ6qW+ujsoHizsYHcKQVo9eM
         +Qkrp5ukdtzv6CuoJTtBES12URwnTL4EVoVM4/TeM//9IuvFDu2qRxj2hplPR5jiJD/R
         5KxA==
X-Gm-Message-State: AOJu0YxoysVmcseanmSnFYMjsd6pMVaBPRf1t8nNgXTR3vCmaD9IrZ6j
	Rmkxb2V9xZhbyYP4sjichWYgrSwqqZoCVLEQJ9/E0P+gXPuiK3AArJmAuA==
X-Google-Smtp-Source: AGHT+IH9DY3Xoi2dWNlxj0RlQ5HoPEezzw/OoU1kLrGWhP8mYGwyXwT4fkV7iQvAYd/ItT5gKYMz/A==
X-Received: by 2002:a05:6808:159e:b0:3e5:fe39:7f10 with SMTP id 5614622812f47-3e602c58dbcmr4251283b6e.10.1729289308666;
        Fri, 18 Oct 2024 15:08:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9a72])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6029b7874sm554446b6e.8.2024.10.18.15.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 15:08:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/4] lib: license: Move package license skip to library
Date: Fri, 18 Oct 2024 15:59:03 -0600
Message-ID: <20241018220818.4042304-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241018220818.4042304-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 22:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206075

Moves the code that skips packages with incompatible licenses to the
library code so that it can be called in other locations

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass | 36 ++++------------------------
 meta/lib/oe/license.py           | 40 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 88b932fc3f0..b81e61fdb72 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -573,42 +573,14 @@ python () {
 
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
                     bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
                 for pkg in unskipped_pkgs:
                     bb.debug(1, "Including the package %s" % pkg)
             else:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7739697c401..75b1e70ba0e 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -422,3 +422,43 @@ def check_license_format(d):
                     '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
                     'in the valid list of separators (%s)' %
                     (pn, licenses, element, license_operator_chars), d)
+
+def skip_incompatible_package_licenses(d, pkgs):
+    if not pkgs:
+        return {}
+
+    pn = d.getVar("PN")
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
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
+            d.setVar('_exclude_incompatible-' + pkg, ' '.join(incompatible_lic))
+
+    return skipped_pkgs
-- 
2.46.2


