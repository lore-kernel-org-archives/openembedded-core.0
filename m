Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC74608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:53:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2013 09:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,898,1363158000"; d="scan'208";a="352447369"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2013 09:53:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2013 17:53:06 +0100
Message-Id: <1371660786-11419-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/buildhistory: fix error when no packages are installed
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
X-List-Received-Date: Wed, 19 Jun 2013 16:53:14 -0000

"xargs -n1 basename" will execute basename even if there are no lines
piped into it, causing a "basename: missing operand" error if no
packages are installed, which will happen for the target portion of
buildtools-tarball.

(xargs' -r option could have been used here, but it is a GNU extension
and I thought it best to avoid that for the sake of future
interoperability).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index c8fd68c..36e7fe1 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -319,7 +319,11 @@ buildhistory_get_installed() {
 	list_installed_packages file | sort > $pkgcache
 
 	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
-	cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > $1/installed-packages.txt
+	if [ -s $pkgcache ] ; then
+		cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > $1/installed-packages.txt
+	else
+		printf "" > $1/installed-packages.txt
+	fi
 
 	# Produce dependency graph
 	# First, filter out characters that cause issues for dot
-- 
1.8.1.2


