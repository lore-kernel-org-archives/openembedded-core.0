Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFD2C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 07:50:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11733.1745999425736438969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 00:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7215436bf3=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U6UfWL030551
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:50:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug0fw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:50:24 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 30 Apr 2025 00:50:23 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 30 Apr 2025 00:50:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libsoup-2.4: fix CVE-2025-32911
Date: Wed, 30 Apr 2025 15:50:21 +0800
Message-ID: <20250430075021.963190-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=6811d640 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=s-xiYq9glxJWK11P4UkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QTuz0fWhElLU0JZfzr-MdwzDWoDUh8IP
X-Proofpoint-ORIG-GUID: QTuz0fWhElLU0JZfzr-MdwzDWoDUh8IP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfX8pNATvE8uW3X h6238yPzcAZSIsD4IB+1+jLT55f+P4AlH6eGVnPLUnJjWubvgb8Rt6VfRldmbpKNyQdMmcSat60 ADCzX7i7/G9ZtdIw0d4X8QH3oNSxlDOV3p/URfIaPUVEUdvOEnrZ/B/c6l2CP9JmqY37ToSbeRR
 h8RtOeDT76R8sdVeDid4uz80AqKhWFhkvJyTPGCYgIGPwZYdQelwnx0nCGlur1h5B7SgLaRoCZl SMastJ1gWZwaNDKg4RNZuOs02caGyvkfEIzIgJIXWEcaHVnSfbJlQ9opcz8OzHD3SAn11/TNWLj 1AeJ8QwZBlEsX/hhVGItw8zuVnUJhr6wueNNUYcvre0HAJL0pVai8RAYKf+I+HgmvXm+lPSEMzy
 rJ8Tw3tdcptRny0NIHeKEcQWEgIbuoXBvP1vC72nT66u5l9guoGRePPEw9Rt8GCIp7lhCJdP
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=892 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 07:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215726

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-32911:
A use-after-free type vulnerability was found in libsoup, in the
soup_message_headers_get_content_disposition() function. This flaw
allows a malicious HTTP client to cause memory corruption in the libsoup
server.

Backport patches to fix it

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-32911
[2] https://gitlab.gnome.org/GNOME/libsoup/-/issues/433

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-2.4/0001-CVE-2025-32911.patch     | 74 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
new file mode 100644
index 0000000000..9ef0643837
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -0,0 +1,74 @@
+From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Apr 2025 14:59:55 +0800
+Subject: [PATCH] CVE-2025-32911
+
+CVE: CVE-2025-32911
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c | 13 +++++++++----
+ tests/header-parsing-test.c    | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 39ad14a..78b2455 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
+ 	 */
+ 	if (params && g_hash_table_lookup_extended (*params, "filename",
+ 						    &orig_key, &orig_value)) {
+-		char *filename = strrchr (orig_value, '/');
+-
+-		if (filename)
+-			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                if (orig_value) {
++                        char *filename = strrchr (orig_value, '/');
++
++                        if (filename)
++                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
++                } else {
++                        /* filename with no value isn't valid. */
++                        g_hash_table_remove (*params, "filename");
++                }
+ 	}
+ 	return TRUE;
+ }
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 946f118..752196e 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
+ #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
+ 
+ static void
+ do_content_disposition_tests (void)
+@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
+ 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
+         parameter2 = g_hash_table_lookup (params, "foo");
+         g_assert_cmpstr (parameter2, ==, "bar");
++	g_hash_table_destroy (params);
++
++	 /* Empty filename */
++	soup_message_headers_clear (hdrs);
++	soup_message_headers_append (hdrs, "Content-Disposition",
++								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
++	if (!soup_message_headers_get_content_disposition (hdrs,
++													   &disposition,
++													   &params)) {
++			soup_test_assert (FALSE, "empty filename decoding FAILED");
++			return;
++	}
++	g_free (disposition);
++	g_assert_false (g_hash_table_contains (params, "filename"));
+ 	g_hash_table_destroy (params);
+ 
+ 	soup_message_headers_free (hdrs);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index ee20530b64..25e0d7dcbc 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -12,7 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
+           file://0001-CVE-2025-32911.patch"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


