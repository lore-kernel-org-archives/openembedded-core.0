Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6A9873174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498038"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:03 +0300
Message-Id: <b38a7cd2db7b423bb1a0696881c52e6c1f631fad.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/45] neard: do not package python test scripts
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
X-List-Received-Date: Tue, 24 May 2016 11:53:55 -0000

They require python-dbus and python-gobject
(which are only provided for Python 3), and have not
been ported to Python 3.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/neard/neard_0.15.bb | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index 93bddb3..065cbec 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -33,18 +33,9 @@ do_install_append() {
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
-
-	# Install the tests for neard-tests
-	install -d ${D}${libdir}/neard
-	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
-	install -m 0755 ${B}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
 }
 
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-
-RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
+RDEPENDS_${PN} = "dbus"
 
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS_${PN} = "\
@@ -52,8 +43,6 @@ RRECOMMENDS_${PN} = "\
                      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
                     "
 
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
-
 INITSCRIPT_NAME = "neard"
 INITSCRIPT_PARAMS = "defaults 64"
 
-- 
2.8.1


