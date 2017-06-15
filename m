Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 43E6F783C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CC9CC2E1A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R-vog7KvNPez
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:16 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 267F92E21D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB101A07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E19D21A075
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id D62DFDDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FDrFVA010393
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FDrFhg010392
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 15:53:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:53:09 +0200
Message-Id: <c889d79e52d9a86ad4c7a5de5555aa4e49e0610d.1497534748.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497534748.git.pkj@axis.com>
References: <cover.1497534748.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 07/11] git: Do not install git cvsserver and git svn
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
X-List-Received-Date: Thu, 15 Jun 2017 13:53:19 -0000

These git commands require Perl modules that do not exist in OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/git/git.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9b0d328bad..3ce4642ae7 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -54,6 +54,17 @@ perl_native_fixup () {
 	mkdir -p ${D}${libdir}
 	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
 	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
+
+	# Remove git cvsserver as it requires the DBI Perl module, which does
+	# not exist in OE-Core.
+	rm ${D}${libexecdir}/git-core/git-cvsserver \
+	   ${D}${bindir}/git-cvsserver
+
+	# Remove git svn and all Git::SVN Perl modules as they require the
+	# SVN::Core Perl module, which does not exist in OE-Core.
+	rm -r ${D}${libexecdir}/git-core/git-svn \
+	      ${D}${libdir}/perl/site_perl/*/Git/SVN*
+	sed -i -e '/SVN/d' ${D}${libdir}/perl/site_perl/*/auto/Git/.packlist
 }
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
@@ -83,12 +94,9 @@ PERLTOOLS = " \
     ${libexecdir}/git-core/git-archimport \
     ${libexecdir}/git-core/git-cvsexportcommit \
     ${libexecdir}/git-core/git-cvsimport \
-    ${libexecdir}/git-core/git-cvsserver \
-    ${bindir}/git-cvsserver \
     ${libexecdir}/git-core/git-difftool \
     ${libexecdir}/git-core/git-relink \
     ${libexecdir}/git-core/git-send-email \
-    ${libexecdir}/git-core/git-svn \
     ${libexecdir}/git-core/git-instaweb \
     ${libexecdir}/git-core/git-submodule \
     ${libexecdir}/git-core/git-am \
-- 
2.12.0


