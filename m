Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DA8B874C8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 15:49:27 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w84FnR2L019898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2018 17:49:28 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.2.224])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w84FnRCX003398;
	Tue, 4 Sep 2018 17:49:27 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F41F86635EF;
	Tue,  4 Sep 2018 17:49:27 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 17:48:06 +0200
Message-Id: <20180904154806.7108-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] wpa-supplicant: fix CVE-2018-14526
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
X-List-Received-Date: Tue, 04 Sep 2018 15:49:28 -0000

Ignore unauthenticated encrypted EAPOL-Key data in supplicant
processing. When using WPA2, these are frames that have the Encrypted
flag set, but not the MIC flag.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../wpa_supplicant-CVE-2018-14526.patch            | 44 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.6.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant-CVE-2018-14526.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant-CVE-2018-14526.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant-CVE-2018-14526.patch
new file mode 100644
index 0000000000..e800a410ea
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant-CVE-2018-14526.patch
@@ -0,0 +1,44 @@
+wpa_supplicant-2.6: Fix CVE-2018-14526
+
+[No upstream tracking] -- https://w1.fi/security/2018-1/unauthenticated-eapol-key-decryption.txt
+
+wpa: Ignore unauthenticated encrypted EAPOL-Key data
+
+Ignore unauthenticated encrypted EAPOL-Key data in supplicant
+processing. When using WPA2, these are frames that have the Encrypted
+flag set, but not the MIC flag.
+
+When using WPA2, EAPOL-Key frames that had the Encrypted flag set but
+not the MIC flag, had their data field decrypted without first verifying
+the MIC. In case the data field was encrypted using RC4 (i.e., when
+negotiating TKIP as the pairwise cipher), this meant that
+unauthenticated but decrypted data would then be processed. An adversary
+could abuse this as a decryption oracle to recover sensitive information
+in the data field of EAPOL-Key messages (e.g., the group key).
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/src/rsn_supp/wpa.c?id=3e34cfdff6b192fe337c6fb3f487f73e96582961]
+CVE: CVE-2018-14526
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
+index 3c47879..6bdf923 100644
+--- a/src/rsn_supp/wpa.c
++++ b/src/rsn_supp/wpa.c
+@@ -2016,6 +2016,17 @@ int wpa_sm_rx_eapol(struct wpa_sm *sm, const u8 *src_addr,
+
+ 	if ((sm->proto == WPA_PROTO_RSN || sm->proto == WPA_PROTO_OSEN) &&
+ 	    (key_info & WPA_KEY_INFO_ENCR_KEY_DATA)) {
++		/*
++		 * Only decrypt the Key Data field if the frame's authenticity
++		 * was verified. When using AES-SIV (FILS), the MIC flag is not
++		 * set, so this check should only be performed if mic_len != 0
++		 * which is the case in this code branch.
++		 */
++		if (!(key_info & WPA_KEY_INFO_MIC)) {
++			wpa_msg(sm->ctx->msg_ctx, MSG_WARNING,
++				"WPA: Ignore EAPOL-Key with encrypted but unauthenticated data");
++			goto out;
++		}
+ 		if (wpa_supplicant_decrypt_key_data(sm, key, ver, key_data,
+ 						    &key_data_len))
+ 			goto out;
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index e684537486..aa4c4c2da0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://key-replay-cve-multiple6.patch \
            file://key-replay-cve-multiple7.patch \
            file://key-replay-cve-multiple8.patch \
+           file://wpa_supplicant-CVE-2018-14526.patch \
           "
 SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
 SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
-- 
2.11.0


