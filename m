Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10799C61CE8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:29:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14316.1749036539152695954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55448x8T006347
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:28:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rte2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:28:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:28:58 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:28:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATH 09/14] libsoup: fix CVE-2025-4948
Date: Wed, 4 Jun 2025 19:28:36 +0800
Message-ID: <20250604112841.424355-10-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604112841.424355-1-changqing.li@windriver.com>
References: <20250604112841.424355-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NyBTYWx0ZWRfXy17JGzvEfZOV 36/MqG9c9WOnXx40to8+uw+QPipO+bvu3LVj0t3ZCLldtLWUnVvcbAH8CA3La1xeSl63nBWJrCY RKNlso2R0m2kHpRxmazZpGdLidapSpjwCQpFkUep6jd8zhNjhOCG2u8XO55SRWRYTYynliOu2Yu
 7L4YkfKQ2+T/iHVIxG0ni7trojbaHNhP4nUwHMBNaCRYoLIFl4T+MnbvmRBcXYjMwdb5VR7E+Am yMLZXw0/WM46LZW8sDGk27AYMqf+s5FawGthgeiENwT1OMiks5fyYU7VUavZNeZqhT1CxQG3PCh a4y0zt/OxJejaeqQ2V5JcljaPPwRr/TvOdVj23jdKdpm51Gx/ErIdImHMWD0B2PhjA1MDR+2T2w
 L4H4Kga3N2ya0HEB+xEoy5BZR6GOEK5fFtKwmv9tnuI3Tlxrk6aP49CX+MuL27DsdRaoEEa4
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68402dfa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=o19dcwqJu1wBlOUGTbIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: weVl-yRbR2jUpkCEjYH8Mro5zQy7-SEu
X-Proofpoint-ORIG-GUID: weVl-yRbR2jUpkCEjYH8Mro5zQy7-SEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=719 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217920

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch
new file mode 100644
index 0000000000..e0e7b7a44f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch
@@ -0,0 +1,97 @@
+From 0076a5ef3f2a3d11805438e7fd90775f8c40569e Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 102ce37..a587fe7 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -204,7 +204,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = g_bytes_new_from_bytes (body, // FIXME
+ 						    split - body_data,
+-						    end - 2 - split);
++						    end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index f5b9868..92b673e 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,45 @@ test_multipart_bounds_bad (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_too_large (void)
++{
++	const char *raw_body =
++		"-------------------\r\n"
++		"-\n"
++		"Cont\"\r\n"
++		"Content-Tynt----e:n\x8erQK\r\n"
++		"Content-Disposition:   name=  form-; name=\"file\"; filename=\"ype:i/  -d; ----\xae\r\n"
++		"Content-Typimag\x01/png--\\\n"
++		"\r\n"
++		"---:\n\r\n"
++		"\r\n"
++		"-------------------------------------\r\n"
++		"---------\r\n"
++		"----------------------";
++	GBytes *body;
++	GHashTable *params;
++	SoupMessageHeaders *headers;
++	SoupMultipart *multipart;
++
++	params = g_hash_table_new (g_str_hash, g_str_equal);
++	g_hash_table_insert (params, (gpointer) "boundary", (gpointer) "-----------------");
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_set_content_type (headers, "multipart/form-data", params);
++	g_hash_table_unref (params);
++
++	body = g_bytes_new_static (raw_body, strlen (raw_body));
++	multipart = soup_multipart_new_from_message (headers, body);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (body);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	g_assert_true (soup_multipart_get_part (multipart, 0, &headers, &body));
++	g_assert_cmpint (g_bytes_get_size (body), ==, 0);
++	soup_multipart_free (multipart);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -556,6 +595,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 885e570ab8..0510511b24 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


