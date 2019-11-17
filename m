Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0DB7F96B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 23:24:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:16 -0800
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="195955428"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.29])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:23:33 +0800
Message-Id: <20191117232337.5635-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117232337.5635-1-anuj.mittal@intel.com>
References: <20191117232337.5635-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 3/7] wpa-supplicant: fix CVE-2019-16275
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
X-List-Received-Date: Sun, 17 Nov 2019 23:24:15 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: d7b5a2ebdb6e74a21059ac2496b5dbea4597eb87)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...re-management-frame-from-unexpected-.patch | 82 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
new file mode 100644
index 0000000000..7b0713cf6d
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
@@ -0,0 +1,82 @@
+hostapd before 2.10 and wpa_supplicant before 2.10 allow an incorrect indication
+of disconnection in certain situations because source address validation is
+mishandled. This is a denial of service that should have been prevented by PMF
+(aka management frame protection). The attacker must send a crafted 802.11 frame
+from a location that is within the 802.11 communications range.
+
+CVE: CVE-2019-16275
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 8c07fa9eda13e835f3f968b2e1c9a8be3a851ff9 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 29 Aug 2019 11:52:04 +0300
+Subject: [PATCH] AP: Silently ignore management frame from unexpected source
+ address
+
+Do not process any received Management frames with unexpected/invalid SA
+so that we do not add any state for unexpected STA addresses or end up
+sending out frames to unexpected destination. This prevents unexpected
+sequences where an unprotected frame might end up causing the AP to send
+out a response to another device and that other device processing the
+unexpected response.
+
+In particular, this prevents some potential denial of service cases
+where the unexpected response frame from the AP might result in a
+connected station dropping its association.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/ap/drv_callbacks.c | 13 +++++++++++++
+ src/ap/ieee802_11.c    | 12 ++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
+index 31587685fe3b..34ca379edc3d 100644
+--- a/src/ap/drv_callbacks.c
++++ b/src/ap/drv_callbacks.c
+@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
+ 			   "hostapd_notif_assoc: Skip event with no address");
+ 		return -1;
+ 	}
++
++	if (is_multicast_ether_addr(addr) ||
++	    is_zero_ether_addr(addr) ||
++	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
++			   " in received indication - ignore this indication silently",
++			   __func__, MAC2STR(addr));
++		return 0;
++	}
++
+ 	random_add_randomness(addr, ETH_ALEN);
+ 
+ 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index c85a28db44b7..e7065372e158 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
+ 	fc = le_to_host16(mgmt->frame_control);
+ 	stype = WLAN_FC_GET_STYPE(fc);
+ 
++	if (is_multicast_ether_addr(mgmt->sa) ||
++	    is_zero_ether_addr(mgmt->sa) ||
++	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
++			   " in received frame - ignore this frame silently",
++			   MAC2STR(mgmt->sa));
++		return 0;
++	}
++
+ 	if (stype == WLAN_FC_STYPE_BEACON) {
+ 		handle_beacon(hapd, mgmt, len, fi);
+ 		return 1;
+-- 
+2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index c16978cfe8..2db09ad2c6 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
+		   file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.21.0


