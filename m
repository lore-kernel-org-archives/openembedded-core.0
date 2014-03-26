Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 67D886BFF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:29:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QMTV11007993 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:29:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u8aaJrHxvWyb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:29:31 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QMTQ5S007984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:29:28 GMT
Message-ID: <1395872960.24890.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 22:29:20 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] git: Fix perl paths in scripts and population of the perltools package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 22:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

References to "perl-native" were slipping into the target packages. These
changes ensure those references are cleaned up and that tools using perl
are packaged in the correct perltools package. The same issues affected
the nativesdk-git output so are also applied there.

[YOCTO #5918]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 5d02343..f5013f1 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -34,12 +34,24 @@ do_install () {
 	rmdir ${D}${exec_prefix}/lib || true
 }
 
+PERLSEDFIXUP = " \
+	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
+	       -e 's#${libdir}/perl-native/#${libdir}/#' \
+	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')} \
+"
+
+do_install_append_class-target () {
+	${PERLSEDFIXUP}
+}
+
+do_install_append_class-nativesdk () {
+	${PERLSEDFIXUP}
+}
+
 FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
-# Git tools requiring perl
-PACKAGES =+ "${PN}-perltools"
-FILES_${PN}-perltools += " \
+PERLTOOLS = " \
     ${libexecdir}/git-core/git-add--interactive \
     ${libexecdir}/git-core/git-archimport \
     ${libexecdir}/git-core/git-cvsexportcommit \
@@ -50,6 +62,19 @@ FILES_${PN}-perltools += " \
     ${libexecdir}/git-core/git-relink \
     ${libexecdir}/git-core/git-send-email \
     ${libexecdir}/git-core/git-svn \
+    ${libexecdir}/git-core/git-instaweb \
+    ${libexecdir}/git-core/git-submodule \
+    ${libexecdir}/git-core/git-am \
+    ${libexecdir}/git-core/git-request-pull \
+    ${datadir}/gitweb/gitweb.cgi \
+    ${datadir}/git-core/templates/hooks/prepare-commit-msg.sample \
+    ${datadir}/git-core/templates/hooks/pre-rebase.sample \
+"
+
+# Git tools requiring perl
+PACKAGES =+ "${PN}-perltools"
+FILES_${PN}-perltools += " \
+    ${PERLTOOLS} \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"



