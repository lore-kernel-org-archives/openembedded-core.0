Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97AECFA47C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:20:27 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.9320.1729718422720492772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKFO4J1d;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-27beb2496f4so179231fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718421; x=1730323221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBM8DwEyE+LTH168dXu7BjzcactKkjlJ5/1EwcrqbFM=;
        b=HKFO4J1dV7OS6XP7+3DgYCP3Q6pk58JUYYjWLjSap3RmpydHcb9WYtUOaM7Ad26rTm
         crPuv9bBHiRxZGwJozWBzIsT/yIm3fugzf9sLdV/PTrb3O1YPIA2VV8DjAti9FbfHxQP
         16HJgbyugatnLX8CX5CWu5YnSAa8Dl7cl33IgbkjjJ6PzdWTqszaO3FqZENncnRZbDJD
         OjRjhPheH6zIhJDjIt+8XLGb03S6VMYMzvBMNF2YyZISRw8WlWxAgSy0+sOg464bqE91
         F2Jy0Vl940Do9cHYyq1dZ1lOA2Q1Sc/DHq9mdg2mM0okyLb/Py6DNSGF+EHiJPObBnEw
         UiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718421; x=1730323221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBM8DwEyE+LTH168dXu7BjzcactKkjlJ5/1EwcrqbFM=;
        b=wpbn8D0NIQH0igASBdK16G9d2o6oIB/ytM/zisZPZC72/aJvql539aHBl5H1PVc+Y9
         HsGOQ+S9ijKQ5kzxfl0cIydv3zIJSICrMvnRIkvRRw53hNrdN+86SKk+dFI28NGq7EZu
         0HDE7GphJu31w6eWKQ4f4/cG77KRsb9Yo1sUbqxp+0+3QWfWMplevb+ZJ+i+UrotVAAq
         fV23z2TvETqOrPgNIlS/KYJavE01Q76RK2SMQxqqTnWPY4ZFZiJAN7YiqsS5ppVcse6E
         mMZlXDBEizmW4b0XjTqNhZEgTSCAVUw//jSgIU2CG6+/W36o6RTmFQSuYN+Ib0hxGbfE
         YHNg==
X-Gm-Message-State: AOJu0Yz9uBXLkT7IkKpEG/w/0Q+hPTEw8KxeyI3xsdS+7Q2xISsZmrZn
	0wZpaukIR1MrDC6m5LnB5IlUjRlIsddqTtD2M1rdgv94+oNo9JziqL0U8Q==
X-Google-Smtp-Source: AGHT+IHXy2lV9Gg1lhRAoLFGwVk9BdaM2Gf4YYlfd4YCwR05YT7VYIykeBp9pS8FrNmYVQdwZjKPJw==
X-Received: by 2002:a05:6870:2199:b0:278:32f:f171 with SMTP id 586e51a60fabf-28ccb82559emr3806028fac.26.1729718421174;
        Wed, 23 Oct 2024 14:20:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fbb0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79204699sm2681940fac.2.2024.10.23.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 1/4] classes-global/license: Move functions to library code
Date: Wed, 23 Oct 2024 15:15:19 -0600
Message-ID: <20241023212013.995247-2-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206266

Moves several of the functions in license.bbclass to be library code

New function dependencies were manually verified using bitbake-dumpsigs
to ensure that bitbake identified the same dependencies even though they
are now in library code (although the new function names mean that the
task hashes still change)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass          |  10 +-
 meta/classes-global/license.bbclass       | 165 ----------------------
 meta/classes-recipe/license_image.bbclass |  14 +-
 meta/lib/oe/license.py                    | 163 +++++++++++++++++++++
 4 files changed, 175 insertions(+), 177 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b6940bbb6ff..88b932fc3f0 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -528,8 +528,8 @@ python () {
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
     if bb.data.inherits_class('license', d):
-        check_license_format(d)
-        unmatched_license_flags = check_license_flags(d)
+        oe.license.check_license_format(d)
+        unmatched_license_flags = oe.license.check_license_flags(d)
         if unmatched_license_flags:
             for unmatched in unmatched_license_flags:
                 message = "Has a restricted license '%s' which is not listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
@@ -583,7 +583,7 @@ python () {
             check_license = False
 
         if check_license and bad_licenses:
-            bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+            bad_licenses = oe.license.expand_wildcard_licenses(d, bad_licenses)
 
             exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
 
@@ -599,7 +599,7 @@ python () {
             for pkg in pkgs:
                 remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
 
-                incompatible_lic = incompatible_license(d, remaining_bad_licenses, pkg)
+                incompatible_lic = oe.license.incompatible_license(d, remaining_bad_licenses, pkg)
                 if incompatible_lic:
                     skipped_pkgs[pkg] = incompatible_lic
                 else:
@@ -612,7 +612,7 @@ python () {
                 for pkg in unskipped_pkgs:
                     bb.debug(1, "Including the package %s" % pkg)
             else:
-                incompatible_lic = incompatible_license(d, bad_licenses)
+                incompatible_lic = oe.license.incompatible_license(d, bad_licenses)
                 for pkg in skipped_pkgs:
                     incompatible_lic += skipped_pkgs[pkg]
                 incompatible_lic = sorted(list(set(incompatible_lic)))
diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 043715fcc36..94dcc7f331c 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -255,171 +255,6 @@ def find_license_files(d):
 
     return lic_files_paths
 
-def return_spdx(d, license):
-    """
-    This function returns the spdx mapping of a license if it exists.
-     """
-    return d.getVarFlag('SPDXLICENSEMAP', license)
-
-def canonical_license(d, license):
-    """
-    Return the canonical (SPDX) form of the license if available (so GPLv3
-    becomes GPL-3.0-only) or the passed license if there is no canonical form.
-    """
-    return d.getVarFlag('SPDXLICENSEMAP', license) or license
-
-def expand_wildcard_licenses(d, wildcard_licenses):
-    """
-    There are some common wildcard values users may want to use. Support them
-    here.
-    """
-    licenses = set(wildcard_licenses)
-    mapping = {
-        "AGPL-3.0*" : ["AGPL-3.0-only", "AGPL-3.0-or-later"],
-        "GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later"],
-        "LGPL-3.0*" : ["LGPL-3.0-only", "LGPL-3.0-or-later"],
-    }
-    for k in mapping:
-        if k in wildcard_licenses:
-            licenses.remove(k)
-            for item in mapping[k]:
-                licenses.add(item)
-
-    for l in licenses:
-        if l in oe.license.obsolete_license_list():
-            bb.fatal("Error, %s is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE" % l)
-        if "*" in l:
-            bb.fatal("Error, %s is an invalid license wildcard entry" % l)
-
-    return list(licenses)
-
-def incompatible_license_contains(license, truevalue, falsevalue, d):
-    license = canonical_license(d, license)
-    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
-    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
-    return truevalue if license in bad_licenses else falsevalue
-
-def incompatible_pkg_license(d, dont_want_licenses, license):
-    # Handles an "or" or two license sets provided by
-    # flattened_licenses(), pick one that works if possible.
-    def choose_lic_set(a, b):
-        return a if all(oe.license.license_ok(canonical_license(d, lic),
-                            dont_want_licenses) for lic in a) else b
-
-    try:
-        licenses = oe.license.flattened_licenses(license, choose_lic_set)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('P'), exc))
-
-    incompatible_lic = []
-    for l in licenses:
-        license = canonical_license(d, l)
-        if not oe.license.license_ok(license, dont_want_licenses):
-            incompatible_lic.append(license)
-
-    return sorted(incompatible_lic)
-
-def incompatible_license(d, dont_want_licenses, package=None):
-    """
-    This function checks if a recipe has only incompatible licenses. It also
-    take into consideration 'or' operand.  dont_want_licenses should be passed
-    as canonical (SPDX) names.
-    """
-    import oe.license
-    license = d.getVar("LICENSE:%s" % package) if package else None
-    if not license:
-        license = d.getVar('LICENSE')
-
-    return incompatible_pkg_license(d, dont_want_licenses, license)
-
-def check_license_flags(d):
-    """
-    This function checks if a recipe has any LICENSE_FLAGS that
-    aren't acceptable.
-
-    If it does, it returns the all LICENSE_FLAGS missing from the list
-    of acceptable license flags, or all of the LICENSE_FLAGS if there
-    is no list of acceptable flags.
-
-    If everything is is acceptable, it returns None.
-    """
-
-    def license_flag_matches(flag, acceptlist, pn):
-        """
-        Return True if flag matches something in acceptlist, None if not.
-
-        Before we test a flag against the acceptlist, we append _${PN}
-        to it.  We then try to match that string against the
-        acceptlist.  This covers the normal case, where we expect
-        LICENSE_FLAGS to be a simple string like 'commercial', which
-        the user typically matches exactly in the acceptlist by
-        explicitly appending the package name e.g 'commercial_foo'.
-        If we fail the match however, we then split the flag across
-        '_' and append each fragment and test until we either match or
-        run out of fragments.
-        """
-        flag_pn = ("%s_%s" % (flag, pn))
-        for candidate in acceptlist:
-            if flag_pn == candidate:
-                    return True
-
-        flag_cur = ""
-        flagments = flag_pn.split("_")
-        flagments.pop() # we've already tested the full string
-        for flagment in flagments:
-            if flag_cur:
-                flag_cur += "_"
-            flag_cur += flagment
-            for candidate in acceptlist:
-                if flag_cur == candidate:
-                    return True
-        return False
-
-    def all_license_flags_match(license_flags, acceptlist):
-        """ Return all unmatched flags, None if all flags match """
-        pn = d.getVar('PN')
-        split_acceptlist = acceptlist.split()
-        flags = []
-        for flag in license_flags.split():
-            if not license_flag_matches(flag, split_acceptlist, pn):
-                flags.append(flag)
-        return flags if flags else None
-
-    license_flags = d.getVar('LICENSE_FLAGS')
-    if license_flags:
-        acceptlist = d.getVar('LICENSE_FLAGS_ACCEPTED')
-        if not acceptlist:
-            return license_flags.split()
-        unmatched_flags = all_license_flags_match(license_flags, acceptlist)
-        if unmatched_flags:
-            return unmatched_flags
-    return None
-
-def check_license_format(d):
-    """
-    This function checks if LICENSE is well defined,
-        Validate operators in LICENSES.
-        No spaces are allowed between LICENSES.
-    """
-    pn = d.getVar('PN')
-    licenses = d.getVar('LICENSE')
-    from oe.license import license_operator, license_operator_chars, license_pattern
-
-    elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
-    for pos, element in enumerate(elements):
-        if license_pattern.match(element):
-            if pos > 0 and license_pattern.match(elements[pos - 1]):
-                oe.qa.handle_error('license-format',
-                        '%s: LICENSE value "%s" has an invalid format - license names ' \
-                        'must be separated by the following characters to indicate ' \
-                        'the license selection: %s' %
-                        (pn, licenses, license_operator_chars), d)
-        elif not license_operator.match(element):
-            oe.qa.handle_error('license-format',
-                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
-                    'in the valid list of separators (%s)' %
-                    (pn, licenses, element, license_operator_chars), d)
-
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 0e953856a63..d2c5ab902ce 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -58,7 +58,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import stat
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
-    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+    bad_licenses = oe.license.expand_wildcard_licenses(d, bad_licenses)
     pkgarchs = d.getVar("SSTATE_ARCHS").split()
     pkgarchs.reverse()
 
@@ -66,17 +66,17 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
             remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
-            incompatible_licenses = incompatible_pkg_license(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
+            incompatible_licenses = oe.license.incompatible_pkg_license(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
             if incompatible_licenses:
                 bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_licenses)))
             else:
-                incompatible_licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
+                incompatible_licenses = oe.license.incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
                 if incompatible_licenses:
                     oe.qa.handle_error('license-exception', "Including %s with incompatible license(s) %s into the image, because it has been allowed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
             try:
                 (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
                     oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
-                    remaining_bad_licenses, canonical_license, d)
+                    remaining_bad_licenses, oe.license.canonical_license, d)
             except oe.license.LicenseError as exc:
                 bb.fatal('%s: %s' % (d.getVar('P'), exc))
 
@@ -144,7 +144,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 if not os.path.exists(pkg_license_dir ):
                     bb.fatal("Couldn't find license information for dependency %s" % pkg)
 
-                pkg_manifest_licenses = [canonical_license(d, lic) \
+                pkg_manifest_licenses = [oe.license.canonical_license(d, lic) \
                         for lic in pkg_dic[pkg]["LICENSES"]]
 
                 licenses = os.listdir(pkg_license_dir)
@@ -153,7 +153,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
                     if re.match(r"^generic_.*$", lic):
-                        generic_lic = canonical_license(d,
+                        generic_lic = oe.license.canonical_license(d,
                                 re.search(r"^generic_(.*)$", lic).group(1))
 
                         # Do not copy generic license into package if isn't
@@ -176,7 +176,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                         if not os.path.exists(pkg_rootfs_license):
                             os.symlink(os.path.join('..', generic_lic_file), pkg_rootfs_license)
                     else:
-                        if (oe.license.license_ok(canonical_license(d,
+                        if (oe.license.license_ok(oe.license.canonical_license(d,
                                 lic), bad_licenses) == False or
                                 os.path.exists(pkg_rootfs_license)):
                             continue
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index d9c8d94da47..7739697c401 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -259,3 +259,166 @@ def apply_pkg_license_exception(pkg, bad_licenses, exceptions):
     """Return remaining bad licenses after removing any package exceptions"""
 
     return [lic for lic in bad_licenses if pkg + ':' + lic not in exceptions]
+
+def return_spdx(d, license):
+    """
+    This function returns the spdx mapping of a license if it exists.
+     """
+    return d.getVarFlag('SPDXLICENSEMAP', license)
+
+def canonical_license(d, license):
+    """
+    Return the canonical (SPDX) form of the license if available (so GPLv3
+    becomes GPL-3.0-only) or the passed license if there is no canonical form.
+    """
+    return d.getVarFlag('SPDXLICENSEMAP', license) or license
+
+def expand_wildcard_licenses(d, wildcard_licenses):
+    """
+    There are some common wildcard values users may want to use. Support them
+    here.
+    """
+    licenses = set(wildcard_licenses)
+    mapping = {
+        "AGPL-3.0*" : ["AGPL-3.0-only", "AGPL-3.0-or-later"],
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
+        if l in obsolete_license_list():
+            bb.fatal("Error, %s is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE" % l)
+        if "*" in l:
+            bb.fatal("Error, %s is an invalid license wildcard entry" % l)
+
+    return list(licenses)
+
+def incompatible_license_contains(license, truevalue, falsevalue, d):
+    license = canonical_license(d, license)
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+    return truevalue if license in bad_licenses else falsevalue
+
+def incompatible_pkg_license(d, dont_want_licenses, license):
+    # Handles an "or" or two license sets provided by
+    # flattened_licenses(), pick one that works if possible.
+    def choose_lic_set(a, b):
+        return a if all(license_ok(canonical_license(d, lic),
+                            dont_want_licenses) for lic in a) else b
+
+    try:
+        licenses = flattened_licenses(license, choose_lic_set)
+    except LicenseError as exc:
+        bb.fatal('%s: %s' % (d.getVar('P'), exc))
+
+    incompatible_lic = []
+    for l in licenses:
+        license = canonical_license(d, l)
+        if not license_ok(license, dont_want_licenses):
+            incompatible_lic.append(license)
+
+    return sorted(incompatible_lic)
+
+def incompatible_license(d, dont_want_licenses, package=None):
+    """
+    This function checks if a recipe has only incompatible licenses. It also
+    take into consideration 'or' operand.  dont_want_licenses should be passed
+    as canonical (SPDX) names.
+    """
+    license = d.getVar("LICENSE:%s" % package) if package else None
+    if not license:
+        license = d.getVar('LICENSE')
+
+    return incompatible_pkg_license(d, dont_want_licenses, license)
+
+def check_license_flags(d):
+    """
+    This function checks if a recipe has any LICENSE_FLAGS that
+    aren't acceptable.
+
+    If it does, it returns the all LICENSE_FLAGS missing from the list
+    of acceptable license flags, or all of the LICENSE_FLAGS if there
+    is no list of acceptable flags.
+
+    If everything is is acceptable, it returns None.
+    """
+
+    def license_flag_matches(flag, acceptlist, pn):
+        """
+        Return True if flag matches something in acceptlist, None if not.
+
+        Before we test a flag against the acceptlist, we append _${PN}
+        to it.  We then try to match that string against the
+        acceptlist.  This covers the normal case, where we expect
+        LICENSE_FLAGS to be a simple string like 'commercial', which
+        the user typically matches exactly in the acceptlist by
+        explicitly appending the package name e.g 'commercial_foo'.
+        If we fail the match however, we then split the flag across
+        '_' and append each fragment and test until we either match or
+        run out of fragments.
+        """
+        flag_pn = ("%s_%s" % (flag, pn))
+        for candidate in acceptlist:
+            if flag_pn == candidate:
+                    return True
+
+        flag_cur = ""
+        flagments = flag_pn.split("_")
+        flagments.pop() # we've already tested the full string
+        for flagment in flagments:
+            if flag_cur:
+                flag_cur += "_"
+            flag_cur += flagment
+            for candidate in acceptlist:
+                if flag_cur == candidate:
+                    return True
+        return False
+
+    def all_license_flags_match(license_flags, acceptlist):
+        """ Return all unmatched flags, None if all flags match """
+        pn = d.getVar('PN')
+        split_acceptlist = acceptlist.split()
+        flags = []
+        for flag in license_flags.split():
+            if not license_flag_matches(flag, split_acceptlist, pn):
+                flags.append(flag)
+        return flags if flags else None
+
+    license_flags = d.getVar('LICENSE_FLAGS')
+    if license_flags:
+        acceptlist = d.getVar('LICENSE_FLAGS_ACCEPTED')
+        if not acceptlist:
+            return license_flags.split()
+        unmatched_flags = all_license_flags_match(license_flags, acceptlist)
+        if unmatched_flags:
+            return unmatched_flags
+    return None
+
+def check_license_format(d):
+    """
+    This function checks if LICENSE is well defined,
+        Validate operators in LICENSES.
+        No spaces are allowed between LICENSES.
+    """
+    pn = d.getVar('PN')
+    licenses = d.getVar('LICENSE')
+
+    elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
+    for pos, element in enumerate(elements):
+        if license_pattern.match(element):
+            if pos > 0 and license_pattern.match(elements[pos - 1]):
+                oe.qa.handle_error('license-format',
+                        '%s: LICENSE value "%s" has an invalid format - license names ' \
+                        'must be separated by the following characters to indicate ' \
+                        'the license selection: %s' %
+                        (pn, licenses, license_operator_chars), d)
+        elif not license_operator.match(element):
+            oe.qa.handle_error('license-format',
+                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
+                    'in the valid list of separators (%s)' %
+                    (pn, licenses, element, license_operator_chars), d)
-- 
2.46.2


