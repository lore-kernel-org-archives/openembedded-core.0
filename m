Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A82165C7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 05:01:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q51E1u001601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 22:01:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 25 May 2015 22:01:14 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 May 2015 12:55:42 +0800
Message-ID: <1432616142-9170-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] wpa-supplicant: upgrade to 2.4
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
X-List-Received-Date: Tue, 26 May 2015 05:01:14 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

1. upgrade to 2.4
2. update the checksum, and license checksum since date in it is changed
3. Backport a patch to fix CVE-2015-1863
4. remove two deprecated patches

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...e-SSID-element-length-before-copying-it-C.patch | 47 ++++++++++++++++++++++
 .../0001-linux_wext-Fix-types-for-musl.patch       | 38 -----------------
 .../fix-libnl3-host-contamination.patch            | 42 -------------------
 .../wpa-supplicant/wpa-supplicant_2.3.bb           |  2 -
 .../{wpa-supplicant.inc => wpa-supplicant_2.4.bb}  | 13 +++---
 5 files changed, 53 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant.inc => wpa-supplicant_2.4.bb} (88%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
new file mode 100644
index 0000000..e108a93
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
@@ -0,0 +1,47 @@
+From 9ed4eee345f85e3025c33c6e20aa25696e341ccd Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Tue, 7 Apr 2015 11:32:11 +0300
+Subject: [PATCH] P2P: Validate SSID element length before copying it
+ (CVE-2015-1863)
+
+This fixes a possible memcpy overflow for P2P dev->oper_ssid in
+p2p_add_device(). The length provided by the peer device (0..255 bytes)
+was used without proper bounds checking and that could have resulted in
+arbitrary data of up to 223 bytes being written beyond the end of the
+dev->oper_ssid[] array (of which about 150 bytes would be beyond the
+heap allocation) when processing a corrupted management frame for P2P
+peer discovery purposes.
+
+This could result in corrupted state in heap, unexpected program
+behavior due to corrupted P2P peer device information, denial of service
+due to process crash, exposure of memory contents during GO Negotiation,
+and potentially arbitrary code execution.
+
+Thanks to Google security team for reporting this issue and smart
+hardware research group of Alibaba security team for discovering it.
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ src/p2p/p2p.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index f584fae..a45fe73 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -778,6 +778,7 @@ int p2p_add_device(struct p2p_data *p2p, const u8 *addr, int freq,
+ 	if (os_memcmp(addr, p2p_dev_addr, ETH_ALEN) != 0)
+ 		os_memcpy(dev->interface_addr, addr, ETH_ALEN);
+ 	if (msg.ssid &&
++	    msg.ssid[1] <= sizeof(dev->oper_ssid) &&
+ 	    (msg.ssid[1] != P2P_WILDCARD_SSID_LEN ||
+ 	     os_memcmp(msg.ssid + 2, P2P_WILDCARD_SSID, P2P_WILDCARD_SSID_LEN)
+ 	     != 0)) {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
deleted file mode 100644
index 49a988b..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 159db445dc4cb0af5f6ad85f3a146ad137db5057 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Apr 2015 20:38:21 -0700
-Subject: [PATCH] linux_wext: Fix types for musl
-
-| ../src/drivers/linux_wext.h:24:9: error: unknown type name '__uint32_t'
-|  typedef __uint32_t __u32;
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- src/drivers/linux_wext.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/drivers/linux_wext.h b/src/drivers/linux_wext.h
-index 55cf955..e66df91 100644
---- a/src/drivers/linux_wext.h
-+++ b/src/drivers/linux_wext.h
-@@ -21,11 +21,11 @@
- 
- #include <sys/types.h>
- #include <net/if.h>
--typedef __uint32_t __u32;
--typedef __int32_t __s32;
--typedef __uint16_t __u16;
--typedef __int16_t __s16;
--typedef __uint8_t __u8;
-+typedef u_int32_t __u32;
-+typedef int32_t __s32;
-+typedef u_int16_t __u16;
-+typedef int16_t __s16;
-+typedef u_int8_t __u8;
- #ifndef __user
- #define __user
- #endif /* __user */
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
deleted file mode 100644
index e899c16..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-From 37d6b3dd5a737cd67468e4a58b372bddd924a7be Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Fri, 8 Mar 2013 22:55:19 +0100
-Subject: [PATCH] Revert "build: Use updated libnl3 header paths"
-
-This reverts commit e7ecddf33a446072effbc85a27a078a8e582c89e.
----
- src/drivers/drivers.mak |    2 +-
- src/drivers/drivers.mk  |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
-index 68ff910..1f38f57 100644
---- a/src/drivers/drivers.mak
-+++ b/src/drivers/drivers.mak
-@@ -35,7 +35,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20
- ifdef CONFIG_LIBNL3_ROUTE
-   DRV_LIBS += -lnl-route-3
-   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
-diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
-index db8561a..c93e88d 100644
---- a/src/drivers/drivers.mk
-+++ b/src/drivers/drivers.mk
-@@ -30,7 +30,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20
- ifdef CONFIG_LIBNL3_ROUTE
-   DRV_LIBS += -lnl-route-3
-   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
deleted file mode 100644
index afd0654..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require wpa-supplicant.inc
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
similarity index 88%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index dae0606..b7c7033 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://README;beginline=1;endline=56;md5=a07250b28e857455336bb59fc31cb845 \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=e8e021e30f3a6ab7c341b66b86626a5a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=36b27801447e0662ee0138d17fe93880 \
+                    file://README;beginline=1;endline=56;md5=7f393579f8b109fe91f3b9765d26c7d3 \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=3430fda79f2ba1dd545f0b3c4d6e4d24 "
 DEPENDS = "dbus libnl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -24,11 +24,10 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://fix-libnl3-host-contamination.patch \
-           file://0001-linux_wext-Fix-types-for-musl.patch \
+           file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
           "
-SRC_URI[md5sum] = "f2ed8fef72cf63d8d446a2d0a6da630a"
-SRC_URI[sha256sum] = "eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a"
+SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
+SRC_URI[sha256sum] = "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
-- 
1.9.1


