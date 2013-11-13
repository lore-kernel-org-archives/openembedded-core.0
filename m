Return-Path: <jch@honig.net>
Received: from firewall.honig.net (firewall.honig.net [66.152.121.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED5B6D98D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 16:37:48 +0000 (UTC)
Received: from nixie.honig.net (nixie.HONIG.NET [172.25.29.61])
	by firewall.honig.net (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	rADGbm7n010451
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 11:37:48 -0500
Received: from nixie.honig.net (nixie.honig.net [127.0.0.1])
	by nixie.honig.net (8.14.4/8.14.4/Debian-2ubuntu2.1) with ESMTP id
	rADGblha032242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 11:37:47 -0500
Received: (from jch@localhost)
	by nixie.honig.net (8.14.4/8.14.4/Submit) id rADGblgr032241
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Nov 2013 11:37:47 -0500
From: jeffrey.honig@windriver.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 11:37:41 -0500
Message-Id: <1384360661-32208-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [master][dora][PATCH] perl: perl-ptest.inc polutes package dependencies when ptest not enabled
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
X-List-Received-Date: Wed, 13 Nov 2013 16:37:49 -0000

From: Jeffrey C Honig <jch@honig.net>

When ptest is not enabled, the populate_packages_prepend function runs
wheter ptest is enabled or not.  This causes ptest packages to get in the
dependencies list when ptest is not enabled.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 15afe2d..6999e6b 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -42,8 +42,9 @@ python populate_packages_prepend() {
     # Put all *.t files from the lib dir in the ptest package
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
-    do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
-        '${PN}-ptest%s', '%s', recursive=True, match_path=True)
+    if "ptest" in d.getVar("DISTRO_FEATURES", True).split():
+        do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
+            '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
 RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
-- 
1.7.9.5


