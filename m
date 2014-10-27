Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 763ED605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 07:37:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9R7bhhH009676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 00:37:43 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 00:37:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 03:37:41 -0400
Message-ID: <1414395461-10225-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] license.bbclass: canonicalise the licenses named with 'X+'
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
X-List-Received-Date: Mon, 27 Oct 2014 07:37:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If INCOMPATIBLE_LICENSE=GPLv3, GPLv3+ should be excluded
as well but not now since there is no SPDXLICENSEMAP for
licenses named with 'X+', we can add all the SPDXLICENSEMAP
settings for licenses named with 'X+' in licenses.conf,
but it's more like a duplication, so improve the canonical_license
function to auto map for 'X+' if SPDXLICENSEMAP for 'X' is
available, so GPLv3+ becomes GPL-3.0+.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/license.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index a34ea39..14d3107 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -274,9 +274,16 @@ def return_spdx(d, license):
 def canonical_license(d, license):
     """
     Return the canonical (SPDX) form of the license if available (so GPLv3
-    becomes GPL-3.0), or the passed license if there is no canonical form.
+    becomes GPL-3.0), for the license named 'X+', return canonical form of
+    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+), 
+    or the passed license if there is no canonical form.
     """
-    return d.getVarFlag('SPDXLICENSEMAP', license, True) or license
+    lic = d.getVarFlag('SPDXLICENSEMAP', license, True) or ""
+    if not lic and license.endswith('+'):
+        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'), True)
+        if lic:
+            lic += '+'
+    return lic or license
 
 def incompatible_license(d, dont_want_licenses, package=None):
     """
-- 
2.0.0


