Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BF9C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 06:14:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4955.1748931239414624138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55355er7004380
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Jun 2025 23:13:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrk6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 23:13:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Jun 2025 23:13:17 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Jun 2025 23:13:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 1/2] libsoup: fix CVE-2025-4948
Date: Tue, 3 Jun 2025 14:13:54 +0800
Message-ID: <20250603061355.536367-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1MiBTYWx0ZWRfX1uUuN4hZ6rR9 EVVYQQs2KvZqZeA78m6HpXmQyLQwCumptsBqSyLI4XSjwxChqArTOGcsCgROaNHKbaNKVmgmSiD emwY8g+T8f84KlxZl0PJbvVxzpGtfOtC/+o3l4oPTOs3QJuabwUW2bEhlMlKBBE85G2SCYyB/eC
 AZ2ete+Rd1L8aFjrJS4f6BXmD8Sxssb4ppywYLhYPqot4VmvhEWGAJb6ud99j+5tHOrMWW89iAF 0q3HRsNQlqJbptUj0tW9tz7FMbukFbyVG6UrCOiWS2ekEzBYdfT5yzQ5kesIZlwqDf7OcwiLOST jdb9K73aYotgyDAVP0ATkVmtMwVPC0+2Ve7SLGhQczPYSZVlFkK/Eqcb+Clr8oxe+KQ7AUh1kPD
 hRnV3e98BLiRbzNRGj5ASLh6jsF68K3EljjPEVwy3NfAMHCxsAZeFigDuPn6Ucs/a0ncxNJV
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683e92a6 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=o19dcwqJu1wBlOUGTbIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _qnCq7wvRRw4uiJFbU5YUecjBQsuL43T
X-Proofpoint-ORIG-GUID: _qnCq7wvRRw4uiJFbU5YUecjBQsuL43T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=855 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 06:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217757

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2025-4948.patch       | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  4 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
new file mode 100644
index 0000000000..e0e7b7a44f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index a8c0546677..772e21e09b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -17,7 +17,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32908-1.patch \
-           file://CVE-2025-32908-2.patch"
+           file://CVE-2025-32908-2.patch \
+           file://CVE-2025-4948.patch \
+"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.34.1


