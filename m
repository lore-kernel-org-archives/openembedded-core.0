Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912v-0007ey-SR
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2011 13:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="416779216"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2011 13:13:29 -0700
Message-Id: <de0cb236e65390c730f9ce9e7fb82ea546d85126.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 16:30:54 +0800
Date: Sun, 10 Apr 2011 13:13:29 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 3/6] eglibc-package.inc: Add eglibc-binaries, eglibc-localedatas, eglibc-gconvs and eglibc-charmps to variable PACKAGE
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:46 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The purpose of adding the above variables it to make it easier to
install them into a lsb-image. By having 4 collections of packages
they will not fill the task-poky-lsb.bb file.

eglibc-binaries include packages "eglibc-binary-*"
eglibc-localedatas include packages "eglibc-localedata-*"
eglibc-gconvs include packages "eglibc-gconv-*"
eglibc-charmaps include packages "eglibc-charmap-*"

[sgw: edited summary and description]
Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 01275aa..fa6dc3c 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -44,6 +44,26 @@ PACKAGES_DYNAMIC = " \
 		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
 		    locale-base-*${PKGSUFFIX}"
 
+# Create a eglibc-binaries
+ALLOW_EMPTY_${PN}-binaries = "1"
+PACKAGES += "${PN}-binaries"
+RRECOMMENDS_${PN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-binary") != -1])}"
+
+# Create a eglibc-charmaps package 
+ALLOW_EMPTY_${PN}-charmaps = "1"
+PACKAGES += "${PN}-charmaps"
+RRECOMMENDS_${PN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-charmap") != -1])}"
+
+# Create a eglibc-gconvs package 
+ALLOW_EMPTY_${PN}-gconvs = "1"
+PACKAGES += "${PN}-gconvs"
+RRECOMMENDS_${PN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-gconv") != -1])}"
+
+# Create a eglibc-localedatas package 
+ALLOW_EMPTY_${PN}-localedatas = "1"
+PACKAGES += "${PN}-localedatas"
+RRECOMMENDS_${PN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
+
 RPROVIDES_eglibc = "glibc"
 RPROVIDES_eglibc-utils = "glibc-utils"
 RPROVIDES_eglibc-pic = "glibc-pic"
-- 
1.7.1.1



