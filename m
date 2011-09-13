Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3RXQ-0003aF-QX
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:52:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2011 04:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,374,1312182000"; d="scan'208";a="50733811"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2011 04:47:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 19:52:45 +0800
Message-Id: <e714a424c08ff24407b96bfc8edf7dd01f0a7359.1315914682.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315914682.git.dongxiao.xu@intel.com>
References: <cover.1315914682.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315914682.git.dongxiao.xu@intel.com>
References: <cover.1315914682.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] multilib: Remove recipe from multilib.conf that inherits allarch
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
X-List-Received-Date: Tue, 13 Sep 2011 11:52:30 -0000

Recipes like update-rc.d and qemu-config inherit "allarch", thus we
shouldn't add multilib BBCLASSEXTEND for them in multilib.conf.

Besides, we need to add multilib packages as the RPROVIDER contents for
those recipes, in order to avoid the NoProvider error when parsing.

[YOCTO #1471]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib_global.bbclass |    4 ++++
 meta/conf/multilib.conf              |    2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 1263e4e..ed14565 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -7,11 +7,15 @@ python multilib_virtclass_handler_global () {
     if isinstance(e, bb.event.RecipeParsed) and not variant:
         if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
             origprovs = provs = e.data.getVar("PROVIDES", True)
+            rprovs = e.data.getVar("RPROVIDES", True)
             variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
             for variant in variants:
                 provs = provs + " " + multilib_map_variable("PROVIDES", variant, e.data)
+                for pkg in e.data.getVar("PACKAGES", True).split():
+                    rprovs = rprovs + " " + variant + "-" + pkg
                 e.data.setVar("PROVIDES", origprovs)
             e.data.setVar("PROVIDES", provs)
+            e.data.setVar("RPROVIDES", rprovs)
 }
 
 addhandler multilib_virtclass_handler_global
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index f23fbb7..16db375 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -324,7 +324,6 @@ BBCLASSEXTEND_append_pn-psplash = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pth = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-python-dbus = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-python = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-qemu-config = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-qemugl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-qt4-x11-free = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-quota = " ${MULTILIBS}"
@@ -394,7 +393,6 @@ BBCLASSEXTEND_append_pn-udev-extraconf = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-udev = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-unzip = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-update-modules = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-usbutils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-util-macros = " ${MULTILIBS}"
-- 
1.7.1



