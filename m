Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEAB77BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573692"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:32 +0200
Message-Id: <3dd41318a55cd33c7e8c2d1f8a5eaaad0eba1ab9.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/6] lsbinitscripts: don't use update-alternatives
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:38 -0000

Make lsbinitscripts (r)conflict with initscripts-functions package.

[YOCTO #10944]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.72.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
index f1b53feef3..2d74a6f9d3 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
@@ -4,7 +4,9 @@ SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
 
+RPROVIDES_${PN} += "initd-functions"
 RDEPENDS_${PN} += "util-linux"
+RCONFLICTS_${PN} = "initscripts-functions"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
@@ -17,12 +19,6 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}
 SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
 SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
 
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "functions"
-ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
-
 # Since we are only taking the patched version of functions, no need to
 # configure or compile anything so do not execute these
 do_configure[noexec] = "1" 
-- 
2.13.6


