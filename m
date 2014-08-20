Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4A865DD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 21:18:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KLIYJV016521
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 14:18:35 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 20 Aug 2014 14:18:34 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Aug 2014 16:24:21 -0500
Message-ID: <3976806770dbe3eaac9d3bf772665b368c5c17bc.1408569719.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1408569719.git.peter.seebach@windriver.com>
References: <cover.1408569719.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libc-common.bbclass: rename ALL the packages
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
X-List-Received-Date: Wed, 20 Aug 2014 21:18:41 -0000
Content-Type: text/plain

The DEBIAN_NAMES feature renames some of the libc packages to
"libc6*" names --but only some. A previous patch added the -dbg
package. However, this doesn't cover other packages (such as
the -doc package), and it didn't take multilibs into account.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/libc-common.bbclass |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index daf499d..bbc8016 100644
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
+        libcprefix = prefix + bpn + '-'
+        for p in pkgs:
+            # And all the subpackages.
+            if p.startswith(libcprefix):
+                renamed = p.replace(bpn, 'libc6', 1)
+                d.setVar('PKG_' + p, renamed)
         # For backward compatibility with old -dbg package
-        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
+        d.appendVar('RPROVIDES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RCONFLICTS_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RREPLACES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
 }
-- 
1.7.1


