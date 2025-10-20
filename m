Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBB3CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12243.1760944221591095934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uJHE576U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B45F0C0AFCE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 457D0606D5;
	Mon, 20 Oct 2025 07:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A161102F239E;
	Mon, 20 Oct 2025 09:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944215; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=th91Xg2vVeVS296nmdsjSApW/9ZW65XnQTwqP1NzPn4=;
	b=uJHE576UbLETlA9IVn+EQqQdecxYlPVsuxMmhlhcnvNyhd7orqYzSTPUFYqN0lhVJIZ+Em
	uDNKVpi3+YzsS31m9oN7vT+6RZ/qpIeQBUga4RtMqHZ4SIlhk68QntyBrW743rxu13J974
	IT9GvInmd6VSXVRfv9vECf5IE9YDD+zNrvGKGN+LLMAjHrQ7JIGu3dpmTmOqlB1pSaXSDq
	Y1XKQtMG995WrGzj+dBrTuIqJr/ReQCphNv8hOrg0f2a7MdVwLKqWVo7dWO3E5F0FmmbEV
	CWGxyj9dTnZTIEC/jvPHe98+vDCK1RDVaPI4W5dPq1FbbZh28xRBtv3Ugz31PQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 03/11] classes-global/license: Move functions to library code
Date: Mon, 20 Oct 2025 09:09:43 +0200
Message-ID: <20251020070952.942165-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225101

From: Joshua Watt <JPEWhacker@gmail.com>

Moves several of the functions in license.bbclass to be library code

New function dependencies were manually verified using bitbake-dumpsigs
to ensure that bitbake identified the same dependencies even though they
are now in library code (although the new function names mean that the
task hashes still change)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0333e04e353991260c5f67a72f80f3ab9dcf526a)
---
 meta/classes-global/base.bbclass          |  10 +-
 meta/classes-global/license.bbclass       | 165 ----------------------
 meta/classes-recipe/license_image.bbclass |  14 +-
 meta/lib/oe/license.py                    | 163 +++++++++++++++++++++
 4 files changed, 175 insertions(+), 177 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 0999b42daa..f764f3ee2f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -520,8 +520,8 @@ python () {
         bb.fatal('This recipe does not have the LICENSE field set (%s)' =
% pn)
=20
     if bb.data.inherits_class('license', d):
-        check_license_format(d)
-        unmatched_license_flags =3D check_license_flags(d)
+        oe.license.check_license_format(d)
+        unmatched_license_flags =3D oe.license.check_license_flags(d)
         if unmatched_license_flags:
             for unmatched in unmatched_license_flags:
                 message =3D "Has a restricted license '%s' which is not =
listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
@@ -575,7 +575,7 @@ python () {
             check_license =3D False
=20
         if check_license and bad_licenses:
-            bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
+            bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_=
licenses)
=20
             exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") =
or "").split()
=20
@@ -591,7 +591,7 @@ python () {
             for pkg in pkgs:
                 remaining_bad_licenses =3D oe.license.apply_pkg_license_=
exception(pkg, bad_licenses, exceptions)
=20
-                incompatible_lic =3D incompatible_license(d, remaining_b=
ad_licenses, pkg)
+                incompatible_lic =3D oe.license.incompatible_license(d, =
remaining_bad_licenses, pkg)
                 if incompatible_lic:
                     skipped_pkgs[pkg] =3D incompatible_lic
                 else:
@@ -604,7 +604,7 @@ python () {
                 for pkg in unskipped_pkgs:
                     bb.debug(1, "Including the package %s" % pkg)
             else:
-                incompatible_lic =3D incompatible_license(d, bad_license=
s)
+                incompatible_lic =3D oe.license.incompatible_license(d, =
bad_licenses)
                 for pkg in skipped_pkgs:
                     incompatible_lic +=3D skipped_pkgs[pkg]
                 incompatible_lic =3D sorted(list(set(incompatible_lic)))
diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass
index d7c5d08a77..6e0de5f414 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -255,171 +255,6 @@ def find_license_files(d):
=20
     return lic_files_paths
=20
-def return_spdx(d, license):
-    """
-    This function returns the spdx mapping of a license if it exists.
-     """
-    return d.getVarFlag('SPDXLICENSEMAP', license)
-
-def canonical_license(d, license):
-    """
-    Return the canonical (SPDX) form of the license if available (so GPL=
v3
-    becomes GPL-3.0-only) or the passed license if there is no canonical=
 form.
-    """
-    return d.getVarFlag('SPDXLICENSEMAP', license) or license
-
-def expand_wildcard_licenses(d, wildcard_licenses):
-    """
-    There are some common wildcard values users may want to use. Support=
 them
-    here.
-    """
-    licenses =3D set(wildcard_licenses)
-    mapping =3D {
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
-            bb.fatal("Error, %s is an obsolete license, please use an SP=
DX reference in INCOMPATIBLE_LICENSE" % l)
-        if "*" in l:
-            bb.fatal("Error, %s is an invalid license wildcard entry" % =
l)
-
-    return list(licenses)
-
-def incompatible_license_contains(license, truevalue, falsevalue, d):
-    license =3D canonical_license(d, license)
-    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
-    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
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
-        licenses =3D oe.license.flattened_licenses(license, choose_lic_s=
et)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('P'), exc))
-
-    incompatible_lic =3D []
-    for l in licenses:
-        license =3D canonical_license(d, l)
-        if not oe.license.license_ok(license, dont_want_licenses):
-            incompatible_lic.append(license)
-
-    return sorted(incompatible_lic)
-
-def incompatible_license(d, dont_want_licenses, package=3DNone):
-    """
-    This function checks if a recipe has only incompatible licenses. It =
also
-    take into consideration 'or' operand.  dont_want_licenses should be =
passed
-    as canonical (SPDX) names.
-    """
-    import oe.license
-    license =3D d.getVar("LICENSE:%s" % package) if package else None
-    if not license:
-        license =3D d.getVar('LICENSE')
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
-        Return True if flag matches something in acceptlist, None if not=
.
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
-        flag_pn =3D ("%s_%s" % (flag, pn))
-        for candidate in acceptlist:
-            if flag_pn =3D=3D candidate:
-                    return True
-
-        flag_cur =3D ""
-        flagments =3D flag_pn.split("_")
-        flagments.pop() # we've already tested the full string
-        for flagment in flagments:
-            if flag_cur:
-                flag_cur +=3D "_"
-            flag_cur +=3D flagment
-            for candidate in acceptlist:
-                if flag_cur =3D=3D candidate:
-                    return True
-        return False
-
-    def all_license_flags_match(license_flags, acceptlist):
-        """ Return all unmatched flags, None if all flags match """
-        pn =3D d.getVar('PN')
-        split_acceptlist =3D acceptlist.split()
-        flags =3D []
-        for flag in license_flags.split():
-            if not license_flag_matches(flag, split_acceptlist, pn):
-                flags.append(flag)
-        return flags if flags else None
-
-    license_flags =3D d.getVar('LICENSE_FLAGS')
-    if license_flags:
-        acceptlist =3D d.getVar('LICENSE_FLAGS_ACCEPTED')
-        if not acceptlist:
-            return license_flags.split()
-        unmatched_flags =3D all_license_flags_match(license_flags, accep=
tlist)
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
-    pn =3D d.getVar('PN')
-    licenses =3D d.getVar('LICENSE')
-    from oe.license import license_operator, license_operator_chars, lic=
ense_pattern
-
-    elements =3D list(filter(lambda x: x.strip(), license_operator.split=
(licenses)))
-    for pos, element in enumerate(elements):
-        if license_pattern.match(element):
-            if pos > 0 and license_pattern.match(elements[pos - 1]):
-                oe.qa.handle_error('license-format',
-                        '%s: LICENSE value "%s" has an invalid format - =
license names ' \
-                        'must be separated by the following characters t=
o indicate ' \
-                        'the license selection: %s' %
-                        (pn, licenses, license_operator_chars), d)
-        elif not license_operator.match(element):
-            oe.qa.handle_error('license-format',
-                    '%s: LICENSE value "%s" has an invalid separator "%s=
" that is not ' \
-                    'in the valid list of separators (%s)' %
-                    (pn, licenses, element, license_operator_chars), d)
-
 SSTATETASKS +=3D "do_populate_lic"
 do_populate_lic[sstate-inputdirs] =3D "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] =3D "${LICENSE_DIRECTORY}/"
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
index 19b3dc55ba..b18a64d2bc 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -58,7 +58,7 @@ def write_license_files(d, license_manifest, pkg_dic, r=
ootfs=3DTrue):
     import stat
=20
     bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
-    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
+    bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_licenses=
)
     pkgarchs =3D d.getVar("SSTATE_ARCHS").split()
     pkgarchs.reverse()
=20
@@ -66,17 +66,17 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs=3DTrue):
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
             remaining_bad_licenses =3D oe.license.apply_pkg_license_exce=
ption(pkg, bad_licenses, exceptions)
-            incompatible_licenses =3D incompatible_pkg_license(d, remain=
ing_bad_licenses, pkg_dic[pkg]["LICENSE"])
+            incompatible_licenses =3D oe.license.incompatible_pkg_licens=
e(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
             if incompatible_licenses:
                 bb.fatal("Package %s cannot be installed into the image =
because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_=
licenses)))
             else:
-                incompatible_licenses =3D incompatible_pkg_license(d, ba=
d_licenses, pkg_dic[pkg]["LICENSE"])
+                incompatible_licenses =3D oe.license.incompatible_pkg_li=
cense(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
                 if incompatible_licenses:
                     oe.qa.handle_error('license-incompatible', "Includin=
g %s with incompatible license(s) %s into the image, because it has been =
allowed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
             try:
                 (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D =
\
                     oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"]=
,
-                    remaining_bad_licenses, canonical_license, d)
+                    remaining_bad_licenses, oe.license.canonical_license=
, d)
             except oe.license.LicenseError as exc:
                 bb.fatal('%s: %s' % (d.getVar('P'), exc))
=20
@@ -144,7 +144,7 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs=3DTrue):
                 if not os.path.exists(pkg_license_dir ):
                     bb.fatal("Couldn't find license information for depe=
ndency %s" % pkg)
=20
-                pkg_manifest_licenses =3D [canonical_license(d, lic) \
+                pkg_manifest_licenses =3D [oe.license.canonical_license(=
d, lic) \
                         for lic in pkg_dic[pkg]["LICENSES"]]
=20
                 licenses =3D os.listdir(pkg_license_dir)
@@ -153,7 +153,7 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs=3DTrue):
                     pkg_rootfs_license =3D os.path.join(pkg_rootfs_licen=
se_dir, lic)
=20
                     if re.match(r"^generic_.*$", lic):
-                        generic_lic =3D canonical_license(d,
+                        generic_lic =3D oe.license.canonical_license(d,
                                 re.search(r"^generic_(.*)$", lic).group(=
1))
=20
                         # Do not copy generic license into package if is=
n't
@@ -176,7 +176,7 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs=3DTrue):
                         if not os.path.exists(pkg_rootfs_license):
                             os.symlink(os.path.join('..', generic_lic_fi=
le), pkg_rootfs_license)
                     else:
-                        if (oe.license.license_ok(canonical_license(d,
+                        if (oe.license.license_ok(oe.license.canonical_l=
icense(d,
                                 lic), bad_licenses) =3D=3D False or
                                 os.path.exists(pkg_rootfs_license)):
                             continue
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index ac5b296e60..83c2e47766 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -259,3 +259,166 @@ def apply_pkg_license_exception(pkg, bad_licenses, =
exceptions):
     """Return remaining bad licenses after removing any package exceptio=
ns"""
=20
     return [lic for lic in bad_licenses if pkg + ':' + lic not in except=
ions]
+
+def return_spdx(d, license):
+    """
+    This function returns the spdx mapping of a license if it exists.
+     """
+    return d.getVarFlag('SPDXLICENSEMAP', license)
+
+def canonical_license(d, license):
+    """
+    Return the canonical (SPDX) form of the license if available (so GPL=
v3
+    becomes GPL-3.0-only) or the passed license if there is no canonical=
 form.
+    """
+    return d.getVarFlag('SPDXLICENSEMAP', license) or license
+
+def expand_wildcard_licenses(d, wildcard_licenses):
+    """
+    There are some common wildcard values users may want to use. Support=
 them
+    here.
+    """
+    licenses =3D set(wildcard_licenses)
+    mapping =3D {
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
+            bb.fatal("Error, %s is an obsolete license, please use an SP=
DX reference in INCOMPATIBLE_LICENSE" % l)
+        if "*" in l:
+            bb.fatal("Error, %s is an invalid license wildcard entry" % =
l)
+
+    return list(licenses)
+
+def incompatible_license_contains(license, truevalue, falsevalue, d):
+    license =3D canonical_license(d, license)
+    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
+    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
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
+        licenses =3D flattened_licenses(license, choose_lic_set)
+    except LicenseError as exc:
+        bb.fatal('%s: %s' % (d.getVar('P'), exc))
+
+    incompatible_lic =3D []
+    for l in licenses:
+        license =3D canonical_license(d, l)
+        if not license_ok(license, dont_want_licenses):
+            incompatible_lic.append(license)
+
+    return sorted(incompatible_lic)
+
+def incompatible_license(d, dont_want_licenses, package=3DNone):
+    """
+    This function checks if a recipe has only incompatible licenses. It =
also
+    take into consideration 'or' operand.  dont_want_licenses should be =
passed
+    as canonical (SPDX) names.
+    """
+    license =3D d.getVar("LICENSE:%s" % package) if package else None
+    if not license:
+        license =3D d.getVar('LICENSE')
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
+        Return True if flag matches something in acceptlist, None if not=
.
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
+        flag_pn =3D ("%s_%s" % (flag, pn))
+        for candidate in acceptlist:
+            if flag_pn =3D=3D candidate:
+                    return True
+
+        flag_cur =3D ""
+        flagments =3D flag_pn.split("_")
+        flagments.pop() # we've already tested the full string
+        for flagment in flagments:
+            if flag_cur:
+                flag_cur +=3D "_"
+            flag_cur +=3D flagment
+            for candidate in acceptlist:
+                if flag_cur =3D=3D candidate:
+                    return True
+        return False
+
+    def all_license_flags_match(license_flags, acceptlist):
+        """ Return all unmatched flags, None if all flags match """
+        pn =3D d.getVar('PN')
+        split_acceptlist =3D acceptlist.split()
+        flags =3D []
+        for flag in license_flags.split():
+            if not license_flag_matches(flag, split_acceptlist, pn):
+                flags.append(flag)
+        return flags if flags else None
+
+    license_flags =3D d.getVar('LICENSE_FLAGS')
+    if license_flags:
+        acceptlist =3D d.getVar('LICENSE_FLAGS_ACCEPTED')
+        if not acceptlist:
+            return license_flags.split()
+        unmatched_flags =3D all_license_flags_match(license_flags, accep=
tlist)
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
+    pn =3D d.getVar('PN')
+    licenses =3D d.getVar('LICENSE')
+
+    elements =3D list(filter(lambda x: x.strip(), license_operator.split=
(licenses)))
+    for pos, element in enumerate(elements):
+        if license_pattern.match(element):
+            if pos > 0 and license_pattern.match(elements[pos - 1]):
+                oe.qa.handle_error('license-format',
+                        '%s: LICENSE value "%s" has an invalid format - =
license names ' \
+                        'must be separated by the following characters t=
o indicate ' \
+                        'the license selection: %s' %
+                        (pn, licenses, license_operator_chars), d)
+        elif not license_operator.match(element):
+            oe.qa.handle_error('license-format',
+                    '%s: LICENSE value "%s" has an invalid separator "%s=
" that is not ' \
+                    'in the valid list of separators (%s)' %
+                    (pn, licenses, element, license_operator_chars), d)
--=20
2.43.0


