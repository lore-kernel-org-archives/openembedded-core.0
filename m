Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29AD77E797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:42:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so16700514wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=k1BwiTYbhK6yt1y4lO8xvSxqlD/XdxiW3jlybFQZwl8=;
	b=t1ZrmtOjFbBAlh9bxHoP1jBkhPbNih3cHX5+Qu/dyqvI3OKZaDACcG9YeJvsMYfqdA
	lqxQKSNKJab+bynFKZLCRNj4eh73Y6le1tnK9eQWcoSLHS1NWxqk5G0oU1EPmvyuDLHV
	AnZh0v+U8+HhfMJPe9uvWGTom+ghmXB6nD/p4SjGe2AauRX/VSv+bxIRU8kVZjjQtSo2
	vc4zZqSBAYhus64AxkMfRxQxUEnCcazxXDebcpieqyzInA1rrfIjA6qXhKhqrbY1OyF4
	QU9VN7PIfd91wPHOZvCsezwVruBCpNOKtXITHw8dqgYIY49paY9CDCrPqRFdolGLRwiK
	Mw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k1BwiTYbhK6yt1y4lO8xvSxqlD/XdxiW3jlybFQZwl8=;
	b=PgXW5IF2JLgw7WdzXmRtSuWhwxglko+u7LT+Eu7tl/st5WkeWCdGNDQmFJTggzhLjJ
	E3eZstmOmvsGv2rYfTfmHVbMB4MB4wGvuF490mSJw38EejisRGIz8HRctYdFQdq47Bt5
	+t4V4jxKS6B+KJdZV7bnv7jvB9lZ052sFfBX7J1yMyjzpVCfGcbqBxFkjfrwM/KOkSvp
	2yPocmNSLbI7DQ7jx5G0D9DDC3gt0Hy3egdl8ma4Sm9nfqDbH29veWudtEbsceZN3LDo
	22oWG6lzBmqERgK+mQaSKMiIe/JOGtQTRPnqOZ19vB0Dg3lCvndztxb4xrNPWa6puk4n
	Rp1Q==
X-Gm-Message-State: APjAAAXSTwx5U/UNMsZMqDEhkTpNc2C1aVeZ3a02GTaMe8TKYoa0tgdU
	1FmZBFnmmIlN48dwWRkbUU8QxWySuAg=
X-Google-Smtp-Source: APXvYqxtmXzF7hLd/Y01wNabtF0TuXDqK02NClbvcFOhq9VO+MeN9MZ6b+DyVKZlJLW4NV9rTmnO/A==
X-Received: by 2002:a5d:6205:: with SMTP id y5mr23389849wru.340.1560343328447; 
	Wed, 12 Jun 2019 05:42:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y2sm18100098wra.58.2019.06.12.05.42.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 05:42:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 13:42:04 +0100
Message-Id: <20190612124204.5715-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bluez: fix test case failures with GCC 9
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
X-List-Received-Date: Wed, 12 Jun 2019 12:42:08 -0000

[ YOCTO #13366 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
 .../bluez5/bluez5/gcc9-fixes.patch                 | 301 +++++++++++++++++++++
 2 files changed, 302 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a4c2f3a816d..8f321638ce7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -56,6 +56,7 @@ SRC_URI = "\
     file://0001-test-gatt-Fix-hung-issue.patch \
     file://0001-Makefile.am-Fix-a-race-issue-for-tools.patch \
     file://CVE-2018-10910.patch \
+    file://gcc9-fixes.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch b/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch
new file mode 100644
index 00000000000..ca678e601e7
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch
@@ -0,0 +1,301 @@
+Backported commit from upstream master branch (post 5.50 release), which
+resolves assertion failures in several unit tests.
+
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/patch/?id=0be5246170
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/unit/test-avctp.c b/unit/test-avctp.c
+index 3bc3569..24de663 100644
+--- a/unit/test-avctp.c
++++ b/unit/test-avctp.c
+@@ -43,7 +43,7 @@
+ 
+ struct test_pdu {
+ 	bool valid;
+-	const uint8_t *data;
++	uint8_t *data;
+ 	size_t size;
+ };
+ 
+@@ -66,7 +66,7 @@ struct context {
+ #define raw_pdu(args...)					\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -91,6 +91,11 @@ static void test_debug(const char *str, void *user_data)
+ static void test_free(gconstpointer user_data)
+ {
+ 	const struct test_data *data = user_data;
++	struct test_pdu *pdu;
++	int i;
++
++	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
++		g_free(pdu->data);
+ 
+ 	g_free(data->test_name);
+ 	g_free(data->pdu_list);
+diff --git a/unit/test-avdtp.c b/unit/test-avdtp.c
+index dd8aed7..e2c951a 100644
+--- a/unit/test-avdtp.c
++++ b/unit/test-avdtp.c
+@@ -47,7 +47,7 @@
+ struct test_pdu {
+ 	bool valid;
+ 	bool fragmented;
+-	const uint8_t *data;
++	uint8_t *data;
+ 	size_t size;
+ };
+ 
+@@ -61,7 +61,7 @@ struct test_data {
+ #define raw_pdu(args...) \
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -69,7 +69,7 @@ struct test_data {
+ 	{							\
+ 		.valid = true,					\
+ 		.fragmented = true,				\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -81,7 +81,7 @@ struct test_data {
+ 		static struct test_data data;				\
+ 		data.test_name = g_strdup(name);			\
+ 		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+-		tester_add(name, &data, NULL, function, NULL);		\
++		tester_add(name, &data, NULL, function, NULL);	\
+ 	} while (0)
+ 
+ struct context {
+@@ -109,6 +109,11 @@ static void test_debug(const char *str, void *user_data)
+ static void test_free(gconstpointer user_data)
+ {
+ 	const struct test_data *data = user_data;
++	struct test_pdu *pdu;
++	int i;
++
++	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
++		g_free(pdu->data);
+ 
+ 	g_free(data->test_name);
+ 	g_free(data->pdu_list);
+diff --git a/unit/test-avrcp.c b/unit/test-avrcp.c
+index 01307e6..f1aa353 100644
+--- a/unit/test-avrcp.c
++++ b/unit/test-avrcp.c
+@@ -49,7 +49,7 @@ struct test_pdu {
+ 	bool fragmented;
+ 	bool continuing;
+ 	bool browse;
+-	const uint8_t *data;
++	uint8_t *data;
+ 	size_t size;
+ };
+ 
+@@ -74,7 +74,7 @@ struct context {
+ #define raw_pdu(args...)					\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -82,7 +82,7 @@ struct context {
+ 	{							\
+ 		.valid = true,					\
+ 		.browse = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -90,7 +90,7 @@ struct context {
+ 	{							\
+ 		.valid = true,					\
+ 		.fragmented = true,				\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -98,7 +98,7 @@ struct context {
+ 	{							\
+ 		.valid = true,					\
+ 		.continuing = true,				\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -123,6 +123,11 @@ static void test_debug(const char *str, void *user_data)
+ static void test_free(gconstpointer user_data)
+ {
+ 	const struct test_data *data = user_data;
++	struct test_pdu *pdu;
++	int i;
++
++	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
++		g_free(pdu->data);
+ 
+ 	g_free(data->test_name);
+ 	g_free(data->pdu_list);
+diff --git a/unit/test-gatt.c b/unit/test-gatt.c
+index c7e28f8..d49f7a0 100644
+--- a/unit/test-gatt.c
++++ b/unit/test-gatt.c
+@@ -48,7 +48,7 @@
+ 
+ struct test_pdu {
+ 	bool valid;
+-	const uint8_t *data;
++	uint8_t *data;
+ 	size_t size;
+ };
+ 
+@@ -86,7 +86,7 @@ struct context {
+ #define raw_pdu(args...)					\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -306,6 +306,11 @@ static bt_uuid_t uuid_char_128 = {
+ static void test_free(gconstpointer user_data)
+ {
+ 	const struct test_data *data = user_data;
++	struct test_pdu *pdu;
++	int i;
++
++	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
++		g_free(pdu->data);
+ 
+ 	g_free(data->test_name);
+ 	g_free(data->pdu_list);
+@@ -1911,6 +1916,8 @@ static void test_server(gconstpointer data)
+ 	g_assert_cmpint(len, ==, pdu.size);
+ 
+ 	util_hexdump('<', pdu.data, len, test_debug, "GATT: ");
++
++	g_free(pdu.data);
+ }
+ 
+ static void test_search_primary(gconstpointer data)
+diff --git a/unit/test-hfp.c b/unit/test-hfp.c
+index f2b9622..890eee6 100644
+--- a/unit/test-hfp.c
++++ b/unit/test-hfp.c
+@@ -43,7 +43,7 @@ struct context {
+ 
+ struct test_pdu {
+ 	bool valid;
+-	const uint8_t *data;
++	uint8_t *data;
+ 	size_t size;
+ 	enum hfp_gw_cmd_type type;
+ 	bool fragmented;
+@@ -63,7 +63,7 @@ struct test_data {
+ #define raw_pdu(args...)					\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 	}
+ 
+@@ -75,7 +75,7 @@ struct test_data {
+ #define type_pdu(cmd_type, args...)				\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 		.type = cmd_type,				\
+ 	}
+@@ -83,7 +83,7 @@ struct test_data {
+ #define frg_pdu(args...)					\
+ 	{							\
+ 		.valid = true,					\
+-		.data = data(args),				\
++		.data = g_memdup(data(args), sizeof(data(args))), \
+ 		.size = sizeof(data(args)),			\
+ 		.fragmented = true,				\
+ 	}
+@@ -119,6 +119,11 @@ struct test_data {
+ static void test_free(gconstpointer user_data)
+ {
+ 	const struct test_data *data = user_data;
++	struct test_pdu *pdu;
++	int i;
++
++	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
++		g_free(pdu->data);
+ 
+ 	g_free(data->test_name);
+ 	g_free(data->pdu_list);
+diff --git a/unit/test-hog.c b/unit/test-hog.c
+index d117968..25bdb42 100644
+--- a/unit/test-hog.c
++++ b/unit/test-hog.c
+@@ -68,11 +68,11 @@ struct context {
+ 
+ #define data(args...) ((const unsigned char[]) { args })
+ 
+-#define raw_pdu(args...)    \
+-{      \
+-	.valid = true,		\
+-	.data = data(args), \
+-	.size = sizeof(data(args)),\
++#define raw_pdu(args...)					\
++{								\
++	.valid = true,						\
++	.data = g_memdup(data(args), sizeof(data(args))),	\
++	.size = sizeof(data(args)),				\
+ }
+ 
+ #define false_pdu()	\
+diff --git a/unit/test-sdp.c b/unit/test-sdp.c
+index ac921a9..c71ee1f 100644
+--- a/unit/test-sdp.c
++++ b/unit/test-sdp.c
+@@ -59,14 +59,14 @@ struct test_data {
+ #define raw_pdu(args...) \
+ 	{							\
+ 		.valid = true,					\
+-		.raw_data = raw_data(args),			\
++		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
+ 		.raw_size = sizeof(raw_data(args)),		\
+ 	}
+ 
+ #define raw_pdu_cont(cont, args...) \
+ 	{							\
+ 		.valid = true,					\
+-		.raw_data = raw_data(args),			\
++		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
+ 		.raw_size = sizeof(raw_data(args)),		\
+ 		.cont_len = cont,				\
+ 	}
+@@ -103,7 +103,7 @@ struct test_data_de {
+ #define define_test_de_attr(name, input, exp) \
+ 	do {								\
+ 		static struct test_data_de data;			\
+-		data.input_data = input;				\
++		data.input_data = g_memdup(input, sizeof(input));	\
+ 		data.input_size = sizeof(input);			\
+ 		data.expected = exp;					\
+ 		tester_add("/sdp/DE/ATTR/" name, &data,	NULL,		\
-- 
2.11.0


