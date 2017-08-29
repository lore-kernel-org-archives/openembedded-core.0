Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1AADB78307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4EC982E306;
	Tue, 29 Aug 2017 23:21:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LLi26p6mnpAB; Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 7DD462E364;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 533511E09A;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 470D41E094;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3B5F42198;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLgMp030258;
	Tue, 29 Aug 2017 23:21:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLg4v030257;
	Tue, 29 Aug 2017 23:21:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:14 +0200
Message-Id: <bf87c09fc1b5aeee7759f3978a766c045d96770f.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 18/25] git: Do not install git cvsserver and git svn by default
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:53 -0000

These git commands require Perl modules that do not exist in OE-Core.
Add PACKAGECONFIGs to enable them. Be aware though that if you enable
them you must also provide the missing dependencies.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/git.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9b0d328bad..5c12ca8d4c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,6 +13,10 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cvsserver] = ""
+PACKAGECONFIG[svn] = ""
+
 EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
 "
@@ -54,6 +58,23 @@ perl_native_fixup () {
 	mkdir -p ${D}${libdir}
 	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
 	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
+
+	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'cvsserver', d)}" ]; then
+		# Only install the git cvsserver command if explicitly requested
+		# as it requires the DBI Perl module, which does not exist in
+		# OE-Core.
+		rm ${D}${libexecdir}/git-core/git-cvsserver \
+		   ${D}${bindir}/git-cvsserver
+	fi
+
+	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'svn', d)}" ]; then
+		# Only install the git svn command and all Git::SVN Perl modules
+		# if explicitly requested as they require the SVN::Core Perl
+		# module, which does not exist in OE-Core.
+		rm -r ${D}${libexecdir}/git-core/git-svn \
+		      ${D}${libdir}/perl/site_perl/*/Git/SVN*
+		sed -i -e '/SVN/d' ${D}${libdir}/perl/site_perl/*/auto/Git/.packlist
+	fi
 }
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
-- 
2.12.0


