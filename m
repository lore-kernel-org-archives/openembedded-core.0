Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSIXo-0004sQ-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 03:51:52 +0200
Received: by lags15 with SMTP id s15so725161lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S8g2gbrjC+yHlKWnDnHO9ePEZzY2wb9jCVZefYWCL94=;
	b=0zngU3qS5vltp/inqUoQhTV+h7hRsevFe5hg9vHG/rSC0uGxeiZui56gLkwzzHboz0
	Zr9ss19v93wIZ+rSvSfqNwXRp2mX18bpTQTdB7cVMAmfAnYKsZZUtsyuuMbCXWntpgTH
	FmaMQR6bpR8D1umZN84w1/c8I+Mqu3ELppxZQcUOH/ScXBD70UxT42gr/PDubl0KLP2b
	IlEzZSJBaEzrgt4KAaeabpd1tLem4G/+T8LqyNMjfs416i4WiFlPMYqnmCwKANNzUY2B
	mjdzSKCjcWlxNhzAtg2I+7IzyCM7IkOeaUlTD2y3aAGWLnZVC+r0SE+Rjb1eCX+y+ONo
	GJ7g==
Received: by 10.152.147.33 with SMTP id th1mr2344853lab.9.1336614119222;
	Wed, 09 May 2012 18:41:59 -0700 (PDT)
Received: from alpha.cazfi.net (a91-153-5-101.elisa-laajakaista.fi.
	[91.153.5.101])
	by mx.google.com with ESMTPS id ox7sm5461387lbb.17.2012.05.09.18.41.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 18:41:58 -0700 (PDT)
Received: from cazfi by alpha.cazfi.net with local (Exim 4.77)
	(envelope-from <cazfi74@gmail.com>)
	id 1SSIOC-0000Tw-UU; Thu, 10 May 2012 04:41:56 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2012 04:41:44 +0300
Message-Id: <1336614104-1825-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] package_deb.bbclass: don't handle advanced dependency marker as version number
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
X-List-Received-Date: Thu, 10 May 2012 01:51:52 -0000

Strip advanced dependency markers away from Provides before writing
them to control file. Left in place they would mean package version
number in control file format.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/classes/package_deb.bbclass |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index dc0f963..c51bf3c 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -206,6 +206,23 @@ python do_package_deb () {
     import re, copy
     import textwrap
 
+    def deb_explode_dep_ver(varname):
+        # Remove markers from string so they won't get handled as version numbers
+        depstr = localdata.getVar(varname, True) or ""
+        start = depstr.find("(")
+        while start != -1:
+            # We are not searching ")" from full string in case it's malformed in a way
+            # that first ")" is before first "("
+            endstr = depstr[start:len(depstr)]
+            end = endstr.find(")")
+            if (end == len(endstr) - 1) or (end == -1):
+                tmpstr = depstr[0:start]
+            else:
+                tmpstr = depstr[0:start] + depstr[start+end+1:len(depstr)]
+            depstr = tmpstr
+            start = depstr.find("(")
+        return bb.utils.explode_dep_versions(depstr)
+
     workdir = d.getVar('WORKDIR', True)
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
@@ -341,7 +358,7 @@ python do_package_deb () {
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
-        rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        rprovides = deb_explode_dep_ver("RPROVIDES")
         rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
         rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
         if rdepends:
-- 
1.7.10



