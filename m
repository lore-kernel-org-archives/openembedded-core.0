Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQV-00047r-Bt
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476638"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:06 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbK3j006579 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:20 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbKTP006578
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:20 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:07 -0700
Message-Id: <c653f90224199b1b06904cdf32cce8c7c8218f2d.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 19/22] archiver.bbclass: Reduce some duplication for function get_licenses
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:40 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The content to modify this bbclass is as follow:
- Use the existing functions to get license as a directory instead of
  rewriting it for avoiding code duplication.
- Use SPDXLICENSEMAP to map licenses

[YOCTO #2473]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/archiver.bbclass |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ed2dbe4..083bb1d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -225,17 +225,18 @@ def archive_logs(d,logdir,bbinc=False):
 
 def get_licenses(d):
 	'''get licenses for running .bb file'''
-	licenses = d.getVar('LICENSE', 1).replace('&', '|')
-	licenses = licenses.replace('(', '').replace(')', '') 
-	clean_licenses = ""
-	for x in licenses.split():
-		if x.strip() == '' or x == 'CLOSED':
-			continue
-		if x != "|":
-			clean_licenses += x
-	if '|' in clean_licenses:
-		clean_licenses = clean_licenses.replace('|','')
-	return clean_licenses
+	import oe.license
+
+	licenses_type = d.getVar('LICENSE', True) or ""
+	lics = oe.license.is_included(licenses_type)[1:][0]
+	lice = ''
+	for lic in lics:
+		licens = d.getVarFlag('SPDXLICENSEMAP', lic)
+		if licens != None:
+			lice += licens
+		else:
+			lice += lic
+	return lice
 	
 
 def move_tarball_deploy(d,tarball_list):
-- 
1.7.5.4



