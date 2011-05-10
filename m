Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVc-0001is-2m
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 22:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="433404907"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 22:26:15 -0700
Message-Id: <491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 21:58:58 -0700
Date: Mon, 09 May 2011 22:26:14 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 03/30] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Tue, 10 May 2011 05:29:25 -0000

From: Khem Raj <raj.khem@gmail.com>

Appending to BBPATH gives a definite order to BBLAYERS which
means paths are preferred in order from left to right.

[sgw: merged in comment]
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/layer.conf |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 3f63c7d..10a6948 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -2,7 +2,15 @@ BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+# packages is still there because metadata_scm.bbclass still uses
+# it to deduce the repo directory and thats the reason to prepend
+# to BBFILES here because this class uses the first entry in
+# BBFILES to calculate the scm base.
+# since the order of BBFLILES is not that important its acted upon
+# using BBFILES_PRIORITY we are ok to keep the oe-core BBFILES dir
+# at top
+
+BBFILES =+ "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.1.1



