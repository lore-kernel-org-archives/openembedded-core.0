Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5169DC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:15:05 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.86410.1701058499827844244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BE+Oymi1;
 spf=pass (domain: mvista.com, ip: 209.85.210.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d7fa93afe9so2249525a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 20:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701058498; x=1701663298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXZ1H+qMDAP7ePfu78RwjUG6OaT4alDaHTkCQ3WI/Bo=;
        b=BE+Oymi1iKm3Qie0sqjxfVrpiAaBkPwrWSJp0wShcokK6nLcq2ocgD7GSxzFrRPMzu
         mwmhDvXcZoS1iOWfh1fMITxbHoYtxL81A+yB40hR4L9hwDnDTcbnOS/mBZRi9M7FH7gH
         /ufLnC+lEoNJFa0uZZnhmPmm8s1QhAGwwkL9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701058498; x=1701663298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXZ1H+qMDAP7ePfu78RwjUG6OaT4alDaHTkCQ3WI/Bo=;
        b=t7RKmff2UgMeo3gKi/Wqp3ULZDIeRCgZg/aUX9q9+QMW9zUxvZvqLzYzlTTgu/RpmD
         HYrBplmNGyFgkuclvTzyjTSAuxciK1k5hrzh+dmPvnfSNLHWXdNqmRDnHXDBbmnWnCNb
         j3UL3stV0Bo9JlshH9lov02lgwR4UdjXAIGil/d7EmuMZGfgT3kfGmnvuxtHF+VzDWbL
         ML61MDS5D4J/iAADv8vhrDVTQwX28Z2k//i5rCIcgHnZ2bXBIefetwoPl1xTvcyzyJ9t
         OTx5IlojrvjsTxGD/VTIlY1iyX1B6GlZt8Ys/taJttu+BKlBqeMhDcLzRtb3oKqaAevz
         qgZg==
X-Gm-Message-State: AOJu0Yx7tZMJlmYlMn/8agZDqNi+wQ8XemqY01AdBvm55ypzbQkiUapj
	rR04DpSnvLy/+/UdZaWUlna1N2nPrS8brQNlI6Y=
X-Google-Smtp-Source: AGHT+IHLp7ukaB151onKB4Vdw91C3m5gaZFt/MJaoesfWiKncBfwdx+gqhKzCyVMDDwlTpZ+1pDjgQ==
X-Received: by 2002:a9d:6c0d:0:b0:6d8:286f:158a with SMTP id f13-20020a9d6c0d000000b006d8286f158amr1748149otq.8.1701058498217;
        Sun, 26 Nov 2023 20:14:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c01c:7c68:be78:1874:25fb:372e])
        by smtp.gmail.com with ESMTPSA id 32-20020a630c60000000b005c19c586cb7sm6794652pgm.33.2023.11.26.20.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:14:57 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] bind: Backport fix for CVE-2023-3341
Date: Mon, 27 Nov 2023 09:44:44 +0530
Message-Id: <20231127041444.45754-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191251

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/c4fac5ca98efd02fbaef43601627c7a3a09f5a71]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


