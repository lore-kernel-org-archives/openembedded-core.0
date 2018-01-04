Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76A0278694
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:12:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 05:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8439254"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 Jan 2018 05:12:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 15:12:31 +0200
Message-Id: <20180104131238.21452-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Thu, 04 Jan 2018 13:12:41 -0000

gnomebase.bbclass hardcodes the autotools inherit, so make it
configurable and set appropriately from both classes.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gnomebase-meson.bbclass | 2 ++
 meta/classes/gnomebase.bbclass       | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/gnomebase-meson.bbclass

diff --git a/meta/classes/gnomebase-meson.bbclass b/meta/classes/gnomebase-meson.bbclass
new file mode 100644
index 00000000000..92e2e3f3b18
--- /dev/null
+++ b/meta/classes/gnomebase-meson.bbclass
@@ -0,0 +1,2 @@
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 4ccc8e07814..efcb6caae15 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -20,7 +20,8 @@ FILES_${PN} += "${datadir}/application-registry  \
 
 FILES_${PN}-doc += "${datadir}/devhelp"
 
-inherit autotools pkgconfig
+GNOMEBASEBUILDCLASS ??= "autotools"
+inherit ${GNOMEBASEBUILDCLASS} pkgconfig
 
 do_install_append() {
 	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
-- 
2.15.1


