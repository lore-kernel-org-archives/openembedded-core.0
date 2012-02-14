Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkE-0004rp-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109850998"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:15 +0000
Message-Id: <d1e49362229ba4267dd975335332c9226a015bfa.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] classes/buildhistory: fix splitting on + in package list fields
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
X-List-Received-Date: Tue, 14 Feb 2012 13:48:34 -0000

Ensure we do not erroneously split on + in RDEPENDS/RRECOMMENDS e.g.
libstdc++-dev was being split into libstdc and -dev.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index dfc9b73..6c2d4e9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -124,7 +124,7 @@ python buildhistory_emit_pkghistory() {
 			return None
 
 	def sortpkglist(string):
-		pkgiter = re.finditer(r'[a-zA-Z0-9.-]+( \([><=]+ [^ )]+\))?', string, 0)
+		pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+ [^ )]+\))?', string, 0)
 		pkglist = [p.group(0) for p in pkgiter]
 		pkglist.sort()
 		return ' '.join(pkglist)
-- 
1.7.5.4



