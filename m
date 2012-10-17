Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOUi4-00024h-1A for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:35:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HELd5k006630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:21:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05962-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:21:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HELWPj006623
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:21:33 +0100
Message-ID: <1350483699.2185.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2012 15:21:39 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] autotools.bbclass: Fix gettext macro versions issues
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
X-List-Received-Date: Wed, 17 Oct 2012 14:35:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gettext m4 macros don't use the usual versioning/serial mechanism used by
aclocal. It therefore won't update them over and above any local version of
the macro. Equally, we don't run gettextize due to it doing slightly crazy
things to the build.

When we put the aclocal directory as a -I option to aclocal, if this was
found first compared to any recipe provided macros, the correct version
of the gettext macro would still "win". With the switch so correctly override
the system directory, older recipe provided macros may get used.

This patch manually removes the problematic m4 macros in the case we're using
gettext and need to use the correct m4 macros.

This patch also always ensures the gettext manipulations happen, even in the
-native case since missing or stale gettext files could cause build failures.

(From OE-Core rev: e9645d2bbeabaa5251d49edd659ab320fd66d0ee)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 7c99bbd..59c5bae 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -166,21 +166,24 @@ autotools_do_configure() {
 		else
 			CONFIGURE_AC=configure.ac
 		fi
-		if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
-			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-				if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
-					: do nothing -- we still have an old unmodified configure.ac
-		    		else
-					bbnote Executing glib-gettextize --force --copy
-					echo "no" | glib-gettextize --force --copy
-				fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-				# We'd call gettextize here if it wasn't so broken...
-					cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
-					if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
-						cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
-					fi
+		if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+				: do nothing -- we still have an old unmodified configure.ac
+	    		else
+				bbnote Executing glib-gettextize --force --copy
+				echo "no" | glib-gettextize --force --copy
+			fi
+		else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			# We'd call gettextize here if it wasn't so broken...
+				cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
+				if [ -d ${S}/po/ ]; then
+					cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
 				fi
+				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
+					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
+						rm $j
+					done
+				done
 			fi
 		fi
 		mkdir -p m4




