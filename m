Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F8ECFA47B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:20:27 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.9322.1729718425663078496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X4b05Y8U;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc05007daso127243eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718424; x=1730323224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8yWpv7F9SGm+ml67qmOPGskGrZvuYjwuCHqfA80ouw=;
        b=X4b05Y8UguYEzMA8rEEmItcDLLBk3ob1nTAb7P3bK4JeRY7adIL6MQ15XCNOiWIFtR
         e2tPDotcBwFWgin0GeutINLbZVfgxldNLzqX0An/Xgp7L2cbBrABAB7hjhh4GIunwyAA
         MvKsGkMT5gcS35f7yBEp8XQW4h+iTfORfzLYyQLo5sDk/maFtldJ49wBtpB2EeZMBi/4
         MQ/5u8TfTpwiw1ifwrBgosG4ZCZLFlQkMgFUc+kcEqU8uLlZ+xyXcQP/7OnlLIbDlyo5
         qVC5AC8pscxNhYX3slp3eRSkXSNDONxoVEUk3J2F2VacJ7FVj5XV4dqWODMgv0MCQb3q
         6csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718424; x=1730323224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8yWpv7F9SGm+ml67qmOPGskGrZvuYjwuCHqfA80ouw=;
        b=IGyx+EyO5uQT/tjZkC02Gmb4GWeTuI6ltJ3DrLLVAIbQy62ZHyMuFwj0ixk6xvfoyc
         d2jGt7bCkoWiJDW3uGprgrDEfABZmW4jSkHR2NHTao0reB0P3/HuIRcpHpWB/gjCivj3
         yaF5SiA9dfZ4HbfaURg4UWhz4XNRDXVPDFS9n0AHyTDO15rzeA4HZuWH2e8PXVhyOhFA
         kG6ElzQXyfriIQeeolllqRT51CQTjPbbbFnKQHdWWJYOMVKnaSyRikOwUj6jIgLNlZV1
         HpvfY8ybgsLGSfR68iT4mSFfjtDCSfPbgnJgNJWLoVajbQt6v9/nZJET0YbxllWJz0IK
         yMHg==
X-Gm-Message-State: AOJu0Yz7OolpKw+FecaiMS0drE89C/YkO75SZ3ZX5xv+AuN7qZW+kc37
	zcKiPiI85FIfw1kMBNsg4SYZhjWMeKqAVzjRtZJGIP5UD0CCEZbCrKYE6A==
X-Google-Smtp-Source: AGHT+IFPcpyexl5q3nTRkMT9KLsjXmWUETY4vb672nkZX5mrrb2Eg8FnaL1sEVGkKuQleOglno4b8A==
X-Received: by 2002:a05:6870:8a28:b0:287:e3e1:15f2 with SMTP id 586e51a60fabf-28ccb504ab9mr3757875fac.25.1729718424119;
        Wed, 23 Oct 2024 14:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fbb0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79204699sm2681940fac.2.2024.10.23.14.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:22 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 2/4] lib: license: Move package license skip to library
Date: Wed, 23 Oct 2024 15:15:20 -0600
Message-ID: <20241023212013.995247-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023212013.995247-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 21:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206267

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
index 7739697c401..866a876d7f0 100644
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
+
+    return skipped_pkgs
-- 
2.46.2


