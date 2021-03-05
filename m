Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9mid1ib2y8ZuGDHz+FS8jrNNFg8JXiuCNseDPhQYuR4OW+4oXHBKY5nqS/58QA1i7SXRbyviCm
 euPyh6RkJ84w==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671102"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671102"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:40 -0800
IronPort-SDR: 5SU//OA45BrGKHKMu3Ubu9Wq3LDIfXhfHxVhNYmy+6ok1VA3IEZ0C4cS7M3MW3fASdcDOAzO7L
 D4b7sbESbFlg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128972"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 31/52] wpa-supplicant: fix CVE-2021-0326
Date: Fri,  5 Mar 2021 12:21:07 +0800
Message-Id: <50dd7d7f8496aef0ce5e9aa4dd60e55b2e396976.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

In p2p_copy_client_info of p2p.c, there is a possible out of bounds write
due to a missing bounds check. This could lead to remote code execution
if the target device is performing a Wi-Fi Direct search, with no
additional execution privileges needed. User interaction is not needed
for exploitation.Product: AndroidVersions: Android-10 Android-11
Android-8.1 Android-9 Android ID: A-172937525

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-0326

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e<links_for_CVE_patches>

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7940edabe100512e8f558cc37f9da836feae74d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../wpa-supplicant/CVE-2021-0326.patch        | 45 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
new file mode 100644
index 0000000000..8c90fa3421
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
@@ -0,0 +1,45 @@
+From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 9 Nov 2020 11:43:12 +0200
+Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
+ client
+
+Parsing and copying of WPS secondary device types list was verifying
+that the contents is not too long for the internal maximum in the case
+of WPS messages, but similar validation was missing from the case of P2P
+group information which encodes this information in a different
+attribute. This could result in writing beyond the memory area assigned
+for these entries and corrupting memory within an instance of struct
+p2p_device. This could result in invalid operations and unexpected
+behavior when trying to free pointers from that corrupted memory.
+
+Upstream-Status: Backport
+CVE: CVE-2021-0326
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e]
+
+Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
+Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index a08ba02..079270f 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
+ 	dev->info.config_methods = cli->config_methods;
+ 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
+ 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
++	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
++		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
+ 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
+ 		  dev->info.wps_sec_dev_type_list_len);
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 7cc03fef7d..85ac28d881 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+           file://CVE-2021-0326.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.29.2

