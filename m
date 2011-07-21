Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8Z-0001FT-PL
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787067"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:52:57 -0700
Message-Id: <a0756560075e954afd43c6b1fb1ecdb68e35ee56.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/20] eglibc-package: don't fail without localedef/gconv
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:45 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* in some cases we don't have localedef/gconv built
  ie when DISTRO_FEATURES lacks one of libc-charsets, libc-locales, libc-locale-code
  then is better ignore localedef/gconv instead of do_install_locale
  failing like in this bugreport:
  http://bugzilla.yoctoproject.org/show_bug.cgi?id=1209

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index faf68f7..9e71150 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -98,8 +98,12 @@ do_install_locale () {
 	if [ "${base_libdir}" != "${libdir}" ]; then
 		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
 	fi
-	mv ${D}${bindir}/localedef ${dest}${bindir}
-	mv ${D}${libdir}/gconv ${dest}${libdir}
+	if [ -f ${D}${bindir}/localedef ]; then
+		mv -f ${D}${bindir}/localedef ${dest}${bindir}
+	fi
+	if [ -f ${D}${libdir}/gconv ]; then
+		mv -f ${D}${libdir}/gconv ${dest}${libdir}
+	fi
 	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
         mv ${D}${datadir}/i18n ${dest}${datadir}
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
-- 
1.7.3.4



