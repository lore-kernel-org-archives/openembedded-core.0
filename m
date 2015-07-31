Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB4E97653C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 19:00:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 31 Jul 2015 12:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,586,1432623600"; d="scan'208";a="759398931"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2015 12:00:12 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 18:59:37 +0000
Message-Id: <8d573523874b6436f4cea1d5998bce4d07adef03.1438369127.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1438369127.git.alejandro.hernandez@linux.intel.com>
References: <cover.1438369127.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] opkg: solve inconsistency of using different lists directories
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
X-List-Received-Date: Fri, 31 Jul 2015 19:00:12 -0000

Default behavior of opkg was to use ${OPKGLIBDIR}/opkg/lists;
but in our recipe we modify it to ${OPKGLIBDIR}/opkg/${OPKGLIBDIR}/opkg/,
when appending package-management to IMAGE_FEATURES these lists are
populated during build time (using the default directory),
but since our config was different these populated lists were never used at runtime,
this patch solves this inconsistency by using default behavior for both build time and runtime.

[YOCTO #6966]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 56df920..b7574e5 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -45,7 +45,7 @@ EXTRA_OECONF = "\
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/opkg/opkg.conf
 
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
-- 
1.8.4.5


