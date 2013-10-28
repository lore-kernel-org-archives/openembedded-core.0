Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 382626D1A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:47:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 13:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,588,1378882800"; d="scan'208";a="424167992"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2013 13:46:25 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 22:46:20 +0200
Message-Id: <9099fdcdc1f68910f4e8af56aec77a91e0b538f3.1382992874.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382992874.git.laurentiu.palcu@intel.com>
References: <cover.1382992874.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382992874.git.laurentiu.palcu@intel.com>
References: <cover.1382992874.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/2] nativesdk-qt4-tools: create qt.conf file
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
X-List-Received-Date: Mon, 28 Oct 2013 20:47:10 -0000

When installing the SDK to another location than the default one, qmake
will look for libraries, headers, etc. in the default location. That's
because the paths are hard-coded in the binary itself. Luckily, QT
allows to override this using a qt.conf file installed in the same
directory with the application executable. However, we already have a
patch that allows for the installation of qt.conf in another place and
read the location from QT_CONF_PATH environment variable.

Hence, install qt.conf in ${sysconfdir}. This will allow other apps, that
use QLibraryInfo class, to find it.

[YOCTO #5339]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index a9ec61e..2c806e0 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -118,4 +118,10 @@ do_install() {
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do \
         ln -s ${i}4 ${i}; \
     done)
+
+    install -d ${D}${sysconfdir}
+    cat >${D}${sysconfdir}/qt.conf <<EOF
+[Paths]
+Prefix = ${prefix}
+EOF
 }
-- 
1.7.9.5


