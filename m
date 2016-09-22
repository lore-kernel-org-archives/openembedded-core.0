Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC6060616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 07:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8M7sMFP016547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:54:23 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Sep 2016 00:54:21 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 15:54:20 +0800
Message-ID: <1474530860-23655-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] wpa_supplicant: Security Advisory-CVE-2016-4476
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
X-List-Received-Date: Thu, 22 Sep 2016 07:54:24 -0000
Content-Type: text/plain

Add CVE-2016-4476 patch for avoiding \n and \r characters in passphrase
parameters, which allows remote attackers to cause a denial of service
(daemon outage) via a crafted WPS operation.
Patches came from http://w1.fi/security/2016-1/

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ject-a-Credential-with-invalid-passphrase.patch | 86 ++++++++++++++++++++++
 ...ines-from-wpa_supplicant-config-network-o.patch | 86 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |  2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
new file mode 100644
index 0000000..db222e4
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
@@ -0,0 +1,86 @@
+From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Fri, 4 Mar 2016 17:20:18 +0200
+Subject: [PATCH 1/2] WPS: Reject a Credential with invalid passphrase
+
+WPA/WPA2-Personal passphrase is not allowed to include control
+characters. Reject a Credential received from a WPS Registrar both as
+STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
+WPA2PSK authentication type and includes an invalid passphrase.
+
+This fixes an issue where hostapd or wpa_supplicant could have updated
+the configuration file PSK/passphrase parameter with arbitrary data from
+an external device (Registrar) that may not be fully trusted. Should
+such data include a newline character, the resulting configuration file
+could become invalid and fail to be parsed.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4476
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
+---
+ src/utils/common.c         | 12 ++++++++++++
+ src/utils/common.h         |  1 +
+ src/wps/wps_attr_process.c | 10 ++++++++++
+ 3 files changed, 23 insertions(+)
+
+diff --git a/src/utils/common.c b/src/utils/common.c
+index 450e2c6..27b7c02 100644
+--- a/src/utils/common.c
++++ b/src/utils/common.c
+@@ -697,6 +697,18 @@ int is_hex(const u8 *data, size_t len)
+ }
+ 
+ 
++int has_ctrl_char(const u8 *data, size_t len)
++{
++	size_t i;
++
++	for (i = 0; i < len; i++) {
++		if (data[i] < 32 || data[i] == 127)
++			return 1;
++	}
++	return 0;
++}
++
++
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len)
+diff --git a/src/utils/common.h b/src/utils/common.h
+index 701dbb2..a972240 100644
+--- a/src/utils/common.h
++++ b/src/utils/common.h
+@@ -488,6 +488,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
+ 
+ char * wpa_config_parse_string(const char *value, size_t *len);
+ int is_hex(const u8 *data, size_t len);
++int has_ctrl_char(const u8 *data, size_t len);
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len);
+diff --git a/src/wps/wps_attr_process.c b/src/wps/wps_attr_process.c
+index eadb22f..e8c4579 100644
+--- a/src/wps/wps_attr_process.c
++++ b/src/wps/wps_attr_process.c
+@@ -229,6 +229,16 @@ static int wps_workaround_cred_key(struct wps_credential *cred)
+ 		cred->key_len--;
+ #endif /* CONFIG_WPS_STRICT */
+ 	}
++
++
++	if (cred->auth_type & (WPS_AUTH_WPAPSK | WPS_AUTH_WPA2PSK) &&
++	    (cred->key_len < 8 || has_ctrl_char(cred->key, cred->key_len))) {
++		wpa_printf(MSG_INFO, "WPS: Reject credential with invalid WPA/WPA2-Personal passphrase");
++		wpa_hexdump_ascii_key(MSG_INFO, "WPS: Network Key",
++				      cred->key, cred->key_len);
++		return -1;
++	}
++
+ 	return 0;
+ }
+ 
+--
+1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
new file mode 100644
index 0000000..cc7b01a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
@@ -0,0 +1,86 @@
+From 0fe5a234240a108b294a87174ad197f6b5cb38e9 Mon Sep 17 00:00:00 2001
+From: Paul Stewart <pstew@google.com>
+Date: Thu, 3 Mar 2016 15:40:19 -0800
+Subject: [PATCH 2/2] Remove newlines from wpa_supplicant config network
+ output
+
+Spurious newlines output while writing the config file can corrupt the
+wpa_supplicant configuration. Avoid writing these for the network block
+parameters. This is a generic filter that cover cases that may not have
+been explicitly addressed with a more specific commit to avoid control
+characters in the psk parameter.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4476
+
+Signed-off-by: Paul Stewart <pstew@google.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi.wrs.com>
+---
+ src/utils/common.c      | 11 +++++++++++
+ src/utils/common.h      |  1 +
+ wpa_supplicant/config.c | 15 +++++++++++++--
+ 3 files changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/src/utils/common.c b/src/utils/common.c
+index 27b7c02..9856463 100644
+--- a/src/utils/common.c
++++ b/src/utils/common.c
+@@ -709,6 +709,17 @@ int has_ctrl_char(const u8 *data, size_t len)
+ }
+ 
+ 
++int has_newline(const char *str)
++{
++	while (*str) {
++		if (*str == '\n' || *str == '\r')
++			return 1;
++		str++;
++	}
++	return 0;
++}
++
++
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len)
+diff --git a/src/utils/common.h b/src/utils/common.h
+index a972240..d19927b 100644
+--- a/src/utils/common.h
++++ b/src/utils/common.h
+@@ -489,6 +489,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
+ char * wpa_config_parse_string(const char *value, size_t *len);
+ int is_hex(const u8 *data, size_t len);
+ int has_ctrl_char(const u8 *data, size_t len);
++int has_newline(const char *str);
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len);
+diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
+index fdd9643..eb97cd5 100644
+--- a/wpa_supplicant/config.c
++++ b/wpa_supplicant/config.c
+@@ -2699,8 +2699,19 @@ char * wpa_config_get(struct wpa_ssid *ssid, const char *var)
+ 
+ 	for (i = 0; i < NUM_SSID_FIELDS; i++) {
+ 		const struct parse_data *field = &ssid_fields[i];
+-		if (os_strcmp(var, field->name) == 0)
+-			return field->writer(field, ssid);
++		if (os_strcmp(var, field->name) == 0) {
++			char *ret = field->writer(field, ssid);
++
++			if (ret && has_newline(ret)) {
++				wpa_printf(MSG_ERROR,
++					   "Found newline in value for %s; not returning it",
++					   var);
++				os_free(ret);
++				ret = NULL;
++			}
++
++			return ret;
++		}
+ 	}
+ 
+ 	return NULL;
+--
+1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index 935c8af..bfcc6cc 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
+           file://0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch \
           "
 SRC_URI[md5sum] = "96ff75c3a514f1f324560a2376f13110"
 SRC_URI[sha256sum] = "cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"
-- 
1.9.1


