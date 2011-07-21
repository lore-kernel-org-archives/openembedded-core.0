Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8X-0001FT-S2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787058"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:52:54 -0700
Message-Id: <ad4ff8a1ddca8fd4f8d0c16d84702168fda9def1.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/20] icon-naming-utils-native: Fix long path to perl in icon-name-mapping
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:38 -0000

From: Tom Rini <tom_rini@mentor.com>

This is 5396e0868cf89787746fa6341ddb1f271a770595 in oe.dev but here we
instead use the nativeperl wrapper.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../icon-naming-utils-native_0.8.7.bb              |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
index d34fb03..4760c96 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -9,3 +9,8 @@ SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-0.8.7.tar.gz"
 S = "${WORKDIR}/icon-naming-utils-${PV}"
 
 inherit autotools native perlnative
+
+do_configure_append() {
+	# Make sure we use our nativeperl wrapper.
+	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
+}
-- 
1.7.3.4



