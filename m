Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A101C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.10166.1701211980766257077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X71q39NX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6cbe5b6ec62so4926716b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211979; x=1701816779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6/zveR1Rml0nD2PiBemrG+ZgQlizFCfVkJH4uQMySI=;
        b=X71q39NXmcJ8prBe7EhmPvJnKO8g+BHMOnizlHJiqUybKbdam0e5HR+x0OoacTKkaa
         5uRof21peRKxEhJptt9gIBgLV1q5nkPXqolsBro6BawZYRrW7+/of54/CbrPOtrUwX0p
         1V6kmJh2ux/1gNkJpyG4OtDnmOfS0rZiNoIozsep+6/qgbHifNExaA2p6hitUly7BrFk
         2dKuxGRlCCeBtuKeV/mtTDIywit3MnhiiHufNX2c4uTuJybavKYIou07qWj8ebqVCJJm
         MvmQnxa2UQAaqHSAGBHRSGN8Vrf4sEm3e7zxZXfjiRqgbeKKxT7szOT3Uwa8pznOP5Fx
         Tb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211979; x=1701816779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6/zveR1Rml0nD2PiBemrG+ZgQlizFCfVkJH4uQMySI=;
        b=XFL80wguHzv3MQKzjCrJ5v/ZXkQCDjA1ma2goPOTUDToaTjP/wy/857BGvqu85QrrG
         ZyiplGxwlz+Ytyta3/cRz2vmIkU4+6jD3Q6vu5gRPRrtZzNogSc/7rTt9btHcICwfvwD
         er3VdpM0F5j8P7aV9hf4rog2fQVteObkIsoBBItbLbiZArrztvR5kl3hkpkFrwMX4zvr
         XdbyS7Y8BemwC9kTkIkYYgOJIuKFe3RNbeFnF2UC3/8eLXecbai5XfOFI5i0en0yRb37
         AZh6+k9ff7ct5VPNq3ply0YpkAs1FhEq6YWjncugNTbwSnEPIZXDEOLw040f4+5XHAp/
         bWVQ==
X-Gm-Message-State: AOJu0YzKuy0QlT5Suv2ZR8k3o5bhxs40eFmXzAKqRIZsu0dyArMP9n1T
	xicsNmjo9ewKD49PrkV/+eK9vBl5ygdLMOH2KoZijg==
X-Google-Smtp-Source: AGHT+IHZU11eWfjIxVraAWD3qQxeSmafJukFc1DUCNbACKmp90ncMptYwnnnELj4DpBJlT3Edhr0rQ==
X-Received: by 2002:a05:6a20:d48b:b0:18b:8fd9:5ad4 with SMTP id im11-20020a056a20d48b00b0018b8fd95ad4mr17677403pzb.10.1701211979427;
        Tue, 28 Nov 2023 14:52:59 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/13] bind: Backport fix for CVE-2023-3341
Date: Tue, 28 Nov 2023 12:52:33 -1000
Message-Id: <e0fbe202981c9074547881dbeb7eb58670808fc3.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191401

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/c4fac5ca98efd02fbaef43601627c7a3a09f5a71]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind/CVE-2023-3341.patch             | 175 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2023-3341.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2023-3341.patch b/meta/recipes-connectivity/bind/bind/CVE-2023-3341.patch
new file mode 100644
index 0000000000..be479cb00e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2023-3341.patch
@@ -0,0 +1,175 @@
+From c4fac5ca98efd02fbaef43601627c7a3a09f5a71 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 20 Jun 2023 15:21:36 +1000
+Subject: [PATCH] Limit isccc_cc_fromwire recursion depth
+
+Named and rndc do not need a lot of recursion so the depth is
+set to 10.
+
+Taken from BIND 9.16.44 change.
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/c4fac5ca98efd02fbaef43601627c7a3a09f5a71]
+CVE: CVE-2023-3341
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/isccc/cc.c                   | 38 +++++++++++++++++++++++---------
+ lib/isccc/include/isccc/result.h |  4 +++-
+ lib/isccc/result.c               |  4 +++-
+ 3 files changed, 34 insertions(+), 12 deletions(-)
+
+diff --git a/lib/isccc/cc.c b/lib/isccc/cc.c
+index e012685..8eac3d6 100644
+--- a/lib/isccc/cc.c
++++ b/lib/isccc/cc.c
+@@ -53,6 +53,10 @@
+ 
+ #define MAX_TAGS		256
+ #define DUP_LIFETIME		900
++#ifndef ISCCC_MAXDEPTH
++#define ISCCC_MAXDEPTH \
++	10 /* Big enough for rndc which just sends a string each way. */
++#endif
+ 
+ typedef isccc_sexpr_t *sexpr_ptr;
+ 
+@@ -561,19 +565,25 @@ verify(isccc_sexpr_t *alist, unsigned char *data, unsigned int length,
+ 
+ static isc_result_t
+ table_fromwire(isccc_region_t *source, isccc_region_t *secret,
+-	       uint32_t algorithm, isccc_sexpr_t **alistp);
++	       uint32_t algorithm, unsigned int depth, isccc_sexpr_t **alistp);
+ 
+ static isc_result_t
+-list_fromwire(isccc_region_t *source, isccc_sexpr_t **listp);
++list_fromwire(isccc_region_t *source, unsigned int depth,
++	      isccc_sexpr_t **listp);
+ 
+ static isc_result_t
+-value_fromwire(isccc_region_t *source, isccc_sexpr_t **valuep) {
++value_fromwire(isccc_region_t *source, unsigned int depth,
++	       isccc_sexpr_t **valuep) {
+ 	unsigned int msgtype;
+ 	uint32_t len;
+ 	isccc_sexpr_t *value;
+ 	isccc_region_t active;
+ 	isc_result_t result;
+ 
++	if (depth > ISCCC_MAXDEPTH) {
++		return (ISCCC_R_MAXDEPTH);
++	}
++
+ 	if (REGION_SIZE(*source) < 1 + 4)
+ 		return (ISC_R_UNEXPECTEDEND);
+ 	GET8(msgtype, source->rstart);
+@@ -591,9 +601,9 @@ value_fromwire(isccc_region_t *source, isccc_sexpr_t **valuep) {
+ 		} else
+ 			result = ISC_R_NOMEMORY;
+ 	} else if (msgtype == ISCCC_CCMSGTYPE_TABLE)
+-		result = table_fromwire(&active, NULL, 0, valuep);
++		result = table_fromwire(&active, NULL, 0, depth + 1, valuep);
+ 	else if (msgtype == ISCCC_CCMSGTYPE_LIST)
+-		result = list_fromwire(&active, valuep);
++		result = list_fromwire(&active, depth + 1, valuep);
+ 	else
+ 		result = ISCCC_R_SYNTAX;
+ 
+@@ -602,7 +612,7 @@ value_fromwire(isccc_region_t *source, isccc_sexpr_t **valuep) {
+ 
+ static isc_result_t
+ table_fromwire(isccc_region_t *source, isccc_region_t *secret,
+-	       uint32_t algorithm, isccc_sexpr_t **alistp)
++	       uint32_t algorithm, unsigned int depth, isccc_sexpr_t **alistp)
+ {
+ 	char key[256];
+ 	uint32_t len;
+@@ -613,6 +623,10 @@ table_fromwire(isccc_region_t *source, isccc_region_t *secret,
+ 
+ 	REQUIRE(alistp != NULL && *alistp == NULL);
+ 
++	if (depth > ISCCC_MAXDEPTH) {
++		return (ISCCC_R_MAXDEPTH);
++	}
++
+ 	checksum_rstart = NULL;
+ 	first_tag = true;
+ 	alist = isccc_alist_create();
+@@ -628,7 +642,7 @@ table_fromwire(isccc_region_t *source, isccc_region_t *secret,
+ 		GET_MEM(key, len, source->rstart);
+ 		key[len] = '\0';	/* Ensure NUL termination. */
+ 		value = NULL;
+-		result = value_fromwire(source, &value);
++		result = value_fromwire(source, depth + 1, &value);
+ 		if (result != ISC_R_SUCCESS)
+ 			goto bad;
+ 		if (isccc_alist_define(alist, key, value) == NULL) {
+@@ -661,14 +675,18 @@ table_fromwire(isccc_region_t *source, isccc_region_t *secret,
+ }
+ 
+ static isc_result_t
+-list_fromwire(isccc_region_t *source, isccc_sexpr_t **listp) {
++list_fromwire(isccc_region_t *source, unsigned int depth, isccc_sexpr_t **listp) {
+ 	isccc_sexpr_t *list, *value;
+ 	isc_result_t result;
+ 
++	if (depth > ISCCC_MAXDEPTH) {
++		return (ISCCC_R_MAXDEPTH);
++	}
++
+ 	list = NULL;
+ 	while (!REGION_EMPTY(*source)) {
+ 		value = NULL;
+-		result = value_fromwire(source, &value);
++		result = value_fromwire(source, depth + 1, &value);
+ 		if (result != ISC_R_SUCCESS) {
+ 			isccc_sexpr_free(&list);
+ 			return (result);
+@@ -699,7 +717,7 @@ isccc_cc_fromwire(isccc_region_t *source, isccc_sexpr_t **alistp,
+ 	if (version != 1)
+ 		return (ISCCC_R_UNKNOWNVERSION);
+ 
+-	return (table_fromwire(source, secret, algorithm, alistp));
++	return (table_fromwire(source, secret, algorithm, 0, alistp));
+ }
+ 
+ static isc_result_t
+diff --git a/lib/isccc/include/isccc/result.h b/lib/isccc/include/isccc/result.h
+index 6c79dd7..a85861c 100644
+--- a/lib/isccc/include/isccc/result.h
++++ b/lib/isccc/include/isccc/result.h
+@@ -47,8 +47,10 @@
+ #define ISCCC_R_CLOCKSKEW		(ISC_RESULTCLASS_ISCCC + 4)
+ /*% Duplicate */
+ #define ISCCC_R_DUPLICATE		(ISC_RESULTCLASS_ISCCC + 5)
++/*% Maximum recursion depth */
++#define ISCCC_R_MAXDEPTH               (ISC_RESULTCLASS_ISCCC + 6)
+ 
+-#define ISCCC_R_NRESULTS 		6	/*%< Number of results */
++#define ISCCC_R_NRESULTS 		7	/*%< Number of results */
+ 
+ ISC_LANG_BEGINDECLS
+ 
+diff --git a/lib/isccc/result.c b/lib/isccc/result.c
+index 8419bbb..325200b 100644
+--- a/lib/isccc/result.c
++++ b/lib/isccc/result.c
+@@ -40,7 +40,8 @@ static const char *text[ISCCC_R_NRESULTS] = {
+ 	"bad auth",				/* 3 */
+ 	"expired",				/* 4 */
+ 	"clock skew",				/* 5 */
+-	"duplicate"				/* 6 */
++	"duplicate",				/* 6 */
++	"max depth",				/* 7 */
+ };
+ 
+ static const char *ids[ISCCC_R_NRESULTS] = {
+@@ -50,6 +51,7 @@ static const char *ids[ISCCC_R_NRESULTS] = {
+ 	"ISCCC_R_EXPIRED",
+ 	"ISCCC_R_CLOCKSKEW",
+ 	"ISCCC_R_DUPLICATE",
++	"ISCCC_R_MAXDEPTH",
+ };
+ 
+ #define ISCCC_RESULT_RESULTSET			2
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.37.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
index 80fbcbfa36..95bb5be005 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.37.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-38177.patch \
            file://CVE-2022-38178.patch \
            file://CVE-2023-2828.patch \
+           file://CVE-2023-3341.patch \
            "
 
 SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
-- 
2.34.1


