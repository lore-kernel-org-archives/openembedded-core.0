Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SYiJr-0000rR-1K
	for openembedded-core@lists.openembedded.org;
	Sun, 27 May 2012 20:35:59 +0200
Received: by wibhn14 with SMTP id hn14so879409wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 May 2012 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=SLX06cG7m5mMWfabv1vH6NtyVTKEU6OJWi+92fvet6k=;
	b=sZDXD3WZAeBxWBbIMIqZ+lX62D7ZwuKHi9UBwnXyxVr93Z9arrTp7jbQWQ583bqhZw
	itJ8m5xoGC24Qy8IUs0FSP7/2Vx6rId/HlXxYyaNcLGVqOJUFLiERaXfeRjLRmMsvjdb
	nGQZLolqBcS3BMadExEjmVFS0jQ303MpjhvgSoFCVyOvEphly0N70lQYxtLJaXW2erRf
	V+GXkpRqM3c8mE+fa6dTXko4XiWveVDFjqwQbZDgp/MJMTI76U1iilyOrEbszFu5Mwql
	F3DweLE8Qoenb22N511NtbY8GCURyp/dM1z3mrDxvU2hVpt/cGyXVEaFIEcPQy2JvQUY
	KyXg==
Received: by 10.180.74.193 with SMTP id w1mr10201563wiv.4.1338143143922;
	Sun, 27 May 2012 11:25:43 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2352.dip.t-dialin.net.
	[91.10.35.82])
	by mx.google.com with ESMTPS id gc6sm13680379wib.0.2012.05.27.11.25.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 May 2012 11:25:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 May 2012 20:29:42 +0200
Message-Id: <1338143382-5982-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] buildhistory.bbclass: add pkg_pre/postinst/rm contents
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
X-List-Received-Date: Sun, 27 May 2012 18:35:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A use-case would have been [1].

The following tests were performed:
* image from scratch with old buildhistory contents
* image from scratch with buildhistory contents from scratch
* decrement a PR for a test recipe and check if the message
  'ERROR: Package version for xy went backwards' is displayed.

[1] http://patches.openembedded.org/patch/28841/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/buildhistory.bbclass |   80 +++++++++++++++++++++++--------------
 1 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d2d19ff..9c49bab 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -57,6 +57,10 @@ python buildhistory_emit_pkghistory() {
 			self.rrecommends = ""
 			self.files = ""
 			self.filelist = ""
+			self.preinst = ""
+			self.postinst = ""
+			self.prerm = ""
+			self.postrm = ""
 
 	# Should check PACKAGES here to see if anything removed
 
@@ -74,18 +78,19 @@ python buildhistory_emit_pkghistory() {
 		try:
 			for line in f:
 				lns = line.split('=')
-				name = lns[0].strip()
-				value = lns[1].strip(" \t\r\n").strip('"')
-				if name == "PE":
-					rcpinfo.pe = value
-				elif name == "PV":
-					rcpinfo.pv = value
-				elif name == "PR":
-					rcpinfo.pr = value
-				elif name == "DEPENDS":
-					rcpinfo.depends = value
-				elif name == "PACKAGES":
-					rcpinfo.packages = value
+				if len(lns)==2:
+					name = lns[0].strip()
+					value = lns[1].strip(" \t\r\n").strip('"')
+					if name == "PE":
+						rcpinfo.pe = value
+					elif name == "PV":
+						rcpinfo.pv = value
+					elif name == "PR":
+						rcpinfo.pr = value
+					elif name == "DEPENDS":
+						rcpinfo.depends = value
+					elif name == "PACKAGES":
+						rcpinfo.packages = value
 		finally:
 			f.close()
 		return rcpinfo
@@ -96,24 +101,25 @@ python buildhistory_emit_pkghistory() {
 		try:
 			for line in f:
 				lns = line.split('=')
-				name = lns[0].strip()
-				value = lns[1].strip(" \t\r\n").strip('"')
-				if name == "PE":
-					pkginfo.pe = value
-				elif name == "PV":
-					pkginfo.pv = value
-				elif name == "PR":
-					pkginfo.pr = value
-				elif name == "RDEPENDS":
-					pkginfo.rdepends = value
-				elif name == "RRECOMMENDS":
-					pkginfo.rrecommends = value
-				elif name == "PKGSIZE":
-					pkginfo.size = long(value)
-				elif name == "FILES":
-					pkginfo.files = value
-				elif name == "FILELIST":
-					pkginfo.filelist = value
+				if len(lns)==2:
+					name = lns[0].strip()
+					value = lns[1].strip(" \t\r\n").strip('"')
+					if name == "PE":
+						pkginfo.pe = value
+					elif name == "PV":
+						pkginfo.pv = value
+					elif name == "PR":
+						pkginfo.pr = value
+					elif name == "RDEPENDS":
+						pkginfo.rdepends = value
+					elif name == "RRECOMMENDS":
+						pkginfo.rrecommends = value
+					elif name == "PKGSIZE":
+						pkginfo.size = long(value)
+					elif name == "FILES":
+						pkginfo.files = value
+					elif name == "FILELIST":
+						pkginfo.filelist = value
 		finally:
 			f.close()
 		return pkginfo
@@ -198,6 +204,12 @@ python buildhistory_emit_pkghistory() {
 		filelist.sort()
 		pkginfo.filelist = " ".join(filelist)
 
+		# pre/postinst/rm
+		pkginfo.preinst = getpkgvar(pkg, 'pkg_preinst') or ""
+		pkginfo.postinst = getpkgvar(pkg, 'pkg_postinst') or ""
+		pkginfo.prerm = getpkgvar(pkg, 'pkg_prerm') or ""
+		pkginfo.postrm = getpkgvar(pkg, 'pkg_postrm') or ""
+
 		write_pkghistory(pkginfo, d)
 
 		write_latestlink(pkg, pe, pv, pr, d)
@@ -246,6 +258,14 @@ def write_pkghistory(pkginfo, d):
 		f.write("PKGSIZE = %d\n" %  pkginfo.size)
 		f.write("FILES = %s\n" %  pkginfo.files)
 		f.write("FILELIST = %s\n" %  pkginfo.filelist)
+		if pkginfo.preinst != "":
+			f.write("\npkg_preinst=\n%s\n" %  pkginfo.preinst)
+		if pkginfo.postinst != "":
+			f.write("\npkg_postinst=\n%s\n" %  pkginfo.postinst)
+		if pkginfo.prerm != "":
+			f.write("\npkg_prerm=\n%s\n" %  pkginfo.prerm)
+		if pkginfo.postrm != "":
+			f.write("\npkg_postrm=\n%s\n" %  pkginfo.postrm)
 	finally:
 		f.close()
 
-- 
1.7.4.4



