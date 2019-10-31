Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 194FC7F998
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n1so5698634wra.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FbpZt+fDiBlObbEAE4xzXW7EXh0fMzrIhQYIu7wjOjs=;
	b=0OguhsHpNJ3xy02xE6QpjpuNtBR5qlB5XXfhEQQLo4kqO152MBGC6ezyU4GoFxT9qX
	1z/KQCLU4IiYYszOJDzQCCb7V8ZPCEWOVGv+rSdYDxsvuhMUcUqDFtY18HH3Ww1Vb+ki
	mcW64zrXFhoy1LvxjOoXEFKk25wQoGbd3M75zlYZIMzsygiKOKg69I74icr/5/m/jxDT
	P6vCnSxizJJ9HQToEWeVSixkuaZyI5yFxeAJ8Yst6nc7msrp7NxzYdquCx0DTrQPpjBR
	1G9HsFoHZsjtQi/xTLLCDsZ3vWm58lol8Mb5JTomFgWmiZu4p1RZ1/uZWM/z6rdCxvJY
	gkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FbpZt+fDiBlObbEAE4xzXW7EXh0fMzrIhQYIu7wjOjs=;
	b=lR3vhy+rYHtbpLRanklvSoh+PcwrGHXaFa2tePfZlBXZ5C5u2k5I26sqSi25tY3vmR
	VqhsBC26VBCnjol74X3ORbO3HC6QU9km2MxVXLKL0spEljRHAkOIcWT53KpqOb7ERM1t
	dnhR+xpX/007CCxQkZBAg8XLU2F6Vww9XnPASosKsv8nSvVgOyC1fxm3NVhI74a2fy85
	Vvlcp90Us/HgTWvhIagP/DAb8vF502ASYjMxoyur24mmyTClqCpw79juGNhHwSEsoKUf
	IASFuWWfi+8FXghRF14DLkKU0X4B/o1LrZWnFCA/eTarxsDCBOeptEjBstI7yHISl0Yu
	Mwjg==
X-Gm-Message-State: APjAAAV7PXMipdUEzKnI8AowUuTpaKv2sfvPV8jL8KSd+UhrDTQiuUKT
	vjdhxXAGQT1Wr1HujZx9fvgGrq3okNg=
X-Google-Smtp-Source: APXvYqwQQSlBaUbeBdRSQ5aDC8sooUbA1SBbcfCM3CTFsbgmO7HxTbj9/mXFQcIyKPVYV38OnLqv6g==
X-Received: by 2002:a5d:6104:: with SMTP id v4mr4718764wrt.36.1572519328280;
	Thu, 31 Oct 2019 03:55:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:18 +0000
Message-Id: <20191031105518.7716-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] wpa-supplicant: fix CVE-2019-16275
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...re-management-frame-from-unexpected-.patch | 82 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
new file mode 100644
index 00000000000..7b0713cf6d7
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
index ad9e6ea4be1..3e92427bb0b 100644
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
2.20.1


