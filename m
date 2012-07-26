Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuPKl-0002Ym-Rd
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:46:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 07:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127179866"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.37])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 07:35:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 15:34:59 +0100
Message-Id: <c7d982477ca634ce9a459bd53261258934740c78.1343313237.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343313237.git.paul.eggleton@linux.intel.com>
References: <cover.1343313237.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343313237.git.paul.eggleton@linux.intel.com>
References: <cover.1343313237.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/package: do not add self-dependencies to dev/dbg packages
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
X-List-Received-Date: Thu, 26 Jul 2012 14:46:36 -0000

Avoid adding dependencies to dev and dbg packages on themselves via the
DEPCHAIN_* handling code. These don't actually cause any problems, but
they do complicate dependency graphs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ea199d3..962abcd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1629,7 +1629,7 @@ python package_depchains() {
                 depend = depend.replace('-dbg', '')
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
-            if pkgname not in rreclist:
+            if pkgname not in rreclist and pkgname != pkg:
                 rreclist[pkgname] = ""
 
         #bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
@@ -1650,7 +1650,7 @@ python package_depchains() {
                 depend = depend.replace('-dbg', '')
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
-            if pkgname not in rreclist:
+            if pkgname not in rreclist and pkgname != pkg:
                 rreclist[pkgname] = ""
 
         #bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
-- 
1.7.9.5



