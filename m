Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSGnx-0003X2-Lt
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:00:25 +0200
Received: by yhjj56 with SMTP id j56so986171yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=qXPFh7fPQyY/pbgg2N3Ry07LSGu3HPCYtp7Qec+eGmA=;
	b=1FRtZifiryyP2yEMi/StBveLJap8R481qsjaS9aobtPMb/uR5OZrE1H7Dz45QNNSH2
	+XBOR7UkOAPWvEb15CdKIHDitFJ3fkCbqK5vpaiNpwU7irw9wzyMp5kgQTnWxtLTiJUd
	auczquH3nErX+cU/FUJ5c/NAwaI3W2Xa4GBbB/PMCSkcui1Segfwme11wFbw19uDonik
	KYSLcEAATntpd5sgx52p4vfLretQJIK6jAXgYx6505bHz1w6fdIhCLt/mQj6/boKnHR7
	Pw5Ll8/KcEBU7zgIW4ePaT0prqFdMXyj7Je6CQrBxA8RYrLYScTEOjTaQjG2vplbQRNU
	PZFQ==
MIME-Version: 1.0
Received: by 10.50.104.133 with SMTP id ge5mr1153532igb.21.1336607431562; Wed,
	09 May 2012 16:50:31 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 16:50:31 -0700 (PDT)
Date: Thu, 10 May 2012 02:50:31 +0300
Message-ID: <CAF6bG8eVQcJHEH8RHsAGV2CP6ZjH1+sZUyvBTFLvB6cv--ZUhw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] package_deb.bbclass: don't handle advanced dependency marker
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
X-List-Received-Date: Thu, 10 May 2012 00:00:25 -0000
Content-Type: text/plain; charset=UTF-8

From: Marko Lindqvist <cazfi74@gmail.com>
Date: Thu, 10 May 2012 02:41:06 +0300
Subject: [PATCH] package_deb.bbclass: don't handle advanced dependency marker
 as version number

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
+        # Remove markers from string so they won't get handled as
version numbers
+        depstr = localdata.getVar(varname, True) or ""
+        start = depstr.find("(")
+        while start != -1:
+            # We are not searching ")" from full string in case it's
malformed in a way
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
         rsuggests =
bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or
"")
-        rprovides =
bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or
"")
+        rprovides = deb_explode_dep_ver("RPROVIDES")
         rreplaces =
bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or
"")
         rconflicts =
bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or
"")
         if rdepends:
-- 
1.7.10


