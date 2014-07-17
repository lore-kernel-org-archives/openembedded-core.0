Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 26F9270686
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:41:11 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so2934389wib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U5C75XtSRbpnL+v9prXEDI7VExvyzo4fF5qiHTpZAKY=;
	b=eZYCMXIeGz5/wGcacsA+Ur+Tfc7JGsa8Dg0GV5vTNsBSFQjy+3+jHvhrXyvGZG6ow1
	439uEVCu/pw81DKEWnTNnE6sY4tJ+jfc7ifbEE+o+JgjHZPcHS0Z/L6OXcxQ5Hy/xK7s
	RXGfyH4KwRDgOLTZGcnIxr+idq8ST2gDSJBpUqnUZJjpsuoS/smrpHVHxqJ3cXTKDo/J
	tSYgLgnjq6hA+W/S+6Eso/Iqpue6ybokZsjbmDLj9y+q5IMshA1/uUgRo4ee3M4lL+aA
	vaG0x+QRGdAsDKlhJAIRZM7APOwgUE/41PNj7NUy2NX2pagOCrX1Cdj6wxlHoc7LVAdt
	FkfA==
X-Gm-Message-State: ALoCoQnxhxfeJ5peXvh0Zd0ZbS/PRG6NJHzVvmGF/nYJiIJIompNcbTYu0ATu5CLxVDugj4JvnP7
X-Received: by 10.180.76.68 with SMTP id i4mr22809017wiw.83.1405608072374;
	Thu, 17 Jul 2014 07:41:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cx5sm6627310wjb.8.2014.07.17.07.41.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 07:41:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 15:41:05 +0100
Message-Id: <1405608065-8679-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jul 2014 14:41:14 -0000

If INCOMPATIBLE_LICENSE=GPL-3.0 but the recipe sets LICENSE=GPLv3, the current
code won't trigger because they're different strings.

Fix this by attempting to canonicalise every license name to a SPDX name, so
both names in this example become GPL-3.0.

[ YOCTO #5622 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass    |    2 ++
 meta/classes/license.bbclass |   14 +++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c0d2c8ec8..8114cf6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -540,6 +540,8 @@ python () {
                 check_license = False
 
         if check_license and bad_licenses:
+            bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+
             whitelist = []
             for lic in bad_licenses:
                 for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_", "WHITELIST_"]:
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 08f0665..973a95b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -264,10 +264,18 @@ def return_spdx(d, license):
      """
     return d.getVarFlag('SPDXLICENSEMAP', license, True)
 
+def canonical_license(d, license):
+    """
+    Return the canonical (SPDX) form of the license if available (so GPLv3
+    becomes GPL-3.0), or the passed license if there is no canonical form.
+    """
+    return d.getVarFlag('SPDXLICENSEMAP', license, True) or license
+
 def incompatible_license(d, dont_want_licenses, package=None):
     """
-    This function checks if a recipe has only incompatible licenses. It also take into consideration 'or'
-    operand.
+    This function checks if a recipe has only incompatible licenses. It also
+    take into consideration 'or' operand.  dont_want_licenses should be passed
+    as canonical (SPDX) names.
     """
     import re
     import oe.license
@@ -298,7 +306,7 @@ def incompatible_license(d, dont_want_licenses, package=None):
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('P', True), exc))
-    return any(not license_ok(l) for l in licenses)
+    return any(not license_ok(canonical_license(d, l)) for l in licenses)
 
 def check_license_flags(d):
     """
-- 
1.7.10.4


