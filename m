Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D18BC784DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:43:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FLhbYY026972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 15 Aug 2017 14:43:37 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:43:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:41:53 -0500
Message-ID: <1502833317-48183-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 2/6 v2] git: Do not install git cvsserver and git svn by default
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
X-List-Received-Date: Tue, 15 Aug 2017 21:43:40 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <pkj@axis.com>

These git commands require Perl modules that do not exist in OE-Core.
Add PACKAGECONFIGs to enable them. Be aware though that if you enable
them you must also provide the missing dependencies.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/git/git.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4390b8d..9b4c128 100644
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
1.8.3.1


