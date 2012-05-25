Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPL-0000E6-Gq
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115471"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:21 -0700
Message-Id: <4035cf44fa40222ae955c3883f8eb5ffc9fa3506.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 42/45] package.bbclass: Add additional debugging for dependencies
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
X-List-Received-Date: Fri, 25 May 2012 06:53:56 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When trying to understand why a QA wanring such as:

ERROR: QA Issue: foo rdepends on bar-dev

it is very difficult to figure out where the bar-dev dependency
comes from, since many of them are added dynamically.

This adds a debug statement that says which dependency adds an
rdepends to the system.

Also, while doing this work, it was noted that the same dependencies
were being scanned for over and over.  Instead we shorten the list
by only added to the dep list if the dependency was not already there.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6fba5b6..8b0ac55 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1266,7 +1266,8 @@ python package_do_shlibs() {
 		for l in lines:
 			m = re.match("\s+NEEDED\s+([^\s]*)", l)
 			if m:
-				needed[pkg].append(m.group(1))
+				if m.group(1) not in needed[pkg]:
+					needed[pkg].append(m.group(1))
 			m = re.match("\s+SONAME\s+([^\s]*)", l)
 			if m:
 				this_soname = m.group(1)
@@ -1338,7 +1339,7 @@ python package_do_shlibs() {
 								name = dep.replace("-l", "lib")
 							if pkg not in needed:
 								needed[pkg] = []
-							if name:
+							if name and name not in needed[pkg]:
 								needed[pkg].append(name)
 								#bb.note("Adding %s for %s" % (name, pkg))
 
@@ -1443,6 +1444,8 @@ python package_do_shlibs() {
 			if n in shlib_provider.keys():
 				(dep_pkg, ver_needed) = shlib_provider[n]
 
+				bb.debug(2, '%s: Dependency %s requires package %s' % (pkg, n, dep_pkg))
+
 				if dep_pkg == pkg:
 					continue
 
-- 
1.7.7.6



