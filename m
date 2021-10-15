Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60801C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:16 +0000 (UTC)
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web09.10350.1634308814208362631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=B2eSe86q;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id bONUmOYBeYDhbbONVmFr16; Fri, 15 Oct 2021 15:40:13 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=O+WiQC1W c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=-An2I_7KAAAA:8 a=Fop-cdjdmPSRM0QCBkkA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description; bh=JzASuNW/3lA7fkOMLypiQulbaYb8oF/5EvRHguluk68=; b=B2eSe
	86qjwPRpf/FaOE7qI3AUSAXfHvHZUWs3am4LPfPU+F2UJrcVUAK6WZhLyruWiHod2QO5g9FSX5A6l
	CEpYyzEHApcoqTL4O/WP729uk2QTlOlXIuI/j5uAFf83iy+B2Ig17/Rh86dPMsDkUE2GLKZGul8sW
	N+DVZPkOceManLny16rUczs2N/6kDhVKgsEfxijKWxkjB/NZYQKCny5DMRu1lJfkF1PaFMbk66Ui6
	u1AOyEyHcoS9eomre6QwNVakFO+5ikE6MZO/N6EOlOEjUL/+Gyc47FgSoDDHg9xVPZhcg2oZZRTRM
	HWRZTu5ckfQ0gQ0SxN3tal9P1cStA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mbONK-004dRv-TT; Fri, 15 Oct 2021 15:39:58 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v5 2/2] insane,license,license_image: Allow treating license
 problems as errors
Date: Fri, 15 Oct 2021 15:39:54 +0100
Message-Id: 
 <c2b2f2341e284cb331be07257226eadb69bc11b7.1634308643.git.mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <60b9c916b1bbd7488abd9366749efea9766aa3fe.1634308643.git.mac@mcrowe.com>
References: 
 <60b9c916b1bbd7488abd9366749efea9766aa3fe.1634308643.git.mac@mcrowe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfD0JslSo5gpySdoY7QDWu5SvCLu0mu3jz4cTT+SwfrO3mv93CxBOiHoOigvjqm5X0pYNUbHMosboqMq9LoQgPpOXCqjVLY0Rge8gTBbgmke9d8PsaAgS
 33p/fvOjxgYrY7D9fWcCznh6uNR3yBe7XTfPvbQbdrQUZyU9fadxd4ycoI7L45G86PlSSePx6vzBZA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:40:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157001

Use the same WARN_WA and ERROR_QA variables as insane.bbclass to allow
individual recipes, the distro or other configuration to determine
whether the various detected license errors should be treated as a
warning (as now) or as an error.

oe.qa.handle_error isn't immediately fatal, so oe.qa.exit_if_errors must
be called at the end of do_populate_lic to fail the task.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/insane.bbclass        |  2 ++
 meta/classes/license.bbclass       | 20 +++++++++++++-------
 meta/classes/license_image.bbclass | 11 ++++++-----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ad9771dfa..1e2f1b768a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -26,6 +26,8 @@ WARN_QA ?= " libdir xorg-driver-abi \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             missing-update-alternatives native-last missing-ptest \
+            license-exists license-no-generic license-syntax license-format \
+            license-incompatible license-file-missing \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 7a34e185c7..d5480d87e2 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -29,6 +29,7 @@ python do_populate_lic() {
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
         for key in sorted(info.keys()):
             f.write("%s: %s\n" % (key, info[key]))
+    oe.qa.exit_if_errors(d)
 }
 
 PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE') + '/meta/COPYING').split())}"
@@ -182,7 +183,8 @@ def find_license_files(d):
             # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
             # and should not be allowed, warn the user in this case.
             if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
-                bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
+                oe.qa.handle_error("license-no-generic",
+                    "%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type), d)
 
         elif non_generic_lic and non_generic_lic in lic_chksums:
             # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
@@ -194,7 +196,8 @@ def find_license_files(d):
             # Add explicity avoid of CLOSED license because this isn't generic
             if license_type != 'CLOSED':
                 # And here is where we warn people that their licenses are lousy
-                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
+                oe.qa.handle_error("license-exists",
+                    "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
             pass
 
     if not generic_directory:
@@ -219,7 +222,8 @@ def find_license_files(d):
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
-        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
+        oe.qa.handle_error("license-syntax",
+            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, data in sorted(lic_chksums.items()):
@@ -410,14 +414,16 @@ def check_license_format(d):
     for pos, element in enumerate(elements):
         if license_pattern.match(element):
             if pos > 0 and license_pattern.match(elements[pos - 1]):
-                bb.warn('%s: LICENSE value "%s" has an invalid format - license names ' \
+                oe.qa.handle_error('license-format',
+                        '%s: LICENSE value "%s" has an invalid format - license names ' \
                         'must be separated by the following characters to indicate ' \
                         'the license selection: %s' %
-                        (pn, licenses, license_operator_chars))
+                        (pn, licenses, license_operator_chars), d)
         elif not license_operator.match(element):
-            bb.warn('%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
+            oe.qa.handle_error('license-format',
+                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
                     'in the valid list of separators (%s)' %
-                    (pn, licenses, element, license_operator_chars))
+                    (pn, licenses, element, license_operator_chars), d)
 
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 5490d121f1..bf70bee99b 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -75,7 +75,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 pkg_dic[pkg]["LICENSES"] = re.sub(r'  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
                 if pkg in whitelist:
-                    bb.warn("Including %s with an incompatible license %s into the image, because it has been whitelisted." %(pkg, pkg_dic[pkg]["LICENSE"]))
+                    oe.qa.handle_error('license-incompatible', "Including %s with an incompatible license %s into the image, because it has been whitelisted." %(pkg, pkg_dic[pkg]["LICENSE"]), d)
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
@@ -105,10 +105,10 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                    continue
 
                 if not os.path.exists(lic_file):
-                   bb.warn("The license listed %s was not in the "\ 
-                            "licenses collected for recipe %s" 
-                            % (lic, pkg_dic[pkg]["PN"]))
-
+                    oe.qa.handle_error('license-file-missing',
+                                       "The license listed %s was not in the "\
+                                       "licenses collected for recipe %s"
+                                       % (lic, pkg_dic[pkg]["PN"]), d)
     # Two options here:
     # - Just copy the manifest
     # - Copy the manifest and the license directories
@@ -274,6 +274,7 @@ do_rootfs[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_deploy() {
     license_deployed_manifest(d)
+    oe.qa.exit_if_errors(d)
 }
 
 addtask populate_lic_deploy before do_build after do_image_complete
-- 
2.30.2


