Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0A09B7FA15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjn3t8Lz3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281277;
	bh=EZqe0m6t38vhH6Q1U/LjKwhfh7BC4cwoJqmab9YK+lM=;
	h=From:To:Subject:Date:From;
	b=kPDqZmyMArXKc9QGYiFo/A6XFK7Jj2euy9qyX5chvR8S1KsooDmMXVHBnS497zaoh
	xj0MvhEJF4jrCCzBV2UR8ahkXuo0oowj3Omh1xBXyX1aYwcufKHVo7zVq6Dss5fq3F
	AtgmxoCGRQ1b6gKKBIN20x8qXSDl/IUg/4G+jsuL9UdNxKhbtkluxF4ovoGuQG7arl
	ihTJqPs6RLWaxvPlgSXGfr0cvpGcspcOR2A7XO1kQR5DbPtgJDwFTD4bT2a90MYsiy
	XEwbrGmK69dCtS6AW7OqR/rppWhcjj0ULZMRsCSD4Pwvl0jlXKlVSB/VVKShcAHzQu
	0BgM98ZCIl+aDmNrEwMKsT1qmSlxmxCFChPsc/0RwlGysf7Y2WwhhiWVTRHgWanI7E
	EbSrtbwbWQgTzBv6l7kciksE55/A1iSATXjglMfdvX6cUKAMjiarhwBoFLbGkZcnSl
	qgKyKgxCtghJnA2WRbBNnECwuaKzBqjF0JChwIHXiT55hGJGHAgiH1SSmcVSXtTvMX
	YFIWaS+48G62ig/2gxF+vukA2Kn7IueQmMQgKfNRTyOIK94Dp52pOl1vw9gHTNeU/A
	XGjR3OOGoz4gbGh5MwT7NH0GF1seE+tsq5E3W3HID40H5/u+n3++SKzbA5Z6UbdvPo
	uGWeL+60W068bgim4EZg0oe8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:21 +0200
Message-Id: <20200117171436.17131-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] wpa-supplicant: fix CVE-2019-16275
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:38 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...re-management-frame-from-unexpected-.patch | 82 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.7.bb      |  1 +
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
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
index 277bbaec63..542bbf4a9a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch \
            file://0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch \
            file://0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch \
+           file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
           "
 SRC_URI[md5sum] = "a68538fb62766f40f890125026c42c10"
 SRC_URI[sha256sum] = "76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074"
-- 
2.17.1


