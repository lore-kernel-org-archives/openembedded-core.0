Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJ0-0001c8-6c
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892489"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:24 -0700
Message-Id: <41b49e07aa5b387732f40225d65d129b9acc7db7.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 28 Apr 2011 00:56:59 +0200
Date: Tue, 03 May 2011 16:44:23 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 02/33] liberation-fonts: postinst can't be called offline
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
X-List-Received-Date: Tue, 03 May 2011 23:47:02 -0000

From: Ilya Yanok <yanok@emcraft.com>

fc-cache should be called on target system. Or maybe we should pass a
suitable directory list to it?

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../ttf-fonts/liberation-fonts_1.04.bb             |    3 +++
 .../ttf-fonts/liberation-fonts_1.06.bb             |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index c50d6eb..81aee0e 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -34,6 +34,9 @@ do_install () {
 
 pkg_postinst_${PN} () {
 #!/bin/sh
+if [ "x$D" != "x" ] ; then
+	exit 1
+fi
 fc-cache
 }
 
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
index d910cff..1f023b7 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
@@ -35,6 +35,9 @@ do_install () {
 
 pkg_postinst_${PN} () {
 #!/bin/sh
+if [ "x$D" != "x" ] ; then
+	exit 1
+fi
 fc-cache
 }
 
-- 
1.7.4.1



