Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC2F610FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 23:36:54 +0000 (UTC)
Received: from mailserv59-us.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	r94Nas6m008710; Fri, 4 Oct 2013 18:36:54 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by mailserv59-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013100418365476-795149 ;
	Fri, 4 Oct 2013 18:36:54 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 4 Oct 2013 18:35:53 -0500
Message-Id: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 1.8.4
X-MIMETrack: Itemize by SMTP Server on MailServ59-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 10/04/2013 06:36:54 PM,
	Serialize by Router on MailServ59-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/04/2013 06:36:54 PM,
	Serialize complete at 10/04/2013 06:36:54 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-04_05:2013-10-04, 2013-10-04,
	1970-01-01 signatures=0
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com
Subject: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Fri, 04 Oct 2013 23:36:55 -0000

Suppose the following:
1) foo.do_configure/do_build runs in parallel with
   sed-native.do_configure;
2) foo.do_configure/do_build makes use of sed (i.e. inherits autotools);
3) A previously built sed-native already exists in the native sysroot,
   and in the sstate cache.

Then sed-native may be deleted from its sysroot via
sstate_clean_manifest while foo.do_configure/do_build is using it,
leading to an irreproducible build failure.

This fix does for sed-native what's already done for libtool-native,
with some additional light refactoring.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/autotools.bbclass | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 66c0f5d..2bb2aa3 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -7,17 +7,25 @@ def autotools_dep_prepend(d):
 
     if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
         return deps
-    deps += 'autoconf-native automake-native '
+    deps += 'autoconf-native automake-native gnu-config-native '
 
-    if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
-        deps += 'libtool-native '
-        if not bb.data.inherits_class('native', d) \
-                        and not bb.data.inherits_class('nativesdk', d) \
-                        and not bb.data.inherits_class('cross', d) \
-                        and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
-            deps += 'libtool-cross '
+    if pn in ['libtool', 'libtool-native'] or pn.endswith("libtool-cross"):
+        return deps
+    deps += 'libtool-native '
+
+    if d.getVar('INHIBIT_DEFAULT_DEPS', True):
+        return deps
+
+    if pn not in ['sed-native']:
+        deps += 'sed-native '
+
+    if bb.data.inherits_class('native', d) \
+       or bb.data.inherits_class('nativesdk', d) \
+       or bb.data.inherits_class('cross', d):
+        return deps
+    deps += 'libtool-cross '
 
-    return deps + 'gnu-config-native '
+    return deps
 
 EXTRA_OEMAKE = ""
 
-- 
1.8.4


