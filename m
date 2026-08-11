Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C25C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 03:56:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46909.1786420572376463270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 20:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T/nW6hcS;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1416587a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 20:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420572; x=1787025372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVE7jUqMvNcwlm3CLyR2Y/H4/KuIVnzDaml5xPRR/WQ=;
        b=T/nW6hcSNs5eZM2K5MWT26+rtPAKXsn+5f7Dd6tz4z/qOZGBhn44HiO+GU1K2IXY3N
         T9FK3Pa4sS//PbDZuK17P/pUi4qQxF0895CkYZ+v98V2sAZnS0uitVdGfxRf9wMxaxoU
         X4O8jql2ouP/FRrbzKqfoFkWjaw25044lfpcZkduHogAF8ECJXYjtCiEj9y+DNdBgJrM
         AoQ1I2QU2K4/sAI6+Mwyqm+dQjYe5iFGoQuKmac0nSt7qm4YwdlwyW2/aWXLR5eC/x1e
         s1FlUFET/UEPQaBAbYkqLsVrWqzx5kzEDe0HMi9rXRuI4h+k82GcB8XKw6zmbzaEX2ub
         jCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420572; x=1787025372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVE7jUqMvNcwlm3CLyR2Y/H4/KuIVnzDaml5xPRR/WQ=;
        b=dkvnHlbnZUjqTn8aUDl2cRc7WcB456aWblrgFt6TN99vvg+J1NZY0OnZ+rxkWWNh2x
         8dO+c3/x/DrFzqlA0yqi6lSsneeoL+Yx3fGctRorgdM0mdvNWZFdQCREGX1PA4L9LntZ
         4wyy2mKHNfFh1h2g1LwRM1vPxG7b6z7xYYVPHxgsdCrV7/DZPk7gOFgY0dbseajXnY6Z
         UTbZeX6Wvl2je4V4TOBiMxxfdsSjbc+I9eC/nCi95TGSaKyIElC0t/dK8Rg8qJBb7+A+
         YfQKc6DPKOEaz80v2ZByLUuqPZPEB4V5gczzJPti4IHsKhTivEz/eJ5PqUsHmJGYGlwa
         AQfg==
X-Gm-Message-State: AOJu0YzlilqN2+YREr0GydldnhOS9PoJ21rkioDiSGWNiSndaBDGrkeH
	qcesuuY1j1i2FKjxsFA64u1nWoSxNcWCYOOHO3cCkMAmJDtYK6NtrQbo8KHmOw==
X-Gm-Gg: AR+sD10ugBNyFUvYjQiua5YK9zGZd3cxD95gEuZNmgEA0wg6DErZ366uJmmI1VIGiz3
	GWUySanDFWjlVk9RZyzUwZG0cbhpZzRmxcDKU1F2EzVvlaOcZ8uTN+LaWZHaDxNIBSjVR+j5LBa
	okqoB5IB7d+Wmz10DtRxBWhrcfmYDjEkj8YiC/vYoqhrkGGQbzhMqQJR9Ka6qV/mieV0JiED9gM
	AdFTGUufzGdIpVQvWCs9Pb1DYVpWkge5O9ySsXze9GWDSwr8NQDNeaZReqB0hx8EZoNMdZae9xO
	2RB6Jmfzalpcafhikhr1Z1zNQXvoGofo5q9kU1GPdA67paAKISw4XqlXYrmQUmCgKBkEI+Q39uP
	0jKHPAiGRvpLQtKevdG+jHuvxga0AuYgB/iY4E3SEjq+GS7lfkk5ZbYR33r1i1y3eztaQoTTT+w
	PdoT89/khXK2UWODccPxmExXPmU+m5BQHWBrH71jnOe8BOEiWaGLyzFnB3BrRfYJRTSEe2OvGrW
	vU4WYI=
X-Received: by 2002:a05:6a20:a11a:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3cc2bbbccc3mr718875637.31.1786420571224;
        Mon, 10 Aug 2026 20:56:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141203734a8sm634636c88.5.2026.08.10.20.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:56:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 1/1] wpa-supplicant: upgrade 2.11 -> 2.12
Date: Tue, 11 Aug 2026 15:56:02 +1200
Message-ID: <20260811035602.3661581-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243149

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Copyright updated to 2026[1].

Dropped patches that are part of the upstream version.

Changelog[2]:
* support RSN overriding (e.g., WPA3-Personal Compatibility Mode)
* improve BSS transition management support
* EHT/IEEE 802.11be/Wi-Fi 7
  - more complete support
  - fix message validation issues that could enable DoS attacks
* support Wi-Fi Direct R2
* support Wi-Fi Aware (add synchronized NAN; extend USD support)
* support Proximity Ranging
* support SPP A-MSDU negotiation
* support IEEE 802.11bi functionality
  - changing SAE password identifiers
  - EPPKE
  - IEEE 802.1X/EAP in Authentication frames
  - Association frame encryption
  - PMKID privacy
* enable layer 2/Wi-Fi multicast filtering for all networks (not
  just some Passpoint networks which enabled this before)
* wpa_gui: port to Qt6
* support OpenSSL 3.0 API changes
* EAP-TEAP: protocol changes based on RFC 9930; this is not compatible
  with previous versions
* maintain configuration file permissions when writing updated
  configuration
* add option to validate PKCS#11/OpenSC engine and module paths
* fix PMKSA caching to enforce network context to avoid misuse of
  unexpected PMKSA cache entries
* fix a potential DoS attack in SAE processing of an unexpected element
* fix incomplete bounds checking of mesh AMPE messages that could have
  resulted in DoS attacks and memory corruption
* a large number of other fixes, cleanup, and extensions

[1] https://git.w1.fi/cgit/hostap/commit/README?h=hostap_2_12&id=e58715b1b7f8d53e493017f5ce4a3b45e53f3d23
[2] https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?h=hostap_2_12&id=e58715b1b7f8d53e493017f5ce4a3b45e53f3d23

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...dware-offload-requires-Linux-headers.patch | 53 -------------
 ...-Opportunistic-Wireless-Encryption-O.patch | 39 ---------
 ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 --------
 ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 --------
 ...r-broken-AP-operating-class-behavior.patch | 39 ---------
 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 -------------------
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ----------------
 ...plicant_2.11.bb => wpa-supplicant_2.12.bb} | 11 +--
 8 files changed, 2 insertions(+), 355 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.11.bb => wpa-supplicant_2.12.bb} (88%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
deleted file mode 100644
index f9634e47c9..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Thu, 22 Aug 2024 00:03:41 +0300
-Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
-
-Hardware offload in Linux macsec driver is enabled in compile time if
-libnl version is >= v3.6. This is not sufficient for successful build
-since enum 'macsec_offload' has been added to Linux header if_link.h
-in kernels v5.6 and v5.7, see commits:
-- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
-- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
-
-New libnl with older Linux headers is a valid combination. This is how
-hostapd build failure has been detected by Buildroot autobuilder, see:
-- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
-
-Extend compile time condition for the enablement of the macsec hardware
-offload adding Linux headers version check.
-
-Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/patch/?id=809d9d8172db8e2a08ff639875f838b5b86d2641]
-Signed-off-by: Jon Mason <jdmason@kudzu.us>
----
- src/drivers/driver_macsec_linux.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
-index c867154981e9..fad47a292f9f 100644
---- a/src/drivers/driver_macsec_linux.c
-+++ b/src/drivers/driver_macsec_linux.c
-@@ -19,6 +19,7 @@
- #include <netlink/route/link.h>
- #include <netlink/route/link/macsec.h>
- #include <linux/if_macsec.h>
-+#include <linux/version.h>
- #include <inttypes.h>
- 
- #include "utils/common.h"
-@@ -32,7 +33,8 @@
- 
- #define UNUSED_SCI 0xffffffffffffffff
- 
--#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
-+#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
-+     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
- #define LIBNL_HAS_OFFLOAD
- #endif
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
deleted file mode 100644
index 7311b76b6f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fb043a27324ba81502b8986a31222f38aa414bbf Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 18 Dec 2025 09:46:03 +0800
-Subject: [PATCH 1/3] defconfig: Update Opportunistic Wireless Encryption (OWE)
- state
-
-OWE enhances privacy in public and enterprise environments where open
-networks are prevalent. Enabling OWE aligns with modern security best
-practices and supports the testing and development of OWE-capable
-devices.
-
-OWE is now standardized in IEEE Std 802.11-2024 while it was originally
-specified in IETF RFC 8110 (updated by RFC 9672). It is not experimental
-anymore, i.e., there has been significant interoperability testing and
-there are deployed cases.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=39db92dcf301793ce45a8ebf85c425f67c670058]
----
- wpa_supplicant/defconfig | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 52befd8..044604a 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -638,8 +638,7 @@ CONFIG_BGSCAN_SIMPLE=y
- #CONFIG_BGSCAN_LEARN=y
- 
- # Opportunistic Wireless Encryption (OWE)
--# Experimental implementation of draft-harkins-owe-07.txt
--#CONFIG_OWE=y
-+CONFIG_OWE=y
- 
- # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
- CONFIG_DPP=y
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
deleted file mode 100644
index b474b8437f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From aebbf87ca7311f543bd849020b97402c49f3cf24 Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 18 Dec 2025 09:39:39 +0800
-Subject: [PATCH 2/3] defconfig: Document IEEE 802.11be as a published
- amendment
-
-The comment about the IEEE 802.11be functionality being experimental
-and based on a not yet finalized standard is not accurate anymore
-since IEEE Std 802.11be-2024 has already been published. Remove this
-outdated comment.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=2887a975b12de9256ed6fdbd0da1dbb78c7a25c4]
----
- wpa_supplicant/defconfig | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 044604a..7efb9e6 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -507,9 +507,6 @@ CONFIG_IEEE80211AX=y
- 
- # IEEE 802.11be EHT support (mainly for AP mode)
- # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
--# Note: This is experimental and work in progress. The definitions are still
--# subject to change and this should not be expected to interoperate with the
--# final IEEE 802.11be version.
- #CONFIG_IEEE80211BE=y
- 
- # Wireless Network Management (IEEE Std 802.11v-2011)
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
deleted file mode 100644
index 9ed7342bdc..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From be5ffd2084b8690f5b974c5b6ff7409fbfaacfb7 Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 11 Dec 2025 15:07:31 +0800
-Subject: [PATCH 3/3] defconfig: Uncomment CONFIG_IEEE80211BE=y
-
-wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
-years. With growing market demand for Wi-Fi 7, it is now an appropriate
-time to enable IEEE 802.11be support. This is needed mainly to enable AP
-mode functionality in wpa_supplicant.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=e623edd9b73a521b8a4438c600c9a8fb0ac5febe]
----
- wpa_supplicant/defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 7efb9e6..84ac8ba 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -507,7 +507,7 @@ CONFIG_IEEE80211AX=y
- 
- # IEEE 802.11be EHT support (mainly for AP mode)
- # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
--#CONFIG_IEEE80211BE=y
-+CONFIG_IEEE80211BE=y
- 
- # Wireless Network Management (IEEE Std 802.11v-2011)
- # Note: This is experimental and not complete implementation.
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
deleted file mode 100644
index 47fe1b4c9f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 72ac0ee026d9f6f9cd031d7859ea0b343b34e61d Mon Sep 17 00:00:00 2001
-From: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
-Date: Thu, 1 Aug 2024 18:37:25 +0800
-Subject: [PATCH] WNM: Extend workaround for broken AP operating class behavior
-
-Some APs do not advertise operating classes correctly for BSS Transition
-Management. Try to determine the most likely operating frequency based
-on the channel number (1..14 --> 2.4 GHz; 36..177 --> 5 GHz) if invalid
-op_class == 255 is received in a BSS Transition Management Request. This
-speeds up the following operating by avoiding a full scan due to an
-unknown channel.
-
-This extends the workaround that was added in commit 80ce804e8824 ("WNM:
-Workaround for broken AP operating class behavior") for invalid
-operating class 0 to cover another observed case with invalid operating
-class 255.
-
-Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
-Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=72ac0ee026d9f6f9cd031d7859ea0b343b34e61d]
----
- wpa_supplicant/wnm_sta.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wpa_supplicant/wnm_sta.c b/wpa_supplicant/wnm_sta.c
-index 58a124c00..662f6089e 100644
---- a/wpa_supplicant/wnm_sta.c
-+++ b/wpa_supplicant/wnm_sta.c
-@@ -555,7 +555,7 @@ static int wnm_nei_get_chan(struct wpa_supplicant *wpa_s, u8 op_class, u8 chan)
- 	}
- 
- 	freq = ieee80211_chan_to_freq(country, op_class, chan);
--	if (freq <= 0 && op_class == 0) {
-+	if (freq <= 0 && (op_class == 0 || op_class == 255)) {
- 		/*
- 		 * Some APs do not advertise correct operating class
- 		 * information. Try to determine the most likely operating
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
deleted file mode 100644
index 36660b5880..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 25 Jan 2025 11:21:16 +0200
-Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
-
-The case of an invalid authenticator in a RADIUS response could imply
-that the response is not from the correct RADIUS server and as such,
-such a response should be discarded without changing internal state for
-the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
-is somewhat more complex since it could have been indicated before
-validating the authenticator. In any case, it seems better to change the
-state for the pending request only when we have fully accepted the
-response.
-
-Allowing the internal state of pending RADIUS request to change based on
-responses that are not fully validation could have allow at least a
-theoretical DoS attack if an attacker were to have means for injecting
-RADIUS messages to the network using the IP address of the real RADIUS
-server and being able to do so more quickly than the real server and
-with the matching identifier from the request header (i.e., either by
-flooding 256 responses quickly or by having means to capture the RADIUS
-request). These should not really be realistic options in a properly
-protected deployment, but nevertheless it is good to be more careful in
-processing RADIUS responses.
-
-Remove a pending RADIUS request from the internal list only when having
-fully accepted a matching RADIUS response, i.e., after one of the
-registered handlers has confirmed that the authenticator is valid and
-processing of the response has succeeded.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 2a7f36170..7909b29a7 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       roundtrip / 100, roundtrip % 100);
- 	rconf->round_trip_time = roundtrip;
- 
--	/* Remove ACKed RADIUS packet from retransmit list */
--	if (prev_req)
--		prev_req->next = req->next;
--	else
--		radius->msgs = req->next;
--	radius->num_msgs--;
--
- 	for (i = 0; i < num_handlers; i++) {
- 		RadiusRxResult res;
- 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
-@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			radius_msg_free(msg);
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
-+			/* Remove ACKed RADIUS packet from retransmit list */
-+			if (prev_req)
-+				prev_req->next = req->next;
-+			else
-+				radius->msgs = req->next;
-+			radius->num_msgs--;
-+
- 			radius_client_msg_free(req);
- 			return;
- 		case RADIUS_RX_INVALID_AUTHENTICATOR:
-@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       msg_type, hdr->code, hdr->identifier,
- 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
- 		       "");
--	radius_client_msg_free(req);
- 
-  fail:
- 	radius_msg_free(msg);
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
deleted file mode 100644
index add2e47048..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <quic_jouni@quicinc.com>
-Date: Wed, 5 Feb 2025 19:23:39 +0200
-Subject: [PATCH] RADIUS: Fix pending request dropping
-
-A recent change to this moved the place where the processed RADIUS
-request was removed from the pending list to happen after the message
-handler had been called. This did not take into account possibility of
-the handler adding a new pending request in the list and the prev_req
-pointer not necessarily pointing to the correct entry anymore. As such,
-some of the pending requests could have been lost and that would result
-in not being able to process responses to those requests and also, to a
-memory leak.
-
-Fix this by determining prev_req at the point when the pending request
-is being removed, i.e., after the handler function has already added a
-new entry.
-
-Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
-Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 7909b29a7..d4faa7936 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 	struct radius_hdr *hdr;
- 	struct radius_rx_handler *handlers;
- 	size_t num_handlers, i;
--	struct radius_msg_list *req, *prev_req;
-+	struct radius_msg_list *req, *prev_req, *r;
- 	struct os_reltime now;
- 	struct hostapd_radius_server *rconf;
- 	int invalid_authenticator = 0;
-@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		break;
- 	}
- 
--	prev_req = NULL;
- 	req = radius->msgs;
- 	while (req) {
- 		/* TODO: also match by src addr:port of the packet when using
-@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		    hdr->identifier)
- 			break;
- 
--		prev_req = req;
- 		req = req->next;
- 	}
- 
-@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
- 			/* Remove ACKed RADIUS packet from retransmit list */
-+			prev_req = NULL;
-+			for (r = radius->msgs; r; r = r->next) {
-+				if (r == req)
-+					break;
-+				prev_req = r;
-+			}
- 			if (prev_req)
- 				prev_req->next = req->next;
- 			else
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
similarity index 88%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
index adb8467786..9c2d716c03 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
-                    file://README;beginline=1;endline=56;md5=6e4b25e7d74bfc44a32ba37bdf5210a6 \
+                    file://README;beginline=1;endline=56;md5=155e35cb3d6ab0d6a17524f48f4e761c \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=f5ccd57ea91e04800edb88267bf8eae4"
 
 DEPENDS = "dbus libnl"
@@ -15,15 +15,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
-           file://0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch \
-           file://0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch \
-           file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
-           file://0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch \
-           file://CVE-2025-24912-01.patch \
-           file://CVE-2025-24912-02.patch \
            "
-SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
+SRC_URI[sha256sum] = "08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6"
 
 S = "${UNPACKDIR}/wpa_supplicant-${PV}"
 

