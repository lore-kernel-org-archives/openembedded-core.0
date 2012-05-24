Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SXdX7-0006Ne-4y
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 21:17:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4OJ71wG025941
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 12:07:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 24 May 2012 12:07:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 14:11:02 -0500
Message-ID: <2b0bf168b27f511656fdbdadde94dda2daba6462.1337886141.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337886141.git.mark.hatle@windriver.com>
References: <cover.1337886141.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] package.bbclass: Add additional debugging for dependencies
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
X-List-Received-Date: Thu, 24 May 2012 19:17:13 -0000
Content-Type: text/plain

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
1.7.3.4



