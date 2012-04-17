Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKHoe-0003Ns-HM
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 01:28:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Apr 2012 16:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132134362"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.85])
	by azsmga001.ch.intel.com with ESMTP; 17 Apr 2012 16:18:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 00:18:35 +0100
Message-Id: <967c78b6c30d6d6620db8066aac28224153d3359.1334704605.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334704605.git.paul.eggleton@linux.intel.com>
References: <cover.1334704605.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334704605.git.paul.eggleton@linux.intel.com>
References: <cover.1334704605.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Apr 2012 23:28:08 -0000

This allows libzypp to successfully build when x11 is not in
DISTRO_FEATURES (avoiding the libzypp -> libproxy -> gconf -> gtk+
dependency chain which without X results in gtk+ failing at
do_configure).

Fixes [YOCTO #2320].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 11b2abf..6d99861 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
 
 DEPENDS = "gconf"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
            file://g++-namepace.patch \
@@ -31,7 +31,7 @@ do_configure_prepend() {
 }
 
 python() {
-    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
+    if base_contains("INCOMPATIBLE_LICENSE", "GPLv3", "x", "", d) == "x" or base_contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
         d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
         d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS").split() if i != "gconf"))
 }
-- 
1.7.5.4



