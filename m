Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6238.1622800467311052845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: poDR36U2TYZJ06mR8utriOtLMv+hGpWrp1HPcw1vNZJuH7RTBPmB62NiBSqWTsqVLhjwgSFv2N
 V/fwkylrxzLg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204289029"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="204289029"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 02:54:27 -0700
IronPort-SDR: MqzVvhWw67ZajBz+J4wsZZgOUBHSJ6z98fA3MNrZe9NzzQS0HrF+LIj5+dgfCYTyBl+LNMPgd4
 rh6QZtE3NY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="550479769"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2021 02:54:26 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/2] gnutls: fix CVE-2021-20231 CVE-2021-20232
Date: Fri,  4 Jun 2021 17:54:24 +0800
Message-Id: <20210604095424.76470-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604095424.76470-1-chee.yang.lee@intel.com>
References: <20210604095424.76470-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../gnutls/gnutls/CVE-2021-20231.patch        | 67 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2021-20232.patch        | 65 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
new file mode 100644
index 0000000000..6fe7a21e33
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
@@ -0,0 +1,67 @@
+From 15beb4b193b2714d88107e7dffca781798684e7e Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 29 Jan 2021 14:06:32 +0100
+Subject: [PATCH] key_share: avoid use-after-free around realloc
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/15beb4b193b2714d88107e7dffca781798684e7e
+Upstream-Status: Backport 
+CVE: CVE-2021-CVE-2021-20231
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/ext/key_share.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ext/key_share.c b/lib/ext/key_share.c
+index ab8abf8fe6..a8c4bb5cff 100644
+--- a/lib/ext/key_share.c
++++ b/lib/ext/key_share.c
+@@ -664,14 +664,14 @@ key_share_send_params(gnutls_session_t session,
+ {
+ 	unsigned i;
+ 	int ret;
+-	unsigned char *lengthp;
+-	unsigned int cur_length;
+ 	unsigned int generated = 0;
+ 	const gnutls_group_entry_st *group;
+ 	const version_entry_st *ver;
+ 
+ 	/* this extension is only being sent on client side */
+ 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
++		unsigned int length_pos;
++
+ 		ver = _gnutls_version_max(session);
+ 		if (unlikely(ver == NULL || ver->key_shares == 0))
+ 			return 0;
+@@ -679,16 +679,13 @@ key_share_send_params(gnutls_session_t session,
+ 		if (!have_creds_for_tls13(session))
+ 			return 0;
+ 
+-		/* write the total length later */
+-		lengthp = &extdata->data[extdata->length];
++		length_pos = extdata->length;
+ 
+ 		ret =
+ 		    _gnutls_buffer_append_prefix(extdata, 16, 0);
+ 		if (ret < 0)
+ 			return gnutls_assert_val(ret);
+ 
+-		cur_length = extdata->length;
+-
+ 		if (session->internals.hsk_flags & HSK_HRR_RECEIVED) { /* we know the group */
+ 			group = get_group(session);
+ 			if (unlikely(group == NULL))
+@@ -736,7 +733,8 @@ key_share_send_params(gnutls_session_t session,
+ 		}
+ 
+ 		/* copy actual length */
+-		_gnutls_write_uint16(extdata->length - cur_length, lengthp);
++		_gnutls_write_uint16(extdata->length - length_pos - 2,
++				     &extdata->data[length_pos]);
+ 
+ 	} else { /* server */
+ 		ver = get_version(session);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch
new file mode 100644
index 0000000000..e13917cddb
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch
@@ -0,0 +1,65 @@
+From 75a937d97f4fefc6f9b08e3791f151445f551cb3 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 29 Jan 2021 14:06:50 +0100
+Subject: [PATCH] pre_shared_key: avoid use-after-free around realloc
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/75a937d97f4fefc6f9b08e3791f151445f551cb3
+Upstream-Status: Backport 
+CVE: CVE-2021-CVE-2021-20232
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/ext/pre_shared_key.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ext/pre_shared_key.c b/lib/ext/pre_shared_key.c
+index a042c6488e..380bf39ed5 100644
+--- a/lib/ext/pre_shared_key.c
++++ b/lib/ext/pre_shared_key.c
+@@ -267,7 +267,7 @@ client_send_params(gnutls_session_t session,
+ 	size_t spos;
+ 	gnutls_datum_t username = {NULL, 0};
+ 	gnutls_datum_t user_key = {NULL, 0}, rkey = {NULL, 0};
+-	gnutls_datum_t client_hello;
++	unsigned client_hello_len;
+ 	unsigned next_idx;
+ 	const mac_entry_st *prf_res = NULL;
+ 	const mac_entry_st *prf_psk = NULL;
+@@ -428,8 +428,7 @@ client_send_params(gnutls_session_t session,
+ 	assert(extdata->length >= sizeof(mbuffer_st));
+ 	assert(ext_offset >= (ssize_t)sizeof(mbuffer_st));
+ 	ext_offset -= sizeof(mbuffer_st);
+-	client_hello.data = extdata->data+sizeof(mbuffer_st);
+-	client_hello.size = extdata->length-sizeof(mbuffer_st);
++	client_hello_len = extdata->length-sizeof(mbuffer_st);
+ 
+ 	next_idx = 0;
+ 
+@@ -440,6 +439,11 @@ client_send_params(gnutls_session_t session,
+ 	}
+ 
+ 	if (prf_res && rkey.size > 0) {
++		gnutls_datum_t client_hello;
++
++		client_hello.data = extdata->data+sizeof(mbuffer_st);
++		client_hello.size = client_hello_len;
++
+ 		ret = compute_psk_binder(session, prf_res,
+ 					 binders_len, binders_pos,
+ 					 ext_offset, &rkey, &client_hello, 1,
+@@ -474,6 +478,11 @@ client_send_params(gnutls_session_t session,
+ 	}
+ 
+ 	if (prf_psk && user_key.size > 0 && info) {
++		gnutls_datum_t client_hello;
++
++		client_hello.data = extdata->data+sizeof(mbuffer_st);
++		client_hello.size = client_hello_len;
++
+ 		ret = compute_psk_binder(session, prf_psk,
+ 					 binders_len, binders_pos,
+ 					 ext_offset, &user_key, &client_hello, 0,
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 903bb5503a..0c68da7c54 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -23,6 +23,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
            file://CVE-2020-24659.patch \
+           file://CVE-2021-20231.patch \
+           file://CVE-2021-20232.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.17.1

