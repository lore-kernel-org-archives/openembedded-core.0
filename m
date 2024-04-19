Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7167C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 14:11:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22190.1713535902295126825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 07:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cB5PiEyI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4839d06d74=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43JBC64Y032024
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=dm9WLT5Ormb2XI45qScAY8DnwtJnPicioR7wU1htSKw=; b=
	cB5PiEyIQkncmZoSMGPmL9bJ/BT2Z4YHwgrNr9jKYofrQ5EOuiTY1fUcdVF/rw8i
	wmS6FSYh/ySm9hiwVvaLzhBIwDRrH6pNyRXA96Fo5C/+TDVU9LZRjnQ8rqYSyHMD
	YffWmspRhffQCtr0IUdWuB+bnh6EiLrveY8KG5Qsu8VRA688iZ4cthgHX6xT9Dld
	ACxnNyOt1W0YFiLiJC1qqTFCEzj2gPxPOryzTct+zfdXpp3LFO/ReTaTWJOq9NTt
	ynL8bQwFXMRymO83vGOXisadHa21tVy53hcwXUtALBVEIn3cmeicwNhvYAiLxwFt
	MxznAvMb7lk0zhyzeCswNA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16p44r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:11:40 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 19 Apr 2024 07:11:37 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/2] gnutls: fix CVE-2024-28835
Date: Fri, 19 Apr 2024 14:11:00 +0000
Message-ID: <20240419141100.3116142-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240419141100.3116142-1-archana.polampalli@windriver.com>
References: <20240419141100.3116142-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ntcExfqGHTSI6sOXvvR8bBLrGFfd20aZ
X-Proofpoint-GUID: ntcExfqGHTSI6sOXvvR8bBLrGFfd20aZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198552

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw has been discovered in GnuTLS where an application crash can be induced
when attempting to verify a specially crafted .pem bundle using the
"certtool --verify-chain" command.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../gnutls/gnutls/CVE-2024-28835.patch        | 406 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 2 files changed, 407 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-28835.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-28835.patch b/meta/recipes-support/gnutls/gnutls/CVE-2024-28835.patch
new file mode 100644
index 0000000000..0341df8bd9
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-28835.patch
@@ -0,0 +1,406 @@
+From e369e67a62f44561d417cb233acc566cc696d82d Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Mon, 29 Jan 2024 13:52:46 +0900
+Subject: [PATCH] gnutls_x509_trust_list_verify_crt2: remove length limit of
+ input
+
+Previously, if cert_list_size exceeded DEFAULT_MAX_VERIFY_DEPTH, the
+chain verification logic crashed with assertion failure.  This patch
+removes the restriction while keeping the maximum number of
+retrieved certificates being DEFAULT_MAX_VERIFY_DEPTH.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2024-28835
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e369e67a62f44561d417cb233acc566cc696d82d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gnutls_int.h       |   5 +-
+ lib/x509/common.c      |  10 +-
+ lib/x509/verify-high.c |  43 ++++++---
+ tests/test-chains.h    | 211 ++++++++++++++++++++++++++++++++++++++++-
+ 4 files changed, 252 insertions(+), 17 deletions(-)
+
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index b2a3ae6..5127996 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -221,7 +221,10 @@ typedef enum record_send_state_t {
+
+ #define MAX_PK_PARAM_SIZE 2048
+
+-/* defaults for verification functions
++/* Defaults for verification functions.
++ *
++ * update many_icas in tests/test-chains.h when increasing
++ * DEFAULT_MAX_VERIFY_DEPTH.
+  */
+ #define DEFAULT_MAX_VERIFY_DEPTH 16
+ #define DEFAULT_MAX_VERIFY_BITS (MAX_PK_PARAM_SIZE*8)
+diff --git a/lib/x509/common.c b/lib/x509/common.c
+index 6367b03..8f8c1f8 100644
+--- a/lib/x509/common.c
++++ b/lib/x509/common.c
+@@ -1749,7 +1749,15 @@ unsigned int _gnutls_sort_clist(gnutls_x509_crt_t *clist,
+	bool insorted[DEFAULT_MAX_VERIFY_DEPTH]; /* non zero if clist[i] used in sorted list */
+	gnutls_x509_crt_t sorted[DEFAULT_MAX_VERIFY_DEPTH];
+
+-	assert(clist_size <= DEFAULT_MAX_VERIFY_DEPTH);
++        /* Limit the number of certificates in the chain, to avoid DoS
++	 * because of the O(n^2) sorting below.  FIXME: Switch to a
++	 * topological sort algorithm which should be linear to the
++	 * number of certificates and subject-issuer relationships.
++	 */
++	if (clist_size > DEFAULT_MAX_VERIFY_DEPTH) {
++		_gnutls_debug_log("too many certificates; skipping sorting\n");
++		return 1;
++	}
+
+	for (i = 0; i < DEFAULT_MAX_VERIFY_DEPTH; i++) {
+		issuer[i] = -1;
+diff --git a/lib/x509/verify-high.c b/lib/x509/verify-high.c
+index 5698d4f..a957511 100644
+--- a/lib/x509/verify-high.c
++++ b/lib/x509/verify-high.c
+@@ -25,7 +25,7 @@
+ #include "errors.h"
+ #include <libtasn1.h>
+ #include <global.h>
+-#include <num.h>		/* MAX */
++#include <num.h>		/* MIN */
+ #include <tls-sig.h>
+ #include <str.h>
+ #include <datum.h>
+@@ -1418,7 +1418,8 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+	int ret = 0;
+	unsigned int i;
+	size_t hash;
+-	gnutls_x509_crt_t sorted[DEFAULT_MAX_VERIFY_DEPTH];
++	gnutls_x509_crt_t *cert_list_copy = NULL;
++	unsigned int cert_list_max_size = 0;
+	gnutls_x509_crt_t retrieved[DEFAULT_MAX_VERIFY_DEPTH];
+	unsigned int retrieved_size = 0;
+	const char *hostname = NULL, *purpose = NULL, *email = NULL;
+@@ -1472,16 +1473,26 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+		}
+	}
+
+-	memcpy(sorted, cert_list, cert_list_size * sizeof(gnutls_x509_crt_t));
+-	cert_list = sorted;
++	/* Allocate extra for retrieved certificates. */
++	if (!INT_ADD_OK(cert_list_size, DEFAULT_MAX_VERIFY_DEPTH,
++			&cert_list_max_size))
++		return gnutls_assert_val(GNUTLS_E_INVALID_REQUEST);
++
++	cert_list_copy = _gnutls_reallocarray(NULL, cert_list_max_size,
++					      sizeof(gnutls_x509_crt_t));
++	if (!cert_list_copy)
++		return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
++
++	memcpy(cert_list_copy, cert_list,
++	       cert_list_size * sizeof(gnutls_x509_crt_t));
++	cert_list = cert_list_copy;
+
+	ret = cert_set_init(&cert_set, DEFAULT_MAX_VERIFY_DEPTH);
+	if (ret < 0) {
+		return ret;
+	}
+
+-	for (i = 0; i < cert_list_size &&
+-		     cert_list_size <= DEFAULT_MAX_VERIFY_DEPTH; ) {
++	for (i = 0; i < cert_list_size;) {
+		unsigned int sorted_size = 1;
+		unsigned int j;
+		gnutls_x509_crt_t issuer;
+@@ -1491,8 +1502,7 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+							 cert_list_size - i);
+		}
+
+-		/* Remove duplicates. Start with index 1, as the first element
+-		 * may be re-checked after issuer retrieval. */
++		/* Remove duplicates. */
+		for (j = 1; j < sorted_size; j++) {
+			if (cert_set_contains(&cert_set, cert_list[i + j])) {
+				if (i + j < cert_list_size - 1) {
+@@ -1539,14 +1549,16 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+		ret = retrieve_issuers(list,
+				       cert_list[i - 1],
+				       &retrieved[retrieved_size],
+-				       DEFAULT_MAX_VERIFY_DEPTH -
+-				       MAX(retrieved_size,
+-					   cert_list_size));
++				       MIN(DEFAULT_MAX_VERIFY_DEPTH - retrieved_size,
++                                           cert_list_max_size - cert_list_size));
+		if (ret < 0) {
+			break;
+		} else if (ret > 0) {
+			assert((unsigned int)ret <=
+-			       DEFAULT_MAX_VERIFY_DEPTH - cert_list_size);
++                               DEFAULT_MAX_VERIFY_DEPTH - retrieved_size);
++			assert((unsigned int)ret <=
++			       cert_list_max_size - cert_list_size);
++
+			memmove(&cert_list[i + ret],
+				&cert_list[i],
+				(cert_list_size - i) *
+@@ -1563,8 +1575,10 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+	}
+
+	cert_list_size = shorten_clist(list, cert_list, cert_list_size);
+-	if (cert_list_size <= 0)
+-		return gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++	if (cert_list_size <= 0) {
++		ret = gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++		goto cleanup;
++	}
+
+	hash =
+	    hash_pjw_bare(cert_list[cert_list_size - 1]->raw_issuer_dn.
+@@ -1715,6 +1729,7 @@ gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t list,
+	}
+
+  cleanup:
++	gnutls_free(cert_list_copy);
+	for (i = 0; i < retrieved_size; i++) {
+		gnutls_x509_crt_deinit(retrieved[i]);
+	}
+diff --git a/tests/test-chains.h b/tests/test-chains.h
+index 09a5461..dd872a9 100644
+--- a/tests/test-chains.h
++++ b/tests/test-chains.h
+@@ -25,7 +25,7 @@
+
+ /* *INDENT-OFF* */
+
+-#define MAX_CHAIN 10
++#define MAX_CHAIN 17
+
+ static const char *chain_with_no_subject_id_in_ca_ok[] = {
+	"-----BEGIN CERTIFICATE-----\n"
+@@ -4386,6 +4386,213 @@ static const char *cross_signed_ca[] = {
+	NULL
+ };
+
++/* This assumes DEFAULT_MAX_VERIFY_DEPTH to be 16 */
++static const char *many_icas[] = {
++	/* Server */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBqzCCAV2gAwIBAgIUIK3+SD3GmqJlRLZ/ESyhTzkSDL8wBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowNzEbMBkGA1UEChMSR251VExTIHRlc3Qgc2VydmVyMRgwFgYD\n"
++	"VQQDEw90ZXN0LmdudXRscy5vcmcwKjAFBgMrZXADIQAWGjx45NIJiKFsNBxxRRjm\n"
++	"NxUT5KYK7xXr5HPVywwgLaOBkjCBjzAMBgNVHRMBAf8EAjAAMBoGA1UdEQQTMBGC\n"
++	"D3Rlc3QuZ251dGxzLm9yZzATBgNVHSUEDDAKBggrBgEFBQcDATAOBgNVHQ8BAf8E\n"
++	"BAMCB4AwHQYDVR0OBBYEFKgNAQWZPx76/vXqQOdIi5mTftsaMB8GA1UdIwQYMBaA\n"
++	"FDaPsY6WAGuRtrhYJE6Gk/bg5qbdMAUGAytlcANBAMIDh8aGcIIFDTUrzfV7tnkX\n"
++	"hHrxyFKBH/cApf6xcJQTfDXm23po627Ibp+WgLaWMY08Fn9Y2V6Ev8ADfqXNbQ8=\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA16 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUSnE0PKdm/dsnZSWBh5Ct4pS6DcwwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAxq9SI8vp0QH1dDBBuZW+t+bLLROppQbjSQ4O1BEonDOjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBQ2j7GOlgBrkba4\n"
++	"WCROhpP24Oam3TAfBgNVHSMEGDAWgBRvdUKX0aw3nfUIdvivXGSfRO7zyjAFBgMr\n"
++	"ZXADQQBsI2Hc7X5hXoHTvk01qMc5a1I27QHAFRARJnvIQ15wxNS2LVLzGk+AUmwr\n"
++	"sOhBKAcVfS55uWtYdjoWQ80h238H\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA15 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUQk4XkgQVImnp6OPZas7ctwgBza4wBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAs3yVKLJd3sKbNVmj6Bxy2j1x025rksyQpZZWnCx5a+CjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRvdUKX0aw3nfUI\n"
++	"dvivXGSfRO7zyjAfBgNVHSMEGDAWgBRhGfUXYPh4YQsdtTWYUozLphGgfzAFBgMr\n"
++	"ZXADQQBXTtm56x6/pHXdW8dTvZLc/8RufNQrMlc23TCgX0apUnrZdTsNAb7OE4Uu\n"
++	"9PBuxK+CC9NL/BL2hXsKvAT+NWME\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA14 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUKfwz7UUYRvYlvqwmnLJlTOS9o1AwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAXbUetQ08t+F4+IcKL++HpeclqTxXZ7cG4mwqvHmTUEWjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRhGfUXYPh4YQsd\n"
++	"tTWYUozLphGgfzAfBgNVHSMEGDAWgBQYRQqO+V1kefF7QvNnFU1fX5H9+jAFBgMr\n"
++	"ZXADQQAiSHNMTLPFP3oa6q13Dj8jSxF9trQDJGM1ArWffFcPZUt2U4/ODHdcMTHx\n"
++	"kGwhIj+ghBlu6ykgu6J2wewCUooC\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA13 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUUKOs59gyCPAZzoC7zMZQSh6AnQgwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAmvqhj5GYqsXIpsr1BXBfD+2mTP/m/TEpKIYSZHM62dijYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBQYRQqO+V1kefF7\n"
++	"QvNnFU1fX5H9+jAfBgNVHSMEGDAWgBQ27HzvP5hl2xR+LOzRcPfmY5ndXjAFBgMr\n"
++	"ZXADQQBrB3NkrYC7EQ74qgeesVOE71rW012dPOOKPAV0laR+JLEgsv9sfus+AdBF\n"
++	"WBNwR3KeYBTi/MFDuecxBHU2m5gD\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA12 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUUQooGfH21+sR7/pSgCWm13gg2H4wBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAK2of/B4wMpk6k/KdugC5dMS+jo2fseUM7/PvXkE6HASjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBQ27HzvP5hl2xR+\n"
++	"LOzRcPfmY5ndXjAfBgNVHSMEGDAWgBSJDHU0Mj1Xr0e8ErCnRK24w7XwTTAFBgMr\n"
++	"ZXADQQDY8d2bAZpj7oGhdl2dBsCE48jEWj49da0PbgN12koAj3gf4hjMPd8G7p5z\n"
++	"8RsURAwQmCkE8ShvdNw/Qr2tDL0E\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA11 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUW9Dw0hU2pfjXhb5Stip+mk9SndIwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAn5ISjLVV6RBWsnxDWHDicpye7SjFwGOTwzF01/psiJ2jYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBSJDHU0Mj1Xr0e8\n"
++	"ErCnRK24w7XwTTAfBgNVHSMEGDAWgBSR9UU27RI0XohiEgHDxNo/9HP4djAFBgMr\n"
++	"ZXADQQCfQg6MDHk71vhyrEo4/5PcLb2Li5F/FKURyux7snv2TbkSdInloAqca9UR\n"
++	"DtqHSLCNLXCNdSPr5QwIt5p29rsE\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA10 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUR4uTedG8e6MibKViQ3eX7QzXG1swBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAnslX04kSVOL5LAf1e+Ze3ggNnDJcEAxLDk8I/IhyjTyjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBSR9UU27RI0Xohi\n"
++	"EgHDxNo/9HP4djAfBgNVHSMEGDAWgBRC7US5gJYnvd5F7EN+C4anMgd2NzAFBgMr\n"
++	"ZXADQQDo+jHt07Tvz3T5Lbz6apBrSln8xKYfJk2W1wP85XAnf7sZT9apM1bS4EyD\n"
++	"Kckw+KG+9x7myOZz6AXJgZB5OGAO\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA9 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUSIIIRjrNpE+kEPkiJMOqaNAazvQwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAZKy7p1Gn4W/reRxKJN99+QkHt2q9aELktCKe5PqrX5ejYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRC7US5gJYnvd5F\n"
++	"7EN+C4anMgd2NzAfBgNVHSMEGDAWgBSOhR7Ornis2x8g0J+bvTTwMnW60zAFBgMr\n"
++	"ZXADQQA0MEcC4FgKZEAfalVpApU2to0G158MVz/WTNcSc7fnl8ifJ/g56dVHL1jr\n"
++	"REvC/S28dn/CGAlbVXUAgxnHAbgE\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA8 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUGGFSgD95vOTSj7iFxfXA5vq6vsYwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAg3W/bTdW0fR32NeZEVMXICpa30d7rSdddLOYDvqqUO+jYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBSOhR7Ornis2x8g\n"
++	"0J+bvTTwMnW60zAfBgNVHSMEGDAWgBT3zK8Hbn9aVTAOOFY6RSxJ2o5x2jAFBgMr\n"
++	"ZXADQQBl4gnzE463iMFg57gPvjHdVzA39sJBpiu0kUGfRcLnoRI/VOaLcx7WnJ9+\n"
++	"c3KxPZBec76EdIoQDkTmI6m2FIAM\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA7 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUGktMGXhNuaMhKyAlecymmLD+/GIwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEA/Z1oc76hOQ0Hi+2hePaGIntnMIDqBlb7RDMjRpYONP2jYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT3zK8Hbn9aVTAO\n"
++	"OFY6RSxJ2o5x2jAfBgNVHSMEGDAWgBSPae3JUN3jP0NgUJqDV3eYxcaM3DAFBgMr\n"
++	"ZXADQQBMkwKaUZlvG/hax8rv3nnDv8kJOr6KVHBnxSx3hZ+8HIBT7GFm1+YDeYOB\n"
++	"jhNg66kyeFPGXXBCe+mvNQFFjCEE\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA6 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUKn3gz5lAUpKqWlHKLKYDbOJ4rygwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAZ/eD4eTe91ddvHusm7YlLPxU4ByGFc6suAmlP1CxXkWjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBSPae3JUN3jP0Ng\n"
++	"UJqDV3eYxcaM3DAfBgNVHSMEGDAWgBT9f/qSI/jhxvGI7aMtkpraDcjBnjAFBgMr\n"
++	"ZXADQQAMRnkmRhnLGdmJaY8B42gfyaAsqCMyds/Tw4OHYy+N48XuAxRjKkhf3szC\n"
++	"0lY71oU043mNP1yx/dzAuCTrVSgI\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA5 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUEgEYbBXXEyGv3vOq10JQv1SBiUUwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAs2xEDPw8RVal53nX9GVwUd1blq1wjtVFC8S1V7up7MWjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT9f/qSI/jhxvGI\n"
++	"7aMtkpraDcjBnjAfBgNVHSMEGDAWgBRBVkLu9BmCKz7HNI8md4vPpoE/7jAFBgMr\n"
++	"ZXADQQCCufAyLijtzzmeCuO3K50rBSbGvB3FQfep7g6kVsQKM3bw/olWK5/Ji0dD\n"
++	"ubJ0cFl1FmfAda7aVxLBtJOvO6MI\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA4 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIULj8GkaHw+92HuOTnXnXlxCy3VrEwBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAiedxh4dvtwDellMAHc/pZH0MAOXobRenTUgF1yj5l12jYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRBVkLu9BmCKz7H\n"
++	"NI8md4vPpoE/7jAfBgNVHSMEGDAWgBSDtNRgQ36KwW/ASaMyr6WeDt0STDAFBgMr\n"
++	"ZXADQQDL8U2ckzur7CktdrVUNvfLhVCOz33d/62F28vQFHUa8h/4h+Mi1MMbXOKT\n"
++	"1bL2TvpFpU7Fx/vcIPXDielVqr4C\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA3 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUQXl74TDDw6MQRMbQUSPa6Qrvba8wBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEA7l0jQ0f4fJRw7Qja/Hz2qn8y91SI7CokxhSf+FT+9M6jYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBSDtNRgQ36KwW/A\n"
++	"SaMyr6WeDt0STDAfBgNVHSMEGDAWgBQ2inEK4KH6ATftmybxKE1dZUzOozAFBgMr\n"
++	"ZXADQQCnP7Oqx1epGnFnO7TrTJwcUukXDEYsINve2GeUsi8HEIeKKlMcLZ2Cnaj7\n"
++	"5v9NGuWh3QJpmmSGpEemiv8dJc4A\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA2 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBYTCCAROgAwIBAgIUP7Nmof8H2F1LyDkjqlYIUpGdXE8wBQYDK2VwMB0xGzAZ\n"
++	"BgNVBAMMEkdudVRMUyB0ZXN0IElDQSAkaTAgFw0yNDAzMTIyMjUzMzlaGA85OTk5\n"
++	"MTIzMTIzNTk1OVowHTEbMBkGA1UEAwwSR251VExTIHRlc3QgSUNBICRpMCowBQYD\n"
++	"K2VwAyEAkW9Rod3CXAnha6nlaHkDbCOegq94lgmjqclA9sOIt3yjYzBhMA8GA1Ud\n"
++	"EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBQ2inEK4KH6ATft\n"
++	"mybxKE1dZUzOozAfBgNVHSMEGDAWgBRPq/CQlK/zuXkjZvTCibu+vejD+jAFBgMr\n"
++	"ZXADQQBU+A+uF0yrtO/yv9cRUdCoL3Y1NKM35INg8BQDnkv724cW9zk1x0q9Fuou\n"
++	"zvfSVb8S3vT8fF5ZDOxarQs6ZH0C\n"
++	"-----END CERTIFICATE-----\n",
++	/* ICA1 */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBXTCCAQ+gAwIBAgIUfUWP+AQHpdFTRKTf21mMzjaJsp0wBQYDK2VwMBkxFzAV\n"
++	"BgNVBAMTDkdudVRMUyB0ZXN0IENBMCAXDTI0MDMxMjIyNTMzOVoYDzk5OTkxMjMx\n"
++	"MjM1OTU5WjAdMRswGQYDVQQDDBJHbnVUTFMgdGVzdCBJQ0EgJGkwKjAFBgMrZXAD\n"
++	"IQAVmfBAvLbT+pTD24pQrr6S0jEIFIV/qOv93yYvAUzpzKNjMGEwDwYDVR0TAQH/\n"
++	"BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAgQwHQYDVR0OBBYEFE+r8JCUr/O5eSNm9MKJ\n"
++	"u7696MP6MB8GA1UdIwQYMBaAFAFpt5wrFsqCtHc4PpluPDvwcxQLMAUGAytlcANB\n"
++	"AC6+XZnthjlUD0TbBKRF3qT5if3Pp29Bgvutw8859unzUZW8FkHg5KeDBj9ncgJc\n"
++	"O2tFnNH2hV6LDPJzU0rtLQc=\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
++static const char *many_icas_ca[] = {
++	/* CA (self-signed) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBNzCB6qADAgECAhRjaokcQwcrtW8tjuVFz3A33F8POjAFBgMrZXAwGTEXMBUG\n"
++	"A1UEAxMOR251VExTIHRlc3QgQ0EwIBcNMjQwMzEyMjI1MzM5WhgPOTk5OTEyMzEy\n"
++	"MzU5NTlaMBkxFzAVBgNVBAMTDkdudVRMUyB0ZXN0IENBMCowBQYDK2VwAyEAvoxP\n"
++	"TNdbWktxA8qQNNH+25Cx9rzP+DxLGeI/7ODwrQGjQjBAMA8GA1UdEwEB/wQFMAMB\n"
++	"Af8wDgYDVR0PAQH/BAQDAgIEMB0GA1UdDgQWBBQBabecKxbKgrR3OD6Zbjw78HMU\n"
++	"CzAFBgMrZXADQQCP5IUD74M7WrUx20uqzrzuj+s2jnBVmLQfWf/Ucetx+oTRFeq4\n"
++	"xZB/adWhycSeJUAB1zKqYUV9hgT8FWHbnHII\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
+ #if defined __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
+ #  pragma GCC diagnostic push
+ #  pragma GCC diagnostic ignored "-Wunused-variable"
+@@ -4567,6 +4774,8 @@ static struct
+     GNUTLS_CERT_INSECURE_ALGORITHM | GNUTLS_CERT_INVALID, NULL, 1620118136, 1},
+   { "cross signed - ok", cross_signed, cross_signed_ca, 0, 0, 0,
+     1704955300 },
++  { "many intermediates - ok", many_icas, many_icas_ca, 0, 0, 0,
++    1710284400 },
+   { NULL, NULL, NULL, 0, 0}
+ };
+
+--
+2.40.0
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 3c4ecc4f59..9f502e3f7c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2024-0553.patch \
            file://CVE-2024-0567.patch \
            file://CVE-2024-28834.patch \
+           file://CVE-2024-28835.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.40.0


