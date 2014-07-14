Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AB4D97048D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:23:37 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so1748077wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 03:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VqcrMOItdTOTwUk0iTSHK/UUVI4/YBCNH13Ax+bddJ8=;
	b=R2ASEzHFMU5XzRnKI6ZNCprNMOrSgP02NiaIVOS+xA9ckfqvA7bHryRd7m0/lpFkjD
	/iggvrpgv8TAkWuwwTPpIew+vM3XmLZp30GzF+XAJ+BsK3bHNe/BX0pJWEkk1RG+DDWw
	KqvQ85qT9tLx9RXMWMrVNJYtKUpwbDuyg0ACQRxqSTPip/Y8PWQpQYoiKaGsihJ6Up3s
	aHymR+R8ZX+7xwAfXpyuqmxJKlp6lB52xIFXI1M8i6XIyTnaMj2GfhZ563K/BKH7TY7f
	PZirCzZlBBhf9dRiXOrtX4zrg47h3rWOWM7majKIwt9Q7ILuAjsiG3LiBY4qxYf5Odcc
	DXrw==
X-Gm-Message-State: ALoCoQnlmTDPwp3ZBSsJn7+NwrqCvhsjMg5ok0DLEMCuLNLVRZT57dW6unHqy0epw++Jn5noH+LG
X-Received: by 10.180.198.173 with SMTP id jd13mr24083812wic.9.1405333416471; 
	Mon, 14 Jul 2014 03:23:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id o9sm29469365wib.22.2014.07.14.03.23.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 03:23:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 11:23:29 +0100
Message-Id: <1405333409-17997-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Mon, 14 Jul 2014 10:23:39 -0000

If INCOMPATIBLE_LICENSE=GPLv3.0 but the recipe sets LICENSE=GPLv3, the current
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


