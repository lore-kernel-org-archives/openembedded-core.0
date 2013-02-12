Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5OGX-0006b8-Kx
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 23:23:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CM7rZw009986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:07:53 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 14:07:52 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 16:07:51 -0600
Message-ID: <b559f96e2840654db436b13490dd4c9a6a99f0d7.1360706344.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1360706344.git.peter.seebach@windriver.com>
References: <cover.1360706344.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libc-common.bbclass: rename ALL the packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 22:24:01 -0000
Content-Type: text/plain

The DEBIAN_NAMES feature renames some of the libc packages to
"libc6*" names --but only some. A previous patch added the -dbg
package. However, this doesn't cover other packages (such as
the -doc package), and it didn't take multilibs into account.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/libc-common.bbclass |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 67b018b..0d77a2d 100644
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
1.7.0.4



