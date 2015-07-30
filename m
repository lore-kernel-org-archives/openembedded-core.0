Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59321764B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 21:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 30 Jul 2015 14:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,579,1432623600"; d="scan'208";a="616347367"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 14:40:15 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:40:12 -0500
Message-Id: <1438292413-32544-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438292413-32544-1-git-send-email-anibal.limon@linux.intel.com>
References: <1438292413-32544-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH][fido] license_class: Fix choose_lic_set into incompatible license
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
X-List-Received-Date: Thu, 30 Jul 2015 21:40:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use canonical_license when doing evaluation of license expresion
since INCOMPATIBLE_LICENSE are already canonized.

[YOCTO #8080]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index b62910b..9a8066c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -359,7 +359,8 @@ def incompatible_license(d, dont_want_licenses, package=None):
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
-        return a if all(license_ok(lic) for lic in a) else b
+        return a if all(license_ok(canonical_license(d, lic)) for lic in a) \
+                else b
 
     try:
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
-- 
1.9.1


