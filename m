Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 74A1171B90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:50:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13862121"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Dec 2016 15:50:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AA7E5477B1C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:50:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 13 Dec 2016 15:50:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 15:49:44 +0800
Message-ID: <1481615384-118263-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: AA7E5477B1C1.A959F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] wpa-supplicant: 2.5 -> 2.6
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
X-List-Received-Date: Tue, 13 Dec 2016 07:50:52 -0000
Content-Type: text/plain

1)Upgrade wpa-supplicant from 2.5 to 2.6.
2)Delete 5 patches below, since they are integrated upstream. 
  0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
  0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
  0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
  0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
  0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
3)License checksum changes are not related to license changes.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...parameter-set-with-invalid-passphrase-cha.patch | 55 --------------
 ...ject-a-Credential-with-invalid-passphrase.patch | 86 ----------------------
 ...CRED-commands-with-newline-characters-in-.patch | 66 -----------------
 ...ines-from-wpa_supplicant-config-network-o.patch | 86 ----------------------
 ...commands-with-newline-characters-in-the-s.patch | 54 --------------
 ...wpa-supplicant_2.5.bb => wpa-supplicant_2.6.bb} | 15 ++--
 6 files changed, 5 insertions(+), 357 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.5.bb => wpa-supplicant_2.6.bb} (82%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
deleted file mode 100644
index dd7d5f7..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 73e4abb24a936014727924d8b0b2965edfc117dd Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Fri, 4 Mar 2016 18:46:41 +0200
-Subject: [PATCH 1/3] Reject psk parameter set with invalid passphrase
- character
-
-WPA/WPA2-Personal passphrase is not allowed to include control
-characters. Reject a passphrase configuration attempt if that passphrase
-includes an invalid passphrase.
-
-This fixes an issue where wpa_supplicant could have updated the
-configuration file psk parameter with arbitrary data from the control
-interface or D-Bus interface. While those interfaces are supposed to be
-accessible only for trusted users/applications, it may be possible that
-an untrusted user has access to a management software component that
-does not validate the passphrase value before passing it to
-wpa_supplicant.
-
-This could allow such an untrusted user to inject up to 63 characters of
-almost arbitrary data into the configuration file. Such configuration
-file could result in wpa_supplicant trying to load a library (e.g.,
-opensc_engine_path, pkcs11_engine_path, pkcs11_module_path,
-load_dynamic_eap) from user controlled location when starting again.
-This would allow code from that library to be executed under the
-wpa_supplicant process privileges.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4477
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
----
- wpa_supplicant/config.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
-index b1c7870..fdd9643 100644
---- a/wpa_supplicant/config.c
-+++ b/wpa_supplicant/config.c
-@@ -478,6 +478,12 @@ static int wpa_config_parse_psk(const struct parse_data *data,
- 		}
- 		wpa_hexdump_ascii_key(MSG_MSGDUMP, "PSK (ASCII passphrase)",
- 				      (u8 *) value, len);
-+		if (has_ctrl_char((u8 *) value, len)) {
-+			wpa_printf(MSG_ERROR,
-+				   "Line %d: Invalid passphrase character",
-+				   line);
-+			return -1;
-+		}
- 		if (ssid->passphrase && os_strlen(ssid->passphrase) == len &&
- 		    os_memcmp(ssid->passphrase, value, len) == 0) {
- 			/* No change to the previously configured value */
--- 
-1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
deleted file mode 100644
index db222e4..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Fri, 4 Mar 2016 17:20:18 +0200
-Subject: [PATCH 1/2] WPS: Reject a Credential with invalid passphrase
-
-WPA/WPA2-Personal passphrase is not allowed to include control
-characters. Reject a Credential received from a WPS Registrar both as
-STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
-WPA2PSK authentication type and includes an invalid passphrase.
-
-This fixes an issue where hostapd or wpa_supplicant could have updated
-the configuration file PSK/passphrase parameter with arbitrary data from
-an external device (Registrar) that may not be fully trusted. Should
-such data include a newline character, the resulting configuration file
-could become invalid and fail to be parsed.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4476
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
----
- src/utils/common.c         | 12 ++++++++++++
- src/utils/common.h         |  1 +
- src/wps/wps_attr_process.c | 10 ++++++++++
- 3 files changed, 23 insertions(+)
-
-diff --git a/src/utils/common.c b/src/utils/common.c
-index 450e2c6..27b7c02 100644
---- a/src/utils/common.c
-+++ b/src/utils/common.c
-@@ -697,6 +697,18 @@ int is_hex(const u8 *data, size_t len)
- }
- 
- 
-+int has_ctrl_char(const u8 *data, size_t len)
-+{
-+	size_t i;
-+
-+	for (i = 0; i < len; i++) {
-+		if (data[i] < 32 || data[i] == 127)
-+			return 1;
-+	}
-+	return 0;
-+}
-+
-+
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len)
-diff --git a/src/utils/common.h b/src/utils/common.h
-index 701dbb2..a972240 100644
---- a/src/utils/common.h
-+++ b/src/utils/common.h
-@@ -488,6 +488,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
- 
- char * wpa_config_parse_string(const char *value, size_t *len);
- int is_hex(const u8 *data, size_t len);
-+int has_ctrl_char(const u8 *data, size_t len);
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len);
-diff --git a/src/wps/wps_attr_process.c b/src/wps/wps_attr_process.c
-index eadb22f..e8c4579 100644
---- a/src/wps/wps_attr_process.c
-+++ b/src/wps/wps_attr_process.c
-@@ -229,6 +229,16 @@ static int wps_workaround_cred_key(struct wps_credential *cred)
- 		cred->key_len--;
- #endif /* CONFIG_WPS_STRICT */
- 	}
-+
-+
-+	if (cred->auth_type & (WPS_AUTH_WPAPSK | WPS_AUTH_WPA2PSK) &&
-+	    (cred->key_len < 8 || has_ctrl_char(cred->key, cred->key_len))) {
-+		wpa_printf(MSG_INFO, "WPS: Reject credential with invalid WPA/WPA2-Personal passphrase");
-+		wpa_hexdump_ascii_key(MSG_INFO, "WPS: Network Key",
-+				      cred->key, cred->key_len);
-+		return -1;
-+	}
-+
- 	return 0;
- }
- 
---
-1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
deleted file mode 100644
index cad7425..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From b166cd84a77a6717be9600bf95378a0055d6f5a5 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Tue, 5 Apr 2016 23:33:10 +0300
-Subject: [PATCH 2/3] Reject SET_CRED commands with newline characters in the
- string values
-
-Most of the cred block parameters are written as strings without
-filtering and if there is an embedded newline character in the value,
-unexpected configuration file data might be written.
-
-This fixes an issue where wpa_supplicant could have updated the
-configuration file cred parameter with arbitrary data from the control
-interface or D-Bus interface. While those interfaces are supposed to be
-accessible only for trusted users/applications, it may be possible that
-an untrusted user has access to a management software component that
-does not validate the credential value before passing it to
-wpa_supplicant.
-
-This could allow such an untrusted user to inject almost arbitrary data
-into the configuration file. Such configuration file could result in
-wpa_supplicant trying to load a library (e.g., opensc_engine_path,
-pkcs11_engine_path, pkcs11_module_path, load_dynamic_eap) from user
-controlled location when starting again. This would allow code from that
-library to be executed under the wpa_supplicant process privileges.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4477
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
----
- wpa_supplicant/config.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
-index eb97cd5..69152ef 100644
---- a/wpa_supplicant/config.c
-+++ b/wpa_supplicant/config.c
-@@ -2896,6 +2896,8 @@ int wpa_config_set_cred(struct wpa_cred *cred, const char *var,
- 
- 	if (os_strcmp(var, "password") == 0 &&
- 	    os_strncmp(value, "ext:", 4) == 0) {
-+		if (has_newline(value))
-+			return -1;
- 		str_clear_free(cred->password);
- 		cred->password = os_strdup(value);
- 		cred->ext_password = 1;
-@@ -2946,9 +2948,14 @@ int wpa_config_set_cred(struct wpa_cred *cred, const char *var,
- 	}
- 
- 	val = wpa_config_parse_string(value, &len);
--	if (val == NULL) {
-+	if (val == NULL ||
-+	    (os_strcmp(var, "excluded_ssid") != 0 &&
-+	     os_strcmp(var, "roaming_consortium") != 0 &&
-+	     os_strcmp(var, "required_roaming_consortium") != 0 &&
-+	     has_newline(val))) {
- 		wpa_printf(MSG_ERROR, "Line %d: invalid field '%s' string "
- 			   "value '%s'.", line, var, value);
-+		os_free(val);
- 		return -1;
- 	}
- 
--- 
-1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
deleted file mode 100644
index cc7b01a..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 0fe5a234240a108b294a87174ad197f6b5cb38e9 Mon Sep 17 00:00:00 2001
-From: Paul Stewart <pstew@google.com>
-Date: Thu, 3 Mar 2016 15:40:19 -0800
-Subject: [PATCH 2/2] Remove newlines from wpa_supplicant config network
- output
-
-Spurious newlines output while writing the config file can corrupt the
-wpa_supplicant configuration. Avoid writing these for the network block
-parameters. This is a generic filter that cover cases that may not have
-been explicitly addressed with a more specific commit to avoid control
-characters in the psk parameter.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4476
-
-Signed-off-by: Paul Stewart <pstew@google.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi.wrs.com>
----
- src/utils/common.c      | 11 +++++++++++
- src/utils/common.h      |  1 +
- wpa_supplicant/config.c | 15 +++++++++++++--
- 3 files changed, 25 insertions(+), 2 deletions(-)
-
-diff --git a/src/utils/common.c b/src/utils/common.c
-index 27b7c02..9856463 100644
---- a/src/utils/common.c
-+++ b/src/utils/common.c
-@@ -709,6 +709,17 @@ int has_ctrl_char(const u8 *data, size_t len)
- }
- 
- 
-+int has_newline(const char *str)
-+{
-+	while (*str) {
-+		if (*str == '\n' || *str == '\r')
-+			return 1;
-+		str++;
-+	}
-+	return 0;
-+}
-+
-+
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len)
-diff --git a/src/utils/common.h b/src/utils/common.h
-index a972240..d19927b 100644
---- a/src/utils/common.h
-+++ b/src/utils/common.h
-@@ -489,6 +489,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
- char * wpa_config_parse_string(const char *value, size_t *len);
- int is_hex(const u8 *data, size_t len);
- int has_ctrl_char(const u8 *data, size_t len);
-+int has_newline(const char *str);
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len);
-diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
-index fdd9643..eb97cd5 100644
---- a/wpa_supplicant/config.c
-+++ b/wpa_supplicant/config.c
-@@ -2699,8 +2699,19 @@ char * wpa_config_get(struct wpa_ssid *ssid, const char *var)
- 
- 	for (i = 0; i < NUM_SSID_FIELDS; i++) {
- 		const struct parse_data *field = &ssid_fields[i];
--		if (os_strcmp(var, field->name) == 0)
--			return field->writer(field, ssid);
-+		if (os_strcmp(var, field->name) == 0) {
-+			char *ret = field->writer(field, ssid);
-+
-+			if (ret && has_newline(ret)) {
-+				wpa_printf(MSG_ERROR,
-+					   "Found newline in value for %s; not returning it",
-+					   var);
-+				os_free(ret);
-+				ret = NULL;
-+			}
-+
-+			return ret;
-+		}
- 	}
- 
- 	return NULL;
---
-1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
deleted file mode 100644
index 5375db7..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 2a3f56502b52375c3bf113cf92adfa99bad6b488 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Tue, 5 Apr 2016 23:55:48 +0300
-Subject: [PATCH 3/3] Reject SET commands with newline characters in the
- string values
-
-Many of the global configuration parameters are written as strings
-without filtering and if there is an embedded newline character in the
-value, unexpected configuration file data might be written.
-
-This fixes an issue where wpa_supplicant could have updated the
-configuration file global parameter with arbitrary data from the control
-interface or D-Bus interface. While those interfaces are supposed to be
-accessible only for trusted users/applications, it may be possible that
-an untrusted user has access to a management software component that
-does not validate the value of a parameter before passing it to
-wpa_supplicant.
-
-This could allow such an untrusted user to inject almost arbitrary data
-into the configuration file. Such configuration file could result in
-wpa_supplicant trying to load a library (e.g., opensc_engine_path,
-pkcs11_engine_path, pkcs11_module_path, load_dynamic_eap) from user
-controlled location when starting again. This would allow code from that
-library to be executed under the wpa_supplicant process privileges.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4477
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
----
- wpa_supplicant/config.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
-index 69152ef..d9a1603 100644
---- a/wpa_supplicant/config.c
-+++ b/wpa_supplicant/config.c
-@@ -3764,6 +3764,12 @@ static int wpa_global_config_parse_str(const struct global_parse_data *data,
- 		return -1;
- 	}
- 
-+	if (has_newline(pos)) {
-+		wpa_printf(MSG_ERROR, "Line %d: invalid %s value with newline",
-+			   line, data->name);
-+		return -1;
-+	}
-+
- 	tmp = os_strdup(pos);
- 	if (tmp == NULL)
- 		return -1;
--- 
-1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
similarity index 82%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index a4160e1..b96f9d2 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://w1.fi/wpa_supplicant/"
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=36b27801447e0662ee0138d17fe93880 \
-                    file://README;beginline=1;endline=56;md5=7f393579f8b109fe91f3b9765d26c7d3 \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=3430fda79f2ba1dd545f0b3c4d6e4d24"
+LIC_FILES_CHKSUM = "file://COPYING;md5=292eece3f2ebbaa25608eed8464018a3 \
+                    file://README;beginline=1;endline=56;md5=3f01d778be8f953962388307ee38ed2b \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=4061612fc5715696134e3baf933e8aba"
 DEPENDS = "dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -24,14 +24,9 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
-           file://0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch \
-           file://0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch \
-           file://0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch \
-           file://0003-Reject-SET-commands-with-newline-characters-in-the-s.patch \
           "
-SRC_URI[md5sum] = "96ff75c3a514f1f324560a2376f13110"
-SRC_URI[sha256sum] = "cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"
+SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
+SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
-- 
2.7.4




