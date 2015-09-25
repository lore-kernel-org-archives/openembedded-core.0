Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 641FE77003
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 21:02:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2015 14:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,588,1437462000"; d="scan'208";a="797479534"
Received: from afshjern.zpn.intel.com ([10.219.128.51])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2015 14:02:54 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 16:03:05 -0500
Message-Id: <1443214985-18686-2-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443214985-18686-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1443214985-18686-1-git-send-email-alejandro.franco@linux.intel.com>
Subject: [PATCHv3] lsb: add lsbinitscripts and util-linux rdepends
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
X-List-Received-Date: Fri, 25 Sep 2015 21:02:54 -0000

Building a base image such as core-image-minimal with lsb and then
attempting to source /lib/lsb/init-functions, then using the start
_daemon function (to start a daemon, such as syslogd) fails, since
/lib/lsb/init-functions use functions (incl. "daemon()") from file
/etc/init.d/functions.lsbinitscripts, which is provided by package
lsbinitscripts.

Running daemon() then calls /usr/bin/mountpoint, which is provided
by util-linux.

So, lsbinitscripts has been added as an RDEPENDency in lsb, and in
turn util-linux has been added to lsbinitscripts.

[YOCTO #7732]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb             | 4 ++--
 meta/recipes-extended/lsb/lsbinitscripts_9.64.bb | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 6215b62..c9f6a8b 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -9,8 +9,8 @@ LSB_CORE_x86 = "lsb-core-ia32"
 LSB_CORE_x86-64 = "lsb-core-amd64"
 RPROVIDES_${PN} += "${LSB_CORE}"
 
-# lsb_release needs getopt
-RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
+# lsb_release needs getopt, lsbinitscripts
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
index 6db667c..150f6f2 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
@@ -3,6 +3,8 @@ SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
 
+RDEPENDS_${PN} += "util-linux"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-- 
2.5.3


