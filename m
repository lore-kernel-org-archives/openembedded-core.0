Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3TM-0001a0-Hj
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 13:23:21 +0200
Received: by bkcjm2 with SMTP id jm2so722170bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 04:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4VN653ibOeBIzp0aJPWbdhJe7MHzasWeGJ2Xks1c5LM=;
	b=WhqN9ld2NtqqZ/wDC/KjgO2EFjDUmsAkhyX6W55mICt70lGkgKbX57F9Qr1Wb3Dd5C
	ua8JmICYf168s+l6pmPmSJuplHE0nYljC7zzVkgzXKBhImNt1eI5Okdi0Qz4WnBq/31x
	3sAiPguCLvpdbbMiupF8EPcXe20wvC3Wux2rJnKxE+aB7YxqDw12UgbSeyTK3+29CTxG
	b9owS70as6cXVaC9o6X2k+RtKZ+lpFdLqbBOxGc5wBoQc/x/Zjhh1qmlac7hxhOJ7SNC
	cbsXiLDArQeiYVIN99UmDz5qWsSNGYdKWpedeD9Zt+YRd2YK1xBjfEv5JGX7jDY7k+5O
	bgUA==
Received: by 10.205.134.6 with SMTP id ia6mr11720035bkc.51.1338462780988;
	Thu, 31 May 2012 04:13:00 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id gm18sm2835908bkc.7.2012.05.31.04.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 04:13:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2012 13:12:45 +0200
Message-Id: <1338462765-18412-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2 2/2] buildhistory.bbclass: add pkg_pre/postinst/rm contents
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
X-List-Received-Date: Thu, 31 May 2012 11:23:21 -0000
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
1.7.6.5



