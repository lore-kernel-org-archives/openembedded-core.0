Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlp-0000Hp-Uo
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321824"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:50 -0700
Message-Id: <be6c109f8cf2ae7cb8da12578d4826133f9f03a5.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/23] package.bbclass: sort dynamically generated packages
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:50 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* do_split_packages and package_do_split_locales dynamically add
  packages in order of appearance of os.walk() or os.listdir().
  This order varies between multiple build hosts (and probably
  also between successive builds).
* Sort the list of dynamically added packages, to get a consistent
  and reproducible order.
* This reduces the diffs in buildhistory and improves
  comparability between builds.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9b6862d..7bcfa02 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -116,7 +116,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 			mainpkg = mainpkg.replace('-dev', '')
 		extra_depends = mainpkg
 
-	for o in objs:
+	for o in sorted(objs):
 		import re, stat
 		if match_path:
 			m = re.match(file_regex, o)
@@ -415,7 +415,7 @@ python package_do_split_locales() {
 	summary = d.getVar('SUMMARY', True) or pn
 	description = d.getVar('DESCRIPTION', True) or "" 
         locale_section = d.getVar('LOCALE_SECTION', True)
-	for l in locales:
+	for l in sorted(locales):
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-- 
1.7.7.6



