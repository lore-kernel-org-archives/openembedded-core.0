Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E69AC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:42:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1836.1646178139829051544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EpE4OVuj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so1713811wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VZR1dL0qEbek1CJrpGS/ve/Scb3t0PTHoimczXV4Vos=;
        b=EpE4OVujcBA0oVewXA8TAil4pIgzVITdLQVxSf19TaxKC73ZZ9+rdBU9DPDjAyRbEG
         yowRLrgWk23pzUP+TtK+2h573KncqSJRcBrWkD4Hi7oTm5id2JtTk5f1/CBdkKZN05g6
         WcfoaUjNVAHnmwCA7IJoUG1n8gW1pSid4JyEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZR1dL0qEbek1CJrpGS/ve/Scb3t0PTHoimczXV4Vos=;
        b=UkPe0VXeC41wT5dSuUV8jyW87Txb/FeYDv7P1x7gZFbTXg2cOkezFNP3AmV5d4S7qu
         Hh8t3hNDF0uvgYFYCq22IhHPnGxVL8fh2H3Fjxic3Kg7emyKH24H23U68SNofbXkxE5x
         0XOxF2KUQHGXVqFznSA7jrsGTha4CV48ZvGcMk+rIzacRruJxHop5v62BZzBF8Qz96V8
         K/8QrQNinML1+JR7FfkgF7lSfjOCfNYq8pvf3SlmMGoUsVAeiIpeQMcjDeQtUo8vzdE/
         8d2jsK9ZEl09MwQQ+CAQZGEjIjCuYcAvFlgRwxV1psWqLYjTH9icEbzJvQpHA99XliBR
         KpPA==
X-Gm-Message-State: AOAM532fOUhzSR0DoNPvWjUVWkpmI4kZCweEw1sKTplM3Yq7yAs299zm
	yz1fIPVUDosYEM9h7O3q97L38rf3w/YFc2Cz
X-Google-Smtp-Source: 
 ABdhPJwzJsv6KKTo+cLM2Vq/LOT+ZNGJ9+BgKNYBHMgmBUysFu1qJnHnL4hLWj9nvRSSKM/e+T5dQw==
X-Received: by 2002:a05:600c:4e50:b0:381:5f7e:bff6 with SMTP id
 e16-20020a05600c4e5000b003815f7ebff6mr10632554wmq.65.1646178137975;
        Tue, 01 Mar 2022 15:42:17 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm21491351wro.27.2022.03.01.15.42.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:42:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE wildcard handling
Date: Tue,  1 Mar 2022 23:42:14 +0000
Message-Id: <20220301234214.247172-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:42:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162580

The current wildcard handling is badly documented and inconsistently
used and understood.

Forcing users to have to use "GPL-3.0-only GPL-3.0-or-later" whilst
explict is not very user friendly. Equally, using the current wildcards
is ambigious. This supports pre-defined expansions only and at least makes
it clear what GPL-3.0* means (it doesn't include the exception licenses).

This is hopefully an acceptable compromise between literal meaning and
having something usable.

Non-SPDX forms of license in this field have been dropped and errors are
shown for unsupported expansions and unsupported old style license terms.

Users need to carefully consider how to migrate to the new syntax but
the meaning should be well defined and clear from here forward.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass                  | 41 +++++----
 .../oeqa/selftest/cases/incompatible_lic.py   | 86 +++++++++++--------
 2 files changed, 70 insertions(+), 57 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 68c022248c8..cb1f46983ac 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -277,28 +277,27 @@ AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
 
 def expand_wildcard_licenses(d, wildcard_licenses):
     """
-    Return actual spdx format license names if wildcards are used. We expand
-    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
+    There are some common wildcard values users may want to use. Support them
+    here.
     """
-    import fnmatch
-
-    licenses = wildcard_licenses[:]
-    spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
-    for wld_lic in wildcard_licenses:
-        spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
-        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
-        # Assume that if we are passed "GPL-3.0" or "*GPL-3.0", then it means
-        # "-or-later" as well.
-        if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
-            spdxflags = fnmatch.filter(spdxmapkeys, wld_lic + "+")
-            licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
-
-    spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
-    for wld_lic in wildcard_licenses:
-        licenses += fnmatch.filter(spdx_lics, wld_lic)
-
-    licenses = list(set(licenses))
-    return licenses
+    licenses = set(wildcard_licenses)
+    mapping = {
+        "GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later"],
+        "LGPL-3.0*" : ["LGPL-3.0-only", "LGPL-3.0-or-later"],
+    }
+    for k in mapping:
+        if k in wildcard_licenses:
+            licenses.remove(k)
+            for item in mapping[k]:
+                licenses.add(item)
+
+    for l in licenses:
+        if l in oe.license.obsolete_license_list():
+            bb.fatal("Error, %s is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE" % l)
+        if "*" in l:
+            bb.fatal("Error, %s is an invalid license wildcard entry" % l)
+
+    return list(licenses)
 
 def incompatible_license_contains(license, truevalue, falsevalue, d):
     license = canonical_license(d, license)
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index c68f920555f..0794d46e6dd 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -1,10 +1,11 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
-class IncompatibleLicenseTests(OESelftestTestCase):
+class IncompatibleLicenseTestObsolete(OESelftestTestCase):
 
-    def lic_test(self, pn, pn_lic, lic):
-        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has incompatible license(s): %s' % (pn, pn, pn_lic)
+    def lic_test(self, pn, pn_lic, lic, error_msg=None):
+        if not error_msg:
+            error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has incompatible license(s): %s' % (pn, pn, pn_lic)
 
         self.write_config("INCOMPATIBLE_LICENSE += \"%s\"" % (lic))
 
@@ -12,69 +13,82 @@ class IncompatibleLicenseTests(OESelftestTestCase):
         if error_msg not in result.output:
             raise AssertionError(result.output)
 
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
-    def test_incompatible_spdx_license(self):
-        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0-only')
-
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
     # SPDXLICENSEMAP) of this SPDX license
     def test_incompatible_alias_spdx_license(self):
-        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPLv3')
-
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
-    # matching this SPDX license
-    def test_incompatible_spdx_license_wildcard(self):
-        self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPL-3.0-only')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPLv3', "is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE")
 
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded alias
     # license matching this SPDX license
     def test_incompatible_alias_spdx_license_wildcard(self):
-        self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPLv3')
-
-    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
-    # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
-    # license
-    def test_incompatible_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPL-3.0-only')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPLv3', "*GPLv3 is an invalid license wildcard entry")
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains this alias
     def test_incompatible_alias_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPLv3')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPLv3', "is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE")
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
     # license matching this SPDX license
     def test_incompatible_spdx_license_alias_wildcard(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPL-3.0')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPL-3.0', "*GPL-3.0 is an invalid license wildcard entry")
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
     # alias license matching the SPDX license
     def test_incompatible_alias_spdx_license_alias_wildcard(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPLv3')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPLv3', "*GPLv3 is an invalid license wildcard entry")
 
-    # Verify that a package with multiple SPDX licenses (from
-    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
-    # some of them
-    def test_incompatible_spdx_licenses(self):
-        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', 'GPL-3.0-only LGPL-3.0-only')
 
     # Verify that a package with multiple SPDX licenses (from
     # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
     # wildcard to some of them
     def test_incompatible_spdx_licenses_wildcard(self):
-        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', '*GPL-3.0-only')
+        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', '*GPL-3.0-only', "*GPL-3.0-only is an invalid license wildcard entry")
+
 
     # Verify that a package with multiple SPDX licenses (from
     # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
     # wildcard matching all licenses
     def test_incompatible_all_licenses_wildcard(self):
-        self.lic_test('incompatible-licenses', 'GPL-2.0-only GPL-3.0-only LGPL-3.0-only', '*')
+        self.lic_test('incompatible-licenses', 'GPL-2.0-only GPL-3.0-only LGPL-3.0-only', '*', "* is an invalid license wildcard entry")
+
+class IncompatibleLicenseTests(OESelftestTestCase):
+
+    def lic_test(self, pn, pn_lic, lic):
+        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has incompatible license(s): %s' % (pn, pn, pn_lic)
+
+        self.write_config("INCOMPATIBLE_LICENSE += \"%s\"" % (lic))
+
+        result = bitbake('%s --dry-run' % (pn), ignore_status=True)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
+
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
+    def test_incompatible_spdx_license(self):
+        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0-only')
+
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
+    # matching this SPDX license
+    def test_incompatible_spdx_license_wildcard(self):
+        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0*')
+
+    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
+    # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
+    # license
+    def test_incompatible_spdx_license_alias(self):
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPL-3.0-only')
+
+    # Verify that a package with multiple SPDX licenses (from
+    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
+    # some of them
+    def test_incompatible_spdx_licenses(self):
+        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', 'GPL-3.0-only LGPL-3.0-only')
 
     # Verify that a package with a non-SPDX license (neither in
     # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
@@ -86,7 +100,7 @@ class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
         return """
 IMAGE_INSTALL:append = " bash"
-INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 """
 
     def test_bash_default(self):
@@ -118,15 +132,15 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 class NoGPL3InImagesTests(OESelftestTestCase):
     def test_core_image_minimal(self):
         self.write_config("""
-INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 """)
         bitbake('core-image-minimal')
 
     def test_core_image_full_cmdline_weston(self):
         self.write_config("""
 INHERIT += "testimage"
-INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0 LGPL-3.0"
-INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0* LGPL-3.0*"
+INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0* LGPL-3.0*"
 # Settings for full-cmdline
 RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
 RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
-- 
2.32.0


