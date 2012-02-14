Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkE-0004rw-9W
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109850988"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:14 +0000
Message-Id: <f0a239770c953c55f604106afe0466a8b4ae4cea.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] classes/buildhistory: use hostname instead of reading /etc/hostname
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

For the purposes of querying the hostname to include it in the commit
message, it seems "cat /etc/hostname" does not work on the Yocto Project
autobuilder machines, and it's likely that the hostname command will be
more generally reliable, so use that instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3fbe3a8..dfc9b73 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -383,7 +383,7 @@ buildhistory_commit() {
 		repostatus=`git status --porcelain`
 		if [ "$repostatus" != "" ] ; then
 			git add ${BUILDHISTORY_DIR}/*
-			HOSTNAME=`cat /etc/hostname 2>/dev/null || echo unknown`
+			HOSTNAME=`hostname 2>/dev/null || echo unknown`
 			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
-- 
1.7.5.4



