Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TukHv-0006dy-KJ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 14:41:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Jan 2013 05:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="190871330"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jan 2013 05:25:55 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 15:29:09 +0200
Message-Id: <1358170149-27579-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oprofile: set correct kernel path
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
X-List-Received-Date: Mon, 14 Jan 2013 13:41:35 -0000
X-List-Received-Date: Mon, 14 Jan 2013 13:41:35 -0000

oprofile's "configure" was always looking at the configuration of the host
kernel, not the target kernel. This patch instructs oprofile to use the
target kernel to configure itself.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 9bbd2ef..d6d20ae 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,7 +19,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
@@ -28,7 +28,7 @@ SRC_URI = "file://opstart.patch \
 
 inherit autotools
 
-EXTRA_OECONF = "--with-kernel-support --without-x"
+EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
 	find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
 	cp ${WORKDIR}/acinclude.m4 ${S}/
-- 
1.7.10.4



