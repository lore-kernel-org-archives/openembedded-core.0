Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSDZa-0000Od-Av
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:28:50 +0200
Received: by mail-yx0-f175.google.com with SMTP id 11so172635yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=Iibp7bE6S4qbPvwe1EPon2M3hssY/ff8VXDVS/3jeO0=;
	b=cb7x4tgxqcHLAe573b3rXnVbuFAjn6WD9t6B+mCwSbAyp9DCkFqFPJo7qil37/xJ55
	RXhJ0FNadg8/u552iFDC1sSpUhSnreqQvgmsft1hv11F0+dhSxfI50rxABxiIKAGI7/9
	soGzlopKrar5ORU2R26sEcBH2uXsyRcobR7ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XrDnWPC1KZGFMq9GxYMjpDMI089dMRd0EUPZeth1n0jo4YM7BOfDc/wrGA3T/g/oly
	ned4ib5JBXqYkt8G9qoCf8clfwjkrcuGDnLVH/w5UiuFG1GR+UcpftPmx4LpeMR57fdO
	QaGVe6yY9v1gzU+QAN9nqDQHPfTKxPL7aDJ8M=
Received: by 10.150.199.19 with SMTP id w19mr1101029ybf.363.1307042740452;
	Thu, 02 Jun 2011 12:25:40 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o45sm689081yhk.63.2011.06.02.12.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:25:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 19:25:17 +0000
Message-Id: <36f8dc4d4c307c9fa9cd17e701045c33967c5abe.1307042670.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] package.bbclass: add support to split Qt translation files
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
X-List-Received-Date: Thu, 02 Jun 2011 19:28:50 -0000

There're many Qt applications that provide translation files in '.qm'
format however those weren't being splitted as GetText based
ones.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/package.bbclass |   41 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1e6a872..e4be20f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -343,6 +343,8 @@ python package_do_split_locales() {
 		bb.debug(1, "package requested not splitting locales")
 		return
 
+	import re
+
 	packages = (bb.data.getVar('PACKAGES', d, True) or "").split()
 
 	datadir = bb.data.getVar('datadir', d, True)
@@ -358,12 +360,29 @@ python package_do_split_locales() {
 
 	localedir = os.path.join(dvar + datadir, 'locale')
 
-	if not os.path.isdir(localedir):
+	locales = []
+	if os.path.isdir(localedir):
+		locales = os.listdir(localedir)
+
+	# Check of Qt translation files
+	qm_re = re.compile("(.*)\.qm$")
+	qm_files = {}
+	for root, dirs, files in os.walk(dvar):
+		for file in files:
+			qm_file = qm_re.match(file)
+			if qm_file:
+				locale = qm_file.group(1)
+				relpath = os.path.join(root, file).replace(dvar, '', 1)
+				if relpath:
+					if not qm_files.has_key(locale):
+						qm_files[locale] = []
+
+					qm_files[locale].append(relpath)
+
+	if len(locales) == 0 and len(qm_files) == 0:
 		bb.debug(1, "No locale files in this package")
 		return
 
-	locales = os.listdir(localedir)
-
 	# This is *really* broken
 	mainpkg = packages[0]
 	# At least try and patch it up I guess...
@@ -372,13 +391,27 @@ python package_do_split_locales() {
 	if mainpkg.find('-dev'):
 		mainpkg = mainpkg.replace('-dev', '')
 
+	# Queue Qt locales for spliting
+	for l in qm_files.keys():
+		if l not in locales:
+			locales.append(l)
+
+	# Split the locales into different packages
 	summary = bb.data.getVar('SUMMARY', d, True) or pn
 	description = bb.data.getVar('DESCRIPTION', d, True) or "" 
 	for l in locales:
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
+		files = []
+		files.append(os.path.join(datadir, 'locale', l))
+
+		if qm_files.has_key(l):
+			locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
+			ln = legitimize_package_name(locale_re.match(l).group(1))
+			files += qm_files[l]
+
+		bb.data.setVar('FILES_' + pkg, " ".join(files), d)
 		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)
-- 
1.7.2.5



