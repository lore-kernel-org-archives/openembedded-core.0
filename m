Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbP-0005mi-MD
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609038"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:23 -0700
Message-Id: <093e7611b1d1821b1e1789de9c17bcd16fc2cfc8.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 19/20] package_rpm.bbclass: make RPM use on-disk permissions
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:56 -0000

From: Scott Garman <scott.a.garman@intel.com>

Instruct RPM to use the on-disk permissions, owners, groups,
and directory permissions, instead of defaulting to root:root

Code changes suggested by Mark Hatle.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/package_rpm.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3df66cc..d8e86c5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -484,6 +484,7 @@ python write_specfile () {
 			else:
 				bb.note("Creating RPM package for %s" % splitname)
 				spec_files_top.append('%files')
+				spec_files_top.append('%defattr(-,-,-,-)')
 				if file_list:
 					spec_files_top.extend(file_list)
 				spec_files_top.append('')
@@ -570,6 +571,7 @@ python write_specfile () {
 		else:
 			bb.note("Creating RPM package for %s" % splitname)
 			spec_files_bottom.append('%%files -n %s' % splitname)
+			spec_files_bottom.append('%defattr(-,-,-,-)')
 			if file_list:
 				spec_files_bottom.extend(file_list)
 			spec_files_bottom.append('')
-- 
1.7.3.4



