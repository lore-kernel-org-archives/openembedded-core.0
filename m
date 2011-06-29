Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbkph-0006b9-LJ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 04:48:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 19:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="21316935"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 19:45:10 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 10:59:33 +0800
Message-Id: <3545289c58c821fc02cfdc48a3dc65eab23328bf.1309315723.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/6] ofono: upgrade to version 0.50
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
X-List-Received-Date: Wed, 29 Jun 2011 02:48:56 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/distro/include/default-versions.inc |    4 ----
 meta/recipes-connectivity/ofono/ofono.inc     |    2 ++
 meta/recipes-connectivity/ofono/ofono_0.45.bb |    9 ---------
 meta/recipes-connectivity/ofono/ofono_0.50.bb |   13 +++++++++++++
 4 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_0.45.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.50.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 0abbd8f..377aba5 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -12,7 +12,3 @@ PREFERRED_VERSION_python-native ?= "2.6.6"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
-
-
-
diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index ee3bc3e..4fc969c 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -15,5 +15,7 @@ INITSCRIPT_PARAMS = "defaults 22"
 do_install_append() {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
+  install -d ${D}${sysconfdir}/udev/rules.d/
+  install -m 0644 ${S}/plugins/97-ofono.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
diff --git a/meta/recipes-connectivity/ofono/ofono_0.45.bb b/meta/recipes-connectivity/ofono/ofono_0.45.bb
deleted file mode 100644
index 4a8950f..0000000
--- a/meta/recipes-connectivity/ofono/ofono_0.45.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-PR = "r0"
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
-	          file://ofono"
-
-SRC_URI[md5sum] = "31dabb077e7592ba36913bd9d0c76b94"
-SRC_URI[sha256sum] = "5541e832fb72c6c647b663e5ee55384a33efaee5a34c4544e3a16af94892f47e"
diff --git a/meta/recipes-connectivity/ofono/ofono_0.50.bb b/meta/recipes-connectivity/ofono/ofono_0.50.bb
new file mode 100644
index 0000000..eb82e39
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_0.50.bb
@@ -0,0 +1,13 @@
+require ofono.inc
+
+PR = "r0"
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
+	          file://ofono"
+
+EXTRA_OECONF += "\
+    --enable-test \
+"
+
+SRC_URI[md5sum] = "b2656fd0bbf33f926fc86c1e8915d697"
+SRC_URI[sha256sum] = "f8f8dd917847a007e4d441b949efc4d28dc3644526d5293016844c2536c65ff9"
-- 
1.7.1



