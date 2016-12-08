Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0005671C70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:22 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 74D73B8AB93; Thu,  8 Dec 2016 22:48:01 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:54 +0100
Message-Id: <1481233677-27298-31-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 30/33] dpkg: use correct path for perl libraries
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:23 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 40cfc45..1d55837 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,21 +1,19 @@
 SUMMARY = "Package maintenance system from Debian"
 SECTION = "base"
 LICENSE = "GPLv2+"
-DEPENDS = "perl"
 DEPENDS_append_class-native = " bzip2-replacement-native"
 PROVIDES = "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
-inherit autotools gettext perlnative pkgconfig systemd
+inherit autotools cpan-base gettext perlnative pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "dpkg-configure.service"
 
 export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
-export PERL_LIBDIR = "${libdir}/perl"
-PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
+export PERL_LIBDIR = "${PERLLIBDIRS}/${PERLVERSION}"
 
 UA = "update-alternatives"
 UA_native = "${@['', 'update-alternatives'][d.getVar('PREFERRED_PROVIDER_virtual/update-alternatives-native', True) == 'dpkg-native']}"
-- 
2.7.4


