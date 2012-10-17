Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOUhW-00021p-0j for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:34:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEL756006620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:21:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05807-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:21:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HEKvGZ006613
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:20:58 +0100
Message-ID: <1350483665.2185.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2012 15:21:05 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] autotools: Fix race over aclocal macro directory
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
X-List-Received-Date: Wed, 17 Oct 2012 14:34:26 -0000
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
date we could look into potentially optimsing this.

[YOCTO #3216]

(From OE-Core rev: ad29b331e0d61708e68ef772cdb19154956fa67e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..7c99bbd 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -127,10 +127,11 @@ autotools_do_configure() {
 		cd ${S}
 		# Remove any previous copy of the m4 macros
 		rm -rf ${B}/aclocal-copy/
+		ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
 			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+				grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
 				acpaths="$acpaths -I $i"
 			done
 		else
@@ -140,16 +141,19 @@ autotools_do_configure() {
 		automake --version
 		echo "AUTOV is $AUTOV"
 		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
-			acpaths="$acpaths -I${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV"
+			ACLOCAL="$ACLOCAL --automake-acdir=${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV"
 		fi
 		# The aclocal directory could get modified by other processes 
 		# uninstalling data from the sysroot. See Yocto #861 for details.
 		# We avoid this by taking a copy here and then files cannot disappear.
-		if [ -d ${STAGING_DATADIR}/aclocal ]; then
-			# for scratch build this directory can be empty
-			# so avoid cp's no files to copy error
-			cp-noerror ${STAGING_DATADIR}/aclocal ${B}/aclocal-copy/
-			acpaths="$acpaths -I ${B}/aclocal-copy/"
+		# We copy native first, then target. This avoids certain races since cp-noerror
+		# won't overwrite existing files.
+		mkdir -p ${B}/aclocal-copy/
+		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
+			cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${B}/aclocal-copy/
+		fi
+		if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/aclocal" != "${STAGING_DATADIR}/aclocal" ]; then
+			cp-noerror ${STAGING_DATADIR}/aclocal/ ${B}/aclocal-copy/
 		fi
 		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 		# like it was auto-generated.  Work around this by blowing it away
@@ -184,8 +188,8 @@ autotools_do_configure() {
 			bbnote Executing intltoolize --copy --force --automake
 			intltoolize --copy --force --automake
 		fi
-		bbnote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-		autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
 		cd $olddir
 	fi
 	if [ -e ${S}/configure ]; then




