Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkdZw-000088-2w
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 16:25:36 +0100
Received: by werm13 with SMTP id m13so3976093wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 07:18:07 -0800 (PST)
Received: by 10.180.94.102 with SMTP id db6mr4710959wib.0.1326208687401;
	Tue, 10 Jan 2012 07:18:07 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id fi11sm83730623wbb.9.2012.01.10.07.18.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 07:18:06 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 17:17:58 +0200
Message-Id: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 15:25:36 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

A new function was defined in license.bbclass in order to correctly exclude packages where OE-Style licence naming
is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be excluded from a non-GPLv3 build. This function
takes into consideration if 'or' operand is used.
The function defined in license.bbclass is called in base.bbclass where packages are excluded based on
INCOMPATIBLE_LICENSE variable.

[YOCTO #1884]
[YOCTO #1844]

Signed-off-by: Andrei Gherzan <andrei at gherzan.ro>
---
 meta/classes/base.bbclass    |    3 +-
 meta/classes/license.bbclass |   45 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e65a722..f0c358e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -398,9 +398,8 @@ python () {
             dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, 1) or "").split()
             if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
 
-                import re
                 this_license = d.getVar('LICENSE', 1)
-                if this_license and re.search(dont_want_license, this_license):
+                if incompatible_license(d,dont_want_license):
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d351b5a..4b98e29 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -237,6 +237,51 @@ python do_populate_lic() {
 
 }
 
+def incompatible_license(d,dont_want_license):
+    """
+    This function checks if a package has only incompatible licenses. It also take into consideration 'or'
+    operand.
+    """
+    import re
+    import oe.license
+    from fnmatch import fnmatchcase as fnmatch
+
+    dont_want_licenses = []
+    dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', 1))
+    if d.getVarFlag('SPDXLICENSEMAP', dont_want_license):
+	dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
+
+    def include_license(license):
+	if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
+	    return False
+	else:
+	    spdx_license = d.getVarFlag('SPDXLICENSEMAP', license)
+	    if spdx_license and any(fnmatch(spdx_license, pattern) for pattern in dont_want_licenses):
+		return False
+	    else:
+		return True
+
+    def choose_licenses(a, b):
+        if all(include_license(lic) for lic in a):
+		return a
+        else:
+		return b
+
+    """
+    If you want to exlude license named generically 'X', we surely want to exlude 'X+' as well.
+    In consequence, we will exclude the '+' character from LICENSE in case INCOMPATIBLE_LICENSE
+    is not a 'X+' license.
+    """
+    if not re.search(r'[+]',dont_want_license):
+	licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', d.getVar('LICENSE', True)), choose_licenses)
+    else:
+	licenses=oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+
+    for onelicense in licenses:
+	if not include_license(onelicense):
+		return True
+    return False
+
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-- 
1.7.5.4



