Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6741471992
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 07:54:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8M7sTuq009676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:54:29 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Sep 2016 00:54:28 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 15:54:27 +0800
Message-ID: <1474530867-23698-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] wpa_supplicant: Security Advisory-CVE-2016-4477
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
X-List-Received-Date: Thu, 22 Sep 2016 07:54:28 -0000
Content-Type: text/plain

Add CVE-2016-4477 patch for avoiding \n and \r characters in passphrase
parameters, which allows remote attackers to cause a denial of service
(daemon outage) via a crafted WPS operation.
Patches came from http://w1.fi/security/2016-1/

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...parameter-set-with-invalid-passphrase-cha.patch | 55 ++++++++++++++++++
 ...CRED-commands-with-newline-characters-in-.patch | 66 ++++++++++++++++++++++
 ...commands-with-newline-characters-in-the-s.patch | 54 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |  3 +
 4 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
new file mode 100644
index 0000000..dd7d5f7
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
@@ -0,0 +1,55 @@
+From 73e4abb24a936014727924d8b0b2965edfc117dd Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Fri, 4 Mar 2016 18:46:41 +0200
+Subject: [PATCH 1/3] Reject psk parameter set with invalid passphrase
+ character
+
+WPA/WPA2-Personal passphrase is not allowed to include control
+characters. Reject a passphrase configuration attempt if that passphrase
+includes an invalid passphrase.
+
+This fixes an issue where wpa_supplicant could have updated the
+configuration file psk parameter with arbitrary data from the control
+interface or D-Bus interface. While those interfaces are supposed to be
+accessible only for trusted users/applications, it may be possible that
+an untrusted user has access to a management software component that
+does not validate the passphrase value before passing it to
+wpa_supplicant.
+
+This could allow such an untrusted user to inject up to 63 characters of
+almost arbitrary data into the configuration file. Such configuration
+file could result in wpa_supplicant trying to load a library (e.g.,
+opensc_engine_path, pkcs11_engine_path, pkcs11_module_path,
+load_dynamic_eap) from user controlled location when starting again.
+This would allow code from that library to be executed under the
+wpa_supplicant process privileges.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4477
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
+---
+ wpa_supplicant/config.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
+index b1c7870..fdd9643 100644
+--- a/wpa_supplicant/config.c
++++ b/wpa_supplicant/config.c
+@@ -478,6 +478,12 @@ static int wpa_config_parse_psk(const struct parse_data *data,
+ 		}
+ 		wpa_hexdump_ascii_key(MSG_MSGDUMP, "PSK (ASCII passphrase)",
+ 				      (u8 *) value, len);
++		if (has_ctrl_char((u8 *) value, len)) {
++			wpa_printf(MSG_ERROR,
++				   "Line %d: Invalid passphrase character",
++				   line);
++			return -1;
++		}
+ 		if (ssid->passphrase && os_strlen(ssid->passphrase) == len &&
+ 		    os_memcmp(ssid->passphrase, value, len) == 0) {
+ 			/* No change to the previously configured value */
+-- 
+1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
new file mode 100644
index 0000000..cad7425
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
@@ -0,0 +1,66 @@
+From b166cd84a77a6717be9600bf95378a0055d6f5a5 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Tue, 5 Apr 2016 23:33:10 +0300
+Subject: [PATCH 2/3] Reject SET_CRED commands with newline characters in the
+ string values
+
+Most of the cred block parameters are written as strings without
+filtering and if there is an embedded newline character in the value,
+unexpected configuration file data might be written.
+
+This fixes an issue where wpa_supplicant could have updated the
+configuration file cred parameter with arbitrary data from the control
+interface or D-Bus interface. While those interfaces are supposed to be
+accessible only for trusted users/applications, it may be possible that
+an untrusted user has access to a management software component that
+does not validate the credential value before passing it to
+wpa_supplicant.
+
+This could allow such an untrusted user to inject almost arbitrary data
+into the configuration file. Such configuration file could result in
+wpa_supplicant trying to load a library (e.g., opensc_engine_path,
+pkcs11_engine_path, pkcs11_module_path, load_dynamic_eap) from user
+controlled location when starting again. This would allow code from that
+library to be executed under the wpa_supplicant process privileges.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4477
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
+---
+ wpa_supplicant/config.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
+index eb97cd5..69152ef 100644
+--- a/wpa_supplicant/config.c
++++ b/wpa_supplicant/config.c
+@@ -2896,6 +2896,8 @@ int wpa_config_set_cred(struct wpa_cred *cred, const char *var,
+ 
+ 	if (os_strcmp(var, "password") == 0 &&
+ 	    os_strncmp(value, "ext:", 4) == 0) {
++		if (has_newline(value))
++			return -1;
+ 		str_clear_free(cred->password);
+ 		cred->password = os_strdup(value);
+ 		cred->ext_password = 1;
+@@ -2946,9 +2948,14 @@ int wpa_config_set_cred(struct wpa_cred *cred, const char *var,
+ 	}
+ 
+ 	val = wpa_config_parse_string(value, &len);
+-	if (val == NULL) {
++	if (val == NULL ||
++	    (os_strcmp(var, "excluded_ssid") != 0 &&
++	     os_strcmp(var, "roaming_consortium") != 0 &&
++	     os_strcmp(var, "required_roaming_consortium") != 0 &&
++	     has_newline(val))) {
+ 		wpa_printf(MSG_ERROR, "Line %d: invalid field '%s' string "
+ 			   "value '%s'.", line, var, value);
++		os_free(val);
+ 		return -1;
+ 	}
+ 
+-- 
+1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
new file mode 100644
index 0000000..5375db7
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
@@ -0,0 +1,54 @@
+From 2a3f56502b52375c3bf113cf92adfa99bad6b488 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Tue, 5 Apr 2016 23:55:48 +0300
+Subject: [PATCH 3/3] Reject SET commands with newline characters in the
+ string values
+
+Many of the global configuration parameters are written as strings
+without filtering and if there is an embedded newline character in the
+value, unexpected configuration file data might be written.
+
+This fixes an issue where wpa_supplicant could have updated the
+configuration file global parameter with arbitrary data from the control
+interface or D-Bus interface. While those interfaces are supposed to be
+accessible only for trusted users/applications, it may be possible that
+an untrusted user has access to a management software component that
+does not validate the value of a parameter before passing it to
+wpa_supplicant.
+
+This could allow such an untrusted user to inject almost arbitrary data
+into the configuration file. Such configuration file could result in
+wpa_supplicant trying to load a library (e.g., opensc_engine_path,
+pkcs11_engine_path, pkcs11_module_path, load_dynamic_eap) from user
+controlled location when starting again. This would allow code from that
+library to be executed under the wpa_supplicant process privileges.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4477
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
+---
+ wpa_supplicant/config.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
+index 69152ef..d9a1603 100644
+--- a/wpa_supplicant/config.c
++++ b/wpa_supplicant/config.c
+@@ -3764,6 +3764,12 @@ static int wpa_global_config_parse_str(const struct global_parse_data *data,
+ 		return -1;
+ 	}
+ 
++	if (has_newline(pos)) {
++		wpa_printf(MSG_ERROR, "Line %d: invalid %s value with newline",
++			   line, data->name);
++		return -1;
++	}
++
+ 	tmp = os_strdup(pos);
+ 	if (tmp == NULL)
+ 		return -1;
+-- 
+1.9.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index bfcc6cc..a4160e1 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -26,6 +26,9 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://99_wpa_supplicant \
            file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
            file://0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch \
+           file://0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch \
+           file://0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch \
+           file://0003-Reject-SET-commands-with-newline-characters-in-the-s.patch \
           "
 SRC_URI[md5sum] = "96ff75c3a514f1f324560a2376f13110"
 SRC_URI[sha256sum] = "cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"
-- 
1.9.1


