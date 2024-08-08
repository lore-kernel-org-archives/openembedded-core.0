Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CDDC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 05:22:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.52986.1723094544662714566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 22:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89508b4af2=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4784g7Ik014685
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 22:22:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c918pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 22:22:23 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 22:22:21 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ofono: fix CVE-2023-2794
Date: Thu, 8 Aug 2024 05:22:03 +0000
Message-ID: <20240808052203.3050716-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: NKvJWng078SXiywYmiAXZuNzMsWFhQ4A
X-Proofpoint-GUID: NKvJWng078SXiywYmiAXZuNzMsWFhQ4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_05,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203114

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux.
A stack overflow bug is triggered within the decode_deliver()
function during the SMS decoding. It is assumed that the attack
scenario is accessible from a compromised modem, a malicious
base station, or just SMS. There is a bound check for this
memcpy length in decode_submit(), but it was forgotten in
decode_deliver().

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-2794

Upstream patches:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a90421d8e45d63b304dc010baba24633e7869682
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=7f2adfa22fbae824f8e2c3ae86a3f51da31ee400
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=07f48b23e3877ef7d15a7b0b8b79d32ad0a3607e
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8fa1fdfcb54e1edb588c6a5e2688880b065a39c9

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ofono/ofono/CVE-2023-2794-0001.patch      |  37 +++++
 .../ofono/ofono/CVE-2023-2794-0002.patch      |  32 +++++
 .../ofono/ofono/CVE-2023-2794-0003.patch      |  44 ++++++
 .../ofono/ofono/CVE-2023-2794-0004.patch      | 127 ++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |   4 +
 5 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch
new file mode 100644
index 0000000000..a44633edd9
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch
@@ -0,0 +1,37 @@
+From a90421d8e45d63b304dc010baba24633e7869682 Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Mon, 5 Aug 2024 19:50:04 +0800
+Subject: [PATCH] smsutil: ensure the address length in bytes <= 10
+
+If a specially formatted SMS is received, it is conceivable that the
+address length might overflow the structure it is being parsed into.
+Ensure that the length in bytes of the address never exceeds 10.
+
+CVE: CVE-2023-2794
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a90421d8e45d63b304dc010baba24633e7869682]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/smsutil.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 8dd2126..d8170d1 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -643,7 +643,12 @@ gboolean sms_decode_address_field(const unsigned char *pdu, int len,
+	else
+		byte_len = (addr_len + 1) / 2;
+
+-	if ((len - *offset) < byte_len)
++	/*
++	 * 23.040:
++	 * The maximum length of the full address field
++	 * (AddressLength, TypeofAddress and AddressValue) is 12 octets.
++	 */
++	if ((len - *offset) < byte_len || byte_len > 10)
+		return FALSE;
+
+	out->number_type = bit_field(addr_type, 4, 3);
+--
+2.25.1
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch
new file mode 100644
index 0000000000..dfd6edeb7e
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch
@@ -0,0 +1,32 @@
+From 7f2adfa22fbae824f8e2c3ae86a3f51da31ee400 Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Mon, 5 Aug 2024 20:06:09 +0800
+Subject: [PATCH] smsutil: Check cbs_dcs_decode return value
+
+It is better to explicitly check the return value of cbs_dcs_decode
+instead of relying on udhi not being changed due to side-effects.
+
+CVE: CVE-2023-2794
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=7f2adfa22fbae824f8e2c3ae86a3f51da31ee400]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/smsutil.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index d8170d1..7746a71 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1765,7 +1765,8 @@ gboolean sms_udh_iter_init_from_cbs(const struct cbs *cbs,
+	const guint8 *hdr;
+	guint8 max_ud_len;
+
+-	cbs_dcs_decode(cbs->dcs, &udhi, NULL, NULL, NULL, NULL, NULL);
++	if (!cbs_dcs_decode(cbs->dcs, &udhi, NULL, NULL, NULL, NULL, NULL))
++		return FALSE;
+
+	if (!udhi)
+		return FALSE;
+--
+2.25.1
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch
new file mode 100644
index 0000000000..82b36a0193
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch
@@ -0,0 +1,44 @@
+From 07f48b23e3877ef7d15a7b0b8b79d32ad0a3607e Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Mon, 5 Aug 2024 20:23:38 +0800
+Subject: [PATCH] simutil: Make sure set_length on the parent succeeds
+
+CVE: CVE-2023-2794
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=07f48b23e3877ef7d15a7b0b8b79d32ad0a3607e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/simutil.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/simutil.c b/src/simutil.c
+index 59d8d5d..0e131e8 100644
+--- a/src/simutil.c
++++ b/src/simutil.c
+@@ -588,8 +588,9 @@ gboolean ber_tlv_builder_set_length(struct ber_tlv_builder *builder,
+	if (new_pos > builder->max)
+		return FALSE;
+
+-	if (builder->parent)
+-		ber_tlv_builder_set_length(builder->parent, new_pos);
++	if (builder->parent &&
++			!ber_tlv_builder_set_length(builder->parent, new_pos))
++		return FALSE;
+
+	builder->len = new_len;
+
+@@ -730,9 +731,9 @@ gboolean comprehension_tlv_builder_set_length(
+	if (builder->pos + new_ctlv_len > builder->max)
+		return FALSE;
+
+-	if (builder->parent)
+-		ber_tlv_builder_set_length(builder->parent,
+-						builder->pos + new_ctlv_len);
++	if (builder->parent && !ber_tlv_builder_set_length(builder->parent,
++						builder->pos + new_ctlv_len))
++		return FALSE;
+
+	len = MIN(builder->len, new_len);
+	if (len > 0 && new_len_size != len_size)
+--
+2.25.1
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch
new file mode 100644
index 0000000000..3111b3007d
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch
@@ -0,0 +1,127 @@
+From 8fa1fdfcb54e1edb588c6a5e2688880b065a39c9 Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Mon, 5 Aug 2024 20:38:20 +0800
+Subject: [PATCH] smsutil: Use a safer strlcpy
+
+sms_address_from_string is meant as private API, to be used with string
+form addresses that have already been sanitized.  However, to be safe,
+use a safe version of strcpy to avoid overflowing the buffer in case the
+input was not sanitized properly.  While here, add a '__' prefix to the
+function name to help make it clearer that this API is private and
+should be used with more care.
+
+CVE: CVE-2023-2794
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8fa1fdfcb54e1edb588c6a5e2688880b065a39c9]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/smsutil.c   | 14 +++++++-------
+ src/smsutil.h   |  2 +-
+ unit/test-sms.c |  6 +++---
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 7746a71..e073a06 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1887,15 +1887,15 @@ time_t sms_scts_to_time(const struct sms_scts *scts, struct tm *remote)
+	return ret;
+ }
+
+-void sms_address_from_string(struct sms_address *addr, const char *str)
++void __sms_address_from_string(struct sms_address *addr, const char *str)
+ {
+	addr->numbering_plan = SMS_NUMBERING_PLAN_ISDN;
+	if (str[0] == '+') {
+		addr->number_type = SMS_NUMBER_TYPE_INTERNATIONAL;
+-		strcpy(addr->address, str + 1);
++		l_strlcpy(addr->address, str + 1, sizeof(addr->address));
+	} else {
+		addr->number_type = SMS_NUMBER_TYPE_UNKNOWN;
+-		strcpy(addr->address, str);
++		l_strlcpy(addr->address, str, sizeof(addr->address));
+	}
+ }
+
+@@ -3087,7 +3087,7 @@ gboolean status_report_assembly_report(struct status_report_assembly *assembly,
+		}
+	}
+
+-	sms_address_from_string(&addr, straddr);
++	__sms_address_from_string(&addr, straddr);
+
+	if (pending == TRUE && node->deliverable == TRUE) {
+		/*
+@@ -3180,7 +3180,7 @@ void status_report_assembly_expire(struct status_report_assembly *assembly,
+	while (g_hash_table_iter_next(&iter_addr, (gpointer) &straddr,
+					(gpointer) &id_table)) {
+
+-		sms_address_from_string(&addr, straddr);
++		__sms_address_from_string(&addr, straddr);
+		g_hash_table_iter_init(&iter_node, id_table);
+
+		/* Go through different messages. */
+@@ -3474,7 +3474,7 @@ GSList *sms_datagram_prepare(const char *to,
+	template.submit.vp.relative = 0xA7; /* 24 Hours */
+	template.submit.dcs = 0x04; /* Class Unspecified, 8 Bit */
+	template.submit.udhi = TRUE;
+-	sms_address_from_string(&template.submit.daddr, to);
++	__sms_address_from_string(&template.submit.daddr, to);
+
+	offset = 1;
+
+@@ -3601,7 +3601,7 @@ GSList *sms_text_prepare_with_alphabet(const char *to, const char *utf8,
+	template.submit.srr = use_delivery_reports;
+	template.submit.mr = 0;
+	template.submit.vp.relative = 0xA7; /* 24 Hours */
+-	sms_address_from_string(&template.submit.daddr, to);
++	__sms_address_from_string(&template.submit.daddr, to);
+
+	/* There are two enums for the same thing */
+	dialect = (enum gsm_dialect)alphabet;
+diff --git a/src/smsutil.h b/src/smsutil.h
+index 01487de..bc21504 100644
+--- a/src/smsutil.h
++++ b/src/smsutil.h
+@@ -487,7 +487,7 @@ int sms_udl_in_bytes(guint8 ud_len, guint8 dcs);
+ time_t sms_scts_to_time(const struct sms_scts *scts, struct tm *remote);
+
+ const char *sms_address_to_string(const struct sms_address *addr);
+-void sms_address_from_string(struct sms_address *addr, const char *str);
++void __sms_address_from_string(struct sms_address *addr, const char *str);
+
+ const guint8 *sms_extract_common(const struct sms *sms, gboolean *out_udhi,
+					guint8 *out_dcs, guint8 *out_udl,
+diff --git a/unit/test-sms.c b/unit/test-sms.c
+index 3bc099b..88293d5 100644
+--- a/unit/test-sms.c
++++ b/unit/test-sms.c
+@@ -1603,7 +1603,7 @@ static void test_sr_assembly(void)
+			sr3.status_report.mr);
+	}
+
+-	sms_address_from_string(&addr, "+4915259911630");
++	__sms_address_from_string(&addr, "+4915259911630");
+
+	sra = status_report_assembly_new(NULL);
+
+@@ -1626,7 +1626,7 @@ static void test_sr_assembly(void)
+	 * Send sms-message in the national address-format,
+	 * but receive in the international address-format.
+	 */
+-	sms_address_from_string(&addr, "9911630");
++	__sms_address_from_string(&addr, "9911630");
+	status_report_assembly_add_fragment(sra, sha1, &addr, 4, time(NULL), 2);
+	status_report_assembly_add_fragment(sra, sha1, &addr, 5, time(NULL), 2);
+
+@@ -1641,7 +1641,7 @@ static void test_sr_assembly(void)
+	 * Send sms-message in the international address-format,
+	 * but receive in the national address-format.
+	 */
+-	sms_address_from_string(&addr, "+358123456789");
++	__sms_address_from_string(&addr, "+358123456789");
+	status_report_assembly_add_fragment(sra, sha1, &addr, 6, time(NULL), 1);
+
+	g_assert(status_report_assembly_report(sra, &sr3, id, &delivered));
+--
+2.25.1
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index f4548b8a30..3ffb713472 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -14,6 +14,10 @@ SRC_URI = "\
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
     file://CVE-2023-4234.patch \
     file://CVE-2023-4233.patch \
+    file://CVE-2023-2794-0001.patch \
+    file://CVE-2023-2794-0002.patch \
+    file://CVE-2023-2794-0003.patch \
+    file://CVE-2023-2794-0004.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.25.1


