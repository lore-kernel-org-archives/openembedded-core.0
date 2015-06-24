Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07A5D75A20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QZq9004240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:27 -0700
Message-ID: <b4a32034694a5b16eedc790fa2c712b64da3f00b.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] cpan_build.bbclass: remove libmodule-build-perl
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:34 -0000
Content-Type: text/plain

There is no such a package in perl 5.22.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cpan_build.bbclass |   16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 2eb8162..4f648a6 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -10,22 +10,6 @@ export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
 export LD = "${CCLD}"
 
-#
-# We also need to have built libmodule-build-perl-native for
-# everything except libmodule-build-perl-native itself (which uses
-# this class, but uses itself as the provider of
-# libmodule-build-perl)
-#
-def cpan_build_dep_prepend(d):
-	if d.getVar('CPAN_BUILD_DEPS', True):
-		return ''
-	pn = d.getVar('PN', True)
-	if pn in ['libmodule-build-perl', 'libmodule-build-perl-native']:
-		return ''
-	return 'libmodule-build-perl-native '
-
-DEPENDS_prepend = "${@cpan_build_dep_prepend(d)}"
-
 cpan_build_do_configure () {
 	if [ "${@is_target(d)}" = "yes" ]; then
 		# build for target
-- 
1.7.9.5


