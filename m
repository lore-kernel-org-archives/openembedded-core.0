Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QYvrt-0000M4-Hn
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:59:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jun 2011 00:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,399,1304319600"; d="scan'208";a="17658316"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga001.jf.intel.com with ESMTP; 21 Jun 2011 00:55:55 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 16:08:50 +0800
Message-Id: <44894324896452461c53926a1ebbbecfdc154c23.1308642976.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308642976.git.dongxiao.xu@intel.com>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1308642976.git.dongxiao.xu@intel.com>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/5] ofono: add 0.42 version which works OK for Ericsson 3G module.
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
X-List-Received-Date: Tue, 21 Jun 2011 07:59:30 -0000

We met ofonod crash after ofono-0.43 version. Thus import 0.42 version
to enable the 3G feature.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/distro/include/default-versions.inc |    1 +
 meta/recipes-connectivity/ofono/ofono.inc     |    2 ++
 meta/recipes-connectivity/ofono/ofono_0.42.bb |   13 +++++++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.42.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 0abbd8f..f29ee12 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -13,6 +13,7 @@ PREFERRED_VERSION_python-native ?= "2.6.6"
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
 
+PREFERRED_VERSION_ofono ?= "0.42"
 
 
 
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
 
diff --git a/meta/recipes-connectivity/ofono/ofono_0.42.bb b/meta/recipes-connectivity/ofono/ofono_0.42.bb
new file mode 100644
index 0000000..defea0a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_0.42.bb
@@ -0,0 +1,13 @@
+require ofono.inc
+
+PR = "r0"
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
+	          file://ofono"
+
+EXTRA_OECONF += "\
+  --enable-test \
+"
+
+SRC_URI[md5sum] = "e3ccf43a287153eed25f8dd75e7c6d18"
+SRC_URI[sha256sum] = "5b6f78cbe218fbc5c84401cd9d64b3204529e98822f959a9b2aae34b538076af"
-- 
1.7.1



