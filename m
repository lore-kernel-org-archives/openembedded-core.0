Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ST9RH-0006Vy-0F for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 12:20:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4CAAiWr032549
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 11:10:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18550-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 11:10:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4CAAXRv032543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 11:10:34 +0100
Message-ID: <1336817433.2494.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 May 2012 11:10:33 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Drop dubious use of packages[0] from do_split_packages and do_split_locales
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
X-List-Received-Date: Sat, 12 May 2012 10:20:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As the comment says, using packages[0] is rather broken and can be incorrect,
as demonstrated by the recent gdk-pixbuf change. Replacing it with PN is
a bit more correct and more likely to do what was originally intended
by this function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3d0f406..99836e9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -107,14 +107,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 					objs.append(relpath)
 
 	if extra_depends == None:
-		# This is *really* broken
-		mainpkg = packages[0]
-		# At least try and patch it up I guess...
-		if mainpkg.find('-dbg'):
-			mainpkg = mainpkg.replace('-dbg', '')
-		if mainpkg.find('-dev'):
-			mainpkg = mainpkg.replace('-dev', '')
-		extra_depends = mainpkg
+		extra_depends = d.getVar("PN", True)
 
 	for o in sorted(objs):
 		import re, stat
@@ -404,14 +397,6 @@ python package_do_split_locales() {
 
 	locales = os.listdir(localedir)
 
-	# This is *really* broken
-	mainpkg = packages[0]
-	# At least try and patch it up I guess...
-	if mainpkg.find('-dbg'):
-		mainpkg = mainpkg.replace('-dbg', '')
-	if mainpkg.find('-dev'):
-		mainpkg = mainpkg.replace('-dev', '')
-
 	summary = d.getVar('SUMMARY', True) or pn
 	description = d.getVar('DESCRIPTION', True) or "" 
         locale_section = d.getVar('LOCALE_SECTION', True)
@@ -420,7 +405,7 @@ python package_do_split_locales() {
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
 		d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-		d.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln))
+		d.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (pn, ln))
 		d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))
 		d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
 		d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
@@ -435,9 +420,9 @@ python package_do_split_locales() {
 	# glibc-localedata-translit* won't install as a dependency
 	# for some other package which breaks meta-toolchain
 	# Probably breaks since virtual-locale- isn't provided anywhere
-	#rdep = (d.getVar('RDEPENDS_%s' % mainpkg, True) or d.getVar('RDEPENDS', True) or "").split()
+	#rdep = (d.getVar('RDEPENDS_%s' % pn, True) or d.getVar('RDEPENDS', True) or "").split()
 	#rdep.append('%s-locale*' % pn)
-	#d.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep))
+	#d.setVar('RDEPENDS_%s' % pn, ' '.join(rdep))
 }
 
 python perform_packagecopy () {




