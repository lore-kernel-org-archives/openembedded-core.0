Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75676C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:42:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.1968.1646178138154201298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I/T1VIPc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso242758wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ru6vF81+/Hoy67b7KlzqM2G91oAdU2+d+dpR1uttGYA=;
        b=I/T1VIPc+ZkUg6EZr2F/ofeXDC2YRvYBo3KB/1Pxg2kLw89fQxyEIeyhh1VJj/ClmD
         gD7HQHjsxdaZb3nIHu0Bmp4T177I+K60dvEx3Z0f8KzdpsTTTqlKGzZabiRGjf+gzm/0
         UooNBTFv607M1ZFPtK3aNDw1xSze8V63D2zPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ru6vF81+/Hoy67b7KlzqM2G91oAdU2+d+dpR1uttGYA=;
        b=qHgQVQya4BjlMdFjvjtfvlLYCPreXcut3Kg0vQHxg7yaJRMhZDDoCAiuc9T6+Y8GJw
         qG5E30q0pHCqBTqaxjYLaI+lqgso9GhrZblOHSsMdchV4/ZQ5Df7D/vfFOb9P7CSHUmW
         u89Q/CPAj6SeU9V8C/0JZ7/C0nTiuXcjE/AuaC8JVxbWJ3+pGvCo+b8vDXxNctg9v8m6
         NLsYZmq+3IyCZ6iuI7L4NG43FBSfVQbaisdXoZQ0gZzQ0azoU1UDRula4bGBLb72m6Bn
         pAGsVoLyRKyuaDSH7dY5HislOfnlS5J6zzCn/mWv3AXbms+W3wosvfGtgtmmZoAzJ82k
         i7Qw==
X-Gm-Message-State: AOAM530o1mNnNJRRyx8gTM36wR/+p5ZxnkC6I/mtKAbQBsuShpKsXEwL
	wvfIEzMZgPTELBLqzn3B9UiHxk9ww/aZJpjq
X-Google-Smtp-Source: 
 ABdhPJyXXMELCVRQsanwRUVFpc/nc5clDvIzfgH9SUswV8mROhJIiUok5RBWwT3aT8MBVl8yowN4zg==
X-Received: by 2002:a1c:a443:0:b0:381:d21:de2e with SMTP id
 n64-20020a1ca443000000b003810d21de2emr18871542wme.131.1646178136166;
        Tue, 01 Mar 2022 15:42:16 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm21491351wro.27.2022.03.01.15.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:42:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <Saul.Wold@windriver.com>,
	Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/4] base/license: Rework INCOMPATIBLE_LICENSE variable
 handling
Date: Tue,  1 Mar 2022 23:42:12 +0000
Message-Id: <20220301234214.247172-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162578

From: Saul Wold <Saul.Wold@windriver.com>

This re-writes the INCOMPATIBLE_LICENSE checking code to replace
the WHITELIST_<lic> with
INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:<lic> <pkg>:<lic> ...'

This initial change leaves most of the code structure in place,
but the code in base.bbclass needs to be re-written to make
the check more consistent around packages (PKGS) and not recipe
names (PN). This also is taking into account the changes for SPDX
licenses.

The aim is to provide a mode consistent variable where the variable
name is known and can easily be queried.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                     | 67 ++++++++-----------
 meta/classes/license_image.bbclass            | 33 ++++-----
 meta/classes/multilib.bbclass                 |  6 +-
 meta/conf/bitbake.conf                        | 11 +++
 meta/lib/oe/license.py                        |  5 ++
 .../oeqa/selftest/cases/incompatible_lic.py   |  4 +-
 6 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 27c1d6168d4..bfc7087a189 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -595,46 +595,35 @@ python () {
         if check_license and bad_licenses:
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
-            whitelist = []
-            for lic in bad_licenses:
-                spdx_license = return_spdx(d, lic)
-                whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
-                if spdx_license:
-                    whitelist.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
-
-            if pn in whitelist:
-                '''
-                We need to track what we are whitelisting and why. If pn is
-                incompatible we need to be able to note that the image that
-                is created may infact contain incompatible licenses despite
-                INCOMPATIBLE_LICENSE being set.
-                '''
-                bb.note("Including %s as buildable despite it having an incompatible license because it has been whitelisted" % pn)
-            else:
-                pkgs = d.getVar('PACKAGES').split()
-                skipped_pkgs = {}
-                unskipped_pkgs = []
-                for pkg in pkgs:
-                    incompatible_lic = incompatible_license(d, bad_licenses, pkg)
-                    if incompatible_lic:
-                        skipped_pkgs[pkg] = incompatible_lic
-                    else:
-                        unskipped_pkgs.append(pkg)
-                if unskipped_pkgs:
-                    for pkg in skipped_pkgs:
-                        bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                        d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
-                    for pkg in unskipped_pkgs:
-                        bb.debug(1, "Including the package %s" % pkg)
+            exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+
+            pkgs = d.getVar('PACKAGES').split()
+            skipped_pkgs = {}
+            unskipped_pkgs = []
+            for pkg in pkgs:
+                remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
+
+                incompatible_lic = incompatible_license(d, remaining_bad_licenses, pkg)
+                if incompatible_lic:
+                    skipped_pkgs[pkg] = incompatible_lic
                 else:
-                    incompatible_lic = incompatible_license(d, bad_licenses)
-                    for pkg in skipped_pkgs:
-                        incompatible_lic += skipped_pkgs[pkg]
-                    incompatible_lic = sorted(list(set(incompatible_lic)))
-
-                    if incompatible_lic:
-                        bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
-                        raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
+                    unskipped_pkgs.append(pkg)
+
+            if unskipped_pkgs:
+                for pkg in skipped_pkgs:
+                    bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
+                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
+                for pkg in unskipped_pkgs:
+                    bb.debug(1, "Including the package %s" % pkg)
+            else:
+                incompatible_lic = incompatible_license(d, bad_licenses)
+                for pkg in skipped_pkgs:
+                    incompatible_lic += skipped_pkgs[pkg]
+                incompatible_lic = sorted(list(set(incompatible_lic)))
+
+                if incompatible_lic:
+                    bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
+                    raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI')
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index bf70bee99bb..0a5ea0a2fbc 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -54,28 +54,23 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
-    whitelist = []
-    for lic in bad_licenses:
-        whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
-
+    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
-            if bad_licenses and pkg not in whitelist:
-                try:
-                    licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
-                    if licenses:
-                        bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(licenses)))
-                    (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-                        oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
-                        bad_licenses, canonical_license, d)
-                except oe.license.LicenseError as exc:
-                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
+            remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
+            incompatible_licenses = incompatible_pkg_license(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
+            if incompatible_licenses:
+                bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_licenses)))
             else:
-                pkg_dic[pkg]["LICENSES"] = re.sub(r'[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
-                pkg_dic[pkg]["LICENSES"] = re.sub(r'  *', ' ', pkg_dic[pkg]["LICENSES"])
-                pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
-                if pkg in whitelist:
-                    oe.qa.handle_error('license-incompatible', "Including %s with an incompatible license %s into the image, because it has been whitelisted." %(pkg, pkg_dic[pkg]["LICENSE"]), d)
+                incompatible_licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
+                if incompatible_licenses:
+                    oe.qa.handle_error('license-incompatible', "Including %s with incompatible license(s) %s into the image, because it has been allowed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
+            try:
+                (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
+                    oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
+                    remaining_bad_licenses, canonical_license, d)
+            except oe.license.LicenseError as exc:
+                bb.fatal('%s: %s' % (d.getVar('P'), exc))
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 1ad654f546d..5859ca8d21e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -75,12 +75,12 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
-    # Expand WHITELIST_GPL-3.0 with multilib prefix
-    pkgs = e.data.getVar("WHITELIST_GPL-3.0")
+    # Expand INCOMPATIBLE_LICENSE_EXCEPTIONS with multilib prefix
+    pkgs = e.data.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS")
     if pkgs:
         for pkg in pkgs.split():
             pkgs += " " + variant + "-" + pkg
-        e.data.setVar("WHITELIST_GPL-3.0", pkgs)
+        e.data.setVar("INCOMPATIBLE_LICENSE_EXCEPTIONS", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6fb7bfeb23c..7705415a4f5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -110,6 +110,17 @@ BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] = "is a deprecated variable and no longe
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] = "is a deprecated variable and support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] = "LICENSE_FLAGS_ACCEPTED"
 
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+
+# These are deprecated version and should be updated to approved names
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:GPL-3.0-only'"
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0+] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:GPL-3.0-or-later'"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-only'"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0+] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-or-later'"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 8955cbdeb24..29412dfe46b 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -242,3 +242,8 @@ def list_licenses(licensestr):
     except SyntaxError as exc:
         raise LicenseSyntaxError(licensestr, exc)
     return visitor.licenses
+
+def apply_pkg_license_exception(pkg, bad_licenses, exceptions):
+    """Return remaining bad licenses after removing any package exceptions"""
+
+    return [lic for lic in bad_licenses if pkg + ':' + lic not in exceptions]
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index fd3b3f409e3..c68f920555f 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -110,8 +110,8 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
         bitbake('core-image-minimal')
 
-    def test_bash_whitelist(self):
-        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0:pn-core-image-minimal = "bash"')
+    def test_bash_license_exceptions(self):
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"')
 
         bitbake('core-image-minimal')
 
-- 
2.32.0


