Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SxDJu-0000Yz-JR
	for Openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 10:33:18 +0200
Received: from puchatek.dom (87-206-60-144.dynamic.chello.pl [87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 28492D2214;
	Fri,  3 Aug 2012 10:21:44 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 10:21:30 +0200
Message-Id: <1343982090-22181-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpam: disable NIS to not link with libtirpc when it is available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 08:33:18 -0000

I was checking ways to make incremental builds faster so I started using
sstate-cache and SSTATE_MIRRORS. But this gave me some nasty bug:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for php-cgi:
|  *    libtirpc1 (>= 0.2.2) *
|  * opkg_install_cmd: Cannot install package php-cgi.

I checked details:

In my previous build libtirpc got built before libpam so libpam found it
and linked. As a result packages depend on libtirpc1 but as there is no
such build dependency sstate handling code did not used libtirpc copy...

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/pam/libpam_1.1.5.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index dd75d42..4e79aa6 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
@@ -28,6 +28,7 @@ DEPENDS = "bison flex flex-native cracklib"
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
                 --libdir=${base_libdir} \
+                --disable-nis \
                 --disable-regenerate-docu"
 
 CFLAGS_append = " -fPIC "
-- 
1.7.10.4



