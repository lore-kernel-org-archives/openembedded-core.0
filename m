Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id D5EF7705C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:08:23 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so1538202wes.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=VqcrMOItdTOTwUk0iTSHK/UUVI4/YBCNH13Ax+bddJ8=;
	b=KMyNBnI4qVhlGudbdLGq/XdhQiCeZm7tDX3erlmjuy/A9b3RfKLLW+Hdy6iC2wxy6q
	fGYwW4aeXe97HEkeNdG2v0bWVP4gsSxnBhYYvrRoy+vOQ5PrKVFz/ihPp39TihwepxPN
	7E3dHbX9c+hFjpkOXEC+cY716konbwcsbaPc5xycNVGL0Rw52ohpRCFuhxzS8ZHauLBn
	TVzkBKAsvCQlAQ0r/Y4qv5FsRY/0BPcNi95wQ6jQVp3hcKkLvarwzISURqkVQ7Wcv9g1
	0T8gSIoBIkGyXBYkE0Slg95lyaR58bYSYEY2q4esiCGBzAXlEpPVXldH0yj5zsd5k1WL
	RBbQ==
X-Gm-Message-State: ALoCoQmeO2cdT1bUWS6O9qHBUDi6PeRnXVbmZOxGbhT9IKULmuqqzuR5H7srWJY/G27XlZ4Tc9k+
X-Received: by 10.180.211.134 with SMTP id nc6mr14602913wic.44.1405544902150; 
	Wed, 16 Jul 2014 14:08:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm13215918wik.7.2014.07.16.14.08.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 14:08:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 22:08:13 +0100
Message-Id: <630fae1a4789305e375dc7897b9bbb71a240e250.1405542583.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405542583.git.ross.burton@intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
In-Reply-To: <cover.1405542583.git.ross.burton@intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
Subject: [PATCH 1/2] license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Wed, 16 Jul 2014 21:08:25 -0000

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


