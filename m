Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C83C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 07:16:14 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1122.1787901364638267037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 00:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Olm29F/l;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6f9e2f681so4548635ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787901364; x=1788506164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwTTkECFWb9ki77WkJ+7x+vhu9NXEZUNp6Fx8a7htuE=;
        b=Olm29F/lzVUcaKrUhpiL60ndr3cgmueDjBFHYaRudXi8fD8wLDZPsnKbmoBwgI721t
         To+RmrmEl3jwdwWX/GGRigbCcacb933ATPPoz4X4O8gagFNcItZvmok7zgcJu6G6SAal
         FVV/jXAmMFbvdBo1YJip54Osfai1GxqdcOZhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901364; x=1788506164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwTTkECFWb9ki77WkJ+7x+vhu9NXEZUNp6Fx8a7htuE=;
        b=F3s82Lp3lTfboZU/RDwlKOzAEsS6Z5VWAUrcQIEeQzMpBU7glhm+ugATFd4zuJfzYZ
         uKoCZSm9/IbyYoc0vHNH8sYfXIpCp5lrbL1Y/wfcAVPtbfihNdJGosCzLoi/aQ9xbSxx
         idzOEagg6z0TIQLR/9LZz3ZfjkKMoDBJUBYR+XitmdrO4ogUnJG09NpkEr3pahayAOc0
         GcGsmJPvvBhw3PRfeMNQab5k4l9HHh1mjgcNUsQcPlmDFgI0BTMnzZUjQUpk66lIZ7p7
         9i4Z1A3DsopuMCYxb6euSERik+5Wpvev3PpfoEcUynmrswIglcoyP/zY5co2o3X7fABm
         6gJA==
X-Gm-Message-State: AFuF++kr/Ms5+b9RlP5TE4wZ1u15CaoNGCw5St+ovvBGn3Q41qunTejv
	jJh6uEB8La/8c03OxPOeFHnJGMHvD8/8jw26XAxdmOUa+6xb1mRo1Ixtz4vH5zgADEusFxZ8KZo
	JyCCt
X-Gm-Gg: AR+sD1144W5uI0yGtJg1qDlJbQFwjFMPquF3bCVOjucf8+30XdaZytQMIHBxNpra2ou
	bnhgmMLSJcF+zLuCqhe8itkJahMF4z1uEjIDn013s1GYuc5jvh6y2i+0IVpF/OrBLJZVfjYU0jY
	veR3lKgheKVpKZ5+cTh6aiaulJicsme0K0i/SmMpGmzhUnnsTKg8iZD/zFUpemI6Eo7ohnHQVuP
	cA8sDA4MY/+ZlLm9NuBN3mdxOSk9TgYfVXmk8Taw+cQU40WPzIKt/MUqV14FSqd35QweS/HKIIn
	hKVffISLeKiljoN/ohdf7s91O185X7kyp/yqk8ylYP0KJk/OpjNt9LerfW+LLWtGlj4tj8oMYNk
	R9HsELLSLkxx5euwg9689BQzyXBIupjrgnATyQwM5CeePdyQHI+Z0jCAAeqdGggoBRJ1MAKikUN
	g2SWBKWkeRtI9nO5fD58jUTOk+oKfjwgJ3CwduoB36VJdcJOnHnJYpy2ybbW8BMHvkalbSs6iGf
	ABWNw==
X-Received: by 2002:a17:903:1850:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2d74dddceebmr101284745ad.11.1787901363515;
        Fri, 28 Aug 2026 00:16:03 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:2ce6:cc91:125f:50ad:f5e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm3061071eec.13.2026.08.28.00.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:16:02 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/2] p11-kit: Fix CVE-2026-13757
Date: Fri, 28 Aug 2026 12:45:52 +0530
Message-ID: <20260828071553.70382-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 07:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244517

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-13757
[2] https://ubuntu.com/security/CVE-2026-13757

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../p11-kit/files/CVE-2026-13757.patch        | 265 ++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-13757.patch

diff --git a/meta/recipes-support/p11-kit/files/CVE-2026-13757.patch b/meta/recipes-support/p11-kit/files/CVE-2026-13757.patch
new file mode 100644
index 0000000000..2f9aa080bb
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/CVE-2026-13757.patch
@@ -0,0 +1,265 @@
+From 0eedd4ddd7c924f9cbb4ac496b3fda699435c3cf Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Thu, 2 Jul 2026 10:54:47 +0200
+Subject: [PATCH] rpc: add recursion depth limit into RPC attribute parsing
+ (CVE-2026-13757)
+
+A DoS was possible when client sent request to a server with deeply
+nested attributes causing stack exhaustion on the server.
+This patch adds a recursion limit on all server entry points to
+prevent such attacks.
+
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+
+Upstream-Status: Backport [import from ubuntu p11-kit_0.25.3-4ubuntu2.2.debian.tar.xz
+Upstream commit https://github.com/p11-glue/p11-kit/commit/0eedd4ddd7c924f9cbb4ac496b3fda699435c3cf]
+CVE: CVE-2026-13757
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ p11-kit/rpc-message.c      | 39 +++++++++++++++++++++++++++++++++-----
+ p11-kit/rpc-message.h      | 10 +++++++++-
+ p11-kit/test-rpc-message.c | 39 ++++++++++++++++++++++++++++++++++++--
+ p11-kit/test-rpc.c         | 27 ++++++++++++++++++++++++++
+ 4 files changed, 107 insertions(+), 8 deletions(-)
+
+diff --git a/p11-kit/rpc-message.c b/p11-kit/rpc-message.c
+index 09d7f33..d6f0aad 100644
+--- a/p11-kit/rpc-message.c
++++ b/p11-kit/rpc-message.c
+@@ -903,6 +903,15 @@ map_attribute_to_value_type (CK_ATTRIBUTE_TYPE type)
+ 	}
+ }
+ 
++static bool
++p11_rpc_buffer_get_attribute_array_value_wrapper (p11_buffer *buffer,
++						  size_t *offset,
++						  void *value,
++						  CK_ULONG *value_length)
++{
++	return p11_rpc_buffer_get_attribute_array_value (buffer, offset, value, value_length, 0);
++}
++
+ typedef struct {
+ 	p11_rpc_value_type type;
+ 	p11_rpc_value_encoder encode;
+@@ -912,7 +921,7 @@ typedef struct {
+ static p11_rpc_attribute_serializer p11_rpc_attribute_serializers[] = {
+ 	{ P11_RPC_VALUE_BYTE, p11_rpc_buffer_add_byte_value, p11_rpc_buffer_get_byte_value },
+ 	{ P11_RPC_VALUE_ULONG, p11_rpc_buffer_add_ulong_value, p11_rpc_buffer_get_ulong_value },
+-	{ P11_RPC_VALUE_ATTRIBUTE_ARRAY, p11_rpc_buffer_add_attribute_array_value, p11_rpc_buffer_get_attribute_array_value },
++	{ P11_RPC_VALUE_ATTRIBUTE_ARRAY, p11_rpc_buffer_add_attribute_array_value, p11_rpc_buffer_get_attribute_array_value_wrapper },
+ 	{ P11_RPC_VALUE_MECHANISM_TYPE_ARRAY, p11_rpc_buffer_add_mechanism_type_array_value, p11_rpc_buffer_get_mechanism_type_array_value },
+ 	{ P11_RPC_VALUE_DATE, p11_rpc_buffer_add_date_value, p11_rpc_buffer_get_date_value },
+ 	{ P11_RPC_VALUE_BYTE_ARRAY, p11_rpc_buffer_add_byte_array_value, p11_rpc_buffer_get_byte_array_value }
+@@ -1142,7 +1151,8 @@ bool
+ p11_rpc_buffer_get_attribute_array_value (p11_buffer *buffer,
+ 					  size_t *offset,
+ 					  void *value,
+-					  CK_ULONG *value_length)
++					  CK_ULONG *value_length,
++					  size_t depth)
+ {
+ 	uint32_t count, i;
+ 	CK_ATTRIBUTE *attr, temp;
+@@ -1157,7 +1167,7 @@ p11_rpc_buffer_get_attribute_array_value (p11_buffer *buffer,
+ 		attr = value;
+ 
+ 	for (i = 0; i < count; i++) {
+-		if (!p11_rpc_buffer_get_attribute (buffer, offset, attr))
++		if (!p11_rpc_buffer_get_attribute_recursive (buffer, offset, attr, depth))
+ 			return false;
+ 		if (value)
+ 			attr++;
+@@ -1255,12 +1265,26 @@ bool
+ p11_rpc_buffer_get_attribute (p11_buffer *buffer,
+ 			      size_t *offset,
+ 			      CK_ATTRIBUTE *attr)
++{
++	return p11_rpc_buffer_get_attribute_recursive (buffer, offset, attr, 0);
++}
++
++bool
++p11_rpc_buffer_get_attribute_recursive (p11_buffer *buffer,
++					size_t *offset,
++					CK_ATTRIBUTE *attr,
++					size_t depth)
+ {
+ 	uint32_t type, length, decode_length;
+ 	unsigned char validity;
+ 	p11_rpc_attribute_serializer *serializer;
+ 	p11_rpc_value_type value_type;
+ 
++	if (depth > P11_RPC_MAX_RECURSION_DEPTH) {
++		p11_debug ("recursion depth limit reached");
++		return false;
++	}
++
+ 	/* The attribute type */
+ 	if (!p11_rpc_buffer_get_uint32 (buffer, offset, &type))
+ 		return false;
+@@ -1284,8 +1308,13 @@ p11_rpc_buffer_get_attribute (p11_buffer *buffer,
+ 	assert (value_type < ELEMS (p11_rpc_attribute_serializers));
+ 	serializer = &p11_rpc_attribute_serializers[value_type];
+ 	assert (serializer != NULL);
+-	if (!serializer->decode (buffer, offset, attr->pValue, &attr->ulValueLen))
+-		return false;
++	if (value_type == P11_RPC_VALUE_ATTRIBUTE_ARRAY) {
++		if (!p11_rpc_buffer_get_attribute_array_value (buffer, offset, attr->pValue, &attr->ulValueLen, depth + 1))
++			return false;
++	} else {
++		if (!serializer->decode (buffer, offset, attr->pValue, &attr->ulValueLen))
++			return false;
++	}
+ 	if (!attr->pValue) {
+ 		decode_length = attr->ulValueLen;
+ 		attr->ulValueLen = length;
+diff --git a/p11-kit/rpc-message.h b/p11-kit/rpc-message.h
+index f171fc4..671a60d 100644
+--- a/p11-kit/rpc-message.h
++++ b/p11-kit/rpc-message.h
+@@ -44,6 +44,8 @@
+ #include "pkcs11.h"
+ #include "pkcs11x.h"
+ 
++#define P11_RPC_MAX_RECURSION_DEPTH 8
++
+ /* The calls, must be in sync with array below */
+ enum {
+ 	P11_RPC_CALL_ERROR = 0,
+@@ -441,6 +443,11 @@ bool             p11_rpc_buffer_get_attribute            (p11_buffer *buffer,
+ 							  size_t *offset,
+ 							  CK_ATTRIBUTE *attr);
+ 
++bool             p11_rpc_buffer_get_attribute_recursive  (p11_buffer *buffer,
++							  size_t *offset,
++							  CK_ATTRIBUTE *attr,
++							  size_t depth);
++
+ void             p11_rpc_buffer_add_byte_value           (p11_buffer *buffer,
+ 							  const void *value,
+ 							  CK_ULONG value_length);
+@@ -468,7 +475,8 @@ bool             p11_rpc_buffer_get_attribute_array_value
+                                                          (p11_buffer *buffer,
+ 							  size_t *offset,
+ 							  void *value,
+-							  CK_ULONG *value_length);
++							  CK_ULONG *value_length,
++							  size_t depth);
+ 
+ void             p11_rpc_buffer_add_mechanism_type_array_value
+                                                          (p11_buffer *buffer,
+diff --git a/p11-kit/test-rpc-message.c b/p11-kit/test-rpc-message.c
+index 4c11ea5..f00f2f1 100644
+--- a/p11-kit/test-rpc-message.c
++++ b/p11-kit/test-rpc-message.c
+@@ -594,11 +594,11 @@ test_attribute_array_value (void)
+ 	assert (!p11_buffer_failed (&buffer));
+ 
+ 	offset2 = offset;
+-	ret = p11_rpc_buffer_get_attribute_array_value(&buffer, &offset, NULL, &val_size);
++	ret = p11_rpc_buffer_get_attribute_array_value(&buffer, &offset, NULL, &val_size, 0);
+ 	assert_num_eq (true, ret);
+ 
+ 	offset = offset2;
+-	ret = p11_rpc_buffer_get_attribute_array_value(&buffer, &offset, val, &val_size);
++	ret = p11_rpc_buffer_get_attribute_array_value(&buffer, &offset, val, &val_size, 0);
+ 	assert_num_eq (true, ret);
+ 	assert_num_eq (val[0].type, CKA_MODIFIABLE);
+ 	assert_num_eq (*(CK_BBOOL *)val[0].pValue, CK_TRUE);
+@@ -806,6 +806,40 @@ test_message_write (void)
+ 	p11_buffer_uninit (&buffer);
+ }
+ 
++static void
++test_attribute_recursion_limit (void)
++{
++	bool ret;
++	p11_buffer buffer;
++	size_t offset = 0;
++	CK_BBOOL truev = CK_TRUE;
++	CK_ATTRIBUTE attrs_out;
++	CK_ATTRIBUTE attrs[P11_RPC_MAX_RECURSION_DEPTH + 2];
++	for (size_t i = 0; i <= P11_RPC_MAX_RECURSION_DEPTH; i++) {
++		attrs[i].type = CKA_WRAP_TEMPLATE;
++		attrs[i].pValue = &attrs[i + 1];
++		attrs[i].ulValueLen = sizeof (CK_ATTRIBUTE);
++	}
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].type = CKA_ENCRYPT;
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].pValue = &truev;
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].ulValueLen = sizeof (CK_BBOOL);
++
++	ret = p11_buffer_init (&buffer, 0);
++	assert_num_eq (true, ret);
++	p11_rpc_buffer_add_attribute_array_value (&buffer, attrs, ELEMS(attrs));
++	assert_num_eq (true, !p11_buffer_failed (&buffer));
++
++	/* Skip the array count */
++	ret = p11_rpc_buffer_get_uint32(&buffer, &offset, NULL);
++	assert_num_eq (true, ret);
++
++	/* Hit recursion limit */
++	ret = p11_rpc_buffer_get_attribute(&buffer, &offset, &attrs_out);
++	assert_num_eq (false, ret);
++
++	p11_buffer_uninit (&buffer);
++}
++
+ #include "test-mock.c"
+ 
+ static CK_MECHANISM_TYPE mechanisms[] = {
+@@ -848,6 +882,7 @@ main (int argc,
+ 	p11_test (test_byte_array_value, "/rpc-message/byte-array-value");
+ 	p11_test (test_mechanism_value, "/rpc-message/mechanism-value");
+ 	p11_test (test_message_write, "/rpc-message/message-write");
++	p11_test (test_attribute_recursion_limit, "/rpc-message/attribute-recursion-limit");
+ 
+ 	test_mock_add_tests ("/rpc-message", NULL);
+ 
+diff --git a/p11-kit/test-rpc.c b/p11-kit/test-rpc.c
+index f214509..6059b89 100644
+--- a/p11-kit/test-rpc.c
++++ b/p11-kit/test-rpc.c
+@@ -700,6 +700,32 @@ test_mechanism_unsupported (void *module)
+ 	teardown_mock_module (rpc_module);
+ }
+ 
++static void
++test_recursion_limit (void *module)
++{
++	CK_FUNCTION_LIST_PTR rpc_module;
++	CK_SESSION_HANDLE session;
++	CK_RV rv;
++	CK_BBOOL val;
++	CK_ATTRIBUTE attrs[P11_RPC_MAX_RECURSION_DEPTH + 2];
++	for (size_t i = 0; i <= P11_RPC_MAX_RECURSION_DEPTH; i++) {
++		attrs[i].type = CKA_WRAP_TEMPLATE;
++		attrs[i].pValue = &attrs[i + 1];
++		attrs[i].ulValueLen = sizeof (CK_ATTRIBUTE);
++	}
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].type = CKA_ENCRYPT;
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].pValue = &val;
++	attrs[P11_RPC_MAX_RECURSION_DEPTH + 1].ulValueLen = sizeof (CK_BBOOL);
++
++	rpc_module = setup_test_rpc_module (&test_normal_vtable, module, &session);
++
++	/* Hit recursion limit */
++	rv = (rpc_module->C_GetAttributeValue) (session, MOCK_PUBLIC_KEY_PREFIX, attrs, 1);
++	assert_num_eq (rv, CKR_DEVICE_ERROR);
++
++	teardown_mock_module (rpc_module);
++}
++
+ #ifdef OS_UNIX
+ 
+ static void
+@@ -805,6 +831,7 @@ main (int argc,
+ 	p11_testx (test_get_slot_list_no_device, &mock_module_v3_no_slots, "/rpc3/get-slot-list-no-device");
+ 	p11_testx (test_simultaneous_functions, &mock_module_v3_no_slots, "/rpc3/simultaneous-functions");
+ 	p11_testx (test_mechanism_unsupported, &mock_module_v3, "/rpc3/mechanism-unsupported");
++	p11_testx (test_recursion_limit, &mock_module_v3, "/rpc3/recursion-limit");
+ 
+ #ifdef OS_UNIX
+ 	p11_testx (test_fork_and_reinitialize, &mock_module_v3_no_slots, "/rpc3/fork-and-reinitialize");
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 5921a46c88..6c5b82e6bc 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -12,6 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            file://fix-parallel-build-failures.patch \
+           file://CVE-2026-13757.patch \
            "
 SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"
-- 
2.43.0


