Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UZe7U-00070h-27
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:23:40 +0200
Received: by mail-we0-f173.google.com with SMTP id q54so220761wes.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=V+9+IXdTDU/c9EnhmJw9sYmFEYq7BOpbXSiDZS/zVp4=;
	b=JFHsuGXYRUfPq1d/hKdiwC4ee+S0I4b3IBtGsLzY2QA0zGVnUHZVsO9M/v85vEAyZA
	x+MGvYgn4B+n8Lf7SgXjNJOKm+FPES6SI1GLybmVIAG8mmEtRgYcgHIScFeV7hydkIo0
	AD2y1d86GjGoGLvM2qif+NaW92jTutznTmHDtFUgZfRxbeTkfR7hIaF3cOQAG+tLSYcC
	VwBuwr/CfxTA3Dbb3+KFsqgoNCe1W958SrnHLRy7cF+gD64wbrPkPvomewV3fT5GtaRc
	r88BT/VvE5WsNQ3yKXXWPNlJ3WLMzoWgmxmnHziIlnpE/Ur1N+mquB7ub+XE12ldkfEL
	dGxw==
X-Received: by 10.180.73.173 with SMTP id m13mr1668805wiv.27.1367917535446;
	Tue, 07 May 2013 02:05:35 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id dj7sm1407296wib.6.2013.05.07.02.05.33
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 02:05:34 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 10:05:22 +0100
Message-Id: <1367917522-29378-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
Subject: [PATCH] qt4: remove trailing slash from prefix
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
X-List-Received-Date: Tue, 07 May 2013 09:23:58 -0000

The trailing slashs on "Prefix=${prefix}/" and "-prefix ${prefix}/" are passed
through to the generated pkgconfig files and may be joined to paths like
"/include" yielding a final path with a double forward-slash (eg.
"/usr//include"). This may end up in the debugging symbols in other applications
or libraries which depend on qt4 which in turn causes the debugedit program to
fail with the message "canonicalization unexpectedly shrank by one character"
when it tries to replace the double forward-slash with a single forward-slash.
Thus the function split_and_strip_files fails and ultimately do_package fails.

As this slash is removed from the prefix it is added into the regular expression
used to fix up pkgconfig files later in the recipe.

This error was seen in vlc in meta-openembedded and should be solved by this
change in openembedded-core.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-qt/qt4/qt4.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 37fc1dd..84c0ae9 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -213,7 +213,7 @@ do_configure() {
 	cp -f ${WORKDIR}/linux.conf mkspecs/common/
 
 	echo "[Paths]"                                 > $QT_CONF_PATH
-	echo "Prefix=${prefix}/"                      >> $QT_CONF_PATH
+	echo "Prefix=${prefix}"                       >> $QT_CONF_PATH
 	echo "Documentation=${docdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
 	echo "Headers=${includedir}/${QT_DIR_NAME}"   >> $QT_CONF_PATH
 	echo "Libraries=${libdir}"                    >> $QT_CONF_PATH
@@ -229,7 +229,7 @@ do_configure() {
 	${EXTRA_QMAKE_MUNGE}|| true
 
 	echo yes | QT_LICENSE_FILE="${QT_LICENSE_FILE}" ./configure -v \
-			-prefix ${prefix}/ \
+			-prefix ${prefix} \
 			-bindir ${bindir} \
 			-libdir ${libdir} \
 			-datadir ${datadir}/${QT_DIR_NAME} \
@@ -358,7 +358,7 @@ do_install() {
 
 	# QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
 	for pc in ${D}${libdir}/pkgconfig/*.pc ; do
-		sed -i -e "s:prefix}include/${QT_DIR_NAME}/$(basename $pc .pc):prefix}/include:" \
+		sed -i -e "s:prefix}/include/${QT_DIR_NAME}/$(basename $pc .pc):prefix}/include:" \
 				-e 's:IP{:I${:g' $pc
 	done
 
-- 
1.8.2.2



