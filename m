Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xg/6Fun110P4STjLlO1/Ih3HYvNs6ntdmf8BxpLAMNSWJ7wDW1fCmvtUpQe25cmSlGmnKMFuJf
 AjahCa7wH1Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211567"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:42 -0700
IronPort-SDR: qv5rLeT6jyJmzMBHYQDqeqvzyBJ1J91atB+jqaZN0q9JLGkemwN95c03+WFSCxVFidzVwqFfE0
 34sAvDv+6s7Q==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295122"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/25] wpa-supplicant: fix CVE-2021-27803
Date: Mon, 22 Mar 2021 09:41:04 +0800
Message-Id: <5dc8a0a3a22add1e0bb9970c37d014b4abbca049.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact (potentially
execution of arbitrary code), for an attacker within radio range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-27803

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81e4260b83c52558c320fd7d1c1eafcb312ad6be)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../wpa-supplicant/CVE-2021-27803.patch       | 58 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
new file mode 100644
index 0000000000..004b1dbd19
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
@@ -0,0 +1,58 @@
+From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Tue, 8 Dec 2020 23:52:50 +0200
+Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
+
+p2p_add_device() may remove the oldest entry if there is no room in the
+peer table for a new peer. This would result in any pointer to that
+removed entry becoming stale. A corner case with an invalid PD Request
+frame could result in such a case ending up using (read+write) freed
+memory. This could only by triggered when the peer table has reached its
+maximum size and the PD Request frame is received from the P2P Device
+Address of the oldest remaining entry and the frame has incorrect P2P
+Device Address in the payload.
+
+Fix this by fetching the dev pointer again after having called
+p2p_add_device() so that the stale pointer cannot be used.
+
+Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-27803
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec0..05fd593 100644
+--- a/src/p2p/p2p_pd.c
++++ b/src/p2p/p2p_pd.c
+@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
+ 			goto out;
+ 		}
+ 
++		dev = p2p_get_device(p2p, sa);
+ 		if (!dev) {
+-			dev = p2p_get_device(p2p, sa);
+-			if (!dev) {
+-				p2p_dbg(p2p,
+-					"Provision Discovery device not found "
+-					MACSTR, MAC2STR(sa));
+-				goto out;
+-			}
++			p2p_dbg(p2p,
++				"Provision Discovery device not found "
++				MACSTR, MAC2STR(sa));
++			goto out;
+ 		}
+ 	} else if (msg.wfd_subelems) {
+ 		wpabuf_free(dev->info.wfd_subelems);
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 85ac28d881..0f2b7407e9 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
+           file://CVE-2021-27803.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.30.2

