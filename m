Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TK9oJ-0002QI-W5 for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 17:27:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95FETPa017999
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 16:14:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17316-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 16:14:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95FEKLJ017993
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 16:14:20 +0100
Message-ID: <1349450064.15658.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Oct 2012 16:14:24 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [RFC PATCH] autotools: Fix race over aclocal macro directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 15:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The previous steps taken to address races over the aclocal macro directory and the removal
of files hasn't been sufficient since aclocal still looks at that directory as part of its
default search path. This patch passes the aclocal-copy directory into aclocal as its system
directory, removing any chance of it accessing the original aclocal directory.

Hopefully this should therefore fix the race issues once and for all.

In order to do this, cp-noerror needs to not error if the directory already exists.

Its also been noticed that aclocal defaults to using STAGING_DATADIR_NATIVE even when
building for the target. Only using the target directory would cause errors such as
missing pkgconfig macros (since we only depend on pkgconfig-native, not pkgconfig).
This patch processes both sets of macros maintaining existing behaviour. At a future
date we could look into potentially optimising this.

[YOCTO #3216]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..23058be 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -127,6 +127,7 @@ autotools_do_configure() {
 		cd ${S}
 		# Remove any previous copy of the m4 macros
 		rm -rf ${B}/aclocal-copy/
+		ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
 			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
@@ -145,11 +146,16 @@ autotools_do_configure() {
 		# The aclocal directory could get modified by other processes 
 		# uninstalling data from the sysroot. See Yocto #861 for details.
 		# We avoid this by taking a copy here and then files cannot disappear.
+		mkdir -p ${B}/aclocal-copy/
 		if [ -d ${STAGING_DATADIR}/aclocal ]; then
 			# for scratch build this directory can be empty
 			# so avoid cp's no files to copy error
-			cp-noerror ${STAGING_DATADIR}/aclocal ${B}/aclocal-copy/
-			acpaths="$acpaths -I ${B}/aclocal-copy/"
+			cp-noerror ${STAGING_DATADIR}/aclocal/ ${B}/aclocal-copy/
+		fi
+		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
+			# for scratch build this directory can be empty
+			# so avoid cp's no files to copy error
+			cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${B}/aclocal-copy/
 		fi
 		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 		# like it was auto-generated.  Work around this by blowing it away
@@ -185,7 +191,7 @@ autotools_do_configure() {
 			intltoolize --copy --force --automake
 		fi
 		bbnote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-		autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
 		cd $olddir
 	fi
 	if [ -e ${S}/configure ]; then




