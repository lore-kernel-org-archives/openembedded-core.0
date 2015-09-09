Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA9474197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 19:55:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Sep 2015 12:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,498,1437462000"; d="scan'208";a="801737699"
Received: from afshjern.zpn.intel.com ([10.219.128.72])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2015 12:55:33 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 14:56:09 -0500
Message-Id: <1441828569-518-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] lsb: add lsbinitscripts and util-linux rdepends
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
X-List-Received-Date: Wed, 09 Sep 2015 19:55:35 -0000

Building a base image such as core-image-minimal with lsb and then
attempting to source /lib/lsb/init-functions, then using the start
_daemon function (to start a daemon, such as syslogd) fails, since
/lib/lsb/init-functions use functions (incl. "daemon()") from file
/etc/init.d/functions.lsbinitscripts, which is provided by package
lsbinitscripts. Running daemon() then calls /usr/bin/mountpoint, a
binary provided by util-linux. So, both of these dependencies have
been added to: recipes-extended/lsb/lsb_4.1.bb

[YOCTO #7732]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index b4ef98e..11b788f 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -6,6 +6,9 @@ PR = "r2"
 
 # lsb_release needs getopt
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
+# lsb needs lsbinitscripts and util-linux
+RDEPENDS_${PN} += "lsbinitscripts \
+                   util-linux"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-- 
1.8.4.5


