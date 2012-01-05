Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rirfo-0004n0-Tk
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:04:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53632754"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.73])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jan 2012 09:56:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 17:56:25 +0000
Message-Id: <072727adc69cc29a0f3218720014a0a9724e6a08.1325785538.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] classes/buildhistory: add hostname to commit message
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
X-List-Received-Date: Thu, 05 Jan 2012 18:04:21 -0000

If we're building on multiple hosts then it's useful to have the
hostname in the commit message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 06d3510..ba20914 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -356,7 +356,8 @@ buildhistory_commit() {
 		repostatus=`git status --porcelain`
 		if [ "$repostatus" != "" ] ; then
 			git add ${BUILDHISTORY_DIR}/*
-			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} for machine ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			HOSTNAME=`cat /etc/hostname 2>/dev/null || echo unknown`
+			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
-- 
1.7.5.4



