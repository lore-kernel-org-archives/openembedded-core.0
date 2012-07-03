Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPx-0006tU-Fk
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:21:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158085"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:42 -0700
Message-Id: <fa1c7b797593cbd5e82dc264bde2667620eb0515.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/17] libc-common: Allow -dbg package to append, and not just set package variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:21:02 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The libc-common attempts to rewrite the package information in a way similar
to debian.bbclass.  When it does this, it should be appending to the
dependency variables (RPROVIDES, RREPLACES, and RCONFLICTS), instead
of simply setting a hard coded value.  Otherwise the lib package can not
tailor the dependency variables to suite it's needs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/libc-common.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 9b91f0a..8145d64 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -29,7 +29,7 @@ python populate_packages_prepend () {
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
 		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
 		# For backward compatibility with old -dbg package
-		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
+		d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
 }
-- 
1.7.7.6



