Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80FFC6F7E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9iKTj004560
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:54 +0800
Message-ID: <83f0a66f2733ddb620e210ff46fbe67e86d74ceb.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/5] libc-common.bbclass: rename ALL the packages
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:19 -0000
Content-Type: text/plain

From: Peter Seebach <peter.seebach@windriver.com>

The DEBIAN_NAMES feature renames some of the libc packages to
"libc6*" names --but only some. A previous patch added the -dbg
package. However, this doesn't cover other packages (such as
the -doc package), and it didn't take multilibs into account.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/libc-common.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index daf499d..53bf467 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -25,12 +25,19 @@ def get_libc_fpu_setting(bb, d):
 
 python populate_packages_prepend () {
     if d.getVar('DEBIAN_NAMES', True):
+        pkgs = d.getVar('PACKAGES', True).split()
         bpn = d.getVar('BPN', True)
-        d.setVar('PKG_'+bpn, 'libc6')
-        d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
-        d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
+        prefix = d.getVar('MLPREFIX', True) or ""
+        # Set the base package...
+        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
+        initial = prefix + bpn + '-'
+        for p in pkgs:
+            # And all the subpackages.
+            if p.startswith(initial):
+                renamed = p.replace(bpn, 'libc6', 1)
+                d.setVar('PKG_' + p, renamed)
         # For backward compatibility with old -dbg package
-        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
+        d.appendVar('RPROVIDES_' + initial + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RCONFLICTS_' + initial + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RREPLACES_' + initial + 'dbg', ' ' + prefix + 'libc-dbg')
 }
-- 
1.8.1.2


