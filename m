Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rirfq-0004n6-04
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:04:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53632756"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.73])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jan 2012 09:56:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 17:56:26 +0000
Message-Id: <53c81c54c428dc5a9806085efdc7c5dfa194bd6b.1325785538.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/buildhistory: make the package version backwards error non-fatal
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
X-List-Received-Date: Thu, 05 Jan 2012 18:04:22 -0000

Just make it a bb.error when a package version goes backwards, it
doesn't make sense to fail the build immediately; the error(s) will
still be reflected in bitbake's exit code.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ba20914..f618903 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -158,7 +158,7 @@ python buildhistory_emit_pkghistory() {
 			last_pr = lastversion.pr
 			r = bb.utils.vercmp((pe, pv, pr), (last_pe, last_pv, last_pr))
 			if r < 0:
-				bb.fatal("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
+				bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
 
 		pkginfo = PackageInfo(pkg)
 		pkginfo.pe = pe
-- 
1.7.5.4



