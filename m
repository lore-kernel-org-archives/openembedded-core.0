Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPNBa-0006lI-Q8
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:08:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2011 16:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,269,1304319600"; 
   d="scan'208";a="7701951"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:05:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 16:05:17 -0700
Message-Id: <f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1306364294.git.dvhart@linux.intel.com>
References: <cover.1306364294.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Wed, 25 May 2011 23:08:19 -0000

Fixes [YOCTO 1102]

Path variables are typically : delimited. White space is allowed in paths, so
is not a good choice for separating paths. Currently utils.bbclass performs the
following:

    extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()

This splits FILESEXTRAPATHS on whitespace. It later splits overrides on : and
reassembles them all together as : delimited.

There is only one user of FILESEXTRAPATHS in oe-core (qt4-tools-native, which
uses : anyway) and none in oe.

Change the split() in utils.bbclass to split on : instead of whitespace. When
splitting on a defined string (":") we must be careful to handle the empty
string case which returns [''] instead of [].

Tested building qt4-tools-native and core-image-minimal for surgarbay from
meta-intel with a couple extra layers with FILESEXTRAPATHS modifications added.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Phil Blundell <pb@pbcl.net>
---
 meta/classes/utils.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index e103351..9930a24 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -331,8 +331,10 @@ def explode_deps(s):
 
 def base_set_filespath(path, d):
 	filespath = []
-	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
-	path = extrapaths + path
+	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "")
+	# Don't prepend empty strings to the path list
+	if extrapaths != "":
+		path = extrapaths.split(":") + path
 	# The ":" ensures we have an 'empty' override
 	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
 	for p in path:
-- 
1.7.1



