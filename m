Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S67ar-0003DC-0p
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 22:43:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 22:34:40 +0100
Message-Id: <1331328880-18256-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] package.bbclass: sort dynamically generated packages
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
X-List-Received-Date: Fri, 09 Mar 2012 21:43:21 -0000

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
index e8c4497..2337c0d 100644
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
1.7.5.4



