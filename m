Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E8C79FB1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34911.1788788154510097985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XoduwlXg;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4504515f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788153; x=1789392953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wPaCdSDPXSh4aYL7qq+zwwnXq9nOwriOhH57xaEmCmM=;
        b=XoduwlXgCX3MRTppLTtPGVOOObYi19Yfga8uD2Dc/b3ShptZHaPvin49reQBsyBHTv
         +Dj88uQWJr+x0H7wckkHFy6oFl13Sn82Kyufbr8yLOa5mDjPh0IqVLLB9oquqWxUxUIh
         PCp1OZHOBA9XJhI4XP8JEwCaALAc+7H50I4Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788153; x=1789392953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wPaCdSDPXSh4aYL7qq+zwwnXq9nOwriOhH57xaEmCmM=;
        b=eTO2v+BoDh+gOOxQL0YXQYpfJkK1uuYsuCaoeakn1wf3WMHn1LIvKtUEySRWF188Td
         I1t+jZifPpgUdLvn40xv7t8ZTK0uLgm7AtvVtkdIkTKccqKot2OptgBexbrorl80720i
         Tswkii6Z5aiClT+YbTTnPmDsRKplGklXbL5OtMURkwiEJTfmYkJxNATk8JxWJ3r6aLp4
         6UUcKWzphb7Ai0zSy8lhsD5McPJ5oKrPGZ8t8GOvFAQLPeGJPypf/DuAEy85cdy5ELZ8
         NTNu9fyRSZo5/da4ZbupXAqs24gmcQNoXiYdFHgp3CdPtaNU2nj39/KQrn4Y03cRlKaK
         QBdQ==
X-Gm-Message-State: AFuF++neS/JIzmX5XFNGrG4uhl6brh3EjTQ26IalA/tY434cf1GW6QaV
	TTD6dKeXgDd8LkDQW4ymcqJ9MP8GoErHQCn186Jvy8FzMbTgvCCGrHnKmdnDpkU9om4MSwl0IKz
	kMMCqT8U=
X-Gm-Gg: AYBFou0KLY+oczA/qUbo9Y+8Q2aBSLuEyvd8+aUG5Otdq5mimoeHYt3ASTKKX0e3TPV
	lkNnROIPAOLh7IgCJtUuF1+50WVnN96BcFgwYBnmvqyIn69GRnNepZJHhQuMLrQUsVOkkwd6xfI
	I2kYSvs6uF5vZ9vT2ezvN+jItLMp/d1CQ9A7WJ3TEnXOWsugE+8oeWhI8q3VmOVfVLDS3puDXWA
	nE6WOREc2wVlLIa/ZqzuPLbV1lv8f2jbj+lhrBxL/4FBjBwglJ0CnlzH1yMulVdcZZoU6Kla9t0
	0rsRGv+fA4lpZmH6YraoophbvvYi0Y/auEjPGcwUx7NyzdIJyR541wVQgKfOmgjZpJz8DN3puuS
	EYtOd/SYcVqdkarjeCiLnJcHtfV2XW6/MpERy/HrC7s3SX9SMdI/ar5PeUqBoWJ5RPh/w+96HG5
	DKVurXwTYmZs4p/G7tLhHMy8pJVWXexobJEmrm3tmlP/5ZxtawwAvWrexuM3kORI757yifpEYWZ
	XbJ893+Fslz2tXJxHfrcPjcoObZu+MWmPRBj7/uQOiAogFJqJQJunZTr7Mz28iE
X-Received: by 2002:a05:6000:491a:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-4858704a9d7mr47047946f8f.8.1788788152655;
        Mon, 07 Sep 2026 06:35:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/35] p11-kit: Fix CVE-2026-13757
Date: Mon,  7 Sep 2026 15:34:59 +0200
Message-ID: <1233224dcb13924b1366775a71fdf0ce72e3a589.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245261

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-13757
[2] https://ubuntu.com/security/CVE-2026-13757

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../p11-kit/files/CVE-2026-13757.patch        | 265 ++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-13757.patch

diff --git a/meta/recipes-support/p11-kit/files/CVE-2026-13757.patch b/meta/recipes-support/p11-kit/files/CVE-2026-13757.patch
new file mode 100644
index 00000000000..2f9aa080bb0
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
index 5921a46c88b..6c5b82e6bc9 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -12,6 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            file://fix-parallel-build-failures.patch \
+           file://CVE-2026-13757.patch \
            "
 SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"

