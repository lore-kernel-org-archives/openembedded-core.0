Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022F8F589D4
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:33:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19666.1776951225157119791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 06:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J2c7W5RG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so60668045e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776951223; x=1777556023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoAgN5v5Q+yXm5s2f3n81NSDY4vbf7Fs7YdMQu7bptc=;
        b=J2c7W5RGeSxvBv+3g0N9wt4XWyqeX2vZsteawt/m+C/Ll5p9q76bPGXkNW+XMKbGGo
         pDvsVrM6eUGlmBljsidJe5cRkZqfCP7c3hxm7+4jM9FMToeRjithOMhfO9JUfC9L40Vx
         AK4emUFUz8EJhU5jVj6AkxXYY1DtZPSFRNVpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951223; x=1777556023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoAgN5v5Q+yXm5s2f3n81NSDY4vbf7Fs7YdMQu7bptc=;
        b=BZhNc6Uk56xlaFYBjFKFJ1tQ/maiSCP5CFgYyzt1y6F4N3tAh4fBj72JQTyzt6ZEFq
         CQwE95HByP61GpqG/WiEsArJ3JwuCtRsDWeq2lgDKCfN20EVfpnSrYCzXm9kQzail7fK
         /bimlkVuQgav2h+AJ58vzNQG1fQNc2PayntOcfSPxnGe0VczBRG8Q7oDeh8jpfLcZqPS
         3tsYgrQGnTbOrvz7suxilCzwIAmQomIaIOqHPP/PyW9DZAcDDQXd1ymOOsyrXZesVgw0
         GM5Z4gA/phEnluqEcbCJZs06mstbDLJNl2XUM4tvm6AWCJbYlbO8T29sDg+FhafqT4YG
         cD5w==
X-Gm-Message-State: AOJu0YywBXL9zMgD0p4J8uzIRyAYGAz+DKaA9g7B9fyXiH7V0I3FTO15
	nLEeFsTxrLuE2y3HXWFR+bJ2nQbaTIRzNZP34iY6UygQJ7Xm2tuNsb/f7WV9DBC8LgV/TtLj46Q
	XlVG6oj8=
X-Gm-Gg: AeBDietlYvvXfV0cDpDLGAvtq4+6hogZWSi2Efjn+uUrHWOVAPZ1k9hozTmMPKH+oEw
	tm4pcDOiAnxeCzcBIB2ksij1cWPBAQUNmFcliOI2zsvjUE93wLjeG9iw4wuV7rehcGcu1IZE8M2
	PkQj7lFH4c2l1X6BxP5AVHxcdJvx96fyJd0QDeJeb+VEs0BC4bKA52cWrNYCIiQlTfhcPo7yE33
	L4jUSzM9b9ZOV/0Ok9DFaZNEaYNYrjvN0oy+RNXlXPIX2tbThQpEjXV/4wqrzFVYvvjykNIJG5S
	HShM4IvQYOlhPHRT7yAvIGW+60F1FGDrH2qjUhASRCZz8kYm9vDykS1Qkknd6Lfag0e3toD5qeI
	bYyB3LmHTloS3TKKs8US8nBy6+gGwE+2Oldv1xDFoGyjMvVw5jCcrOs4tpEUxLbxyyENxMhqUbz
	T9087BxYFzydGICRJQfjI7yq/Ga08X+gPJM5cXXIWk4n7CAV90O/gH1ZPT6jwUyxk=
X-Received: by 2002:a05:600c:4e14:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-4891f080a7emr249039055e9.16.1776951222862;
        Thu, 23 Apr 2026 06:33:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8228:dac2:8992:4ae8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm537001275e9.5.2026.04.23.06.33.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:33:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] base/bitbake.conf: Rework DISTRO_FEATURES and MACHINE_FEATURES default handling
Date: Thu, 23 Apr 2026 14:33:40 +0100
Message-ID: <20260423133340.1954703-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
References: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 13:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235771

The existing code for handling defaults in distro/machine features
triggers from anonymous python in base.bbclass.

Anonymous python is executed after all inherits including deferred inherits
are processed. This means conditional inherits can't use DISTRO_FEATURES
or MACHINE_FEATURES which is contra to user expectations. This leads to
a hard to understand failure mode.

Whilst it isn't as performant, we can handle the features using inline
python function calls. This patch switches to execute the code that way.

These changes depend on a new function in bb.utils (filter_string).
filter_default_features is changed to return a string rather than
set it and the tests for it are updated to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass            |  5 -----
 meta/classes-recipe/crosssdk.bbclass        |  9 ++-------
 meta/classes-recipe/native.bbclass          |  9 ++-------
 meta/classes-recipe/nativesdk.bbclass       |  9 ++-------
 meta/conf/bitbake.conf                      |  4 ++--
 meta/lib/oe/utils.py                        |  7 ++++++-
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 16 ++++++++--------
 7 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 76fd0ac046a..f2e8326e39a 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -454,11 +454,6 @@ def set_packagetriplet(d):
 python () {
     import string, re
 
-    # Filter default features to allow users to opt out of features they don't
-    # want.
-    oe.utils.filter_default_features("DISTRO_FEATURES", d)
-    oe.utils.filter_default_features("MACHINE_FEATURES", d)
-
     # To add a recipe to the skip list , set:
     #   SKIP_RECIPE[pn] = "message"
     pn = d.getVar('PN')
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index dac18b39edb..f7be3a23bf6 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -16,13 +16,8 @@ PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
     # set TUNE_PKGARCH to SDK_ARCH
     d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
-    # Set features here to prevent DISTRO_FEATURES modifications from affecting
-    # crosssdk distro features
-    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.filter_default_features("DISTRO_FEATURES", d)
-    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
-    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
+    defaults = d.getVar("DISTRO_FEATURES")
+    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 9f4ca170f76..89d862eb55a 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -126,13 +126,8 @@ python native_virtclass_handler () {
         return
     bpn = d.getVar("BPN")
 
-    # Set features here to prevent DISTRO_FEATURES modifications from affecting
-    # native distro features
-    features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
-    oe.utils.filter_default_features("DISTRO_FEATURES", d)
-    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
-    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
+    defaults = d.getVar("DISTRO_FEATURES")
+    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVE", "DISTRO_FEATURES_FILTER_NATIVE", d)}')
 
     classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 80f716fc3c3..25fd463ac78 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -77,13 +77,8 @@ python nativesdk_virtclass_handler () {
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
-    # Set features here to prevent DISTRO_FEATURES modifications from affecting
-    # nativesdk distro features
-    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.filter_default_features("DISTRO_FEATURES", d)
-    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
-    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
+    defaults = d.getVar("DISTRO_FEATURES")
+    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9fcd16615db..24e095632e9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -893,10 +893,10 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and packagegroup-base stuff
 ##################################################################
 
-MACHINE_FEATURES ?= ""
+MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
 
-DISTRO_FEATURES ?= ""
+DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ed5dd5f4504..23f4b639c69 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -154,7 +154,12 @@ def filter_default_features(varname, d):
     default_features = set_difference(varname + "_DEFAULTS",
                                       varname + "_OPTED_OUT",
                                       d)
-    d.appendVar(varname, " " + default_features)
+    return default_features
+
+def class_filter_features(defaults, features_var, filter_var, d):
+    features = set(d.getVar(features_var).split())
+    filtered = set(bb.utils.filter_string(defaults, d.getVar(filter_var)).split())
+    return " ".join(sorted(features | filtered))
 
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index a72a0f5983f..75c69789a5b 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -115,26 +115,26 @@ class TestDefaultFeatures(TestCase):
         # Test with nothing opted out
         d.setVar("DISTRO_FEATURES", "")
         d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
-        filter_default_features("DISTRO_FEATURES", d)
-        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")
+        filtered = filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(filtered.strip(), "alpha beta gamma")
 
         # opt out of a single feature
         d.setVar("DISTRO_FEATURES", "")
         d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
         d.setVar("DISTRO_FEATURES_OPTED_OUT", "beta")
-        filter_default_features("DISTRO_FEATURES", d)
-        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha gamma")
+        filtered = filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(filtered.strip(), "alpha gamma")
 
         # opt out of everything
         d.setVar("DISTRO_FEATURES", "")
         d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
         d.setVar("DISTRO_FEATURES_OPTED_OUT", "gamma alpha beta")
-        filter_default_features("DISTRO_FEATURES", d)
-        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "")
+        filtered = filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(filtered.strip(), "")
 
         # opt out of something that isn't in our defaults
         d.setVar("DISTRO_FEATURES", "")
         d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
         d.setVar("DISTRO_FEATURES_OPTED_OUT", "omega")
-        filter_default_features("DISTRO_FEATURES", d)
-        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")
+        filtered = filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(filtered.strip(), "alpha beta gamma")

