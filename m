Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T7MCY-0003Px-8l for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 10:03:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7UNaab2005870
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 00:36:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05116-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 00:36:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7UNaOxm005864
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 00:36:27 +0100
Message-ID: <1346369784.16485.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 16:36:24 -0700
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: perl: Fix various nativesdk build issues
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
X-List-Received-Date: Fri, 31 Aug 2012 08:03:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The config.sh lists -fstack-protector but this isn't in LDFLAGS. This
can result in perl compilation failures due to the mismatch. Adding the
flag to LDFLAGS solves makes all the flags consistent and avoids build
failures from missing symbols.

It was also found that the path substitutions made by the sed statement
can conflict with each other and you can end up with $prefix$prefix type
expressions in config.sh-X which can break the build in unusual ways.
This patch anchors the expressions to ensure only true matches are
replaced.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 9db3805..8e7ab9e 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -90,6 +90,8 @@ export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
 # LDFLAGS for shared libraries
 export LDDLFLAGS = "${LDFLAGS} -shared"
 
+LDFLAGS_append = " -fstack-protector"
+
 # We're almost Debian, aren't we?
 CFLAGS += "-DDEBIAN"
 
@@ -148,10 +150,10 @@ do_configure() {
                -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
-               -e "s%/usr/include%${STAGING_INCDIR}%g" \
-	       -e 's,/usr/lib/,${libdir}/,g' \
-	       -e 's,/usr/,${exec_prefix}/,g' \
-	       -e 's,/perl5,/perl,g' \
+               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
+	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
+	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
+	       -e "s%/perl5%/perl%g" \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in




