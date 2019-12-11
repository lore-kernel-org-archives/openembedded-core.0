Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD5C7FC2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:11:29 +0000 (UTC)
IronPort-SDR: k/zZhBrIt6Y4+5mROT1c1vJIrOj3IeD6qM/JAo74b1T3dubWdZbzn4DARSFeBy2PKQAhf8QXnX
	gaUxzuB7zBVb02U2ih9BCZgJlsfk6cjnN6ftj9Oy77O4nGytrdGevcUBklNzxBoDZStb65I4PC
	zrrw2IJzxaizESelC4C9v7jKBoF/1dfRBgjV2Rzx/Oauj8nf93Yw1wOnjI2dauw7l5DVPEgFZq
	iUqc3smCdwHwXFmrgvoXb9/7hgkCCuGsd0Q7u26JMm0vshEn8NznDMoSbp6agOxwP9EnajmC/i
	ltg=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3360215"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 04:11:21 +0100
Message-Id: <20191211031126.22782-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211031126.22782-1-pkj@axis.com>
References: <20191211031126.22782-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 3/8] license.bbclass: Make incompatible_pkg_license return incompatible lics
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
X-List-Received-Date: Wed, 11 Dec 2019 03:11:30 -0000
Content-Transfer-Encoding: 8bit

This makes it possible to report the incompatible licenses.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c388740003..f90176d6c0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -310,15 +310,21 @@ def incompatible_pkg_license(d, dont_want_licenses, license):
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
-        return a if all(oe.license.license_ok(canonical_license(d, lic), 
+        return a if all(oe.license.license_ok(canonical_license(d, lic),
                             dont_want_licenses) for lic in a) else b
 
     try:
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('P'), exc))
-    return any(not oe.license.license_ok(canonical_license(d, l), \
-               dont_want_licenses) for l in licenses)
+
+    incompatible_lic = []
+    for l in licenses:
+        license = canonical_license(d, l)
+        if not oe.license.license_ok(license, dont_want_licenses):
+            incompatible_lic.append(license)
+
+    return sorted(incompatible_lic)
 
 def incompatible_license(d, dont_want_licenses, package=None):
     """
-- 
2.21.0


