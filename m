Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 52D016BDDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627804"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:07 +0200
Message-Id: <71e727b8ad1e26187898e6e6c35ccbb23d2b49ca.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] gstreamer1.0-plugins-bad: upgrade to 1.2.2
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:37 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

bluez-fix-compilation-on-big-endian-systems.patch removed,
included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...uez-fix-compilation-on-big-endian-systems.patch | 35 ----------------------
 ..._1.2.0.bb => gstreamer1.0-plugins-bad_1.2.2.bb} |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.0.bb => gstreamer1.0-plugins-bad_1.2.2.bb} (67%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch
deleted file mode 100644
index 6299a47..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-commit 1ab90f259fee4fa9a7c10dac0a1e85799a15881b
-Author: Sebastian Dröge <slomo@circular-chaos.org>
-Date:   Wed Sep 25 20:25:03 2013 +0200
-
-    bluez: Fix compilation on big endian systems
-
-Upstream-Status: Backport
-
-diff --git a/sys/bluez/gstavdtputil.c b/sys/bluez/gstavdtputil.c
-index dea803a..ed5c276 100644
---- a/sys/bluez/gstavdtputil.c
-+++ b/sys/bluez/gstavdtputil.c
-@@ -611,11 +611,11 @@ gst_avdtp_util_parse_aac_raw (void *config)
-   GValue value = G_VALUE_INIT;
-   GValue value_str = G_VALUE_INIT;
-   GValue list = G_VALUE_INIT;
-+  a2dp_aac_t aac_local = { 0 };
-+  a2dp_aac_t *aac = &aac_local;
- 
- #if G_BYTE_ORDER == G_LITTLE_ENDIAN
-   uint8_t *raw = (uint8_t *) config;
--  a2dp_aac_t aac_local = { 0 };
--  a2dp_aac_t *aac = &aac_local;
-   aac->object_type = raw[0];
-   aac->frequency = (raw[1] << 4) | ((raw[2] & 0xFF) >> 4);
-   aac->channels = (raw[2] >> 2) & 0x3;
-@@ -624,7 +624,7 @@ gst_avdtp_util_parse_aac_raw (void *config)
-   aac->bitrate = (raw[4] << 16) | (raw[3] << 8) | raw[4];
-   aac->bitrate &= ~0x800000;
- #elif G_BYTE_ORDER == G_BIG_ENDIAN
--  *aac = (a2dp_aac_t *) config;
-+  *aac = *((a2dp_aac_t *) config);
- #else
- #error "Unknown byte order"
- #endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.2.bb
similarity index 67%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.2.bb
index d9e3b48..da71170 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.2.bb
@@ -5,10 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI[md5sum] = "4fd078e1b9d903d22b67872b616f1715"
-SRC_URI[sha256sum] = "a12fac6c106a7e4ae8bb2c7da508688d7db532b818319df2202f497cbd930afa"
-
-SRC_URI += "file://bluez-fix-compilation-on-big-endian-systems.patch"
+SRC_URI[md5sum] = "d519b7e8e570c4a22d6b79f2ab89765c"
+SRC_URI[sha256sum] = "63e78db11b482d0529a0bde01e2ac23fd32c7cb99a5508b53ee4ca1051871b2c"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.8.3.2


