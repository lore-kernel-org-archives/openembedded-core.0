Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkHVI-00043U-Rm
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 16:51:20 +0100
Received: by eeit10 with SMTP id t10so1991491eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 07:43:53 -0800 (PST)
Received: by 10.213.34.203 with SMTP id m11mr1209903ebd.40.1326123832758;
	Mon, 09 Jan 2012 07:43:52 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id t1sm292106243eeb.3.2012.01.09.07.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 07:43:51 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 17:43:44 +0200
Message-Id: <1326123824-11738-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] base.bbclass: support for or operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Mon, 09 Jan 2012 15:51:20 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

base.bblass modfied in order to correctly exlude packages where OE-Style licence naming
is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 will be exluded from a non-GPLv3
build.
The second modification was to include in a non-GPLv3 build packages where LICENSE is
GPLv3 or "something else". For example, qt4-embedded has LICENSE = "LGPLv2.1 | GPLv3".
This package should be included in a non-GPLv3 build as it is LGPLv2.1 or GPLv3.

[YOCTO #1884]
[YOCTO #1844]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/base.bbclass |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e65a722..568c5dd 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -392,6 +392,8 @@ python () {
 
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', 1)
+        spdx_dont_want_license = d.getVarFlag('SPDXLICENSEMAP', dont_want_license)
+
         if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial"):
             hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, 1) or "").split()
             lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, 1) or "").split()
@@ -400,10 +402,22 @@ python () {
 
                 import re
                 this_license = d.getVar('LICENSE', 1)
-                if this_license and re.search(dont_want_license, this_license):
-                    bb.note("SKIPPING %s because it's %s" % (pn, this_license))
-                    raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
-
+                this_license_clean=re.sub(r'[+&()*]', '', this_license)
+                or_licenses = re.split('[|]', this_license_clean)
+
+                for one_or_license in or_licenses:
+		    licenses = re.split('[ ]', one_or_license)
+		    good_license=one_or_license
+		    for onelicense in licenses:
+			spdx_onelicense = d.getVarFlag('SPDXLICENSEMAP', onelicense)
+			if ( onelicense and re.search(dont_want_license, onelicense) ) or ( onelicense and re.search(spdx_dont_want_license, onelicense) ) or ( spdx_onelicense and re.search(dont_want_license, spdx_onelicense) ) or ( spdx_onelicense and re.search(spdx_dont_want_license, spdx_onelicense) ):
+				good_license = ""
+				break
+		    if good_license != "":
+			break
+		if good_license == "":
+		    bb.note("SKIPPING %s because it's %s" % (pn, this_license))
+		    raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
     srcuri = d.getVar('SRC_URI', 1)
     # Svn packages should DEPEND on subversion-native
     if "svn://" in srcuri:
-- 
1.7.5.4



